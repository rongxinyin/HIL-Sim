within hil_flexlab_model.Test1.BaseClasses1;
model ParallelValvesFlowAdjustment

          package MediumAir = Buildings.Media.Air;
  package MediumWater = Buildings.Media.Water;
    package MediumPropyleneGlycol =
      Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=273.15+50, X_a=
            0.4);


      parameter Modelica.Units.SI.MassFlowRate mCooCoiWat_flow_nominal=0.2811
    "nominal cooling coil water side mass flow rate";
  Buildings.Fluid.Movers.SpeedControlled_y fanSup(
    redeclare package Medium = MediumWater,
    redeclare Buildings.Fluid.Movers.Data.Pumps.Wilo.Stratos30slash1to8 per,
    addPowerToMedium=false)                                    "Supply air fan"
    annotation (Placement(transformation(extent={{-104,-62},{-84,-42}})));
  Buildings.Fluid.Actuators.Valves.TwoWayButterfly valBut1(
    redeclare package Medium = MediumWater,
    m_flow_nominal=2,
    Kvs=2.34) annotation (Placement(transformation(extent={{4,-34},{24,-14}})));
  Buildings.Fluid.Actuators.Valves.TwoWayButterfly valBut(
    redeclare package Medium = MediumWater,
    m_flow_nominal=mCooCoiWat_flow_nominal*0.3333,
    Kvs=2.34) annotation (Placement(transformation(extent={{4,30},{24,50}})));
  Buildings.Fluid.Sources.Boundary_pT souCoo(redeclare package Medium =
        MediumWater, nPorts=1)
              "Sink for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-132,-86})));
  Buildings.Fluid.Sources.Boundary_pT sinCoo1(redeclare package Medium =
        MediumWater, nPorts=2)
              "Sink for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={82,14})));
  Buildings.Fluid.FixedResistances.Junction splSupNor(
    redeclare package Medium = MediumWater,
    m_flow_nominal={2,-1,-1},
    dp_nominal(each displayUnit="Pa") = {0,0,0})
    "Splitter for room supply"
    annotation (Placement(transformation(extent={{11,11},{-11,-11}},
        rotation=180,
        origin={-15,31})));
  Modelica.Blocks.Sources.Constant
                               const(k=1)
    annotation (Placement(transformation(extent={{-162,-46},{-142,-26}})));
  Modelica.Blocks.Tables.CombiTable1Ds combiTableVal1(
    table=[0,0.05; 0.05,0.05; 0.333,1; 0.667,0.05; 1,1],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-44,62},{-24,82}})));
  Modelica.Blocks.Tables.CombiTable1Ds combiTableVal2(
    table=[0,0.05; 0.333,0.05; 0.667,1; 1,1],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-76,-48},{-56,-28}})));
  Modelica.Blocks.Math.Gain gain(k=1)
    annotation (Placement(transformation(extent={{52,-68},{72,-48}})));
  Modelica.Blocks.Interfaces.RealInput CoolingSignal
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo(redeclare package Medium =
        MediumWater)
    annotation (Placement(transformation(extent={{-62,22},{-42,42}})));
  Modelica.Blocks.Interfaces.RealOutput MassFlowSignal
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));
equation
  connect(souCoo.ports[1], fanSup.port_a) annotation (Line(points={{-122,-86},{-110,
          -86},{-110,-52},{-104,-52}}, color={0,127,255}));
  connect(valBut.port_b, sinCoo1.ports[1]) annotation (Line(points={{24,40},{50,
          40},{50,30},{83,30},{83,24}}, color={0,127,255}));
  connect(valBut1.port_b, sinCoo1.ports[2]) annotation (Line(points={{24,-24},{62,
          -24},{62,30},{81,30},{81,24}}, color={0,127,255}));
  connect(splSupNor.port_2, valBut.port_a) annotation (Line(points={{-4,31},{-2,
          31},{-2,40},{4,40}}, color={0,127,255}));
  connect(splSupNor.port_3, valBut1.port_a) annotation (Line(points={{-15,20},{-16,
          20},{-16,-24},{4,-24}}, color={0,127,255}));
  connect(const.y, fanSup.y) annotation (Line(points={{-141,-36},{-102,-36},{-102,
          -32},{-94,-32},{-94,-40}}, color={0,0,127}));
  connect(combiTableVal1.y[1], valBut.y) annotation (Line(points={{-23,72},{0,72},
          {0,64},{14,64},{14,52}}, color={0,0,127}));
  connect(combiTableVal2.y[1], valBut1.y) annotation (Line(points={{-55,-38},{-30,
          -38},{-30,-2},{14,-2},{14,-12}}, color={0,0,127}));
  connect(combiTableVal1.u, CoolingSignal) annotation (Line(points={{-46,72},{-68,
          72},{-68,-24},{-94,-24},{-94,0},{-120,0}}, color={0,0,127}));
  connect(CoolingSignal, combiTableVal2.u) annotation (Line(points={{-120,0},{-94,
          0},{-94,-24},{-88,-24},{-88,-32},{-86,-32},{-86,-38},{-78,-38}},
        color={0,0,127}));
  connect(fanSup.port_b, senMasFlo.port_a) annotation (Line(points={{-84,-52},{-52,
          -52},{-52,18},{-66,18},{-66,32},{-62,32}}, color={0,127,255}));
  connect(senMasFlo.port_b, splSupNor.port_1) annotation (Line(points={{-42,32},
          {-34,32},{-34,31},{-26,31}}, color={0,127,255}));
  connect(senMasFlo.m_flow, gain.u) annotation (Line(points={{-52,43},{-52,46},{
          -34,46},{-34,-58},{50,-58}}, color={0,0,127}));
  connect(gain.y, MassFlowSignal) annotation (Line(points={{73,-58},{94,-58},{94,
          0},{120,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=86400,
      Interval=60,
      __Dymola_Algorithm="Dassl"));
end ParallelValvesFlowAdjustment;
