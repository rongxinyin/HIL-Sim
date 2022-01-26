within hil_flexlab_model.Examples;
model Flexlab_XRB_Baseline
  "Baseline system containing air-to-air heatpump heating and cooling and economizer"
  extends Modelica.Icons.Example;
  extends hil_flexlab_model.BaseClasses.partialInterface(totPowHVAC(nu=3),
      roo(nPorts=4));
  Modelica.Blocks.Sources.BooleanConstant off(k=false) "Off signal"
    annotation (Placement(transformation(extent={{-80,-42},{-60,-22}})));
  Modelica.Blocks.Sources.Constant zero(k=0) "Zero signal"
    annotation (Placement(transformation(extent={{80,54},{92,66}})));
  hil_flexlab_model.HeatHeatpumpCoolHeatpumpAuxHea rtu(
    mAir_flow_nominal=casDat.mAir_flow_nominal,
    mAir_flow_minOA=casDat.minOAFlo,
    QHea_flow_nominal=casDat.QHea_flow_nominal,
    QCoo_flow_nominal=casDat.QCoo_flow_nominal,
    dp_nominal=casDat.dp_nominal,
    hydraulicEfficiency=casDat.hydraulicEfficiency,
    motorEfficiency=casDat.motorEfficiency,
    COP_heating=casDat.COP_heating,
    COP_cooling=casDat.COP_cooling) "Unit supplying conditioned air to space"
    annotation (Placement(transformation(extent={{-40,-28},{0,12}})));
equation
  connect(off.y,rtu.enaEneRec)  annotation (Line(points={{-59,-32},{-54,-32},{
          -54,-14},{-42,-14}}, color={255,0,255}));
  connect(rtu.enaEvaCoo,rtu.enaEneRec)  annotation (Line(points={{-42,-20},{-54,
          -20},{-54,-14},{-42,-14}}, color={255,0,255}));
  connect(zero.y, PGas)
    annotation (Line(points={{92.6,60},{110,60}}, color={0,0,127}));
  connect(rtu.PFan, totPowHVAC.u[1]) annotation (Line(points={{1,10},{10,10},{10,
          34},{70,34},{70,100},{80,100}}, color={0,0,127}));
  connect(rtu.PHea, totPowHVAC.u[2]) annotation (Line(points={{1,8},{12,8},{12,32},
          {72,32},{72,100},{80,100}}, color={0,0,127}));
  connect(rtu.PCoo, totPowHVAC.u[3]) annotation (Line(points={{1,6},{14,6},{14,30},
          {74,30},{74,100},{80,100}}, color={0,0,127}));
  connect(rtu.TMixAir,con. TMix) annotation (Line(points={{1,-20},{10,-20},{10,
          -46},{-90,-46},{-90,-15.2545},{-82,-15.2545}},
                                             color={0,0,127}));
  connect(rtu.TSup,con. TSup) annotation (Line(points={{1,-22},{8,-22},{8,-44},
          {-88,-44},{-88,-20.1636},{-82,-20.1636}},
                                          color={0,0,127}));
  connect(con.yOutAirFra,rtu. uEco) annotation (Line(points={{-59,-3.8},{-54,
          -3.8},{-54,-8},{-42,-8}},
                              color={0,0,127}));
  connect(con.yHea,rtu. uHea) annotation (Line(points={{-59,7.65455},{-54,
          7.65455},{-54,4},{-42,4}},
                    color={0,0,127}));
  connect(con.yFan,rtu. uFan) annotation (Line(points={{-59,14.2},{-54,14.2},{
          -54,10},{-42,10}},
                     color={0,0,127}));
  connect(rtu.supplyAir, roo.ports[3])
    annotation (Line(points={{0,0},{26,0},{26,-4.6}}, color={0,127,255}));
  connect(rtu.returnAir, roo.ports[4]) annotation (Line(points={{0,-8},{14,-8},{
          14,-4.6},{26,-4.6}}, color={0,127,255}));
  connect(rtu.weaBus, roo.weaBus) annotation (Line(
      points={{-36,9.8},{-36,28},{35,28},{35,16}},
      color={255,204,51},
      thickness=0.5));
  connect(weaBus.TDryBul, con.TEco) annotation (Line(
      points={{-88,90},{-86,90},{-86,-5.27273},{-82,-5.27273}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(rtu.TRet, con.TRet) annotation (Line(points={{1,-26},{6,-26},{6,-48},
          {-92,-48},{-92,-10.3455},{-82,-10.3455}}, color={0,0,127}));
  connect(con.yCoo, rtu.uCoo) annotation (Line(points={{-59,2.74545},{-54,
          2.74545},{-54,-2},{-42,-2}}, color={0,0,127}));
  annotation (experiment(
      StopTime=31536000,
      Interval=179.999712,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Flexlab_XRB_Baseline;
