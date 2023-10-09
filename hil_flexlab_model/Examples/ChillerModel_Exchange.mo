within hil_flexlab_model.Examples;
model ChillerModel_Exchange

  extends Modelica.Icons.Example;


 CCC_test.obsolete.AC_Chiller_PrimaryLoop_addpts cpl    annotation (Placement(transformation(extent={{6,-28},
            {40,-2}})));

  Modelica.Blocks.Sources.Constant m_in(k=0.15)
    annotation (Placement(transformation(extent={{-58,26},{-38,46}})));
  Modelica.Blocks.Sources.Ramp T_in(
    height=15,
    duration=86400/2,
    offset=273 + 10)
    annotation (Placement(transformation(extent={{-6,28},{14,48}})));
  Modelica.Blocks.Sources.Sine OAT(
    amplitude=10,
    f=0.0000115,
    offset=273 + 23) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={22,-54})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=0.15,                   period=3600/2,
    offset=0.15)
    annotation (Placement(transformation(extent={{-90,-26},{-70,-6}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.5)
    annotation (Placement(transformation(extent={{-48,72},{-28,92}})));
  Modelica.Blocks.Sources.Constant On_signal(k=1)
    annotation (Placement(transformation(extent={{-92,68},{-72,88}})));
equation
  connect(greaterThreshold.y, cpl.chiOn) annotation (Line(points={{-27,82},{-20,
          82},{-20,-23.5429},{7.0625,-23.5429}},   color={255,0,255}));
  connect(T_in.y, cpl.T_chw_in) annotation (Line(points={{15,38},{20,38},{20,
          -3.3},{19.8125,-3.3}},
                               color={0,0,127}));
  connect(OAT.y, cpl.T_air_in) annotation (Line(points={{33,-54},{54,-54},{54,
          -25.7714},{38.9375,-25.7714}},
                               color={0,0,127}));
  connect(On_signal.y, greaterThreshold.u) annotation (Line(points={{-71,78},{
          -60,78},{-60,82},{-50,82}}, color={0,0,127}));
  connect(pulse.y, cpl.m_flow_sec) annotation (Line(points={{-69,-16},{-28,-16},
          {-28,-3.3},{12.5875,-3.3}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}})),
    experiment(
      StopTime=86400,
      Interval=60,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end ChillerModel_Exchange;
