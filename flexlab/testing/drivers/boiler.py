from flexlab.drivers.driver import Driver, pd, requests, np, datetime
import logging

class Boiler(Driver):
    def __init__(self, config_file="read_data_config.yaml"):
        logging.basicConfig(format='%(asctime)s %(levelname)s:%(message)s', level=logging.INFO)
        self.logger = logging.getLogger(__name__)

        try:
            super(Boiler, self).__init__(config_file=config_file)
        except Exception as e:
            self.logger.error("error reading config file={0} error={1}",format(config_file, str(e)))

        self.cell_data_config = self.config.get('cell_data')
        self.api_config = self.cell_data_config .get('api')
        self.flex_user = self.api_config.get('flex_user')
        self.flex_password = self.api_config.get('flex_password')
        self.flexq_login = self.api_config.get('flexq_login', 'queryx2')

        self.boiler_config = self.cell_data_config.get('boiler')

        self.boiler_table_name = self.boiler_config.get('db_table_name', 'boiler_test')
        self.boiler_cws_point_map = self.boiler_config.get('cws_point_map')

    def write_to_db(self):
        time_now = self.get_utc_time_now()
        cws_point_list = self.get_data_cws(flexq_login=self.flexq_login, fl_username=self.flex_user,
                                           fl_password=self.flex_password)

        boiler_df = self.filter_cws_data(cws_point_list=cws_point_list, point_map=self.boiler_cws_point_map,
                                        time_now=time_now)


        if not boiler_df.empty:
            self.push_to_db(boiler_df, self.boiler_table_name)
        else:
            print("nothing to push to {0}".format(self.boiler_table_name))

if __name__ == "__main__":
    obj = Boiler(config_file='read_data_config.yaml')
    obj.write_to_db()