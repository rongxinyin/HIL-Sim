from modbus_driver import Modbus_Driver


obj = Modbus_Driver("modbus_config.yaml",)

# DEFAULT: {'temperature_setpoint1': 44, 'temperature_setpoint2': 1, 'temperature_high_alarm': 6, 'temperature_low_alarm': 5, 'heartbeat': 17, 'zone1_temp': 46, 'zone2_temp': 0}
# bottom 7 seg display is setpoint and top is current temperature. top one's segments are broken though
obj.initialize_modbus()
output = obj.get_data(0)
print("-----current values of the registers-----")
print(output)
zone1_temp = output['zone1_temp']
# print(zone1_temp & 0x1100)
# print(zone1_temp & 0x0011)


# obj.write_register('temperature_setpoint1', 42)
# {'temperature_setpoint1': 42, 'temperature_setpoint2': 1, 'temperature_high_alarm': 6, 'temperature_low_alarm': 5, 'heartbeat': 1, 'zone1_temp': 47, 'zone2_temp': 0}
# {'temperature_setpoint1': 42, 'temperature_setpoint2': 1, 'temperature_high_alarm': 6, 'temperature_low_alarm': 5, 'heartbeat': 0, 'zone1_temp': 46, 'zone2_temp': 0}
# {'temperature_setpoint1': 42, 'temperature_setpoint2': 1, 'temperature_high_alarm': 6, 'temperature_low_alarm': 5, 'heartbeat': 1, 'zone1_temp': 45, 'zone2_temp': 0}
# {'temperature_setpoint1': 42, 'temperature_setpoint2': 1, 'temperature_high_alarm': 6, 'temperature_low_alarm': 5, 'heartbeat': 0, 'zone1_temp': 44, 'zone2_temp': 0}

# {'temperature_setpoint1': 44, 'temperature_setpoint2': 1, 'temperature_high_alarm': 6, 'temperature_low_alarm': 5, 'heartbeat': 1, 'zone1_temp': 44, 'zone2_temp': 0, 'zone1_status': -6976}

obj.kill_modbus()

# 1	LP Switch	Output 4	Output 3	Output 2	Output 1	Evapora-tor OUT probe	Evapora-tor IN probe	1	Zone ON	Comp. Overload	Low Oil Pressure	Freeze-stat	High Refrig. Pressure	Low Refrig. Pressure	Low Water Flow
# 1 1           1           0           0           1           0                       0                       1   1       0               0                   0           0                       0                       0


# {'temperature_setpoint1': 44, 'temperature_setpoint2': 1, 'temperature_high_alarm': 6, 'temperature_low_alarm': 5, 'heartbeat': 16, 'zone1_temp': 45, 'zone4_temp': 0, 'zone1_status': -8000, 'zone4_status': 0}

# 1	LP Switch	Output 4	Output 3	Output 2	Output 1	Evapora-tor OUT probe	Evapora-tor IN probe	1	Zone ON	Comp. Overload	Low Oil Pressure	Freeze-stat	High Refrig. Pressure	Low Refrig. Pressure	Low Water Flow
# 1 1           1           0           0           0           0                       0                       1   1       0               00000

# When output1 became 0, the sound stopped

