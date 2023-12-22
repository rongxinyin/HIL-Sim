within hil_flexlab_model.Test2.Fluid1.HeatPumps.Data;
record RongxinSampleHP "RongxinSampleHP"
  extends
    hil_flexlab_model.Test2.Fluid1.HeatPumps.Data.HeatPumpBaseDataDefinition(
    tableP_ele=[0,-13.9,-8.3,-2.8,2.8,8.3,13.9,19.4; 18,850,930,1010,1110,
        1220,1370,1570; 21,980,1060,1160,1250,1370,1530,1730; 24,1110,
        1210,1310,1420,1540,1710,1920],
    tableQdot_con=[0,-13.9,-8.3,-2.8,2.8,8.3,13.9,19.4; 18,1800,2640,3430,
        4330,5370,6540,7850; 21,1610,2380,3260,4130,5140,6280,7570; 24,
        1390,2150,3080,3940,4910,6030,7910],
    mFlow_conNom=3960/4180/5,
    mFlow_evaNom=(2250*1.2)/3600,
    tableUppBou=[-15,25; 20,25]);

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html><p>
  <span style=
  \"font-family: Courier New; color: #006400;\">Data&#160;record&#160;for&#160;type&#160;AWO-M/AWO-M-E-AC&#160;201.A04,
  obtained from the technical guide in the UK.</span>
</p>
<ul>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>"));
end RongxinSampleHP;
