How to create a table in timescaleDB?

Step1: create a table
CREATE TABLE setpoints( time TIMESTAMP NOT NULL, name TEXT NOT NULL, value DOUBLE PRECISION  NOT NULL);

Step2: convert it to hypertable
SELECT create_hypertable('setpoints', 'time');

Step3: setup a unique index
CREATE UNIQUE INDEX ON setpoints (name, time DESC);



from flexlab.db_layer import db_interface
import datetime
import pandas as pd
import pytz
chiller_db = db_interface.DB_Interface()
end_t = datetime.datetime.now(pytz.timezone('US/Pacific')
start_t = end_t - datetime.timedelta(minutes=14)
chiller_db._query_single_system(st=start_t, et=end_t, cell='1a', system='chiller', resample_minutes=15)