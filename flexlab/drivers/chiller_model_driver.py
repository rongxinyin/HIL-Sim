from flexlab.drivers.driver import Driver, pd, requests, np, datetime
import logging
import json
import requests

class Chiller_Model(Driver):
    def __init__(self, config_file="read_data_config.yaml"):
        logging.basicConfig(format='%(asctime)s %(levelname)s:%(message)s', level=logging.INFO)
        self.logger = logging.getLogger(__name__)

        try:
            super(Chiller_Model, self).__init__(config_file=config_file)
        except Exception as e:
            self.logger.error("error reading config file={0} error={1}",format(config_file, str(e)))

        self.chiller_config = self.config.get('emulated_chiller')
        self.chiller_web_host = self.chiller_config.get('chiller_web_host')
        self.web_api_port_1a = self.chiller_config.get('web_api_port_1a')
        self.web_api_port_1b = self.chiller_config.get('web_api_port_1b')
        self.point_map = self.chiller_config.get('point_map')
        self.emulated_chiller_table_name = self.chiller_config.get('db_table_name', 'emulated_chiller_1ab')

    def write_to_db(self):
        time_now = self.get_utc_time_now()
        response_1a = requests.get("{}/get_data:{}".format(self.chiller_web_host, self.web_api_port_1a))
        response_1b = requests.get("{}/get_data:{}".format(self.chiller_web_host, self.web_api_port_1b))
        measurements_1a = {}
        measurements_1b = {}

        if response_1a.status_code == 200:
            measurements_1a = json.loads(response_1a.text)
        else:
            print("failed web request for chiller 1a")

        if response_1b.status_code == 200:
            measurements_1b = json.loads(response_1b.text)
        else:
            print("failed web request for chiller 1b")

        point_dict = {}
        for point in self.point_map:
            new_point_name = self.point_map.get(point, point)
            if point.startswith("1a"):
                point_dict[new_point_name] = measurements_1a.get(point)

            if point.startswith("1b"):
                point_dict[new_point_name] = measurements_1b.get(point)


        chiller_df = pd.DataFrame(index=[time_now], data=point_dict)
        chiller_df.index.name = 'time'

        if not chiller_df.empty:
            self.push_to_db(chiller_df, self.emulated_chiller_table_name)
        else:
            print("nothing to push to {0}".format(self.emulated_chiller_table_name))

if __name__ == "__main__":
    obj = Chiller_Model(config_file='read_data_config.yaml')
    obj.write_to_db()