within hil_flexlab_model.ThermalZones;
model VAVBranch_useResistantReheatCoil "Supply branch of a VAV system"
  extends Modelica.Blocks.Icons.Block;
  replaceable package MediumA = Modelica.Media.Interfaces.PartialMedium
    "Medium model for air" annotation (choicesAllMatching=true);
  replaceable package MediumW = Modelica.Media.Interfaces.PartialMedium
    "Medium model for water" annotation (choicesAllMatching=true);

  parameter Boolean allowFlowReversal=true
    "= false to simplify equations, assuming, but not enforcing, no flow reversal";

  parameter Modelica.Units.SI.MassFlowRate m_flow_nominal
    "Mass flow rate of this thermal zone";
  parameter Modelica.Units.SI.Volume VRoo "Room volume";

  Buildings.Fluid.Actuators.Dampers.PressureIndependent vav(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal,
    dpDamper_nominal=220 + 20,
    allowFlowReversal=allowFlowReversal) "VAV box for room" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,40})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(
    redeclare package Medium = MediumA)
    "Fluid connector a1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-60,-110},{-40,-90}}),
        iconTransformation(extent={{-60,-110},{-40,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_b(
    redeclare package Medium = MediumA)
    "Fluid connector b (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-60,90},{-40,110}}),
        iconTransformation(extent={{-60,90},{-40,110}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo(
    redeclare package Medium = MediumA,
    allowFlowReversal=allowFlowReversal)
    "Sensor for mass flow rate" annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-50,70})));
  Modelica.Blocks.Math.Gain fraMasFlo(k=1/m_flow_nominal)
    "Fraction of mass flow rate, relative to nominal flow"
    annotation (Placement(transformation(extent={{0,70},{20,90}})));
  Modelica.Blocks.Math.Gain ACH(k=1/VRoo/1.2*3600) "Air change per hour"
    annotation (Placement(transformation(extent={{0,30},{20,50}})));
  Modelica.Blocks.Interfaces.RealInput yVAV "Signal for VAV damper"
                                                            annotation (
      Placement(transformation(extent={{-140,20},{-100,60}}),
        iconTransformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput yVal
    "Actuator position for reheat valve (0: closed, 1: open)" annotation (
      Placement(transformation(extent={{-140,-60},{-100,-20}}),
        iconTransformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Interfaces.RealOutput y_actual "Actual VAV damper position"
    annotation (Placement(transformation(extent={{100,46},{120,66}}),
        iconTransformation(extent={{100,70},{120,90}})));
  Buildings.Fluid.HeatExchangers.HeaterCooler_u terHea(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=0,
    Q_flow_nominal=1500)
    annotation (Placement(transformation(extent={{-46,-38},{-26,-18}})));
equation
  connect(fraMasFlo.u, senMasFlo.m_flow) annotation (Line(
      points={{-2,80},{-24,80},{-24,70},{-39,70}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(vav.port_b, senMasFlo.port_a) annotation (Line(
      points={{-50,50},{-50,60}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(ACH.u, senMasFlo.m_flow) annotation (Line(
      points={{-2,40},{-24,40},{-24,70},{-39,70}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(senMasFlo.port_b, port_b) annotation (Line(
      points={{-50,80},{-50,100}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(vav.y, yVAV) annotation (Line(points={{-62,40},{-120,40}},
                color={0,0,127}));
  connect(vav.y_actual, y_actual)
    annotation (Line(points={{-57,45},{-57,56},{110,56}}, color={0,0,127}));
  connect(port_a, terHea.port_a) annotation (Line(points={{-50,-100},{-48,-100},
          {-48,-28},{-46,-28}}, color={0,127,255}));
  connect(terHea.port_b, vav.port_a) annotation (Line(points={{-26,-28},{-12,
          -28},{-12,-26},{-10,-26},{-10,2},{-50,2},{-50,30}}, color={0,127,255}));
  connect(yVal, terHea.u) annotation (Line(points={{-120,-40},{-98,-40},{-98,
          -44},{-60,-44},{-60,-22},{-48,-22}}, color={0,0,127}));
  annotation (Icon(
    graphics={
        Rectangle(
          extent={{-108.07,-16.1286},{93.93,-20.1286}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,127,255},
          origin={-68.1286,6.07},
          rotation=90),
        Rectangle(
          extent={{-68,-20},{-26,-60}},
          fillPattern=FillPattern.Solid,
          fillColor={175,175,175},
          pattern=LinePattern.None),
        Rectangle(
          extent={{100.8,-22},{128.8,-44}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192},
          origin={-82,-76.8},
          rotation=90),
        Rectangle(
          extent={{102.2,-11.6667},{130.2,-25.6667}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,127,255},
          origin={-67.6667,-78.2},
          rotation=90),
        Polygon(
          points={{-62,32},{-34,48},{-34,46},{-62,30},{-62,32}},
          pattern=LinePattern.None,
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-68,-28},{-34,-28},{-34,-30},{-68,-30},{-68,-28}},
          pattern=LinePattern.None,
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-68,-52},{-34,-52},{-34,-54},{-68,-54},{-68,-52}},
          pattern=LinePattern.None,
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-48,-34},{-34,-28},{-34,-30},{-48,-36},{-48,-34}},
          pattern=LinePattern.None,
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-48,-34},{-34,-40},{-34,-42},{-48,-36},{-48,-34}},
          pattern=LinePattern.None,
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-48,-46},{-34,-52},{-34,-54},{-48,-48},{-48,-46}},
          pattern=LinePattern.None,
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-48,-46},{-34,-40},{-34,-42},{-48,-48},{-48,-46}},
          pattern=LinePattern.None,
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0})}), Documentation(info="<html>
<p>
Model for a VAV supply branch. 
The terminal VAV box has a pressure independent damper and a water reheat coil. 
The pressure independent damper model includes an idealized flow rate controller 
and requires a discharge air flow rate set-point (normalized to the nominal value) 
as a control signal.
</p>
</html>"));
end VAVBranch_useResistantReheatCoil;
