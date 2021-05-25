import yaml
from flexlab.db_layer.db_interface import  DB_Interface
import datetime
import pytz
import pandas as pd
import time

class X2_boiler_test_controller:
    def __init__(self, config_file="boiler_controller_config.yaml"):
        with open(config_file) as fp:
            self.config = yaml.safe_load(fp)

        self.db_interface = DB_Interface()

        self.tz_local = pytz.timezone("America/Los_Angeles")
        self.tz_utc = pytz.timezone("UTC")
        self.current_cell = self.config.get('current_cell', 'x2')

    def _get_boiler_sp(self, start_time, time_now):
        # 0-1h: 50C
        # 1-2h: 55C
        # 2-3h: 60C
        # >3h: 45C
        elapsed_time = (time_now - start_time).total_seconds()
        if  elapsed_time >= 3*60*60:
            return 45
        elif elapsed_time >= 2*60*60:
            return 60
        elif elapsed_time >= 60*60:
            return 55
        else:
            return 50

    def get_actions(self, start_time=None, et=None):
        if et is None:
            et = self.tz_utc.localize(datetime.datetime.utcnow()).astimezone(self.tz_local).replace(tzinfo=None)
        st = et - datetime.timedelta(minutes=14)
        obs = self.db_interface.get_data_controller(st=st, et=et, cell='x2')
        print("observations at time = {0} are:".format(et.strftime(("%Y-%m-%d %H:%M:%s"))))

        boiler_sp = self._get_boiler_sp(start_time, et)

        setpoints_df = pd.DataFrame(index=[et], data={'x2_boiler_sp_C_command': [boiler_sp]})
        return setpoints_df

    def push_actions(self, setpoints):
        return self.db_interface.push_setpoints_to_db(cell=self.current_cell, df=setpoints)

if __name__ == "__main__":
    controller = X2_boiler_test_controller(config_file="controllers/boiler_controller_config.yaml")
    completed_minute = -1
    printed_minute = -1
    start_time = controller.tz_utc.localize(datetime.datetime.utcnow()).astimezone(controller.tz_local).replace(tzinfo=None)
    while True:
        time_now = datetime.datetime.now()
        minute_now = time_now.minute
        if minute_now % 5 == 0 and minute_now != completed_minute:
            # actions = controller.get_actions(et=datetime.datetime(2020, 5, 15, 14, 0, 0, 0))
            try:
                actions = controller.get_actions(start_time=start_time)
                print("actions at {0}".format(time_now))
                print(actions)

                print("pushing actions to FL interface")
                print("push status= {0}".format(controller.push_actions(setpoints=actions)))
                print("\n")
                completed_minute = minute_now
                printed_minute = minute_now
                time.sleep(1)
            except Exception as e:
                print("Error occured while running controller. error = {0}".format(e))
        elif minute_now % 1 == 0 and printed_minute != minute_now:
            print("current time: {0}; waiting for the next 15th minute".format(time_now))
            printed_minute = minute_now
