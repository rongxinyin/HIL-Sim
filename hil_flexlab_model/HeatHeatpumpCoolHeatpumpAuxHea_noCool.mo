within hil_flexlab_model;
model HeatHeatpumpCoolHeatpumpAuxHea_noCool
  "Air supply unit model with heatpump heating and cooling and auxiliary electric heater for heating"
  extends hil_flexlab_model.BaseClasses.partialAirUnit_noCool;
  parameter Modelica.SIunits.DimensionlessRatio COP_heating = 3.5 "Coefficient of performance in heating";
  parameter Modelica.SIunits.DimensionlessRatio COP_cooling = 3.5 "Coefficient of performance in cooling";
  Buildings.Fluid.HeatExchangers.HeaterCooler_u heaCoi(
    redeclare package Medium = MediumA,
    m_flow_nominal=mAir_flow_nominal,
    dp_nominal=0,
    Q_flow_nominal=QHea_flow_nominal) "Heating coil"
    annotation (Placement(transformation(extent={{30,30},{50,50}})));
  Modelica.Blocks.Interfaces.RealOutput PHea
    "Heating thermal power consumption"
    annotation (Placement(transformation(extent={{200,110},{220,130}})));
  Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.Data.Generic.DXCoil datCoi(
    nSta=1,
    minSpeRat=0,
    sta={
        Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.Data.Generic.BaseClasses.Stage(
        spe=1,
        nomVal=
          Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.Data.Generic.BaseClasses.NominalValues(
          Q_flow_nominal=-QCoo_flow_nominal,
          COP_nominal=COP_cooling,
          SHR_nominal=0.7,
          m_flow_nominal=mAir_flow_nominal),
        perCur=
          Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.Data.Generic.BaseClasses.PerformanceCurve(
          capFunT={1,0,0,0,0,0},
          capFunFF={1,0,0,0},
          EIRFunT={1,0,0,0,0,0},
          EIRFunFF={1,0,0,0},
          TConInMin=273.15 + 0,
          TConInMax=273.15 + 50,
          TEvaInMin=273.15 + 0,
          TEvaInMax=273.15 + 50,
          ffMin=0,
          ffMax=10))},
    m_flow_small=0.0001*mAir_flow_nominal)      "Coil data"
    annotation (Placement(transformation(extent={{90,-20},{110,0}})));

  Modelica.Blocks.Math.Gain TDryBul(k=1)
    annotation (Placement(transformation(extent={{20,150},{40,170}})));
  Modelica.Blocks.Sources.RealExpression copHea(y=
        hil_flexlab_model.BaseClasses.Functions.COP_ASHP(abs(senTSup.T -
        TDryBul.y)))
    annotation (Placement(transformation(extent={{40,118},{60,138}})));
  hil_flexlab_model.BaseClasses.COP_ASHP_AuxHeat powHeaPum(QHeaPum_flow_nominal=QCoo_flow_nominal)
    "Power consumption calculation for heat pump heating"
    annotation (Placement(transformation(extent={{90,110},{110,130}})));
equation
  connect(uHea, heaCoi.u) annotation (Line(points={{-220,80},{24,80},{24,46},{
          28,46}},
                color={0,0,127}));
  connect(heaCoi.port_a, totalRes.port_b)
    annotation (Line(points={{30,40},{20,40}}, color={0,127,255}));
  connect(weaBus.TDryBul, TDryBul.u) annotation (Line(
      points={{-180,170},{-180,160},{18,160}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(heaCoi.Q_flow, QHea) annotation (Line(points={{51,46},{50,46},{50,-60},
          {210,-60}}, color={0,0,127}));
  connect(powHeaPum.copHeaPum, copHea.y) annotation (Line(points={{88,124},{70,
          124},{70,128},{61,128}}, color={0,0,127}));
  connect(powHeaPum.Q_flow, heaCoi.Q_flow) annotation (Line(points={{88,128},{
          80,128},{80,68},{51,68},{51,46}}, color={0,0,127}));
  connect(powHeaPum.PEle, PHea) annotation (Line(points={{111,130},{116,130},{
          116,120},{210,120}}, color={0,0,127}));
  connect(senMasFloSup.port_a, heaCoi.port_b)
    annotation (Line(points={{100,40},{50,40}}, color={0,127,255}));
  annotation (Icon(graphics={
        Line(points={{198,100},{112,100},{112,44}}, color={0,0,127}),
        Line(points={{198,120},{46,120},{46,46}},   color={0,0,127}),
        Ellipse(
          extent={{104,76},{114,48}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}), experiment(
      StartTime=19872000,
      StopTime=19958400,
      Interval=60,
      Tolerance=1e-06));
end HeatHeatpumpCoolHeatpumpAuxHea_noCool;
