within hil_flexlab_model.Examples;
model AWHP_Model_Exchange

  extends Modelica.Icons.Example;

  Plants.AC_AWHP_PrimaryLoop_addpts cpl(TSupChi_nominal(displayUnit="degC"))
    annotation (Placement(transformation(extent={{6,-28},{40,-2}})));

  Modelica.Blocks.Sources.Constant m_in(k=0.255)
    annotation (Placement(transformation(extent={{-56,18},{-36,38}})));
  Modelica.Blocks.Sources.Ramp T_in(
    height=1,
    duration=36000,
    offset=283)
    annotation (Placement(transformation(extent={{64,20},{84,40}})));
  Modelica.Blocks.Sources.Sine OAT(
    amplitude=6.5,
    freqHz=0.0000116,
    offset=273 + 20.5)
                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={22,-54})));
  Modelica.Blocks.Sources.Pulse pulse_mass_flow(
    amplitude=0.08,
    period=3600/3.5,
    offset=0,
    startTime=0)
    annotation (Placement(transformation(extent={{-90,-26},{-70,-6}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.5)
    annotation (Placement(transformation(extent={{-48,72},{-28,92}})));
  Modelica.Blocks.Sources.Constant On_signal(k=1)
    annotation (Placement(transformation(extent={{-94,70},{-74,90}})));
  Modelica.Blocks.Sources.Pulse T_in_fluctuate(
    amplitude=2,
    period=3600/3.5,
    offset=291) annotation (Placement(transformation(extent={{-8,48},{12,68}})));
  Modelica.Blocks.Sources.Sine T_in_fluctuate2(
    amplitude=2,
    freqHz=0.0000116,
    phase=3.1415926535898,
    offset=289) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={36,58})));
  Modelica.Blocks.Sources.Ramp dynamic_on_signal(
    height=-1,
    duration=86400,
    offset=1) annotation (Placement(transformation(extent={{-92,36},{-72,56}})));
equation
  connect(greaterThreshold.y, cpl.chiOn) annotation (Line(points={{-27,82},{-20,
          82},{-20,-23.5429},{7.0625,-23.5429}}, color={255,0,255}));
  connect(OAT.y, cpl.T_air_in) annotation (Line(points={{33,-54},{50,-54},{50,
          -25.7714},{38.9375,-25.7714}}, color={0,0,127}));
  connect(m_in.y, cpl.m_flow_sec) annotation (Line(points={{-35,28},{-12,28},{
          -12,-3.3},{12.5875,-3.3}}, color={0,0,127}));
  connect(T_in.y, cpl.T_chw_in) annotation (Line(points={{85,30},{28,30},{28,
          -3.3},{19.8125,-3.3}}, color={0,0,127}));
  connect(dynamic_on_signal.y, greaterThreshold.u) annotation (Line(points={{
          -71,46},{-60,46},{-60,82},{-50,82}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}})),
    experiment(
      StopTime=86400,
      Interval=60,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end AWHP_Model_Exchange;
