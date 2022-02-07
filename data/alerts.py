import requests
import os
import sys
import datetime
import pytz
import yaml

if '../' not in sys.path:
    sys.path.append('../')
    
from flexlab.db_layer.db_interface import DB_Interface

def send_simple_message(api_key, recipients, message):
    return requests.post(
        "https://api.mailgun.net/v3/sandbox244efac4658643d69658912e514bddb1.mailgun.org/messages",
        auth=("api", api_key),
        data={"from": "Excited User <akprakash@lbl.gov>",
            "to": recipients,
            "subject": "Missing data alert",
            "text": message})

if __name__ == "__main__":

    with open("alerts_config.yaml") as fp:
        config = yaml.safe_load(fp)

    api_key = config.get('api_key')
    recipients = config.get('recipients')

    tz_local = pytz.timezone("US/Pacific")
    tz_utc = pytz.timezone("UTC")

    db = DB_Interface(config_file='db_interface_config_alerts.yaml')

    et_utc = tz_utc.localize(datetime.datetime.utcnow())
    et_local = et_utc.astimezone(tz_local)
    st_local = et_local - datetime.timedelta(minutes=30)

    points_dict = {
        '1a': ['desk1_plug_power', 'desk2_plug_power', 'desk3_plug_power', 'desk4_plug_power', 'desk5_plug_power',
               'desk6_plug_power', 'desk3_light_power', 'desk4_light_power', 'desk2_light_power', 'desk1_6_light_power',
               'desk5_light_power', '1A-VAV1-Zn_Temp', '1A-VAV2-Zn_Temp', '1A-VAV3-Zn_Temp',
               '1A-VAV1-OccupiedCoolingSetpt', '1A-VAV1-UnoccupiedCoolingSetpt', '1A-VAV1-OccupiedHeatingSetpt',
               '1A-VAV1-UnoccupiedHeatingSetpt', '1A-VAV2-OccupiedCoolingSetpt', '1A-VAV2-UnoccupiedHeatingSetpt',
               '1A-VAV2-UnoccupiedCoolingSetpt', '1A-VAV2-OccupiedHeatingSetpt', '1A-VAV3-OccupiedCoolingSetpt',
               '1A-VAV3-UnoccupiedHeatingSetpt', '1A-VAV3-UnoccupiedCoolingSetpt', '1A-VAV3-OccupiedHeatingSetpt',
               '1A-El-AHU', '1A-El-CHWP', '1A-El-HWP', '1A-El-Exhaust Fan', '1A-Th-Chilled Water', '1B-OAT-1',
               '1A-MidZone-TCS6-DBT', '1A-NorthZone-DBT', '1A-WindowZone-TCS7-DBT', '1A-VAV1-DischargeAirTemp',
               '1A-VAV2-DischargeAirTemp', '1A-VAV3-DischargeAirTemp', '1A-VAV1-DischargeAirflow',
               '1A-VAV2-DischargeAirflow', '1A-VAV3-DischargeAirflow', '1A-ASAM-1', '1A-ARAM-1', '1A-SAT-1',
               '1A-OADA-1-POSN', '1A-RADA-1-POSN'],

        '1b': ['desk3_light_power', 'desk1_light_power', 'desk5_light_power', 'desk2_light_power', 'desk6_light_power',
               'desk4_light_power', 'desk1_plug_power', 'desk2_plug_power', 'desk3_plug_power', 'desk4_plug_power',
               'desk5_plug_power', 'desk6_plug_power', '1B-VAV1-Zn_Temp', '1B-VAV2-Zn_Temp', '1B-VAV3-Zn_Temp',
               '1B-VAV1-OccupiedCoolingSetpt', '1B-VAV1-UnoccupiedCoolingSetpt', '1B-VAV1-OccupiedHeatingSetpt',
               '1B-VAV1-UnoccupiedHeatingSetpt', '1B-VAV2-OccupiedCoolingSetpt', '1B-VAV2-UnoccupiedHeatingSetpt',
               '1B-VAV2-UnoccupiedCoolingSetpt', '1B-VAV2-OccupiedHeatingSetpt', '1B-VAV3-OccupiedCoolingSetpt',
               '1B-VAV3-UnoccupiedHeatingSetpt', '1B-VAV3-UnoccupiedCoolingSetpt', '1B-VAV3-OccupiedHeatingSetpt',
               '1B-El-AHU', '1B-El-CHWP', '1B-El-Exhaust Fan', '1B-El-HWP', '1B-Th-Chilled Water', '1B-OAT-1',
               '1B-MidZone-TCS9-DBT', '1B-NorthZone-DBT', '1B-WindowZone-TCS10-DBT', '1B-VAV1-DischargeAirTemp',
               '1B-VAV2-DischargeAirTemp', '1B-VAV3-DischargeAirTemp', '1B-VAV1-DischargeAirflow',
               '1B-VAV2-DischargeAirflow', '1B-VAV3-DischargeAirflow', '1B-ASAM-1', '1B-ARAM-1', '1B-SAT-1',
               '1B-OADA-1-POSN', '1B-RADA-1-POSN']
    }

    missing_cols_dict = {'1a': [], '1b': []}
    for cell in ['1a', '1b']:
        cell_df=db.get_data(st=st_local, et=et_local, cell=cell)

        points_list = points_dict.get(cell)
        for col in points_list:
            if col in cell_df.columns:
                if cell_df[col].isna().all():
                    missing_cols_dict[cell].append(col)
            else:
                missing_cols_dict[cell].append(col)

    missing = False
    msg = ""
    for cell in missing_cols_dict:
        missing_cols = missing_cols_dict[cell]
        if len(missing_cols) > 0:
            missing = True

            if len(missing_cols) > 0:
                msg += "The following columns have been missing for cell {0} for the last 30min:".format(cell)
                msg += '\n' + ', '.join(missing_cols) + '\n'

    if missing:
        print(msg)
        print(recipients)
        rsp = send_simple_message(api_key=api_key, recipients=recipients, message=msg)

        if rsp.status_code == 200:
            print("successfully sent alert")
        else:
            print("error sending alert: "+ str(rsp.content))
    else:
        print("no missing columns")