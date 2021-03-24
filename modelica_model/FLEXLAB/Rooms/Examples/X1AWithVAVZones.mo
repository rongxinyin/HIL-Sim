within FLEXLAB.Rooms.Examples;
model X1AWithVAVZones "Example model showing a use of X1A"
  extends Modelica.Icons.Example;

  package Air = Buildings.Media.Air "Air model used in the example model";
  package Water = Buildings.Media.Water
    "Water model used in the radiant slab loop";

  Modelica.Blocks.Sources.CombiTimeTable intGai(table=[0,0,0,0; 86400,0,0,0],
      tableOnFile=false)
    "Internal gain heat flow (Radiant = 1, Convective = 2, Latent = 3)"
    annotation (Placement(transformation(extent={{-290,110},{-270,130}})));
  Modelica.Blocks.Sources.CombiTimeTable shaPos(table=[0,1; 86400,1],
      tableOnFile=false) "Position of the shade"
    annotation (Placement(transformation(extent={{-290,140},{-270,160}})));
  Modelica.Blocks.Sources.CombiTimeTable airCon(table=[0,0.1,293.15; 86400,0.1,293.15],
    tableOnFile=true,
    tableName="airCon",
    fileName=Modelica.Utilities.Files.loadResource(
       "modelica://Buildings/Resources/Data/ThermalZones/Detailed/FLEXLAB/Rooms/Examples/X3AWithRadiantFloor.txt"),
    columns=2:5) "Inlet air conditions (y[1] = m_flow, y[4] = T)"
    annotation (Placement(transformation(extent={{-290,74},{-270,94}})));
  Buildings.Fluid.Sources.MassFlowSource_T airInNorthZone(
    use_m_flow_in=true,
    use_T_in=true,
    redeclare package Medium = Air,
    nPorts=1) "Inlet air conditions (from AHU) for X1A North Zone"
    annotation (Placement(transformation(extent={{-254,66},{-234,86}})));
  Buildings.Fluid.Sources.Boundary_pT airOutNorthZone(redeclare package Medium =
        Air, nPorts=1) "Air outlet for X1A north zone"
    annotation (Placement(transformation(extent={{-256,40},{-236,60}})));

  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic
    slaCon(nLay=3, material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.1524,
        k=1.13,
        c=1000,
        d=1400,
        nSta=5),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.127,
        k=0.036,
        c=1200,
        d=40),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.2,
        k=1.8,
        c=1100,
        d=2400)}) "Construction of the slab"
    annotation (Placement(transformation(extent={{174,-80},{194,-60}})));
  parameter Buildings.Fluid.Data.Pipes.PEX_RADTEST pipe(dIn=0.015875, dOut=0.01905)
    annotation (Placement(transformation(extent={{174,-58},{194,-38}})));

  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
    Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos"))
    annotation (Placement(transformation(extent={{-290,174},{-270,194}})));
  Buildings.HeatTransfer.Sources.PrescribedTemperature preT2[2]   annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={86,-88})));
  FLEXLAB.Rooms.X1A.Electrical ele(
    redeclare package Medium = Air, nPorts=2,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "Model of the electrical room"
    annotation (Placement(transformation(extent={{106,46},{146,86}})));
  FLEXLAB.Rooms.X1A.Closet
    clo(
    redeclare package Medium = Air,
    nPorts=2,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "Model of the closet"
    annotation (Placement(transformation(extent={{22,132},{62,172}})));
  Modelica.Blocks.Sources.CombiTimeTable TNei(
    table=[0,293.15,293.15; 86400,293.15,293.15], tableOnFile=false)
    "Temperature of the neighboring test cells (y[1] = X2B, y[2] = X3B)"
    annotation (Placement(transformation(extent={{132,-98},{112,-78}})));
  Modelica.Blocks.Sources.CombiTimeTable intGaiEle(
    table=[0,0,0,0; 86400,0,0,0], tableOnFile=false)
    "Internal gain heat flow for the electrical room"
    annotation (Placement(transformation(extent={{-110,64},{-90,84}})));
  Modelica.Blocks.Sources.CombiTimeTable airConEle(
    tableOnFile=true,
    tableName="airCon",
    fileName=Modelica.Utilities.Files.loadResource(
       "modelica://Buildings/Resources/Data/ThermalZones/Detailed/FLEXLAB/Rooms/Examples/X3AWithRadiantFloor.txt"),
    columns=2:5)
    "Inlet air conditions for the connected electrical room (y[1] = m_flow, y[4] = T)"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        origin={-100,42})));

  Modelica.Blocks.Sources.CombiTimeTable airConClo(
    tableOnFile=true,
    tableName="airCon",
    fileName=Modelica.Utilities.Files.loadResource(
       "modelica://Buildings/Resources/Data/ThermalZones/Detailed/FLEXLAB/Rooms/Examples/X3AWithRadiantFloor.txt"),
    columns=2:5)
    "Inlet air conditions for the connected closet (y[1] = m_flow, y[4] = T)"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        origin={-102,130})));

  Buildings.Fluid.Sources.MassFlowSource_T airInEle(
    use_m_flow_in=true,
    use_T_in=true,
    redeclare package Medium = Air,
    nPorts=1) "Inlet air conditions (from AHU) for the electrical room"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        origin={-40,34})));
  Buildings.Fluid.Sources.Boundary_pT airOutEle(          redeclare package
      Medium = Air, nPorts=1)
                    "Air outlet from the electrical room"
    annotation (Placement(transformation(extent={{-50,-8},{-30,12}})));
  Buildings.Fluid.Sources.MassFlowSource_T airInClo(
    use_m_flow_in=true,
    use_T_in=true,
    redeclare package Medium = Air,
    nPorts=1) "Inlet air conditions (from AHU) for the closet"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-46,134})));
  Buildings.Fluid.Sources.Boundary_pT airOutClo(
    redeclare package Medium = Air, nPorts=1) "Air outlet from the closet"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        origin={-48,100})));
  Modelica.Blocks.Sources.CombiTimeTable intGaiClo(
    table=[0,0,0,0; 86400,0,0,0], tableOnFile=false)
    "Internal gain heat flow for the closet"
    annotation (Placement(transformation(extent={{-112,150},{-92,170}})));

  FLEXLAB.Rooms.X1A.SouthZone southZone(
    nPorts=1,
    redeclare package Medium = Air,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "Model of the X1ASouthZone room"
    annotation (Placement(transformation(extent={{-220,-158},{-180,-118}})));
  Modelica.Blocks.Sources.CombiTimeTable intGai1(table=[0,0,0,0; 86400,0,0,0],
      tableOnFile=false)
    "Internal gain heat flow (Radiant = 1, Convective = 2, Latent = 3)"
    annotation (Placement(transformation(extent={{-288,-148},{-268,-128}})));
  Modelica.Blocks.Sources.CombiTimeTable shaPos1(table=[0,1; 86400,1],
      tableOnFile=false) "Position of the shade"
    annotation (Placement(transformation(extent={{-288,-116},{-268,-96}})));
  Modelica.Blocks.Sources.CombiTimeTable airCon1(
    table=[0,0.1,293.15; 86400,0.1,293.15],
    tableOnFile=true,
    tableName="airCon",
    fileName=Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/Data/ThermalZones/Detailed/FLEXLAB/Rooms/Examples/X3AWithRadiantFloor.txt"),
    columns=2:5) "Inlet air conditions (y[1] = m_flow, y[4] = T)"
    annotation (Placement(transformation(extent={{-288,-178},{-268,-158}})));

  Fluid.Sources.MassFlowSource_T airInSouthZone(
    use_m_flow_in=true,
    use_T_in=true,
    redeclare package Medium = Air,
    nPorts=1) "Inlet air conditions (from AHU) for X1A South Zone"
    annotation (Placement(transformation(extent={{-250,-176},{-230,-156}})));
  Fluid.Sources.Boundary_pT airOutSouthZone(redeclare package Medium = Air,
      nPorts=1) "Air outlet for X1A south zone"
    annotation (Placement(transformation(extent={{-252,-208},{-232,-188}})));

  FLEXLAB.Rooms.X1A.CoreZone coreZone(
    nPorts=1,
    redeclare package Medium = Air,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "Model of the X1A CoreZone room"
    annotation (Placement(transformation(extent={{-222,-34},{-182,6}})));
  Modelica.Blocks.Sources.CombiTimeTable shaPos2(table=[0,1; 86400,1],
      tableOnFile=false) "Position of the shade"
    annotation (Placement(transformation(extent={{-288,2},{-268,22}})));
  Modelica.Blocks.Sources.CombiTimeTable intGai2(table=[0,0,0,0; 86400,0,0,0],
      tableOnFile=false)
    "Internal gain heat flow (Radiant = 1, Convective = 2, Latent = 3)"
    annotation (Placement(transformation(extent={{-288,-28},{-268,-8}})));
  Modelica.Blocks.Sources.CombiTimeTable airCon2(
    table=[0,0.1,293.15; 86400,0.1,293.15],
    tableOnFile=true,
    tableName="airCon",
    fileName=Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/Data/ThermalZones/Detailed/FLEXLAB/Rooms/Examples/X3AWithRadiantFloor.txt"),
    columns=2:5) "Inlet air conditions (y[1] = m_flow, y[4] = T)"
    annotation (Placement(transformation(extent={{-288,-60},{-268,-40}})));

  Fluid.Sources.MassFlowSource_T airInCoreZone(
    use_m_flow_in=true,
    use_T_in=true,
    redeclare package Medium = Air,
    nPorts=1) "Inlet air conditions (from AHU) for X1A Core Zone"
    annotation (Placement(transformation(extent={{-252,-68},{-232,-48}})));
  Fluid.Sources.Boundary_pT airOutCoreZone(redeclare package Medium = Air,
      nPorts=1) "Air outlet for X1A Core Zone"
    annotation (Placement(transformation(extent={{-252,-96},{-232,-76}})));
  FLEXLAB.Rooms.X1A.NorthZone northZone(
    nPorts=1,
    redeclare package Medium = Air,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "Model of the X1A NorthZone room"
    annotation (Placement(transformation(extent={{-218,90},{-178,130}})));
  FLEXLAB.Rooms.X1A.Plenum plenum(
    nPorts=1,
    redeclare package Medium = Air,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "Model of the X1A Plenum room"
    annotation (Placement(transformation(extent={{-58,-212},{-18,-172}})));
  Modelica.Blocks.Sources.CombiTimeTable airCon3(
    table=[0,0.1,293.15; 86400,0.1,293.15],
    tableOnFile=true,
    tableName="airCon",
    fileName=Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/Data/ThermalZones/Detailed/FLEXLAB/Rooms/Examples/X3AWithRadiantFloor.txt"),
    columns=2:5) "Inlet air conditions (y[1] = m_flow, y[4] = T)"
    annotation (Placement(transformation(extent={{-162,-158},{-142,-138}})));

  Fluid.Sources.MassFlowSource_T airInPlenum(
    use_m_flow_in=true,
    use_T_in=true,
    redeclare package Medium = Air,
    nPorts=1) "Inlet air conditions (from AHU) for X1A Plenum"
    annotation (Placement(transformation(extent={{-126,-166},{-106,-146}})));
  Fluid.Sources.Boundary_pT airOutPlenum(redeclare package Medium = Air, nPorts=
       1) "Air outlet for X1A Plenum"
    annotation (Placement(transformation(extent={{-126,-194},{-106,-174}})));
  Modelica.Blocks.Sources.CombiTimeTable intGai3(table=[0,0,0,0; 86400,0,0,0],
      tableOnFile=false)
    "Internal gain heat flow (Radiant = 1, Convective = 2, Latent = 3)"
    annotation (Placement(transformation(extent={{-98,-124},{-78,-104}})));
equation
  connect(airCon.y[1], airInNorthZone.m_flow_in) annotation (Line(
      points={{-269,84},{-256,84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airCon.y[4], airInNorthZone.T_in) annotation (Line(
      points={{-269,84},{-262,84},{-262,80},{-256,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weaDat.weaBus, ele.weaBus)    annotation (Line(
      points={{-270,184},{143.9,184},{143.9,83.9}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaDat.weaBus,clo. weaBus) annotation (Line(
      points={{-270,184},{59.9,184},{59.9,169.9}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(airConEle.y[4], airInEle.T_in) annotation (Line(
      points={{-89,42},{-80,42},{-80,38},{-52,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airInEle.ports[1], ele.ports[1])    annotation (Line(
      points={{-30,34},{84,34},{84,54},{111,54}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(airInClo.ports[1],clo. ports[1]) annotation (Line(
      points={{-36,134},{10,134},{10,140},{27,140}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TNei.y, preT2.T)   annotation (Line(
      points={{111,-88},{98,-88}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(preT2[2].port, clo.surf_conBou[2])   annotation (Line(
      points={{76,-88},{48,-88},{48,136}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(airConClo.y[4], airInClo.T_in) annotation (Line(
      points={{-91,130},{-58,130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airConEle.y[3], airInEle.m_flow_in) annotation (Line(
      points={{-89,42},{-52,42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airConClo.y[2], airInClo.m_flow_in) annotation (Line(
      points={{-91,130},{-80,130},{-80,126},{-58,126}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airOutClo.ports[1],clo. ports[2]) annotation (Line(
      points={{-38,100},{-4,100},{-4,144},{27,144}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(intGaiEle.y, ele.qGai_flow)    annotation (Line(
      points={{-89,74},{104.4,74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(intGaiClo.y,clo. qGai_flow) annotation (Line(
      points={{-91,160},{20.4,160}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airCon1.y[1], airInSouthZone.m_flow_in) annotation (Line(
      points={{-267,-168},{-262,-168},{-262,-158},{-252,-158}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airCon1.y[4], airInSouthZone.T_in) annotation (Line(
      points={{-267,-168},{-262,-168},{-262,-162},{-252,-162}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(shaPos1.y,southZone. uSha) annotation (Line(points={{-267,-106},{-244,
          -106},{-244,-120},{-221.6,-120}}, color={0,0,127}));
  connect(intGai1.y,southZone. qGai_flow) annotation (Line(points={{-267,-138},{
          -242,-138},{-242,-130},{-221.6,-130}}, color={0,0,127}));
  connect(airInSouthZone.ports[1],southZone. ports[1]) annotation (Line(points={
          {-230,-166},{-222,-166},{-222,-148},{-215,-148}}, color={0,127,255}));
  connect(airOutSouthZone.ports[1],southZone. ports[1]) annotation (Line(points=
         {{-232,-198},{-222,-198},{-222,-148},{-215,-148}}, color={0,127,255}));
  connect(weaDat.weaBus,southZone. weaBus) annotation (Line(
      points={{-270,184},{-150,184},{-150,-120.1},{-182.1,-120.1}},
      color={255,204,51},
      thickness=0.5));
  connect(shaPos2.y, coreZone.uSha) annotation (Line(points={{-267,12},{-223.6,12},
          {-223.6,4}}, color={0,0,127}));
  connect(intGai2.y, coreZone.qGai_flow) annotation (Line(points={{-267,-18},{-238,
          -18},{-238,-6},{-223.6,-6}}, color={0,0,127}));
  connect(weaDat.weaBus, coreZone.weaBus) annotation (Line(
      points={{-270,184},{-158,184},{-158,3.9},{-184.1,3.9}},
      color={255,204,51},
      thickness=0.5));
  connect(airCon2.y[1], airInCoreZone.m_flow_in) annotation (Line(
      points={{-267,-50},{-254,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airCon2.y[4], airInCoreZone.T_in) annotation (Line(
      points={{-267,-50},{-260,-50},{-260,-54},{-254,-54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airInCoreZone.ports[1], coreZone.ports[1]) annotation (Line(points={{-232,
          -58},{-224,-58},{-224,-24},{-217,-24}}, color={0,127,255}));
  connect(airOutCoreZone.ports[1], coreZone.ports[1]) annotation (Line(points={{-232,
          -86},{-224,-86},{-224,-24},{-217,-24}},      color={0,127,255}));
  connect(shaPos.y, northZone.uSha)
    annotation (Line(points={{-269,150},{-246,150},{-246,128},{-219.6,128}},
                                                       color={0,0,127}));
  connect(intGai.y, northZone.qGai_flow) annotation (Line(points={{-269,120},{
          -244,120},{-244,118},{-219.6,118}},
                                           color={0,0,127}));
  connect(airOutNorthZone.ports[1], northZone.ports[1]) annotation (Line(points={{-236,50},
          {-224,50},{-224,100},{-213,100}},           color={0,127,255}));
  connect(airInNorthZone.ports[1], northZone.ports[1]) annotation (Line(points={{-234,76},
          {-224,76},{-224,100},{-213,100}},           color={0,127,255}));
  connect(preT2[2].port, northZone.surf_conBou[2]) annotation (Line(points={{76,-88},
          {-134,-88},{-134,22},{-194,22},{-194,94},{-192,94}},      color={191,0,
          0}));
  connect(weaDat.weaBus, northZone.weaBus) annotation (Line(
      points={{-270,184},{-168,184},{-168,127.9},{-180.1,127.9}},
      color={255,204,51},
      thickness=0.5));
  connect(ele.ports[2], airOutEle.ports[1]) annotation (Line(points={{111,58},{40.5,
          58},{40.5,2},{-30,2}}, color={0,127,255}));
  connect(southZone.surf_conBou[2], coreZone.surf_conBou[3]) annotation (Line(
        points={{-194,-154},{-196,-154},{-196,-30}}, color={191,0,0}));
  connect(coreZone.surf_conBou[2], northZone.surf_conBou[5]) annotation (Line(
        points={{-196,-30},{-194,-30},{-194,94},{-192,94}}, color={191,0,0}));
  connect(weaDat.weaBus, plenum.weaBus) annotation (Line(
      points={{-270,184},{160,184},{160,-174.1},{-20.1,-174.1}},
      color={255,204,51},
      thickness=0.5));
  connect(airCon3.y[1], airInPlenum.m_flow_in) annotation (Line(
      points={{-141,-148},{-128,-148}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airCon3.y[4], airInPlenum.T_in) annotation (Line(
      points={{-141,-148},{-142,-148},{-142,-152},{-128,-152}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airInPlenum.ports[1], plenum.ports[1]) annotation (Line(points={{-106,
          -156},{-106,-202},{-53,-202}},             color={0,127,255}));
  connect(airOutPlenum.ports[1], plenum.ports[1]) annotation (Line(points={{-106,
          -184},{-106,-202},{-53,-202}},             color={0,127,255}));
  connect(intGai3.y, plenum.qGai_flow) annotation (Line(points={{-77,-114},{-72,
          -114},{-72,-184},{-59.6,-184}}, color={0,0,127}));
  connect(northZone.surf_conBou[6], plenum.surf_conBou[4]) annotation (Line(
        points={{-192,94},{-140,94},{-140,-208},{-32,-208}}, color={191,0,0}));
  connect(coreZone.surf_conBou[4], plenum.surf_conBou[5]) annotation (Line(
        points={{-196,-30},{-160,-30},{-160,-208},{-32,-208}}, color={191,0,0}));
  connect(southZone.surf_conBou[3], plenum.surf_conBou[6]) annotation (Line(
        points={{-194,-154},{-176,-154},{-176,-208},{-32,-208}}, color={191,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-300,
            -210},{200,200}})),
          Documentation(info="<html>
<p>This model demonstrates one potential simulation using the models available in <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X1A\">Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X1A</a>. This example simulates test cell X1A when it is conditioned with a radiant slab. This example model includes heat transfer between the test cell, the outdoor environment, the radiant slab conditioning the test cell, the connected electrical room and closet, and the neighboring test cells. </p>
<p>The connections between the test cell and the external models are described in the following table. Only models not included in the X1A package are included. For documentation describing the connections between X1A models see <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X1A\">Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X1A</a>. </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p align=\"center\"><h4>External model name</h4></p></td>
<td><p align=\"center\"><h4>External model significance</h4></p></td>
<td><p align=\"center\"><h4>External model port</h4></p></td>
<td><p align=\"center\"><h4>X1A port</h4></p></td>
</tr>
<tr>
<td><p>weaDat</p></td>
<td><p>Outdoor weather</p></td>
<td><p>weaDat.weaBus</p></td>
<td><p>X1A.weaBus</p></td>
</tr>
<tr>
<td><p>TNei</p></td>
<td><p>Neighboring test cells (X2B and X3B)</p></td>
<td><p>X2B: X1A.preTem2.port[1]</p><p>X3B: X1A.preTem2.port[2]</p></td>
<td><p>X2B: X1A.surf_conBou[1]</p><p>X3B: X1A.surf_conBou[2]</p></td>
</tr>
<tr>
<td><p>shaPos</p></td>
<td><p>Table describing the position of the window shade</p></td>
<td><p>shaPos.y[1]</p></td>
<td><p>X1A.uSha</p></td>
</tr>
<tr>
<td><p>intGai</p></td>
<td><p>Table specifying the internal gains in the space</p></td>
<td><p>intGai[1,2,3]</p></td>
<td><p>X1A.qGai_flow[1,2,3]</p></td>
</tr>
<tr>
<td><p>airIn</p></td>
<td><p>Prescribed airflow describing service air from the AHU</p></td>
<td><p>airIn.ports[1]</p></td>
<td><p>X1A.ports[1]</p></td>
</tr>
<tr>
<td><p>airOut</p></td>
<td><p>Outlet for ventilation air flow</p></td>
<td><p>airOut.ports[1]</p></td>
<td><p>X1A.ports[1]</p></td>
</tr>
</table>
<p><br>The connections between the closet and external models are described in the following table. Only connections to models not included in the X1A package are described. </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p align=\"center\"><h4>External model name</h4></p></td>
<td><p align=\"center\"><h4>External model significance</h4></p></td>
<td><p align=\"center\"><h4>External model port</h4></p></td>
<td><p align=\"center\"><h4>clo port</h4></p></td>
</tr>
<tr>
<td><p>intGaiClo</p></td>
<td><p>Table specifying the internal gains in the closet</p></td>
<td><p>intGaiClo[1,2,3]</p></td>
<td><p>clo.qGai_flow[1,2,3]</p></td>
</tr>
<tr>
<td><p>airInClo</p></td>
<td><p>Prescribed airflow describing service air from the AHU</p></td>
<td><p>airInClo.ports[1]</p></td>
<td><p>clo.ports[1]</p></td>
</tr>
<tr>
<td><p>airOutClo</p></td>
<td><p>Outlet for ventilation air flow</p></td>
<td><p>airOutClo.ports[1]</p></td>
<td><p>clo.ports[1]</p></td>
</tr>
<tr>
<td><p>preT</p></td>
<td><p>Prescribed temperature describing the ground temperature</p></td>
<td><p>preT.port</p></td>
<td><p>clo.surf_conBou[3]</p></td>
</tr>
</table>
<p><br>The connections between the electrical room and external models are described in the following table. Only connections to models not included in the X1A package are described. </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p align=\"center\"><h4>External model name</h4></p></td>
<td><p align=\"center\"><h4>External model significance</h4></p></td>
<td><p align=\"center\"><h4>External model port</h4></p></td>
<td><p align=\"center\"><h4>ele port</h4></p></td>
</tr>
<tr>
<td><p>intGaiEle</p></td>
<td><p>Table specifying the internal gains in the electrical room</p></td>
<td><p>intGaiEle[1,2,3]</p></td>
<td><p>ele.qGai_flow[1,2,3]</p></td>
</tr>
<tr>
<td><p>airInEle</p></td>
<td><p>Prescribed airflow describing service air from the AHU</p></td>
<td><p>airInEle.ports[1]</p></td>
<td><p>ele.ports[1]</p></td>
</tr>
<tr>
<td><p>airOutEle</p></td>
<td><p>Outlet for ventilation air flow</p></td>
<td><p>airOutEle.ports[1]</p></td>
<td><p>ele.ports[1]</p></td>
</tr>
<tr>
<td><p>preT</p></td>
<td><p>Prescribed temperature describing the ground temperature</p></td>
<td><p>preT.port</p></td>
<td><p>ele.surf_conBou[1]</p></td>
</tr>
</table>
<p><br><br>The model only simulates the space conditions, the effects of the radiant slab, and the heat transfer between the rooms. The air handling unit, chilled water plant, shade control, internal gains, and ground temperature are all modeled by reading data from tables. Currently the ventilation air is read from an external data file, via the model <span style=\"font-family: Courier New;\">airCon</span>, while the others use tables described in the data reader model. The table below shows the name of data input files in the model, what physical phenomena the data file describes, the physical quantity of each data file output, and the source of the data. </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Model name</h4></p></td>
<td><p align=\"center\"><h4>Quantity described</h4></p></td>
<td><p align=\"center\"><h4>Data source</h4></p></td>
<td><p align=\"center\"><h4>y[1] significance</h4></p></td>
<td><p align=\"center\"><h4>y[2] significance</h4></p></td>
<td><p align=\"center\"><h4>y[3] significance</h4></p></td>
<td><p align=\"center\"><h4>y[4] significance</h4></p></td>
<td></td>
</tr>
<tr>
<td><p><br>shaPos</p></td>
<td><p>Position of the shade</p></td>
<td><p>Table in model</p></td>
<td><p>Position of the shade</p></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td><p><br><br><br><br>intGai</p></td>
<td><p>Internal gains</p></td>
<td><p>Table in model</p></td>
<td><p>Radiant heat</p></td>
<td><p>Convective heat</p></td>
<td><p>Latent heat</p></td>
<td></td>
<td></td>
</tr>
<tr>
<td><p><br><br>airCon</p></td>
<td><p>Ventilation air from air handling unit</p></td>
<td><p>External text file</p></td>
<td><p>Mass flow rate</p></td>
<td></td>
<td></td>
<td><p><br><br>Temperature</p></td>
<td></td>
</tr>
<tr>
<td><p><br>watCon</p></td>
<td><p>Conditioning water from central plant</p></td>
<td><p>Table in model</p></td>
<td><p>Mass flow rate</p></td>
<td><p>Temperature</p></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td><p><br><br><br>TGro</p></td>
<td><p>Ground temperature</p></td>
<td><p>Table in model</p></td>
<td><p>Temperature</p></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td><p><br><br><br><br>intGaiClo</p></td>
<td><p>Internal gains for the closet</p></td>
<td><p>Table in model</p></td>
<td><p>Radiant heat</p></td>
<td><p>Convective heat</p></td>
<td><p>Latent heat</p></td>
<td></td>
<td></td>
</tr>
<tr>
<td><p><br><br>intGaiEle</p></td>
<td><p>Internal gains for the electrical room</p></td>
<td><p>Table in model</p></td>
<td><p>Radiant heat</p></td>
<td><p>Convective heat</p></td>
<td><p>Latent heat</p></td>
<td></td>
<td></td>
</tr>
<tr>
<td><p><br><br>airConEle</p></td>
<td><p>Ventilation air from AHU in the electrical room</p></td>
<td><p>External text file</p></td>
<td></td>
<td></td>
<td><p><br><br>Mass flow rate</p></td>
<td><p>Temperature</p></td>
<td></td>
</tr>
<tr>
<td><p><br>airConClo</p></td>
<td><p>Ventilation air from AHU in closet</p></td>
<td><p>External text file</p></td>
<td></td>
<td><p><br>Mass flow rate</p></td>
<td></td>
<td><p><br>Temperature</p></td>
<td></td>
</tr>
<tr>
<td><p><br>TNei</p></td>
<td><p>Temperature of the neighboring cells</p></td>
<td><p>Table in model</p></td>
<td><p>X2B</p></td>
<td><p>X3B</p></td>
<td></td>
<td></td>
<td></td>
</tr>
</table>
<p><br><br><br><br>In the above table blank entries either show that there is no data to describe, or that the data is describing a quantity for a separate model. Two examples are: </p>
<ul>
<li>The table for shaPos only contains data for shade position. Because it only has a y[1] value the remaining columns in the table are left blank. </li>
<li>airCon, airConClo, and airConEle all share an external data file. They all use the same temperature data, located in y[4] of the external data file. The three room models use different air mass flow rates. airCon uses the flow rate from y[1] in the data file, airConClo uses the flow rate from y[2], and airConEle uses the flow rate from y[3]. Thus, the other entries for each row in the table are left blank because the data is innapropriate for that particular model. </li>
</ul>
<p>The ventilation air flow rates used during occupied hours in this example were calculated using the assumption of 4 air changes per hour (ACH). It is assumed that there is no ventilation flow during unoccupied hours. </p>
</html>", revisions="<html>
          <ul>
          <li>
          January 09, 2017, by Thierry S. Nouidui:<br/>
          Fixed wrong <code>port</code> index.
          </li>
          <li>
          December 07, 2016, by Thierry S. Nouidui:<br/>
          Changed example to place a state at the surface.
          </li>
          <li>
          April 21, 2016, by Michael Wetter:<br/>
          Replaced <code>ModelicaServices.ExternalReferences.loadResource</code> with
          <code>Modelica.Utilities.Files.loadResource</code>.
          </li>
          <li>
          December 22, 2014 by Michael Wetter:<br/>
          Removed <code>Modelica.Fluid.System</code>
          to address issue
          <a href=\"https://github.com/lbl-srg/modelica-buildings/issues/311\">#311</a>.
          </li>
          <li>September 2, 2014, by Michael Wetter:<br/>
          Corrected wrong pipe diameter.
          </li>
          <li>June 30, 2014, by Michael Wetter:<br/>
          Specified equations to be used to compute the initial conditions.</li>
          <li>October 11, 2013, by Michael Wetter:<br/>
          Added missing <code>parameter</code> keyword in the declaration of the data record.</li>
          <li>Sep 16, 2013 by Peter Grant:<br/>
          Added connections to include floor models in Closet and Electrical.</li>
          <li>Jun 10, 2013 by Peter Grant:<br/>
          First implementation.</li>
          </ul>
          </html>"),
     __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/ThermalZones/Detailed/FLEXLAB/Rooms/Examples/X1AWithRadiantFloor.mos"
        "Simulate and plot"),
     experiment(Tolerance=1e-6, StopTime=864000));
end X1AWithVAVZones;
