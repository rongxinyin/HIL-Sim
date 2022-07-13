within hil_flexlab_model;
partial model partialSourceCoo_weiping_062822
  "Base primary system with single source for cooling"
  replaceable package Medium = Buildings.Media.Water "Water media model";
  parameter Modelica.SIunits.MassFlowRate mSou_flow_nominal = 1e-15 "Nominal mass flow rate through source";
  parameter Modelica.SIunits.Power Q_flow_nominal "Nominal thermal power of source";
  parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")
    "Nominal pressure raise, used for default pressure curve if not specified in record per";



  Buildings.Fluid.Movers.FlowControlled_m_flow pumSou(
    redeclare package Medium = Medium,
    m_flow_nominal=mSou_flow_nominal,
    addPowerToMedium=false,
    nominalValuesDefineDefaultPressureCurve=true,
    dp_nominal=dp_nominal) "Pump serving source" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={0,60})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTemSouSup(
    redeclare package Medium = Medium,
    m_flow_nominal=mSou_flow_nominal)
           "Temperature sensor for source supply water"
    annotation (Placement(transformation(extent={{20,-70},{40,-50}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTemSouRet(
    redeclare package Medium = Medium,
    m_flow_nominal=mSou_flow_nominal)
           "Temperature sensor for source return water"
    annotation (Placement(transformation(extent={{20,50},{40,70}})));
  Modelica.Blocks.Interfaces.RealInput uPum
    "Control signal for pump serving source [0-1]"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Math.Gain gai(k=mSou_flow_nominal)
    "Gain for control signal controlling source pump"
    annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Medium) "Fluid connector a (return to source)"
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        Medium) "Fluid connector b (supply from source)"
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.Blocks.Interfaces.RealOutput TSup
    "Temperature leaving the heating or cooling source"
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=1e-4) annotation (
      Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-90,60})));
  HeatPumps.BlackBox_Generic_TSetpoint blackBox_Generic_TSetpoint(QNom=
        Q_flow_nominal, m_flow_nominal=mSou_flow_nominal)
    annotation (Placement(transformation(
        extent={{11,-13},{-11,13}},
        rotation=180,
        origin={-47,-7})));
  Buildings.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=180,
        origin={-77,21})));
  Modelica.Blocks.Interfaces.RealInput TSetSou
    "Set point temperature of the fluid that leaves the heatpump"
    annotation (Placement(transformation(extent={{-140,-24},{-100,16}})));
  Modelica.Blocks.Interfaces.RealInput TDryBul(unit="K")
    "Dry bulb temperature of source air"
    annotation (Placement(transformation(extent={{-140,10},{-100,50}})));
  Modelica.Blocks.Math.RealToBoolean intRea "Integer to real"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-84,-44})));
equation
  connect(senTemSouRet.port_a, pumSou.port_a)
    annotation (Line(points={{20,60},{10,60}}, color={0,127,255}));
  connect(gai.y, pumSou.m_flow_in) annotation (Line(points={{-59,60},{-50,60},{
          -50,80},{0,80},{0,72},{8.88178e-16,72}},
                                             color={0,0,127}));
  connect(port_a, senTemSouRet.port_b)
    annotation (Line(points={{100,60},{40,60}}, color={0,127,255}));
  connect(senTemSouSup.port_b, port_b)
    annotation (Line(points={{40,-60},{100,-60}}, color={0,127,255}));
  connect(senTemSouSup.T, TSup) annotation (Line(points={{30,-49},{30,-40},{80,
          -40},{80,-20},{110,-20}}, color={0,0,127}));
  connect(gai.u, limiter.y)
    annotation (Line(points={{-82,60},{-85.6,60}}, color={0,0,127}));
  connect(limiter.u, uPum)
    annotation (Line(points={{-94.8,60},{-120,60}}, color={0,0,127}));
  connect(senTemSouSup.port_a, blackBox_Generic_TSetpoint.port_b)
    annotation (Line(points={{20,-60},{-36,-60},{-36,-14.8}}, color={0,127,
          255}));
  connect(pumSou.port_b, blackBox_Generic_TSetpoint.port_a) annotation (
      Line(points={{-10,60},{-36,60},{-36,0.8}}, color={0,127,255}));
  connect(blackBox_Generic_TSetpoint.heatPort, prescribedTemperature.port)
    annotation (Line(points={{-47,6},{-58.5,6},{-58.5,21},{-70,21}}, color={191,
          0,0}));
  connect(blackBox_Generic_TSetpoint.TSet, TSetSou) annotation (Line(points={{
          -53.6,-22.6},{-77.8,-22.6},{-77.8,-4},{-120,-4}}, color={0,0,127}));
  connect(TDryBul, prescribedTemperature.T) annotation (Line(points={{-120,30},
          {-104,30},{-104,21},{-85.4,21}}, color={0,0,127}));
  connect(blackBox_Generic_TSetpoint.TSource, TDryBul) annotation (Line(points=
          {{-67.46,-5.96},{-67.46,12.02},{-120,12.02},{-120,30}}, color={0,0,
          127}));
  connect(intRea.y, blackBox_Generic_TSetpoint.HP_On) annotation (Line(points={
          {-73,-44},{-70,-44},{-70,-16.88},{-67.24,-16.88}}, color={255,0,255}));
  connect(gai.y, intRea.u) annotation (Line(points={{-59,60},{-98,60},{-98,-44},
          {-96,-44}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end partialSourceCoo_weiping_062822;
