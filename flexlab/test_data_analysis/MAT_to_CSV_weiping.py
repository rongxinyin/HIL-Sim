from buildingspy.io.outputfile import Reader
import pandas as pd
import numpy as np
import sys

# python3 MAT_to_CSV_weiping.py your_MAT_file.mat

case=sys.argv[1].replace('.mat','')

finame = "{}.mat".format(case)

ofr1 = Reader(finame, "dymola") 

variables = ofr1.varNames()

tab = pd.read_csv('vav_points_baseline.csv')
#tab = pd.read_csv('rtu_points_long.csv')

df = pd.DataFrame()

for variable in variables:  
    for i in range(len(tab)): 
        if variable == tab['keys'].iloc[i]:    
            print(variable) 
            print(len(df))
            (time, temp) = ofr1.values(variable)
            print(len(temp))
            if len(df)<1:
                df['time'] = time
            if len(temp) < 10:

                temps = pd.DataFrame()
                                    
                temps['time'] = time
                                    
                if tab['offset'].iloc[i]>0:
                                    
                    temps[tab['points'].iloc[i]] = (temp-273.15)*tab['factor'].iloc[i]+tab['offset'].iloc[i]  

                else:        
                    temps[tab['points'].iloc[i]] = (temp)*tab['factor'].iloc[i]+tab['offset'].iloc[i]  


                                    
                df = df.merge(temps, on='time', how='outer')
                                    

                                    
                df = df.sort_values(by=['time'])
                                    
                df[tab['points'].iloc[i]] = df[tab['points'].iloc[i]].interpolate(method='nearest')
            else: 
                              
                if tab['offset'].iloc[i]>0:
                                    
                    df[tab['points'].iloc[i]] = (temp-273.15)*tab['factor'].iloc[i]+tab['offset'].iloc[i]  

                else:        
                    df[tab['points'].iloc[i]] = (temp)*tab['factor'].iloc[i]+tab['offset'].iloc[i]  

                print(variable)                                 
       


 #   df['faulty'] =  [1]*len(temp)  
#else:
 #   df['faulty'] =  [0]*len(temp)  

    
#timeseries_interval=input("Enter the timeseries interval of your '.mat' file: ")


#"""
timeseries_interval=300
sample_time=np.arange(df['time'].iloc[0],df['time'].iloc[-1]+timeseries_interval,timeseries_interval)

df2 = pd.DataFrame()

df2['time'] = sample_time

df = df.merge(df2, on = ["time"], how ='outer')

df = df.sort_values(by=['time'])

df.set_index('time', inplace=True)

df = df.interpolate(method='index')

df.reset_index(inplace=True)

df = df.merge(df2, on = ["time"], how ='inner')

df = df.drop_duplicates('time')

df.reset_index(drop=True, inplace=True)

#"""
df.to_csv('{}.csv'.format(case))
