within hil_flexlab_model;
model AirCooledChiller_PrimaryLoop
 extends BaseClasses.Chiller_Prim_Loop;
 package MediumA = Buildings.Media.Air "Medium model for air";
  package MediumW = Buildings.Media.Water "Medium model for water";

  constant Real mChiEva_flow_nominal=1000*0.0095;

  Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=270,
        origin={250,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={190,-244})));
  Buildings.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = MediumW,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={180,-152})));
  Modelica.Blocks.Interfaces.RealInput T_chw_in annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={220,-116})));
  Modelica.Blocks.Interfaces.RealInput m_chw_in annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={184,-116})));
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = MediumW,            nPorts=1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={378,-164})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
        Buildings.Media.Water)
    annotation (Placement(transformation(extent={{332,-174},{352,-154}})));
  Modelica.Blocks.Interfaces.RealOutput Tout annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={342,-120})));
  Buildings.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = MediumA,
    use_m_flow_in=false,
    m_flow=mChiCon_flow_nominal,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={380,-310})));
  Buildings.Fluid.Sources.Boundary_pT bou1(redeclare package Medium = MediumA, nPorts=1)
    annotation (Placement(transformation(extent={{184,-316},{204,-296}})));
  Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={420,-314})));
equation
  connect(chiOn, chi.on) annotation (Line(points={{250,-120},{250,-282.4},{
          241.6,-282.4}},
                  color={255,0,255}));
  connect(booToInt.u, chi.on) annotation (Line(points={{275,-259},{377,-259},{
          377,-282.4},{241.6,-282.4}},
                             color={255,0,255}));
  connect(m_chw_in, boundary.m_flow_in) annotation (Line(points={{184,-116},{184,
          -140},{188,-140}},     color={0,0,127}));
  connect(T_chw_in, boundary.T_in) annotation (Line(points={{220,-116},{220,-140},
          {184,-140}},       color={0,0,127}));
  connect(senTem.port_b, bou.ports[1]) annotation (Line(points={{352,-164},{366,
          -164},{366,-164},{368,-164}}, color={0,127,255}));
  connect(senTem.T, Tout)
    annotation (Line(points={{342,-153},{342,-120}}, color={0,0,127}));
  connect(boundary1.ports[1], chi.port_a1) annotation (Line(points={{370,-310},
          {326,-310},{326,-284.8},{240,-284.8}}, color={0,127,255}));
  connect(boundary.ports[1], jun1.port_2)
    annotation (Line(points={{180,-162},{180,-166}}, color={0,127,255}));
  connect(jun.port_1, senTem.port_a)
    annotation (Line(points={{308,-164},{332,-164}}, color={0,127,255}));
  connect(chi.port_b1, bou1.ports[1]) annotation (Line(points={{224,-284.8},{
          214,-284.8},{214,-306},{204,-306}}, color={0,127,255}));
  connect(boundary1.T_in, T_air_in)
    annotation (Line(points={{392,-314},{420,-314}}, color={0,0,127}));
                                        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
            {180,-320},{400,-140}}), graphics={
        Rectangle(
          extent={{-70,80},{70,-80}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          origin={286,-244},
          rotation=360),
        Rectangle(
          extent={{-100.5,5},{100.5,-5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          origin={287.5,-185},
          rotation=360),
        Rectangle(
          extent={{-100.5,5},{100.5,-5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          origin={287.5,-305},
          rotation=360),
        Rectangle(
          extent={{-57,9},{57,-9}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={287,-185},
          rotation=360),
        Rectangle(
          extent={{-57,9},{57,-9}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={287,-305},
          rotation=360),
        Rectangle(
          extent={{-100.5,5},{100.5,-5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          origin={281.5,-185},
          rotation=360),
        Rectangle(
          extent={{-100.5,5},{100.5,-5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          origin={287.5,-303},
          rotation=360),
        Rectangle(
          extent={{-50,-5},{50,5}},
          lineColor={0,0,127},
          pattern=LinePattern.None,
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid,
          origin={342,-187},
          rotation=360),
        Polygon(
          points={{0,6},{-10,-6},{10,-6},{0,6}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={326,-246},
          rotation=360),
        Polygon(
          points={{0,-5},{-10,5},{10,5},{0,-5}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={326,-233},
          rotation=360),
        Rectangle(
          extent={{-2,20},{2,-20}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={244,-214},
          rotation=360),
        Rectangle(
          extent={{-2,20},{2,-20}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={244,-276},
          rotation=360),
        Rectangle(
          extent={{-2,51},{2,-51}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={326,-245},
          rotation=360),
        Ellipse(
          extent={{-16,16},{16,-16}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={244,-244},
          rotation=180),
        Polygon(
          points={{0,8},{-16,-8},{16,-8},{0,8}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          origin={244,-244},
          rotation=180),
        Rectangle(
          extent={{-50,-5},{50,5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          origin={244,-305},
          rotation=360)}),                                                                             Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{180,-320},{400,
            -140}})));
end AirCooledChiller_PrimaryLoop;
