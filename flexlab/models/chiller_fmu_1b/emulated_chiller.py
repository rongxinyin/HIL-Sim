from pyfmi import load_fmu
import yaml
import numpy as np
import asyncio

from flask import Flask, jsonify
import threading

from flexlab.db_layer import db_interface
import datetime
import pytz
import pandas as pd

class Emulated_Chiller:
    def __init__(self, config_file='chiller_config.yaml'):
        with open(config_file) as fp:
            self.config = yaml.safe_load(fp)

        self._default_setpoint = self.config.get('default_setpoint', 44)

        # min setpoint: 2C or 35.6F
        self._min_setpoint = self.config.get('min_setpoint', 35.6)
        self._max_setpoint = self.config.get('max_setpoint')

        self.fmu_file = self.config.get('fmu_file')
        self.chiller = load_fmu(self.fmu_file)

        self.cell = self.config.get('cell')

        self.model_options = self.chiller.simulate_options()
        self.model_options['initialize'] = True
        self._model_update_rate = self.config.get('model_update_rate', 30)

        self.chiller_db = db_interface.DB_Interface()
        self.current_time = 0
        self.initialize_chiller_model()

        self.app = Flask('emulated_chiller')
        self.app.add_url_rule('/get_data', 'get_data', self.get_readings)
        self.web_api_port = 5000

        self.loop = asyncio.get_event_loop()
        self.schedule_tasks()


    def initialize_chiller_model(self):
        end_t = datetime.datetime.now(pytz.timezone('US/Pacific'))
        start_t = end_t - datetime.timedelta(minutes=5)

        chiller_values = self.chiller_db.get_latest_chiller_points(st = start_t, et = end_t, cell=self.cell).to_dict('records')[0]
        chiller_values_SI_units = self.convert_units(chiller_values)

        set = (
                    ['m_flow_sec', 'T_chw_in', 'chiOn', 'T_air_in'],
                    np.array(
                        [[0, chiller_values_SI_units.get('m_flow_sec'), chiller_values_SI_units.get('T_chw_in'), chiller_values_SI_units.get('chiOn'), chiller_values_SI_units.get('T_air_in')],
                         [30, chiller_values_SI_units.get('m_flow_sec'), chiller_values_SI_units.get('T_chw_in'), chiller_values_SI_units.get('chiOn'), chiller_values_SI_units.get('T_air_in')]]
                    )
                )
        self.chiller.simulate(0, 30, set, options=self.model_options)
        self.model_options['initialize'] = False
        self.current_time = 30


    def convert_units(self, chiller_values):
        chiller_values_SI_units = {}
        for key in chiller_values:
            if key.endswith('-CHWFM-2'):
                chiller_values_SI_units['m_flow_sec'] = chiller_values[key] * 0.000017 * 997
            elif key.endswith('CHWRTS-2'):
                chiller_values_SI_units['T_chw_in'] = (chiller_values[key] - 32.0) * 5/9.0 + 273.15
            elif key.endswith('CHWP-VFD-STAT'):
                chiller_values_SI_units['chiOn'] = int(chiller_values[key]) == 1
            elif key.endswith('OAT-1'):
                chiller_values_SI_units['chiOn'] = (chiller_values[key] - 32.0) * 5/9.0 + 273.15
        return chiller_values_SI_units

    def schedule_tasks(self):
        self.loop.create_task(self._periodic_advance_time())

    async def _periodic_advance_time(self):
        while True:
            print("current time == {}".format(self.current_time))
            start = self.current_time
            end = self.current_time + self._model_update_rate

            end_t = datetime.datetime.now(pytz.timezone('US/Pacific'))
            start_t = end_t - datetime.timedelta(minutes=5)

            chiller_values = self.chiller_db.get_latest_chiller_points(st=start_t, et=end_t, cell=self.cell).to_dict('records')[0]
            chiller_values_SI_units = self.convert_units(chiller_values)

            inputs = (
                ['m_flow_sec', 'T_chw_in', 'chiOn', 'T_air_in'],
                np.array(
                    [[start, chiller_values_SI_units.get('m_flow_sec'), chiller_values_SI_units.get('T_chw_in'), chiller_values_SI_units.get('chiOn'), chiller_values_SI_units.get('T_air_in')],
                     [end, chiller_values_SI_units.get('m_flow_sec'), chiller_values_SI_units.get('T_chw_in'), chiller_values_SI_units.get('chiOn'), chiller_values_SI_units.get('T_air_in')]]
                )
            )
            self.chiller.simulate(start, end, inputs, options=self.model_options)

            latest_chiller_setpoint = self.chiller.get('T_chw_out')[0]
            self.push_setpoint_to_db(latest_chiller_setpoint)

            self.current_time = self.current_time + self._model_update_rate
            await asyncio.sleep(self._model_update_rate)

    def push_setpoint_to_db(self, setpoint):
        variable_name = self.cell + '_chiller_primary_sp_K_command'

        action_dict = {variable_name: setpoint}
        action_df = pd.DataFrame.from_dict(action_dict)

        self.chiller_db.push_setpoints_to_db(cell=self.cell, df=action_df)

    def get_readings(self):
        measurements = {
                            self.cell+'_m_flow_sec': self.chiller.get('m_flow_sec')[0],
                            self.cell+'_T_chw_in': self.chiller.get('T_chw_in')[0],
                            self.cell+'_chiOn': self.chiller.get('chiOn')[0],
                            self.cell+'_T_air_in': self.chiller.get('T_air_in')[0],
                            self.cell+'_T_chw_out': self.chiller.get('T_chw_out')[0],
                            self.cell+'_T_pch_in': self.chiller.get('T_pch_in')[0],
                            self.cell+'_chi_P': self.chiller.get('chi_P')[0],
                            self.cell+'_pum_P': self.chiller.get('pum_P')[0],
                            self.cell+'_m_flow_pri': self.chiller.get('m_flow_pri')[0]
                        }
        print(measurements)
        return jsonify(measurements)

    def run(self):
        self.app.run('0.0.0.0', port=self.web_api_port)

def main():

    try:
        loop = asyncio.get_event_loop()
        battery = Emulated_Chiller()
        threading.Thread(target=battery.run).start()
        loop.run_forever()

    except KeyboardInterrupt:
        print('Stopping event loop')
        loop.stop()

if __name__ == "__main__":
    main()
