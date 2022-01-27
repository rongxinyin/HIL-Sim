within hil_flexlab_model.BaseClasses;
model Infiltration "Model for constant infiltration"
  replaceable package Medium = Buildings.Media.Air "Air media package";
  parameter Modelica.SIunits.DimensionlessRatio ACH "Air changes per hour";
  parameter Modelica.SIunits.Volume V "Volume of space";
  Modelica.Blocks.Sources.Constant InfiltrationRate(k=ACH*V/3600)
    "Convert ACH to m^3/s"
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Buildings.Fluid.Sources.MassFlowSource_WeatherData
                                           souInf(
    redeclare final package Medium = Medium,
                             use_m_flow_in=true,
    nPorts=1)   "Source model for air infiltration"
    annotation (Placement(transformation(extent={{40,-20},{60,0}})));
  Buildings.Fluid.Sources.MassFlowSource_WeatherData
                                           sinInf(
    redeclare final package Medium = Medium,
                             use_m_flow_in=true,
    nPorts=1)
    "Sink model for air infiltration"
           annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Bus with weather data"
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare final package Medium =
        Medium) "Inlet port" annotation (Placement(transformation(extent={{90,-50},
            {110,-30}}), iconTransformation(extent={{90,-50},{110,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare final package Medium =
        Medium) "Outlet port" annotation (Placement(transformation(extent={{90,30},
            {110,50}}), iconTransformation(extent={{90,30},{110,50}})));
protected
  Modelica.Blocks.Math.Gain gaiInf(final k=1.2)
                                               "Gain for infiltration"
    annotation (Placement(transformation(extent={{-44,-60},{-24,-40}})));
protected
  Modelica.Blocks.Math.Gain gaiInf1(final k=-1)
                                               "Gain for infiltration"
    annotation (Placement(transformation(extent={{-6,-60},{14,-40}})));
equation
  connect(InfiltrationRate.y,gaiInf. u) annotation (Line(points={{-79,-50},{-46,
          -50}},                               color={0,0,127}));
  connect(gaiInf.y, gaiInf1.u)
    annotation (Line(points={{-23,-50},{-8,-50}}, color={0,0,127}));
  connect(gaiInf1.y, souInf.m_flow_in) annotation (Line(points={{15,-50},{30,-50},
          {30,-2},{40,-2}}, color={0,0,127}));
  connect(gaiInf.y, sinInf.m_flow_in) annotation (Line(points={{-23,-50},{-16,-50},
          {-16,38},{40,38}}, color={0,0,127}));
  connect(sinInf.weaBus, weaBus) annotation (Line(
      points={{40,30.2},{-90,30.2},{-90,90}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(sinInf.weaBus, souInf.weaBus) annotation (Line(
      points={{40,30.2},{-90,30.2},{-90,-10},{-6,-10},{-6,-9.8},{40,-9.8}},
      color={255,204,51},
      thickness=0.5));
  connect(sinInf.ports[1], port_b) annotation (Line(points={{60,30},{80,30},{80,
          40},{100,40}}, color={0,127,255}));
  connect(souInf.ports[1], port_a) annotation (Line(points={{60,-10},{80,-10},{80,
          -40},{100,-40}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Infiltration;
