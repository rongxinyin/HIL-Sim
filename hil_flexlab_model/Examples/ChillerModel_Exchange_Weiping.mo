within hil_flexlab_model.Examples;
model ChillerModel_Exchange_Weiping

  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Constant m_in(k=0.15)
    annotation (Placement(transformation(extent={{-58,26},{-38,46}})));
  Modelica.Blocks.Sources.Ramp T_in(
    height=15,
    duration=86400/2,
    offset=273 + 10) "return water temperature from the cooling coil"
    annotation (Placement(transformation(extent={{-6,28},{14,48}})));
  Modelica.Blocks.Sources.Sine OAT(
    amplitude=10,
    freqHz=0.0000115,
    offset=273 + 23) "Outdoor Air Temperature"
                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={22,-54})));
  Modelica.Blocks.Sources.Pulse m_dot_in(
    amplitude=0.7,
    period=3600/2,
    offset=0.7)  "return water flowrate from the cooling coil"
    annotation (Placement(transformation(extent={{-90,-26},{-70,-6}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.5)
    annotation (Placement(transformation(extent={{-48,72},{-28,92}})));
  Modelica.Blocks.Sources.Constant On_signal(k=1)
    annotation (Placement(transformation(extent={{-94,72},{-74,92}})));
  hil_flexlab_model.AC_Chiller_PrimaryLoop_Weiping
    aC_Chiller_PrimaryLoop_Weiping
    annotation (Placement(transformation(extent={{6,-22},{38,6}})));
equation
  connect(On_signal.y, greaterThreshold.u) annotation (Line(points={{-73,82},{
          -50,82}},                   color={0,0,127}));
  connect(OAT.y, aC_Chiller_PrimaryLoop_Weiping.T_air_in) annotation (Line(
        points={{33,-54},{64,-54},{64,-19.6},{37,-19.6}}, color={0,0,127}));
  connect(greaterThreshold.y, aC_Chiller_PrimaryLoop_Weiping.chiOn) annotation (
     Line(points={{-27,82},{-12,82},{-12,-17.2},{7,-17.2}}, color={255,0,255}));
  connect(T_in.y, aC_Chiller_PrimaryLoop_Weiping.T_chw_in) annotation (Line(
        points={{15,38},{18,38},{18,4.6},{19,4.6}}, color={0,0,127}));
  connect(m_dot_in.y, aC_Chiller_PrimaryLoop_Weiping.mdot_chw_in) annotation (
      Line(points={{-69,-16},{-28,-16},{-28,4.6},{12.2,4.6}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}})),
    experiment(
      StopTime=86400,
      Interval=60,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end ChillerModel_Exchange_Weiping;
