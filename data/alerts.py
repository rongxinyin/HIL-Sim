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

    missing_cols_dict = {'1a': [], '1b': []}
    for cell in ['1a', '1b']:
        cell_df=db.get_data(st=st_local, et=et_local, cell=cell)

        for col in cell_df.columns:
            if cell_df[col].isna().all():
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
            print("error sending alert: "+ str(rsp.cotent))
    else:
        print("no missing columns")