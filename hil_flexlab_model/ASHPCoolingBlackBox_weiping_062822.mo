within hil_flexlab_model;
model ASHPCoolingBlackBox_weiping_062822
  "Heat pump for cooling with variable COP"
  extends hil_flexlab_model.partialSourceCoo_weiping_062822;
  Modelica.Blocks.Interfaces.RealOutput PEle(unit="W")
    "Electrical power consumption"
    annotation (Placement(transformation(extent={{100,90},{120,110}})));
  Modelica.Blocks.Interfaces.RealOutput yCOP "Electrical power consumption"
    annotation (Placement(transformation(extent={{100,72},{120,92}})));
  Modelica.Blocks.Interfaces.RealOutput ySpd "Electrical power consumption"
    annotation (Placement(transformation(extent={{100,34},{120,54}})));
equation
  connect(blackBox_Generic_TSetpoint.PEl, PEle) annotation (Line(points={{
          -53.6,6},{58,6},{58,100},{110,100}}, color={0,0,127}));
  connect(blackBox_Generic_TSetpoint.COP_HP, yCOP) annotation (Line(points={{
          -56.9,6},{22,6},{22,82},{110,82}}, color={0,0,127}));
  connect(blackBox_Generic_TSetpoint.Mod, ySpd) annotation (Line(points={{-50.3,
          6},{26,6},{26,44},{110,44}}, color={0,0,127}));
  annotation (experiment(
      StartTime=21600000,
      StopTime=23328000,
      Interval=900.00288,
      Tolerance=1e-06,
      __Dymola_Algorithm="Radau"));
end ASHPCoolingBlackBox_weiping_062822;
