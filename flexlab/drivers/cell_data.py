from driver import Driver, pd, requests, np, datetime
import logging


class Cell_Data(Driver):
    def __init__(self, config_file="read_data_config.yaml"):
        logging.basicConfig(format='%(asctime)s %(levelname)s:%(message)s', level=logging.INFO)
        self.logger = logging.getLogger(__name__)

        try:
            super(Cell_Data, self).__init__(config_file=config_file)
        except Exception as e:
            self.logger.error("error reading config file={0} error={1}".format(config_file, str(e)))

        self.cell_data_config = self.config.get('cell_data')
        self.api_config = self.cell_data_config .get('api')
        self.flex_user = self.api_config.get('flex_user')
        self.flex_password = self.api_config.get('flex_password')
        self.flexq_login = self.api_config.get('flexq_login')

        self.cell_data_sections = ['cell_hvac_1a', 'cell_hvac_1b', 'cell_lighting_plug_1a', 'cell_lighting_plug_1b', 'pcm_data']

    def write_to_db(self):
        time_now = self.get_utc_time_now()
        cws_point_list = self.get_data_cws(flexq_login=self.flexq_login, fl_username=self.flex_user,
                                           fl_password=self.flex_password)

        for section in self.cell_data_sections:
            section_config = self.cell_data_config.get(section, None)
            if section_config is not None:
                section_table_name = section_config.get('db_table_name', 'cellb')
                section_cws_point_map = section_config.get('cws_point_map')

                section_df = self.filter_cws_data(cws_point_list=cws_point_list, point_map=section_cws_point_map, time_now=time_now)

                if section == 'pcm_data':
                    pcm_zones = ['1b_desk1_window_right', '1b_desk6_window_left', '1b_window_middle',
                    '1b_desk2_core_right', '1b_desk5_core_left',
                    '1b_desk3_door_right', '1b_desk4_door_left']

                    for zone in pcm_zones:
                        soc_col = zone + '_soc'

                        T_ceiling = None
                        T_plenum = None

                        T_ceiling_df = section_df[[zone + '_ceiling']]
                        if not T_ceiling_df.empty:
                            T_ceiling = T_ceiling_df.values[0]

                        T_plenum_df = section_df[[zone + '_plenum']]
                        if not T_plenum_df.empty:
                            T_plenum = T_plenum_df.values[0]

                        if T_ceiling is not None and T_plenum is not None:
                            if T_ceiling > 0 and T_plenum > 0:
                                section_df[soc_col] = self.get_pcm_soc(T_ceiling=T_ceiling, T_plenum=T_plenum)
                            else:
                                print("negative or 0 temperatures for T_ceiling={} or T_plenum={}".format(T_ceiling, T_plenum))
                        else:
                            print("missing T_ceiling and/or T_plenum for {}".format(zone))

                if not section_df.empty:
                    self.push_to_db(section_df, section_table_name)
                else:
                    print("nothing to push to {0}".format(section_table_name))
            else:
                print("No configuration for section {0}".format(section))

    def get_pcm_soc(self, T_ceiling, T_plenum, eps=0.5):
        Tm = 23  # degC

        T_solid = Tm - eps  # degC
        T_liquid = Tm + eps  # degC

        T_avg = (T_ceiling + T_plenum)/2.0
        if T_plenum > T_liquid and T_ceiling > T_liquid:
            return 0
        elif T_plenum < T_solid and T_ceiling < T_solid:
            return 1
        else:
            soc = 1 - ((T_avg - T_solid) / (T_liquid - T_solid))
            if soc > 1 :
                print(T_ceiling, T_plenum, T_solid, T_liquid, eps, soc)
            return soc

if __name__ == "__main__":
    obj = Cell_Data(config_file='read_data_config.yaml')
    obj.write_to_db()