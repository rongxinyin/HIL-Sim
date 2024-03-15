within hil_flexlab_model.Test1.BaseClasses1;
model ParallelValvesFlow

          package MediumAir = Buildings.Media.Air;
  package MediumWater = Buildings.Media.Water;
    package MediumPropyleneGlycol =
      Buildings.Media.Antifreeze.PropyleneGlycolWater (property_T=273.15+50, X_a=
            0.4);

replaceable package Medium = Buildings.Media.Water;
      parameter Modelica.Units.SI.MassFlowRate mCooCoiWat_flow_nominal=0.2811
    "nominal cooling coil water side mass flow rate";
  Buildings.Fluid.Actuators.Valves.TwoWayButterfly valBut1(
    redeclare package Medium = Medium,
    m_flow_nominal=mCooCoiWat_flow_nominal*0.6667,
    Kvs=2.34) annotation (Placement(transformation(extent={{4,-34},{24,-14}})));
  Buildings.Fluid.Actuators.Valves.TwoWayButterfly valBut(
    redeclare package Medium = Medium,
    m_flow_nominal=mCooCoiWat_flow_nominal*0.3333,
    Kvs=2.34) annotation (Placement(transformation(extent={{4,30},{24,50}})));
  Buildings.Fluid.FixedResistances.Junction splSupNor(
    redeclare package Medium = Medium,
    m_flow_nominal={2,-1,-1},
    dp_nominal(each displayUnit="Pa") = {0,0,0})
    "Splitter for room supply"
    annotation (Placement(transformation(extent={{11,11},{-11,-11}},
        rotation=180,
        origin={-15,31})));
  Modelica.Blocks.Tables.CombiTable1Ds combiTableVal1(
    table=[0.05,0.05; 0.333,1; 0.667,0.05; 1,1],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-44,62},{-24,82}})));
  Modelica.Blocks.Tables.CombiTable1Ds combiTableVal2(
    table=[0.333,0.05; 0.667,1],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-76,-48},{-56,-28}})));
  Modelica.Blocks.Interfaces.RealInput CoolingSignal
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-62,22},{-42,42}})));
  Modelica.Blocks.Interfaces.RealOutput MassFlowMeasurement
    annotation (Placement(transformation(extent={{100,-100},{140,-60}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{92,-10},{112,10}})));
equation
  connect(splSupNor.port_2, valBut.port_a) annotation (Line(points={{-4,31},{-2,
          31},{-2,40},{4,40}}, color={0,127,255}));
  connect(splSupNor.port_3, valBut1.port_a) annotation (Line(points={{-15,20},{-16,
          20},{-16,-24},{4,-24}}, color={0,127,255}));
  connect(combiTableVal1.y[1], valBut.y) annotation (Line(points={{-23,72},{0,72},
          {0,64},{14,64},{14,52}}, color={0,0,127}));
  connect(combiTableVal2.y[1], valBut1.y) annotation (Line(points={{-55,-38},{-30,
          -38},{-30,-2},{14,-2},{14,-12}}, color={0,0,127}));
  connect(combiTableVal1.u, CoolingSignal) annotation (Line(points={{-46,72},{-92,
          72},{-92,-60},{-94,-60},{-94,-80},{-120,-80}},
                                                     color={0,0,127}));
  connect(CoolingSignal, combiTableVal2.u) annotation (Line(points={{-120,-80},{
          -94,-80},{-94,-60},{-92,-60},{-92,-38},{-78,-38}},
        color={0,0,127}));
  connect(senMasFlo.port_b, splSupNor.port_1) annotation (Line(points={{-42,32},
          {-34,32},{-34,31},{-26,31}}, color={0,127,255}));
  connect(senMasFlo.m_flow, MassFlowMeasurement) annotation (Line(points={{-52,43},
          {-52,46},{0,46},{0,0},{94,0},{94,-80},{120,-80}}, color={0,0,127}));
  connect(port_a, senMasFlo.port_a) annotation (Line(points={{-100,0},{-68,0},{
          -68,32},{-62,32}}, color={0,127,255}));
  connect(valBut.port_b, port_b)
    annotation (Line(points={{24,40},{102,40},{102,0}}, color={0,127,255}));
  connect(valBut1.port_b, port_b) annotation (Line(points={{24,-24},{88,-24},{
          88,0},{102,0}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=86400,
      Interval=60,
      __Dymola_Algorithm="Dassl"));
end ParallelValvesFlow;
