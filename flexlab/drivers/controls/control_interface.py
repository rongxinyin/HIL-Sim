import yaml
import requests
import datetime
import pandas as pd
import subprocess
from sqlalchemy import create_engine
import time
import argparse
from flexlab.drivers.modbus_driver import Modbus_Driver

class FL_Control_Interface:
    def __init__(self, config_file="flexlab_control_config.yaml"):
        with open(config_file, 'r') as fp:
            self.config = yaml.safe_load(fp)

        self.primary_chiller_config = self.config.get('primary_chiller', {})
        self.primary_chiller_control_flag = self.primary_chiller_config.get('control_flag', {'1a': False, '1b': False})

        if self.primary_chiller_control_flag.get('1a') or self.primary_chiller_control_flag.get('1b'):
            self.primary_chiller = Modbus_Driver(config_file, config_section='primary_chiller')
            self.primary_chiller.initialize_modbus()
            print("initialized modbus connection to ip={}".format(self.primary_chiller_config.get('ip')))
        else:
            self.primary_chiller = None

        self.control_config = self.config.get('control', {})
        self.variables = self.control_config.get('variable_names', [])
        self.query_time = self.control_config.get('query_time_minutes', 16)
        self.time_threshold = self.control_config.get('revert_to_default_time_threshold_seconds', 3600)
        self.default_setpoints = self.control_config.get('default_values')
        self.min_values = self.control_config.get('min_values')
        self.max_values = self.control_config.get('max_values')

        self.database_config = self.config.get('database')
        self.initialize_db_client()

    def initialize_db_client(self):
        self.host = self.database_config.get('host', 'localhost')
        self.port = self.database_config.get('port', 9003)
        self.database = self.database_config.get('database', 'hil')
        self.username = self.database_config.get('username', 'hil_flexlab')
        self.password = self.database_config.get('password')
        self.setpoints_table = self.database_config.get('setpoints_table', 'setpoints')


        url = 'postgresql://{0}:{1}@{2}:{3}/{4}'.format(self.username, self.password, self.host,
                                                        self.port, self.database)
        self.engine = create_engine(url)
        self.client = self.engine.connect()


    def get_latest_setpoints(self):
        """
        function to query latest setpoints from database

        :return: a list of dictionaries, with each dictionary containing two keys: time and the corresponding
        setpoint variable name
        """
        df_list = []
        for variable in self.variables:
            query = "select * from {0} where time in (select max(time) from {1} where time > now() - interval '{2} minutes' and name = '{3}') and name = '{4}';".format(
                self.setpoints_table, self.setpoints_table, self.query_time, variable, variable)
            df = pd.read_sql(query, self.client, index_col=['time'], coerce_float=True, parse_dates=True,
                             columns=['name', 'value'])
            df = df.pivot(columns='name', values='value')
            df_list.append(df)

        latest_df = pd.concat(df_list, axis=1)
        latest_setpoints = []
        for col in latest_df.columns:
            col_df = latest_df[[col]].dropna()
            latest_setpoint = {'time': col_df.index.values[0], 'variable': col, 'value': col_df[col].values[0]}
            latest_setpoints.append(latest_setpoint)
        return latest_setpoints

    # Periodic function that sets setpoints to devices
    def set_setpoints(self):
        latest_setpoints = self.get_latest_setpoints()
        time_now = datetime.datetime.utcnow()
        for setpoint in latest_setpoints:
            setpoint_time = datetime.datetime.utcfromtimestamp(setpoint.get('time').astype('O')/1e9)
            variable = setpoint.get('variable')
            new_value = setpoint.get('value')

            if (time_now - setpoint_time).total_seconds() >= self.time_threshold:
                # if the setpoint was generated more than a hour ago, revert to default setpoint
                new_value = self.default_setpoints[variable]

            cell = variable[:2]

            ret = False
            if variable.endswith("_chiller_primary_sp_K_command"):
                if self.primary_chiller_control_flag.get(cell):
                    ret = self.set_primary_chiller_setpoint(cell=cell, value=new_value, point_name=variable)
                else:
                    print("flexlab_control_flag for cell {0} is set to False. Not changing setpoints".format(cell))
                    ret = False

            if ret:
                print("At time {0} UTC succesfully set value={1} to variable={2}".format(time_now, new_value, variable))
            else:
                print("failed to set value={0} to variable={1}".format(new_value, variable))
        if len(latest_setpoints) == 0:
            print("no setpoints retrieved")

    def set_flexlab_points(self, cell, point_name, value):
        flex_sys = "Cell HVAC and Perm Sensors {0}".format(cell.upper())

        channel = self.cws_point_map.get(point_name)

        set_cmd = "ssh %s@flexq.lbl.gov \'{\"cmd\":\"SETDAQ\", \"sys\":\"%s\", \"chn\":\"%s\", \"val\":\"%f\", \"user\":\"%s\",\"pass\":\"%s\"}\'"
        print(set_cmd % (self.flexq_login, flex_sys, channel, value, self.flex_user, self.flex_password))

        try:
            subprocess.check_output(set_cmd % (self.flexq_login, flex_sys, channel, value, self.flex_user, self.flex_password), shell=True)
            return True
        except Exception as e:
            print("exception occurred when setting {0} to point {1} in cell {2}, error={3}".format(value, point_name, cell, str(e)))
            return False

    def set_primary_chiller_setpoint(self, cell, value, point_name='1a_chiller_primary_sp_K_command'):
        min_value = self.min_values.get(point_name)
        max_value = self.max_values.get(point_name)
        def_value = self.default_setpoints.get(point_name)

        if value < min_value:
            print("Value = {0}K less than lower bound {1}K for variable {2}, reverting to default {3}K".format(value, min_value, point_name, def_value))
            value = def_value
        elif value > max_value:
            print("Value = {0}K more than upper bound {1}K for variable {2}, reverting to default {3}K".format(value, max_value, point_name, def_value))
            value = def_value

        value_in_F = int((value - 273.15) * 9.0/5 + 32)
        try:
            if self.primary_chiller is not None:
                unit_id = self.primary_chiller_config.get('UNIT_ID')
                if int(self.primary_chiller.read_holding_register(register_name='temperature_setpoint1', unit=unit_id)) != value_in_F:
                    print("setting temperature_setpoint1 for primary chiller to {}F".format(value_in_F))
                    self.primary_chiller.write_register('temperature_setpoint1', value_in_F)
                else:
                    print("no change in setpoint, keeping temperature_setpoint1 at {}F".format(value_in_F))
                return True
        except Exception as e:
            print("exception occurred when setting {0} to point {1} in cell {2}, error={3}".format(value, point_name,
                                                                                                   cell, str(e)))
            return False

    def set_plant_points(self, cell, point_name, value):
        flex_sys = "HVAC Plant {}".format(cell[-1])

        channel = self.cws_point_map.get(point_name)

        set_cmd = "ssh %s@flexq.lbl.gov \'{\"cmd\":\"SETDAQ\", \"sys\":\"%s\", \"chn\":\"%s\", \"val\":\"%f\", \"user\":\"%s\",\"pass\":\"%s\"}\'"
        print(set_cmd % (self.flexq_login, flex_sys, channel, value, self.flex_user, self.flex_password))

        try:
            subprocess.check_output(
                set_cmd % (self.flexq_login, flex_sys, channel, value, self.flex_user, self.flex_password), shell=True)
            return True
        except Exception as e:
            print("exception occurred when setting {0} to point {1} in cell {2}, error={3}".format(value, point_name,
                                                                                                   cell, str(e)))
            return False


if __name__ == "__main__":
    controller = FL_Control_Interface(config_file="flexlab/drivers/controls/flexlab_control_config.yaml")
    parser = argparse.ArgumentParser()

    parser.add_argument("--reset_cella", help="reset cell a setpoints", action="store_true", default=False)
    parser.add_argument("--reset_cellb", help="reset cell b setpoints", action="store_true", default=False)
    parser.add_argument("--reset_both", help="reset cells a and b setpoints", action="store_true", default=False)
    args = parser.parse_args()

    if args.reset_both:
        print("resetting both cells")
        controller.set_primary_chiller_setpoint(cell='a', value=279.82)
    elif args.reset_cella:
        print("resetting cell a")
        controller.set_primary_chiller_setpoint(cell='a', value=279.82)
    elif args.reset_cellb:
        print("resetting cell b")
    else:
        try:
            print("getting latest setpoints")
            controller.set_setpoints()
        except Exception as e:
            print("Error occurred while setting setpoints. Error={0}".format(e))