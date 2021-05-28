from pyfmi import load_fmu
import yaml
import numpy as np
import asyncio

from flask import Flask, jsonify
import threading

class Emulated_Battery:
    def __init__(self, config_file='battery_config.yaml'):
        with open(config_file) as fp:
            self.config = yaml.safe_load(fp)

        self._initial_SOC = self.config.get('initial_SOC', 0.5)
        self._initial_real_power_setpoint = self.config.get('initial_real_power_setpoint', 0)
        self._initial_poa_pv = self.config.get('initial_poa_pv', 0)
        self._model_update_rate = self.config.get('model_update_rate', 30)

        self._default_real_power_setpoint = self.config.get('default_real_power_setpoint', 0)
        self._min_real_power_setpoint = self.config.get('min_real_power_setpoint', -109000)
        self._max_real_power_setpoint = self.config.get('max_real_power_setpoint', 109000)

        self.fmu_file = self.config.get('fmu_file')
        self.battery = load_fmu(self.fmu_file)

        self.battery.set('simple.SOC_0', self._initial_SOC)
        self.current_SOC = self._initial_SOC
        self.model_options = self.battery.simulate_options()
        self.model_options['initialize'] = True
        self.current_real_power_setpoint = self._initial_real_power_setpoint
        self.current_poa_pv = self._initial_poa_pv
        pset = (['PSet', 'weaPoaPv'], np.array([[0, self.current_real_power_setpoint, self.current_poa_pv], [30, self.current_real_power_setpoint, self.current_poa_pv]]))
        self.battery.simulate(0, 30, pset, options=self.model_options)
        self.model_options['initialize'] = False
        self.current_time = 30

        self.app = Flask('emulated_battery')
        self.app.add_url_rule('/get_data', 'get_data', self.get_readings)

        self.loop = asyncio.get_event_loop()
        self.schedule_tasks()

    def schedule_tasks(self):
        self.loop.create_task(self._periodic_advance_time())

    async def _periodic_advance_time(self):
        while True:
            print("current time == {}".format(self.current_time))
            start = self.current_time
            end = self.current_time + self._model_update_rate

            print("simulating with setpoints: {} and poaPV: {}".format(self.current_real_power_setpoint, self.current_poa_pv))
            setpoint = (['PSet', 'weaPoaPv'], np.array(
                [
                    [start, self.current_real_power_setpoint, self.current_poa_pv],
                    [end, self.current_real_power_setpoint, self.current_poa_pv]
                ]
            ))
            self.battery.simulate(start, end, setpoint, options=self.model_options)
            self.current_time = self.current_time + self._model_update_rate
            await asyncio.sleep(self._model_update_rate)

    def get_readings(self):
        while True:
            self.current_SOC = self.battery.get('SOC_meas')
            measurements = {'real_power_setpoint': self.battery.get('PSet')[0], 'battery_soc': self.current_SOC[0], 'pv_production': self.battery.get('PPv')[0]}
            print(measurements)
            return jsonify(measurements)

    def run(self):
        self.app.run('0.0.0.0')

def main():

    try:
        loop = asyncio.get_event_loop()
        battery = Emulated_Battery()
        threading.Thread(target=battery.run).start()
        loop.run_forever()

    except KeyboardInterrupt:
        print('Stopping event loop')
        loop.stop()

if __name__ == "__main__":

    main()
    print("he")
