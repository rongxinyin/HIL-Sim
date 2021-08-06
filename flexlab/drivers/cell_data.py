from driver import Driver, pd, requests, np, datetime
import logging


class Cell_Data(Driver):
    def __init__(self, config_file="read_data_config.yaml"):
        logging.basicConfig(format='%(asctime)s %(levelname)s:%(message)s', level=logging.INFO)
        self.logger = logging.getLogger(__name__)

        try:
            super(Cell_Data, self).__init__(config_file=config_file)
        except Exception as e:
            self.logger.error("error reading config file={0} error={1}",format(config_file, str(e)))

        self.cell_data_config = self.config.get('cell_data')
        self.api_config = self.cell_data_config .get('api')
        self.flex_user = self.api_config.get('flex_user')
        self.flex_password = self.api_config.get('flex_password')
        self.flexq_login = self.api_config.get('flexq_login')

        self.cell_data_sections = ['cell_hvac_1a', 'cell_hvac_1b', 'processed_cell_1a', 'processed_cell_1b',
                                   'cell_lighting_plug_1a', 'cell_lighting_plug_1b', 'cell_vav_1a', 'cell_vav_1b',
                                   'cell_thermalstation_1ab', 'weather_station']

    def write_to_db(self):
        time_now = self.get_utc_time_now()
        cws_point_list = self.get_data_cws(flexq_login=self.flexq_login, fl_username=self.flex_user,
                                           fl_password=self.flex_password)

        for section in self.cell_data_sections:
            section_config = self.cell_data_config.get(section)
            section_table_name = section_config.get('db_table_name', 'cellb')
            section_cws_point_map = section_config.get('cws_point_map')

            section_df = self.filter_cws_data(cws_point_list=cws_point_list, point_map=section_cws_point_map, time_now=time_now)

            if not section_df.empty:
                self.push_to_db(section_df, section_table_name)
            else:
                print("nothing to push to {0}".format(section_table_name))

if __name__ == "__main__":
    obj = Cell_Data(config_file='read_data_config.yaml')
    obj.write_to_db()