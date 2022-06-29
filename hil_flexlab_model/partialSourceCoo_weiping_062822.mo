within hil_flexlab_model;
partial model partialSourceCoo_weiping_062822
  "Base primary system with single source for cooling"
  replaceable package Medium = Buildings.Media.Water "Water media model";
  parameter Modelica.SIunits.MassFlowRate mSou_flow_nominal "Nominal mass flow rate through source";
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
  HeatPumps.BlackBox_Generic_TSetpoint blackBox_Generic_TSetpoint
    annotation (Placement(transformation(
        extent={{11,-13},{-11,13}},
        rotation=180,
        origin={-47,-7})));
  Buildings.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=180,
        origin={-77,21})));
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
  connect(prescribedTemperature.port, blackBox_Generic_TSetpoint.heatPort)
    annotation (Line(points={{-70,21},{-48,21},{-48,6},{-47,6}}, color={191,
          0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end partialSourceCoo_weiping_062822;
