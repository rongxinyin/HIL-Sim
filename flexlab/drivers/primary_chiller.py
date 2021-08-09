from driver import Driver, pd, np, datetime
import logging
from flexlab.drivers.modbus_driver import Modbus_Driver

class Primary_Chiller(Driver):
    def __init__(self, config_file="read_data_config.yaml"):
        logging.basicConfig(format='%(asctime)s %(levelname)s:%(message)s', level=logging.INFO)
        self.logger = logging.getLogger(__name__)

        try:
            super(Primary_Chiller, self).__init__(config_file=config_file)
        except Exception as e:
            self.logger.error("error reading config file={0} error={1}".format(config_file, str(e)))

        self.primary_chiller_config = self.config.get('primary_chiller')
        self.table_name = self.primary_chiller_config.get('db_table_name')


        self.chiller = Modbus_Driver(config_file, config_section='primary_chiller')
        self.chiller.initialize_modbus()


    def write_to_db(self):
        time_now = self.get_utc_time_now()
        measurements = self.chiller.get_data(unit=self.chiller.UNIT_ID)
        print(measurements)
        df = pd.DataFrame.from_records(measurements, index=[time_now])
        df.index.name = 'time'
        self.chiller.kill_modbus()

        if not df.empty:
            self.push_to_db(df, self.table_name)
        else:
            print("nothing to push to {0}".format(self.table_name))

if __name__ == "__main__":
    obj = Primary_Chiller(config_file='read_data_config.yaml')
    obj.write_to_db()