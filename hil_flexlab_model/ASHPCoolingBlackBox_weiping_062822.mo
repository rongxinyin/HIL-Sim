within hil_flexlab_model;
model ASHPCoolingBlackBox_weiping_062822
  "Heat pump for cooling with variable COP"
  extends hil_flexlab_model.partialSourceCoo_weiping_062822;
  Modelica.Blocks.Interfaces.RealOutput PEle(unit="W")
    "Electrical power consumption"
    annotation (Placement(transformation(extent={{100,90},{120,110}})));
  Modelica.Blocks.Interfaces.RealInput TDryBul(unit="K")
    "Dry bulb temperature of source air"
    annotation (Placement(transformation(extent={{-140,68},{-100,108}})));
  Modelica.Blocks.Interfaces.RealInput TSetSou
    "Set point temperature of the fluid that leaves the heatpump"
    annotation (Placement(transformation(extent={{-140,10},{-100,50}})));
  Modelica.Blocks.Math.RealToBoolean intRea "Integer to real"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,-40})));
equation
  connect(blackBox_Generic_TSetpoint.PEl, PEle) annotation (Line(points={{
          -53.6,6},{58,6},{58,100},{110,100}}, color={0,0,127}));
  connect(TSetSou, blackBox_Generic_TSetpoint.TSet) annotation (Line(points=
         {{-120,30},{-74,30},{-74,-22.6},{-53.6,-22.6}}, color={0,0,127}));
  connect(TDryBul, blackBox_Generic_TSetpoint.TSource) annotation (Line(
        points={{-120,88},{-98,88},{-98,-5.96},{-67.46,-5.96}}, color={0,0,
          127}));
  connect(TDryBul, prescribedTemperature.T) annotation (Line(points={{-120,
          88},{-104,88},{-104,21},{-85.4,21}}, color={0,0,127}));
  connect(intRea.y, blackBox_Generic_TSetpoint.HP_On) annotation (Line(points={{
          -69,-40},{-69,-27},{-67.24,-27},{-67.24,-16.88}}, color={255,0,255}));
  connect(uPum, intRea.u) annotation (Line(points={{-120,60},{-106,60},{-106,-40},
          {-92,-40}}, color={0,0,127}));
  annotation (experiment(
      StartTime=21600000,
      StopTime=23328000,
      Interval=900.00288,
      Tolerance=1e-06,
      __Dymola_Algorithm="Radau"));
end ASHPCoolingBlackBox_weiping_062822;
