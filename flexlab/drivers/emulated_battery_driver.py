from driver import Driver, pd, requests, np, datetime
import logging
import json
import requests

class Emulated_Battery(Driver):
    def __init__(self, config_file="read_data_config.yaml"):
        logging.basicConfig(format='%(asctime)s %(levelname)s:%(message)s', level=logging.INFO)
        self.logger = logging.getLogger(__name__)

        try:
            super(Emulated_Battery, self).__init__(config_file=config_file)
        except Exception as e:
            self.logger.error("error reading config file={0} error={1}",format(config_file, str(e)))

        self.battery_config = self.config.get('emulated_battery')
        self.battery_url = self.battery_config.get('url')
        self.point_map = self.battery_config.get('point_map')
        self.emulated_battery_table_name = self.battery_config.get('db_table_name', 'emulated_battery_test')

    def write_to_db(self):
        time_now = self.get_utc_time_now()
        response = requests.get(self.battery_url)
        measurements = {}
        if response.status_code == 200:
            measurements = json.loads(response.text)

        point_dict = {}
        for point in self.point_map:
            new_point_name = self.point_map.get(point)
            point_dict[new_point_name] = measurements.get(point)

        battery_df = pd.DataFrame(index=[time_now], data=point_dict)
        battery_df.index.name = 'time'

        if not battery_df .empty:
            self.push_to_db(battery_df, self.emulated_battery_table_name)
        else:
            print("nothing to push to {0}".format(self.emulated_battery_table_name))

if __name__ == "__main__":
    obj = Emulated_Battery(config_file='read_data_config.yaml')
    obj.write_to_db()