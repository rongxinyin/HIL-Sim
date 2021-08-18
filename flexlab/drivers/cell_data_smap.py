from driver import Driver, pd, requests, np, datetime
import logging
import pytz

class Cell_Data_Smap(Driver):
    def __init__(self, config_file="read_data_config.yaml"):
        logging.basicConfig(format='%(asctime)s %(levelname)s:%(message)s', level=logging.INFO)
        self.logger = logging.getLogger(__name__)

        try:
            super(Cell_Data_Smap, self).__init__(config_file=config_file)
        except Exception as e:
            self.logger.error("error reading config file={0} error={1}".format(config_file, str(e)))

        self.cell_data_config = self.config.get('cell_data')
        self.api_config = self.cell_data_config .get('api')
        self.flex_user = self.api_config.get('flex_user')
        self.flex_password = self.api_config.get('flex_password')
        self.flexq_login = self.api_config.get('flexq_login')
        self.smap_url = self.api_config.get('smap_url')

        self.cell_data_sections = ['processed_cell_1a', 'processed_cell_1b', 'cell_vav_1a', 'cell_vav_1b',
                                   'cell_thermalstation_1ab', 'weather_station']

    def write_to_db(self):
        time_now = datetime.datetime.now(pytz.timezone("US/Pacific")) - datetime.timedelta(minutes=10)

        for section in self.cell_data_sections:
            section_config = self.cell_data_config.get(section, None)
            if section_config is not None:
                section_table_name = section_config.get('db_table_name', 'cellb')
                section_point_uuid_map = section_config.get('point_uuid_map')

                section_df = self.get_data_smap(url = self.smap_url, point_uuid_map=section_point_uuid_map, time_now=time_now, time_threshold=10)

                if not section_df.empty:
                    self.push_to_db(section_df, section_table_name)
                else:
                    print("nothing to push to {0}".format(section_table_name))
            else:
                print("No configuration for section {0}".format(section))

if __name__ == "__main__":
    obj = Cell_Data_Smap(config_file='read_data_config.yaml')
    obj.write_to_db()