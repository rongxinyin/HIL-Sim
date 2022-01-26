within hil_flexlab_model.BaseClasses;
model HeatRecoveryIEC
  "Heat recovery with optional indirect evaporative cooling"
  replaceable package Medium1 = Buildings.Media.Air "Medium model for air";
  replaceable package Medium2 = Buildings.Media.Air "Medium model for air";
  parameter Modelica.SIunits.MassFlowRate m1_flow_nominal "Design flow rate of system for Medium 1";
  parameter Modelica.SIunits.MassFlowRate m2_flow_nominal "Design flow rate of system for Medium 2";
  IDEAS.Fluid.HeatExchangers.IndirectEvaporativeHex iec(
    redeclare package Medium1 = Medium1,
    redeclare package Medium2 = Medium2,
    m1_flow_nominal=m1_flow_nominal,
    m2_flow_nominal=m2_flow_nominal,
    eps_adia_on=0.8,
    eps_adia_off=0.8,
    use_eNTU=false,
    UA_adia_on=14000,
    UA_adia_off=23000) "Indirect evaporative cooler" annotation (Placement(
        transformation(
        extent={{-30,-30},{30,30}},
        rotation=180,
        origin={10,-20})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTExhAir(
    m_flow_nominal=m1_flow_nominal,
    allowFlowReversal=false,
    tau=0,
    redeclare package Medium = Medium1) "IEC exhaust air temperature sensor"
    annotation (Placement(transformation(extent={{-30,-70},{-50,-50}})));
  Modelica.Blocks.Math.BooleanToReal reaEneRec
    "Convert boolean to real for energy recovery dampers"
    annotation (Placement(transformation(extent={{-50,-100},{-30,-80}})));
  Buildings.Fluid.Sensors.RelativeHumidityTwoPort senRelHumExhAir(
    redeclare package Medium = Medium1,
    allowFlowReversal=false,
    m_flow_nominal=m1_flow_nominal,
    tau=0) "Relative humidity of exhaust air" annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-70,-60})));
  RTUPCM.HVAC.RTUs.BaseClasses.IdealValve idealValve(redeclare package Medium
      = Medium2, m_flow_nominal=m2_flow_nominal) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={40,26})));
  RTUPCM.HVAC.RTUs.BaseClasses.IdealValve idealValve1(redeclare package Medium
      = Medium1, m_flow_nominal=m1_flow_nominal) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-10,-66})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{-80,-100},{-60,-80}})));
  Modelica.Blocks.Interfaces.BooleanInput evaCooSta
    "Activate evaporative cooling"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.BooleanInput eneRecSta
    "Activate IEC energy recovery"
    annotation (Placement(transformation(extent={{-140,80},{-100,120}})));
  Modelica.Blocks.Interfaces.RealOutput TExh(final unit="K", displayUnit="degC")
    "Exhaust air temperature" annotation (Placement(transformation(extent={{100,90},
            {120,110}}),        iconTransformation(extent={{100,90},{120,110}})));
  Modelica.Blocks.Interfaces.RealOutput phiExhAir
    "Relative humidity of exhaust air"
    annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b2(redeclare package Medium =
        Medium2)
    annotation (Placement(transformation(extent={{92,10},{112,30}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare package Medium =
        Medium1)
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium =
        Medium1)
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a2(redeclare package Medium =
        Medium2)
    annotation (Placement(transformation(extent={{-110,10},{-90,30}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTSupAir(
    m_flow_nominal=m2_flow_nominal,
    allowFlowReversal=false,
    tau=0,
    redeclare package Medium = Medium2) "IEC supply air temperature sensor"
    annotation (Placement(transformation(extent={{60,10},{80,30}})));
  Modelica.Blocks.Interfaces.RealOutput TSup "IECHR supply air temperature"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
equation
  connect(iec.adiabaticOn,evaCooSta)  annotation (Line(points={{-21.2,-20},{-66,
          -20},{-66,60},{-120,60}},
                                 color={255,0,255}));
  connect(TExh,senTExhAir. T) annotation (Line(points={{110,100},{-40,100},{-40,
          -49}},                       color={0,0,127}));
  connect(senTExhAir.port_b,senRelHumExhAir. port_a) annotation (Line(points={{-50,-60},
          {-60,-60}},                       color={0,127,255}));
  connect(senRelHumExhAir.phi,phiExhAir)  annotation (Line(points={{-70.1,-49},
          {-70,-49},{-70,-40},{-36,-40},{-36,80},{110,80}},         color={0,0,
          127}));
  connect(iec.port_b2,idealValve. port_3)
    annotation (Line(points={{40,-2},{40,16}},   color={0,127,255}));
  connect(reaEneRec.y,idealValve. y) annotation (Line(points={{-29,-90},{80,-90},
          {80,40},{40,40},{40,37}},         color={0,0,127}));
  connect(idealValve1.port_2,senTExhAir. port_a)
    annotation (Line(points={{-19.8,-60},{-30,-60}},  color={0,127,255}));
  connect(iec.port_b1,idealValve1. port_3) annotation (Line(points={{-20,-38},{
          -20,-50},{-10,-50},{-10,-56}},   color={0,127,255}));
  connect(reaEneRec.y,idealValve1. y) annotation (Line(points={{-29,-90},{-10,
          -90},{-10,-77}}, color={0,0,127}));
  connect(reaEneRec.u,not1. y)
    annotation (Line(points={{-52,-90},{-59,-90}},   color={255,0,255}));
  connect(eneRecSta,not1. u) annotation (Line(points={{-120,100},{-90,100},{-90,
          -90},{-82,-90}},       color={255,0,255}));
  connect(senRelHumExhAir.port_b, port_b1)
    annotation (Line(points={{-80,-60},{-100,-60}}, color={0,127,255}));
  connect(idealValve1.port_1, port_a1)
    annotation (Line(points={{-0.2,-60},{100,-60}}, color={0,127,255}));
  connect(iec.port_a1, port_a1)
    annotation (Line(points={{40,-38},{40,-60},{100,-60}}, color={0,127,255}));
  connect(iec.port_a2,port_a2)  annotation (Line(points={{-20,-2},{-60,-2},{-60,
          20},{-100,20}},
                      color={0,127,255}));
  connect(port_a2,port_a2)
    annotation (Line(points={{-100,20},{-100,20}}, color={0,127,255}));
  connect(idealValve.port_1,port_a2)  annotation (Line(points={{30.2,20},{-100,
          20}},                color={0,127,255}));
  connect(idealValve.port_2, senTSupAir.port_a)
    annotation (Line(points={{49.8,20},{60,20}}, color={0,127,255}));
  connect(senTSupAir.port_b, port_b2)
    annotation (Line(points={{80,20},{102,20}}, color={0,127,255}));
  connect(senTSupAir.T, TSup)
    annotation (Line(points={{70,31},{70,60},{110,60}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HeatRecoveryIEC;
