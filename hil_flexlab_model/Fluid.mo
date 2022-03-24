within hil_flexlab_model;
package Fluid "HP models are stored here"
  model HeatHeatpumpCoolHeatpumpAuxHea_noIEC
    "Air supply unit model with heatpump heating and cooling and auxiliary electric heater for heating"
    extends hil_flexlab_model.BaseClasses.partialAirUnit;
    parameter Modelica.SIunits.DimensionlessRatio COP_heating = 3.5 "Coefficient of performance in heating";
    parameter Modelica.SIunits.DimensionlessRatio COP_cooling = 3.5 "Coefficient of performance in cooling";
    Buildings.Fluid.HeatExchangers.HeaterCooler_u heaCoi(
      redeclare package Medium = MediumA,
      m_flow_nominal=mAir_flow_nominal,
      dp_nominal=0,
      Q_flow_nominal=QHea_flow_nominal) "Heating coil"
      annotation (Placement(transformation(extent={{30,30},{50,50}})));
    Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.VariableSpeed
                                                  cooCoil(
      datCoi=datCoi,
      redeclare package Medium = MediumA,
      dp_nominal=0,
      minSpeRat=0)                       "Cooling coil"
      annotation (Placement(transformation(extent={{70,30},{90,50}})));
    Modelica.Blocks.Interfaces.RealOutput PHea
      "Heating thermal power consumption"
      annotation (Placement(transformation(extent={{200,110},{220,130}})));
    Modelica.Blocks.Interfaces.RealOutput PCoo
      "Cooling electrical power consumption"
      annotation (Placement(transformation(extent={{200,90},{220,110}})));
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

    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{120,90},{140,110}})));
    Modelica.Blocks.Sources.RealExpression copCoo(y=
          hil_flexlab_model.BaseClasses.Functions.COP_ASHP(abs(senTSup.T -
          TDryBul.y)))
      annotation (Placement(transformation(extent={{120,118},{140,138}})));
    Modelica.Blocks.Math.Gain cooCor(k=-1)
      "Correction for cooling power to be positive"
      annotation (Placement(transformation(extent={{146,124},{154,132}})));
    Modelica.Blocks.Math.Division pow
      annotation (Placement(transformation(extent={{160,110},{180,90}})));
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
    connect(heaCoi.port_b, cooCoil.port_a)
      annotation (Line(points={{50,40},{70,40}}, color={0,127,255}));
    connect(heaCoi.port_a, totalRes.port_b)
      annotation (Line(points={{30,40},{20,40}}, color={0,127,255}));
    connect(uCoo, cooCoil.speRat) annotation (Line(points={{-220,20},{-160,20},{
            -160,90},{64,90},{64,48},{69,48}}, color={0,0,127}));
    connect(weaBus.TDryBul, cooCoil.TConIn) annotation (Line(
        points={{-180,170},{-180,100},{62,100},{62,43},{69,43}},
        color={255,204,51},
        thickness=0.5), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(cooCoil.QSen_flow, add.u1) annotation (Line(points={{91,47},{96,47},{
            96,106},{118,106}},   color={0,0,127}));
    connect(cooCoil.QLat_flow, add.u2) annotation (Line(points={{91,45},{98,45},{
            98,94},{118,94}},   color={0,0,127}));
    connect(copCoo.y, cooCor.u)
      annotation (Line(points={{141,128},{145.2,128}}, color={0,0,127}));
    connect(cooCor.y, pow.u2) annotation (Line(points={{154.4,128},{158,128},{158,
            106}}, color={0,0,127}));
    connect(add.y, pow.u1) annotation (Line(points={{141,100},{152,100},{152,94},
            {158,94}}, color={0,0,127}));
    connect(pow.y, PCoo)
      annotation (Line(points={{181,100},{210,100}}, color={0,0,127}));
    connect(weaBus.TDryBul, TDryBul.u) annotation (Line(
        points={{-180,170},{-180,160},{18,160}},
        color={255,204,51},
        thickness=0.5), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(cooCoil.port_b, senMasFloSup.port_a)
      annotation (Line(points={{90,40},{100,40}}, color={0,127,255}));
    connect(heaCoi.Q_flow, QHea) annotation (Line(points={{51,46},{50,46},{50,-60},
            {210,-60}}, color={0,0,127}));
    connect(add.y, QCoo) annotation (Line(points={{141,100},{152,100},{152,76},{
            160,76},{160,-80},{210,-80}}, color={0,0,127}));
    connect(powHeaPum.copHeaPum, copHea.y) annotation (Line(points={{88,124},{70,
            124},{70,128},{61,128}}, color={0,0,127}));
    connect(powHeaPum.Q_flow, heaCoi.Q_flow) annotation (Line(points={{88,128},{
            80,128},{80,68},{51,68},{51,46}}, color={0,0,127}));
    connect(powHeaPum.PEle, PHea) annotation (Line(points={{111,130},{116,130},{
            116,120},{210,120}}, color={0,0,127}));
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
  end HeatHeatpumpCoolHeatpumpAuxHea_noIEC;

  model HeatHeatpumpCoolHeatpumpAuxHea
    "Air supply unit model with heatpump heating and cooling and auxiliary electric heater for heating"
    extends hil_flexlab_model.BaseClasses.partialAirUnit;

    parameter Modelica.SIunits.DimensionlessRatio COP_heating = 3.5 "Coefficient of performance in heating";
    parameter Modelica.SIunits.DimensionlessRatio COP_cooling = 3.5 "Coefficient of performance in cooling";
    Buildings.Fluid.HeatExchangers.HeaterCooler_u heaCoi(
      redeclare package Medium = MediumA,
      m_flow_nominal=mAir_flow_nominal,
      dp_nominal=0,
      Q_flow_nominal=QHea_flow_nominal) "Heating coil"
      annotation (Placement(transformation(extent={{30,30},{50,50}})));
    Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.VariableSpeed
                                                  cooCoil(
      datCoi=datCoi,
      redeclare package Medium = MediumA,
      dp_nominal=0,
      minSpeRat=0)                       "Cooling coil"
      annotation (Placement(transformation(extent={{70,30},{90,50}})));
    Modelica.Blocks.Interfaces.RealOutput PHea
      "Heating thermal power consumption"
      annotation (Placement(transformation(extent={{200,110},{220,130}})));
    Modelica.Blocks.Interfaces.RealOutput PCoo
      "Cooling electrical power consumption"
      annotation (Placement(transformation(extent={{200,90},{220,110}})));
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

    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{120,90},{140,110}})));
    Modelica.Blocks.Sources.RealExpression copCoo(y=
          RTUPCM.HVAC.Plants.BaseClasses.Functions.COP_ASHP(abs(senTSup.T -
          TDryBul.y)))
      annotation (Placement(transformation(extent={{120,118},{140,138}})));
    Modelica.Blocks.Math.Gain cooCor(k=-1)
      "Correction for cooling power to be positive"
      annotation (Placement(transformation(extent={{146,124},{154,132}})));
    Modelica.Blocks.Math.Division pow
      annotation (Placement(transformation(extent={{160,110},{180,90}})));
    Modelica.Blocks.Math.Gain TDryBul(k=1)
      annotation (Placement(transformation(extent={{20,150},{40,170}})));
    Modelica.Blocks.Sources.RealExpression copHea(y=
          RTUPCM.HVAC.Plants.BaseClasses.Functions.COP_ASHP(abs(senTSup.T -
          TDryBul.y)))
      annotation (Placement(transformation(extent={{40,118},{60,138}})));
    RTUPCM.HVAC.Plants.BaseClasses.COP_ASHP_AuxHeat powHeaPum(
        QHeaPum_flow_nominal=QCoo_flow_nominal)
      "Power consumption calculation for heat pump heating"
      annotation (Placement(transformation(extent={{90,110},{110,130}})));
  equation
    connect(uHea, heaCoi.u) annotation (Line(points={{-220,80},{24,80},{24,46},{
            28,46}},
                  color={0,0,127}));
    connect(heaCoi.port_b, cooCoil.port_a)
      annotation (Line(points={{50,40},{70,40}}, color={0,127,255}));
    connect(heaCoi.port_a, totalRes.port_b)
      annotation (Line(points={{30,40},{20,40}}, color={0,127,255}));
    connect(uCoo, cooCoil.speRat) annotation (Line(points={{-220,20},{-160,20},{
            -160,90},{64,90},{64,48},{69,48}}, color={0,0,127}));
    connect(weaBus.TDryBul, cooCoil.TConIn) annotation (Line(
        points={{-180,170},{-180,100},{62,100},{62,43},{69,43}},
        color={255,204,51},
        thickness=0.5), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(cooCoil.QSen_flow, add.u1) annotation (Line(points={{91,47},{96,47},{
            96,106},{118,106}},   color={0,0,127}));
    connect(cooCoil.QLat_flow, add.u2) annotation (Line(points={{91,45},{98,45},{
            98,94},{118,94}},   color={0,0,127}));
    connect(copCoo.y, cooCor.u)
      annotation (Line(points={{141,128},{145.2,128}}, color={0,0,127}));
    connect(cooCor.y, pow.u2) annotation (Line(points={{154.4,128},{158,128},{158,
            106}}, color={0,0,127}));
    connect(add.y, pow.u1) annotation (Line(points={{141,100},{152,100},{152,94},
            {158,94}}, color={0,0,127}));
    connect(pow.y, PCoo)
      annotation (Line(points={{181,100},{210,100}}, color={0,0,127}));
    connect(weaBus.TDryBul, TDryBul.u) annotation (Line(
        points={{-180,170},{-180,160},{18,160}},
        color={255,204,51},
        thickness=0.5), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(cooCoil.port_b, senMasFloSup.port_a)
      annotation (Line(points={{90,40},{100,40}}, color={0,127,255}));
    connect(heaCoi.Q_flow, QHea) annotation (Line(points={{51,46},{50,46},{50,-60},
            {210,-60}}, color={0,0,127}));
    connect(add.y, QCoo) annotation (Line(points={{141,100},{152,100},{152,76},{
            160,76},{160,-80},{210,-80}}, color={0,0,127}));
    connect(powHeaPum.copHeaPum, copHea.y) annotation (Line(points={{88,124},{70,
            124},{70,128},{61,128}}, color={0,0,127}));
    connect(powHeaPum.Q_flow, heaCoi.Q_flow) annotation (Line(points={{88,128},{
            80,128},{80,68},{51,68},{51,46}}, color={0,0,127}));
    connect(powHeaPum.PEle, PHea) annotation (Line(points={{111,130},{116,130},{
            116,120},{210,120}}, color={0,0,127}));
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
  end HeatHeatpumpCoolHeatpumpAuxHea;

  model HeatHeatpumpCoolHeatpumpAuxHea_noIEC_2stage
    "Air supply unit model with heatpump heating and cooling and auxiliary electric heater for heating"
    extends hil_flexlab_model.BaseClasses.partialAirUnit;
    parameter Modelica.SIunits.DimensionlessRatio COP_heating = 3.5 "Coefficient of performance in heating";
    parameter Modelica.SIunits.DimensionlessRatio COP_cooling = 3.5 "Coefficient of performance in cooling";
    Buildings.Fluid.HeatExchangers.HeaterCooler_u heaCoi(
      redeclare package Medium = MediumA,
      m_flow_nominal=mAir_flow_nominal,
      dp_nominal=0,
      Q_flow_nominal=QHea_flow_nominal) "Heating coil"
      annotation (Placement(transformation(extent={{30,30},{50,50}})));
    Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.MultiStage
                                                  cooCoil(
      datCoi=datCoi,
      redeclare package Medium = MediumA,
      dp_nominal=0)                       "Cooling coil"
      annotation (Placement(transformation(extent={{70,30},{90,50}})));
    Modelica.Blocks.Interfaces.RealOutput PHea
      "Heating thermal power consumption"
      annotation (Placement(transformation(extent={{200,110},{220,130}})));
    Modelica.Blocks.Interfaces.RealOutput PCoo
      "Cooling electrical power consumption"
      annotation (Placement(transformation(extent={{200,90},{220,110}})));
    Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.Data.Generic.DXCoil datCoi(
      nSta=2,
      minSpeRat=0,
      sta={
      Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.Data.Generic.BaseClasses.Stage(
          spe=0.66,
          nomVal=
          Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.Data.Generic.BaseClasses.NominalValues(
             Q_flow_nominal=-QCoo_flow_nominal*0.66,
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
            ffMax=10)),
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

    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{120,90},{140,110}})));
    Modelica.Blocks.Sources.RealExpression copCoo(y=
          hil_flexlab_model.BaseClasses.Functions.COP_ASHP(abs(senTSup.T -
          TDryBul.y)))
      annotation (Placement(transformation(extent={{120,118},{140,138}})));
    Modelica.Blocks.Math.Gain cooCor(k=-1)
      "Correction for cooling power to be positive"
      annotation (Placement(transformation(extent={{146,124},{154,132}})));
    Modelica.Blocks.Math.Division pow
      annotation (Placement(transformation(extent={{160,110},{180,90}})));
    Modelica.Blocks.Math.Gain TDryBul(k=1)
      annotation (Placement(transformation(extent={{20,150},{40,170}})));
    Modelica.Blocks.Sources.RealExpression copHea(y=
          hil_flexlab_model.BaseClasses.Functions.COP_ASHP(abs(senTSup.T -
          TDryBul.y)))
      annotation (Placement(transformation(extent={{40,118},{60,138}})));
    hil_flexlab_model.BaseClasses.COP_ASHP_AuxHeat powHeaPum(QHeaPum_flow_nominal=QCoo_flow_nominal)
      "Power consumption calculation for heat pump heating"
      annotation (Placement(transformation(extent={{90,110},{110,130}})));
    Modelica.Blocks.Interfaces.IntegerInput n_Sta
      annotation (Placement(transformation(extent={{-240,-100},{-200,-60}})));
  equation
    connect(uHea, heaCoi.u) annotation (Line(points={{-220,80},{24,80},{24,46},{
            28,46}},
                  color={0,0,127}));
    connect(heaCoi.port_b, cooCoil.port_a)
      annotation (Line(points={{50,40},{70,40}}, color={0,127,255}));
    connect(heaCoi.port_a, totalRes.port_b)
      annotation (Line(points={{30,40},{20,40}}, color={0,127,255}));
    connect(weaBus.TDryBul, cooCoil.TConIn) annotation (Line(
        points={{-180,170},{-180,100},{62,100},{62,43},{69,43}},
        color={255,204,51},
        thickness=0.5), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(cooCoil.QSen_flow, add.u1) annotation (Line(points={{91,47},{96,47},{
            96,106},{118,106}},   color={0,0,127}));
    connect(cooCoil.QLat_flow, add.u2) annotation (Line(points={{91,45},{98,45},{
            98,94},{118,94}},   color={0,0,127}));
    connect(copCoo.y, cooCor.u)
      annotation (Line(points={{141,128},{145.2,128}}, color={0,0,127}));
    connect(cooCor.y, pow.u2) annotation (Line(points={{154.4,128},{158,128},{158,
            106}}, color={0,0,127}));
    connect(add.y, pow.u1) annotation (Line(points={{141,100},{152,100},{152,94},
            {158,94}}, color={0,0,127}));
    connect(pow.y, PCoo)
      annotation (Line(points={{181,100},{210,100}}, color={0,0,127}));
    connect(weaBus.TDryBul, TDryBul.u) annotation (Line(
        points={{-180,170},{-180,160},{18,160}},
        color={255,204,51},
        thickness=0.5), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(cooCoil.port_b, senMasFloSup.port_a)
      annotation (Line(points={{90,40},{100,40}}, color={0,127,255}));
    connect(heaCoi.Q_flow, QHea) annotation (Line(points={{51,46},{50,46},{50,-60},
            {210,-60}}, color={0,0,127}));
    connect(add.y, QCoo) annotation (Line(points={{141,100},{152,100},{152,76},{
            160,76},{160,-80},{210,-80}}, color={0,0,127}));
    connect(powHeaPum.copHeaPum, copHea.y) annotation (Line(points={{88,124},{70,
            124},{70,128},{61,128}}, color={0,0,127}));
    connect(powHeaPum.Q_flow, heaCoi.Q_flow) annotation (Line(points={{88,128},{
            80,128},{80,68},{51,68},{51,46}}, color={0,0,127}));
    connect(powHeaPum.PEle, PHea) annotation (Line(points={{111,130},{116,130},{
            116,120},{210,120}}, color={0,0,127}));
    connect(cooCoil.stage, n_Sta) annotation (Line(points={{69,48},{-66.5,48},{-66.5,
            -80},{-220,-80}}, color={255,127,0}));
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
  end HeatHeatpumpCoolHeatpumpAuxHea_noIEC_2stage;

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

  package HeatPumps "Package with model for heat pumps"
    model HeatPump
      "Grey-box model for reversible heat pumps using a black-box to simulate the refrigeration cycle"
      extends
        AixLib.Fluid.BaseClasses.PartialReversibleVapourCompressionMachine(
      use_rev=true,
      final machineType = true,
      redeclare AixLib.Fluid.HeatPumps.BaseClasses.InnerCycle_HeatPump innerCycle(
          final use_rev=use_rev,
          final scalingFactor=scalingFactor,
          redeclare model PerDataMainHP = PerDataMainHP,
          redeclare model PerDataRevHP = PerDataRevHP));

      replaceable model PerDataMainHP =
          AixLib.DataBase.HeatPump.PerformanceData.BaseClasses.PartialPerformanceData
      "Performance data of a heat pump in main operation mode"
        annotation (choicesAllMatching=true);
      replaceable model PerDataRevHP =
          AixLib.DataBase.Chiller.PerformanceData.BaseClasses.PartialPerformanceData
      "Performance data of a heat pump in reversible operation mode"
        annotation (Dialog(enable=use_rev),choicesAllMatching=true);

      annotation (Icon(coordinateSystem(extent={{-100,-120},{100,120}}), graphics={
            Rectangle(
              extent={{-16,83},{16,-83}},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              origin={1,-64},
              rotation=90),
            Rectangle(
              extent={{-17,83},{17,-83}},
              fillColor={255,0,128},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              origin={1,61},
              rotation=90),
            Text(
              extent={{-76,6},{74,-36}},
              lineColor={28,108,200},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Line(
              points={{-9,40},{9,40},{-5,-2},{9,-40},{-9,-40}},
              color={0,0,0},
              smooth=Smooth.None,
              origin={-3,-60},
              rotation=-90),
            Line(
              points={{9,40},{-9,40},{5,-2},{-9,-40},{9,-40}},
              color={0,0,0},
              smooth=Smooth.None,
              origin={-5,56},
              rotation=-90),
            Rectangle(
              extent={{-82,42},{84,-46}},
              lineColor={238,46,47},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Line(points={{-88,60},{88,60}}, color={28,108,200}),
            Line(points={{-88,-60},{88,-60}}, color={28,108,200}),
        Line(
        origin={-75.5,-80.333},
        points={{43.5,8.3333},{37.5,0.3333},{25.5,-1.667},{33.5,-9.667},{17.5,-11.667},{27.5,-21.667},{13.5,-23.667},
                  {11.5,-31.667}},
          smooth=Smooth.Bezier,
          visible=use_evaCap),
            Polygon(
              points={{-70,-122},{-68,-108},{-58,-114},{-70,-122}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,0},
              visible=use_evaCap),
        Line( origin={40.5,93.667},
              points={{39.5,6.333},{37.5,0.3333},{25.5,-1.667},{33.5,-9.667},{17.5,
                  -11.667},{27.5,-21.667},{13.5,-23.667},{11.5,-27.667}},
              smooth=Smooth.Bezier,
              visible=use_conCap),
            Polygon(
              points={{86,110},{84,96},{74,102},{86,110}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,0},
              visible=use_conCap),
            Line(
              points={{-42,72},{34,72}},
              color={0,0,0},
              arrow={Arrow.None,Arrow.Filled},
              thickness=0.5),
            Line(
              points={{-38,0},{38,0}},
              color={0,0,0},
              arrow={Arrow.None,Arrow.Filled},
              thickness=0.5,
              origin={0,-74},
              rotation=180)}),                Diagram(coordinateSystem(extent={{-100,
                -120},{100,120}})),
        Documentation(revisions="<html><ul>
  <li>
    <i>May 22, 2019</i> by Julian Matthes:<br/>
    Rebuild due to the introducion of the thermal machine partial model
    (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/715\">#715</a>)
  </li>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>",     info="<html>
<p>
  This generic grey-box heat pump model uses empirical data to model
  the refrigerant cycle. The modelling of system inertias and heat
  losses allow the simulation of transient states.
</p>
<p>
  Resulting in the choosen model structure, several configurations are
  possible:
</p>
<ol>
  <li>Compressor type: on/off or inverter controlled
  </li>
  <li>Reversible heat pump / only heating
  </li>
  <li>Source/Sink: Any combination of mediums is possible
  </li>
  <li>Generik: Losses and inertias can be switched on or off.
  </li>
</ol>
<h4>
  Concept
</h4>
<p>
  Using a signal bus as a connector, this heat pump model can be easily
  combined with the new <a href=
  \"modelica://AixLib.Systems.HeatPumpSystems.HeatPumpSystem\">HeatPumpSystem</a>
  or several control or safety blocks from <a href=
  \"modelica://AixLib.Controls.HeatPump\">AixLib.Controls.HeatPump</a>.
  The relevant data is aggregated. In order to control both chillers
  and heat pumps, both flow and return temperature are aggregated. The
  mode signal chooses the type of the heat pump operation. As a result,
  this model can also be used as a chiller:
</p>
<ul>
  <li>mode = true: Heating
  </li>
  <li>mode = false: Chilling
  </li>
</ul>
<p>
  To model both on/off and inverter controlled heat pumps, the
  compressor speed is normalizd to a relative value between 0 and 1.
</p>
<p>
  Possible icing of the evaporator is modelled with an input value
  between 0 and 1.
</p>
<p>
  The model structure is as follows. To understand each submodel,
  please have a look at the corresponding model information:
</p>
<ol>
  <li>
    <a href=
    \"AixLib.Fluid.HeatPumps.BaseClasses.InnerCycle\">InnerCycle</a>
    (Black Box): Here, the user can use between several input models or
    just easily create his own, modular black box model. Please look at
    the model description for more info.
  </li>
  <li>Inertia: A n-order element is used to model system inertias (mass
  and thermal) of components inside the refrigerant cycle (compressor,
  pipes, expansion valve)
  </li>
  <li>
    <a href=
    \"modelica://AixLib.Fluid.HeatExchangers.EvaporatorCondenserWithCapacity\">
    HeatExchanger</a>: This new model also enable modelling of thermal
    interias and heat losses in a heat exchanger. Please look at the
    model description for more info.
  </li>
</ol>
<h4>
  Parametrization
</h4>
<p>
  To simplify the parametrization of the evaporator and condenser
  volumes and nominal mass flows there exists an option of automatic
  estimation based on the nominal usable heating power of the HeatPump.
  This function uses a linear correlation of these parameters, which
  was established from the linear regression of more than 20 data sets
  of water-to-water heat pumps from different manufacturers (e.g.
  Carrier, Trane, Lennox) ranging from about 25kW to 1MW nominal power.
  The linear regressions with coefficients of determination above 91%
  give a good approximation of these parameters. Nevertheless,
  estimates for machines outside the given range should be checked for
  plausibility during simulation.
</p>
<h4>
  Assumptions
</h4>
<p>
  Several assumptions where made in order to model the heat pump. For a
  detailed description see the corresponding model.
</p>
<ol>
  <li>
    <a href=
    \"modelica://AixLib.Fluid.HeatPumps.BaseClasses.PerformanceData.LookUpTable2D\">
    Performance data 2D</a>: In order to model inverter controlled heat
    pumps, the compressor speed is scaled <b>linearly</b>
  </li>
  <li>
    <a href=
    \"modelica://AixLib.Fluid.HeatPumps.BaseClasses.PerformanceData.LookUpTable2D\">
    Performance data 2D</a>: Reduced evaporator power as a result of
    icing. The icing factor is multiplied with the evaporator power.
  </li>
  <li>
    <b>Inertia</b>: The default value of the n-th order element is set
    to 3. This follows comparisons with experimental data. Previous
    heat pump models are using n = 1 as a default. However, it was
    pointed out that a higher order element fits a real heat pump
    better in.
  </li>
  <li>
    <b>Scaling factor</b>: A scaling facor is implemented for scaling
    of the heat pump power and capacity. The factor scales the
    parameters V, m_flow_nominal, C, GIns, GOut and dp_nominal. As a
    result, the heat pump can supply more heat with the COP staying
    nearly constant. However, one has to make sure that the supplied
    pressure difference or mass flow is also scaled with this factor,
    as the nominal values do not increase said mass flow.
  </li>
</ol>
<h4>
  Known Limitations
</h4>
<ul>
  <li>The n-th order element has a big influence on computational time.
  Reducing the order or disabling it completly will decrease
  computational time.
  </li>
  <li>Reversing the mode: A normal 4-way-exchange valve suffers from
  heat losses and irreversibilities due to switching from one mode to
  another. Theses losses are not taken into account.
  </li>
</ul>
</html>"));
    end HeatPump;

    package Data "Different models used for a black box heat pump model"

      record HeatPumpBaseDataDefinition "Basic heat pump data"
          extends Modelica.Icons.Record;
        parameter Real tableQdot_con[:,:] "Heating power table; T in degC; Q_flow in W";
        parameter Real tableP_ele[:,:] "Electrical power table; T in degC; Q_flow in W";
        parameter Modelica.SIunits.MassFlowRate mFlow_conNom
          "Nominal mass flow rate in condenser";
        parameter Modelica.SIunits.MassFlowRate mFlow_evaNom
          "Nominal mass flow rate in evaporator";
        parameter Real tableUppBou[:,2] "Points to define upper boundary for sink temperature";

        annotation (Documentation(info="<html><h4>
  <span style=\"color: #008000\">Overview</span>
</h4>Base data definition used in the heat pump model. It defines the
table <span style=\"font-family: Courier New;\">table_Qdot_Co</span>
which gives the condenser heat flow rate and <span style=
\"font-family: Courier New;\">table_Pel</span> which gives the electric
power consumption of the heat pump. Both tables define the power values
depending on the evaporator inlet temperature (defined in first row)
and the condenser outlet temperature (defined in first column) in W.
The nominal mass flow rate in the condenser and evaporator are also
defined as parameters.
<h4>
  <span style=\"color: #008000\">Calculation of nominal mass flow
  rates</span>
</h4>
<ul>
  <li>General calculation ṁ = Q̇<sub>nominal</sub> / c<sub>p</sub> /
  ΔT
  </li>
</ul><b>Condenser</b> <span style=
\"font-family: Courier New;\">mFlow_conNom</span>
<ul>
  <li>According to <b>EN 14511</b> on <b>water</b> bound condenser side
  <span style=\"font-family: Courier New;\">ΔT = 5 K</span>
  </li>
  <li>According to EN 255 (deprecated) on <b>water</b> bound condenser
  side <span style=\"font-family: Courier New;\">ΔT = 10 K</span>
  </li>
</ul><b>Evaporator</b> <span style=
\"font-family: Courier New;\">mFlow_evaNom:</span>
<ul>
  <li>According to <b>EN 14511</b> on <b>water/glycol</b> bound
  evaporator side <span style=\"font-family: Courier New;\">ΔT = 3
  K</span>
  </li>
  <li>Possible calculation for <b>air</b> bound evaporator side <span>
    ṁ<sub>eva,nominal</sub> = (Q̇<sub>con,nominal</sub> -
    Ṗ<sub>el,nominal</sub>) / c<sub>p</sub> / ΔT</span> under the
    assumption (no literature source so far) of <span>ΔT = 5 K</span>
  </li>
</ul>
</html>",   revisions="<html><ul>
  <li>
    <i>MAy 7, 2020</i> by Philipp Mehrfeld:<br/>
    Add description of how to calculate m_flows
  </li>
  <li>
    <i>December 10, 2013</i> by Ole Odendahl:<br/>
    Formatted documentation appropriately
  </li>
</ul>
</html>
"),      Icon,     preferedView="info");
      end HeatPumpBaseDataDefinition;

      record RongxinSampleHP "RongxinSampleHP"
        extends
          hil_flexlab_model.Fluid.HeatPumps.Data.HeatPumpBaseDataDefinition(
          tableP_ele=[0,-13.9,-8.3,-2.8,2.8,8.3,13.9,19.4; 18,850,930,1010,1110,
              1220,1370,1570; 21,980,1060,1160,1250,1370,1530,1730; 24,1110,
              1210,1310,1420,1540,1710,1920],
          tableQdot_con=[0,-13.9,-8.3,-2.8,2.8,8.3,13.9,19.4; 18,1800,2640,3430,
              4330,5370,6540,7850; 21,1610,2380,3260,4130,5140,6280,7570; 24,
              1390,2150,3080,3940,4910,6030,7910],
          mFlow_conNom=3960/4180/5,
          mFlow_evaNom=(2250*1.2)/3600,
          tableUppBou=[-15,25; 20,25]);

        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false)),
          Diagram(coordinateSystem(preserveAspectRatio=false)),
          Documentation(info="<html><p>
  <span style=
  \"font-family: Courier New; color: #006400;\">Data&#160;record&#160;for&#160;type&#160;AWO-M/AWO-M-E-AC&#160;201.A04,
  obtained from the technical guide in the UK.</span>
</p>
<ul>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>"));
      end RongxinSampleHP;
      annotation (Icon(graphics={
            Rectangle(
              lineColor={200,200,200},
              fillColor={248,248,248},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-100.0,-100.0},{100.0,100.0}},
              radius=25.0),
            Rectangle(
              lineColor={128,128,128},
              extent={{-100.0,-100.0},{100.0,100.0}},
              radius=25.0),
            Ellipse(
              lineColor={102,102,102},
              fillColor={204,204,204},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Sphere,
              extent={{-60.0,-60.0},{60.0,60.0}})}));
    end Data;

    package Examples
      "Collection of models that illustrate model use and test models"

      model TesRTUHP
        "Example for the reversible heat pump model with ports to connect to other RTU components"
       extends Modelica.Icons.Example;
       extends hil_flexlab_model.Fluid.HeatPumps.BaseClasses.RTUHP;

       Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
          tableOnFile=true,
          tableName="tab1",
          fileName=ModelicaServices.ExternalReferences.loadResource(
              "modelica://hil_flexlab_model/Data/2021-03-09_HP_Filtered.txt"),
          columns=6:14,
          timeScale=60) annotation (Placement(transformation(extent={{-156,-92},
                  {-136,-72}})));

        Buildings.Fluid.Sources.Boundary_pT sinkSideFixedInlet(nPorts=1,
            redeclare package Medium = Medium_sin)
          "Fixed boundary at the inlet of the sink side" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-152,0})));
        Buildings.Fluid.Movers.FlowControlled_m_flow fanSup(
          m_flow_nominal=0.2,
          addPowerToMedium=false,
          nominalValuesDefineDefaultPressureCurve=true,
          dp_nominal=600,
          per(use_powerCharacteristic=false),
          energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
          use_inputFilter=true,
          redeclare package Medium = Medium_sin)
                                              "Supply fan"
          annotation (Placement(transformation(extent={{-134,10},{-114,-10}})));
        Buildings.Controls.OBC.UnitConversions.From_cfm from_cfm annotation (
            Placement(transformation(extent={{-152,-62},{-132,-42}})));
        Modelica.Blocks.Sources.Constant den(final k=1.23)
          "Fixed density of air" annotation (Placement(transformation(
              extent={{8,8},{-8,-8}},
              rotation=180,
              origin={-144,-24})));
        Modelica.Blocks.Math.Product m3s_kgs annotation (Placement(
              transformation(extent={{-120,-50},{-100,-30}})));
        Modelica.Blocks.Sources.Pulse    staTest(
          amplitude=1,
          width=60,
          period=300,
          nperiod=10,
          offset=1,
          startTime=0) "Pulse stage setpoint between 1 and 2"                                              annotation (Placement(
              transformation(
              extent={{8,8},{-8,-8}},
              rotation=180,
              origin={-132,60})));
        Buildings.Fluid.Sources.Boundary_pT sinkSideFixedOutlet(redeclare
            package Medium = Medium_sin, nPorts=1)
          "Fixed boundary at the outlet of the sink side" annotation (Placement(
              transformation(
              extent={{10,-10},{-10,10}},
              rotation=0,
              origin={130,0})));
      equation

        connect(sinkSideFixedInlet.ports[1], fanSup.port_a)
          annotation (Line(points={{-142,0},{-134,0}}, color={0,127,255}));
        connect(m3s_kgs.y, fanSup.m_flow_in) annotation (Line(points={{-99,-40},
                {-88,-40},{-88,-20},{-124,-20},{-124,-12}}, color={0,0,127}));
        connect(from_cfm.y, m3s_kgs.u2) annotation (Line(points={{-130,-52},{
                -128,-52},{-128,-46},{-122,-46}}, color={0,0,127}));
        connect(m3s_kgs.u1, den.y) annotation (Line(points={{-122,-34},{-128,
                -34},{-128,-24},{-135.2,-24}}, color={0,0,127}));
        connect(from_cfm.u, combiTimeTable.y[5]) annotation (Line(points={{-154,
                -52},{-164,-52},{-164,-100},{-120,-100},{-120,-82},{-135,-82}},
              color={0,0,127}));
        connect(combiTimeTable.y[4], outsideTemptoKelvin.Fahrenheit)
          annotation (Line(points={{-135,-82},{-120,-82},{-120,-60},{-98,-60}},
              color={0,0,127}));
        connect(staTest.y, nSetGai.u) annotation (Line(points={{-123.2,60},{-108,
                60},{-108,46},{-92,46}}, color={0,0,127}));
        connect(fanSup.port_b, port_a)
          annotation (Line(points={{-114,0},{-100,0}}, color={0,127,255}));
        connect(port_b, sinkSideFixedOutlet.ports[1])
          annotation (Line(points={{100,0},{120,0}}, color={0,127,255}));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}})),
          experiment(
            StopTime=10800,
            Interval=60,
            Tolerance=1e-06),
      __Dymola_Commands(file="modelica://AixLib/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/HeatPump.mos"
              "Simulate and plot"),
          Documentation(info="<html><h4>
  <span style=\"color: #008000\">Overview</span>
</h4>
<p>
  Simple test set-up for the HeatPumpDetailed model. The heat pump is
  turned on and off while the source temperature increases linearly.
  Outputs are the electric power consumption of the heat pump and the
  supply temperature.
</p>
<p>
  Besides using the default simple table data, the user should also
  test tabulated data from <a href=
  \"modelica://AixLib.DataBase.HeatPump\">AixLib.DataBase.HeatPump</a> or
  polynomial functions.
</p>
</html>",   revisions="<html><ul>
  <li>
    <i>May 22, 2019</i> by Julian Matthes:<br/>
    Rebuild due to the introducion of the thermal machine partial model
    (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/715\">#715</a>)
  </li>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>"),__Dymola_Commands(file="Modelica://AixLib/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/HeatPump.mos" "Simulate and plot"),
          Icon(coordinateSystem(extent={{-100,-100},{100,80}})));
      end TesRTUHP;

      model TesFMU "Example for the heat pump and controls FMU"
       extends Modelica.Icons.Example;

        parameter Real refIneFre = 0.0015 "refrigerant inertia parameter";
        parameter Real k_hea=0.33 "Proportional gain of heating controller";
        parameter Modelica.SIunits.Time Ti_hea=20000 "Integral time constant of heating controller";
        parameter Modelica.SIunits.ThermodynamicTemperature maxSAT = 310 "max supply air temperature";
        parameter Real uLowSta1 = 0.12 "PI lower bound to activate stage 1";
        parameter Real uUppSta1 = 0.20 "PI upper bound to activate stage 1";
        parameter Real uLowSta2 = 0.35 "PI lower bound to activate stage 2";
        parameter Real uUppSta2 = 0.45 "PI upper bound to activate stage 2";
        parameter Real kSta1 = 0.12 "PI center line to activate stage 1";
        parameter Real kSta2 = 0.35 "PI center line to activate stage 2";
        parameter Real banSta1 = 0.01 "PI band to activate stage 1";
        parameter Real banSta2 = 0.01 "PI band to activate stage 2";

        Buildings.Controls.OBC.UnitConversions.From_cfm from_cfm annotation (
            Placement(transformation(extent={{-84,30},{-68,46}})));
        Modelica.Blocks.Sources.Constant den(final k=1.189) "Fixed density of air"
                                 annotation (Placement(transformation(
              extent={{8,8},{-8,-8}},
              rotation=180,
              origin={-76,66})));
        Modelica.Blocks.Math.Product m3s_kgs annotation (Placement(
              transformation(extent={{-6,-6},{6,6}},
              rotation=0,
              origin={-50,44})));
        Aachen_HP_2stage_FMU aachen_HP_2stage_FMU(
          refIneFre=refIneFre,
          k_hea=k_hea,
          Ti_hea=Ti_hea,
          maxSAT=maxSAT,
          uLowSta1=uLowSta1,
          uUppSta1=uUppSta1,
          uLowSta2=uLowSta2,
          uUppSta2=uUppSta2,
          kSta1=kSta1,
          kSta2=kSta2,
          banSta1=banSta1,
          banSta2=banSta2,
          rtuConFMU(onOffConHea(bandwidth=0.15)))
          annotation (Placement(transformation(extent={{-18,-20},{22,20}})));
        Modelica.Blocks.Math.Add sumTem(k1=1.65, k2=0.35)
                                        annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={-50,16})));
        Modelica.Blocks.Math.Gain aveTem(k=0.5) annotation (Placement(
              transformation(
              extent={{-4,-4},{4,4}},
              rotation=0,
              origin={-34,8})));
        Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
          tableOnFile=true,
          tableName="tab1",
          fileName=ModelicaServices.ExternalReferences.loadResource(
              "modelica://hil_flexlab_model/Data/2022-03-06_HP_Filtered.txt"),
          columns=6:20,
          smoothness=Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1,
          timeScale=60)
          annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));

        Modelica.Blocks.Interfaces.RealOutput supTemMea
          "Measured supply air temperature" annotation (Placement(
              transformation(extent={{100,-80},{120,-60}}), iconTransformation(
                extent={{100,-80},{120,-60}})));
        Modelica.Blocks.Interfaces.RealOutput powTotMea "Measured power"
          annotation (Placement(transformation(extent={{100,-100},{120,-80}}),
              iconTransformation(extent={{100,-100},{120,-80}})));
        Modelica.Thermal.HeatTransfer.Celsius.FromKelvin  supplyTemptoCelsius
          annotation (Placement(transformation(extent={{20,-88},{36,-72}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin supplyTemptoKelvin
          annotation (Placement(transformation(extent={{-76,-88},{-60,-72}})));
        Modelica.Blocks.Math.Add sta annotation (Placement(transformation(
              extent={{6,-6},{-6,6}},
              rotation=180,
              origin={-76,90})));
        Modelica.Blocks.Interfaces.RealOutput staMea "Measured stage"
          annotation (Placement(transformation(extent={{100,60},{120,80}}),
              iconTransformation(extent={{100,60},{120,80}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin outsideTemptoKelvin
          annotation (Placement(transformation(extent={{-84,-8},{-68,8}})));
        Modelica.Blocks.Interfaces.RealOutput powTotMod "Modeled power"
          annotation (Placement(transformation(extent={{100,10},{120,30}}),
              iconTransformation(extent={{100,10},{120,30}})));
        Modelica.Blocks.Interfaces.RealOutput supTemMod
          "Modeled supply air temperature" annotation (Placement(transformation(
                extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                  -10},{120,10}})));
        Modelica.Blocks.Interfaces.BooleanOutput heaCalMod annotation (
            Placement(transformation(extent={{100,-30},{120,-10}}),
              iconTransformation(extent={{100,-30},{120,-10}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin rooTemptoKelvin
          annotation (Placement(transformation(extent={{-76,-56},{-60,-40}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin retTemptoKelvin
          annotation (Placement(transformation(extent={{-84,12},{-68,28}})));
        Modelica.Thermal.HeatTransfer.Celsius.FromKelvin supplyTempModtoCelsius
          annotation (Placement(transformation(extent={{72,-8},{88,8}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin setpointTemptoKelvin
          annotation (Placement(transformation(extent={{-76,-34},{-60,-18}})));
        Modelica.Blocks.Sources.Constant cp(final k=1006)
          "Fixed specific heat of air" annotation (Placement(transformation(
              extent={{8,8},{-8,-8}},
              rotation=180,
              origin={-40,66})));
        Modelica.Blocks.Math.Add dTMea(k2=-1) annotation (Placement(transformation(
              extent={{6,-6},{-6,6}},
              rotation=180,
              origin={48,-30})));
        Modelica.Blocks.Math.Add dTMod(k2=-1) annotation (Placement(transformation(
              extent={{6,-6},{-6,6}},
              rotation=180,
              origin={48,30})));
        Modelica.Blocks.Math.Product mcp annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={48,56})));
        Modelica.Blocks.Interfaces.RealOutput qdotMod "Modeled thermal power"
          annotation (Placement(transformation(extent={{100,34},{120,54}}),
              iconTransformation(extent={{100,10},{120,30}})));
        Modelica.Blocks.Interfaces.RealOutput qdotMea "Measured thermal power"
          annotation (Placement(transformation(extent={{100,-62},{120,-42}}),
              iconTransformation(extent={{100,10},{120,30}})));
        Modelica.Blocks.Math.Product mcpdTMod annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={82,44})));
        Modelica.Blocks.Math.Product mcpdTMea annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={84,-44})));
        Modelica.Blocks.Interfaces.RealOutput PIHeaDemMea
          "Measured PI heating demand" annotation (Placement(transformation(extent={{100,
                  110},{120,90}}), iconTransformation(extent={{100,60},{120,80}})));
        Modelica.Blocks.Math.Gain gaiPIHeaDem(k=0.01) annotation (Placement(
              transformation(
              extent={{-4,4},{4,-4}},
              rotation=0,
              origin={88,100})));
        Modelica.Blocks.Interfaces.RealOutput PIMod "Measured thermal power"
          annotation (Placement(transformation(extent={{100,-46},{120,-26}}),
              iconTransformation(extent={{100,10},{120,30}})));
      equation

        connect(from_cfm.y, m3s_kgs.u2) annotation (Line(points={{-66.4,38},{-62,38},{
                -62,40.4},{-57.2,40.4}},          color={0,0,127}));
        connect(m3s_kgs.u1, den.y) annotation (Line(points={{-57.2,47.6},{-64,47.6},{-64,
                66},{-67.2,66}},               color={0,0,127}));
        connect(m3s_kgs.y, aachen_HP_2stage_FMU.u_m_flow) annotation (Line(
              points={{-43.4,44},{-32,44},{-32,16},{-22,16}},
                                                            color={0,0,127}));
        connect(combiTimeTable.y[5], from_cfm.u) annotation (Line(points={{-99,
                0},{-94,0},{-94,38},{-85.6,38}}, color={0,0,127}));
        connect(supplyTemptoCelsius.Celsius, supTemMea) annotation (Line(points=
               {{36.8,-80},{74,-80},{74,-70},{110,-70}}, color={0,0,127}));
        connect(supplyTemptoKelvin.Kelvin,supplyTemptoCelsius. Kelvin)
          annotation (Line(points={{-59.2,-80},{18.4,-80}},
                                                        color={0,0,127}));
        connect(combiTimeTable.y[3], supplyTemptoKelvin.Fahrenheit) annotation (
           Line(points={{-99,0},{-94,0},{-94,-80},{-77.6,-80}}, color={0,0,127}));
        connect(combiTimeTable.y[9], powTotMea) annotation (Line(points={{-99,0},
                {-94,0},{-94,-90},{110,-90}}, color={0,0,127}));
        connect(combiTimeTable.y[10], sta.u2) annotation (Line(points={{-99,0},
                {-94,0},{-94,93.6},{-83.2,93.6}}, color={0,0,127}));
        connect(combiTimeTable.y[11], sta.u1) annotation (Line(points={{-99,0},
                {-94,0},{-94,86.4},{-83.2,86.4}}, color={0,0,127}));
        connect(combiTimeTable.y[4], outsideTemptoKelvin.Fahrenheit)
          annotation (Line(points={{-99,0},{-85.6,0}}, color={0,0,127}));
        connect(outsideTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TDryBul)
          annotation (Line(points={{-67.2,0},{-22,0}}, color={0,0,127}));
        connect(sumTem.y, aveTem.u) annotation (Line(points={{-43.4,16},{-40,16},
                {-40,8},{-38.8,8}}, color={0,0,127}));
        connect(aveTem.y, aachen_HP_2stage_FMU.u_TMix)
          annotation (Line(points={{-29.6,8},{-22,8}}, color={0,0,127}));
        connect(powTotMod, powTotMod)
          annotation (Line(points={{110,20},{110,20}}, color={0,0,127}));
        connect(aachen_HP_2stage_FMU.y_PEleHP, powTotMod) annotation (Line(
              points={{24,13.6},{60,13.6},{60,20},{110,20}}, color={0,0,127}));
        connect(aachen_HP_2stage_FMU.y_HeaCal, heaCalMod) annotation (Line(
              points={{24,-8},{60,-8},{60,-20},{110,-20}},     color={255,0,255}));
        connect(combiTimeTable.y[1], rooTemptoKelvin.Fahrenheit) annotation (
            Line(points={{-99,0},{-94,0},{-94,-48},{-77.6,-48}}, color={0,0,127}));
        connect(rooTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TRoo)
          annotation (Line(points={{-59.2,-48},{-40,-48},{-40,-16},{-22,-16}},
              color={0,0,127}));
        connect(retTemptoKelvin.Kelvin, sumTem.u1) annotation (Line(points={{
                -67.2,20},{-58,20},{-58,19.6},{-57.2,19.6}}, color={0,0,127}));
        connect(combiTimeTable.y[2], retTemptoKelvin.Fahrenheit) annotation (
            Line(points={{-99,0},{-94,0},{-94,20},{-85.6,20}}, color={0,0,127}));
        connect(outsideTemptoKelvin.Kelvin, sumTem.u2) annotation (Line(points=
                {{-67.2,0},{-62,0},{-62,12},{-58,12},{-58,12.4},{-57.2,12.4}},
              color={0,0,127}));
        connect(aachen_HP_2stage_FMU.y_TSup, supplyTempModtoCelsius.Kelvin)
          annotation (Line(points={{24,8.4},{60,8.4},{60,0},{70.4,0}}, color={0,
                0,127}));
        connect(supplyTempModtoCelsius.Celsius, supTemMod)
          annotation (Line(points={{88.8,0},{110,0}}, color={0,0,127}));
        connect(sta.y, staMea) annotation (Line(points={{-69.4,90},{16,90},{16,
                70},{110,70}}, color={0,0,127}));
        connect(combiTimeTable.y[12], setpointTemptoKelvin.Fahrenheit) annotation (
            Line(points={{-99,0},{-94,0},{-94,-26},{-77.6,-26}}, color={0,0,127}));
        connect(setpointTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TRooSetPoi)
          annotation (Line(points={{-59.2,-26},{-50,-26},{-50,-8},{-22,-8}}, color={0,
                0,127}));
        connect(m3s_kgs.y, mcp.u2) annotation (Line(points={{-43.4,44},{-32,44},{-32,52.4},
                {40.8,52.4}}, color={0,0,127}));
        connect(cp.y, mcp.u1) annotation (Line(points={{-31.2,66},{10,66},{10,60},{40,
                60},{40,59.6},{40.8,59.6}}, color={0,0,127}));
        connect(aachen_HP_2stage_FMU.u_TMix, dTMea.u2) annotation (Line(points={{-22,8},
                {-30,8},{-30,-26.4},{40.8,-26.4}}, color={0,0,127}));
        connect(aachen_HP_2stage_FMU.y_TSup, dTMod.u1) annotation (Line(points={{24,8.4},
                {32,8.4},{32,26.4},{40.8,26.4}}, color={0,0,127}));
        connect(aachen_HP_2stage_FMU.u_TMix, dTMod.u2) annotation (Line(points={{-22,8},
                {-30,8},{-30,33.6},{40.8,33.6}}, color={0,0,127}));
        connect(supplyTemptoKelvin.Kelvin, dTMea.u1) annotation (Line(points={{-59.2,-80},
                {-10,-80},{-10,-33.6},{40.8,-33.6}}, color={0,0,127}));
        connect(mcpdTMea.y, qdotMea)
          annotation (Line(points={{90.6,-44},{100,-44},{100,-52},{110,-52}},
                                                          color={0,0,127}));
        connect(mcpdTMod.y, qdotMod)
          annotation (Line(points={{88.6,44},{110,44}}, color={0,0,127}));
        connect(dTMod.y, mcpdTMod.u2) annotation (Line(points={{54.6,30},{60,30},{60,40.4},
                {74.8,40.4}}, color={0,0,127}));
        connect(dTMea.y, mcpdTMea.u1) annotation (Line(points={{54.6,-30},{60,-30},{60,
                -40},{76,-40},{76,-40.4},{76.8,-40.4}}, color={0,0,127}));
        connect(mcp.y, mcpdTMod.u1) annotation (Line(points={{54.6,56},{64,56},{64,48},
                {74,48},{74,47.6},{74.8,47.6}}, color={0,0,127}));
        connect(mcp.y, mcpdTMea.u2) annotation (Line(points={{54.6,56},{64,56},{64,-47.6},
                {76.8,-47.6}}, color={0,0,127}));
        connect(PIHeaDemMea, gaiPIHeaDem.y)
          annotation (Line(points={{110,100},{92.4,100}}, color={0,0,127}));
        connect(combiTimeTable.y[15], gaiPIHeaDem.u) annotation (Line(points={{-99,0},
                {-94,0},{-94,100},{83.2,100}}, color={0,0,127}));
        connect(aachen_HP_2stage_FMU.y_PI, PIMod) annotation (Line(points={{24,
                -14.4},{62,-14.4},{62,-36},{110,-36}}, color={0,0,127}));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}})),
          experiment(
            StopTime=42000,
            Interval=1,
            Tolerance=1e-06),
      __Dymola_Commands(file="modelica://AixLib/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/HeatPump.mos"
              "Simulate and plot"),
          Documentation(info="<html><h4>
  <span style=\"color: #008000\">Overview</span>
</h4>
<p>
  Simple test set-up for the HeatPumpDetailed model. The heat pump is
  turned on and off while the source temperature increases linearly.
  Outputs are the electric power consumption of the heat pump and the
  supply temperature.
</p>
<p>
  Besides using the default simple table data, the user should also
  test tabulated data from <a href=
  \"modelica://AixLib.DataBase.HeatPump\">AixLib.DataBase.HeatPump</a> or
  polynomial functions.
</p>
</html>",   revisions="<html><ul>
  <li>
    <i>May 22, 2019</i> by Julian Matthes:<br/>
    Rebuild due to the introducion of the thermal machine partial model
    (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/715\">#715</a>)
  </li>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>"),__Dymola_Commands(file="Modelica://AixLib/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/HeatPump.mos" "Simulate and plot"),
          Icon(coordinateSystem(extent={{-100,-100},{100,80}})));
      end TesFMU;

      model TesFMU_compile "Example for the heat pump and controls FMU"
       extends Modelica.Icons.Example;

        parameter Real refIneFre = 0.0015 "refrigerant inertia parameter";
        parameter Real k_hea=0.33 "Proportional gain of heating controller";
        parameter Modelica.SIunits.Time Ti_hea=20000 "Integral time constant of heating controller";
        parameter Modelica.SIunits.ThermodynamicTemperature maxSAT = 310 "max supply air temperature";
        parameter Real uLowSta1 = 0.12 "PI lower bound to activate stage 1";
        parameter Real uUppSta1 = 0.20 "PI upper bound to activate stage 1";
        parameter Real uLowSta2 = 0.35 "PI lower bound to activate stage 2";
        parameter Real uUppSta2 = 0.45 "PI upper bound to activate stage 2";
        parameter Real kSta1 = 0.12 "PI center line to activate stage 1";
        parameter Real kSta2 = 0.35 "PI center line to activate stage 2";
        parameter Real banSta1 = 0.01 "PI band to activate stage 1";
        parameter Real banSta2 = 0.01 "PI band to activate stage 2";

        Buildings.Controls.OBC.UnitConversions.From_cfm from_cfm annotation (
            Placement(transformation(extent={{-84,30},{-68,46}})));
        Modelica.Blocks.Sources.Constant den(final k=1.189) "Fixed density of air"
                                 annotation (Placement(transformation(
              extent={{8,8},{-8,-8}},
              rotation=180,
              origin={-76,66})));
        Modelica.Blocks.Math.Product m3s_kgs annotation (Placement(
              transformation(extent={{-6,-6},{6,6}},
              rotation=0,
              origin={-50,44})));
        hil_flexlab_model_Fluid_Aachen_HP_02stage_FMU_fmu aachen_HP_2stage_FMU
          annotation (Placement(transformation(extent={{-16,-20},{24,20}})));
        Modelica.Blocks.Math.Add sumTem(k1=1.65, k2=0.35)
                                        annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={-50,16})));
        Modelica.Blocks.Math.Gain aveTem(k=0.5) annotation (Placement(
              transformation(
              extent={{-4,-4},{4,4}},
              rotation=0,
              origin={-34,8})));
        Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
          tableOnFile=true,
          tableName="tab1",
          fileName=ModelicaServices.ExternalReferences.loadResource(
              "modelica://hil_flexlab_model/Data/2022-03-06_HP_Filtered.txt"),
          columns=6:20,
          smoothness=Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1,
          timeScale=60)
          annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));

        Modelica.Blocks.Interfaces.RealOutput supTemMea
          "Measured supply air temperature" annotation (Placement(
              transformation(extent={{100,-80},{120,-60}}), iconTransformation(
                extent={{100,-80},{120,-60}})));
        Modelica.Blocks.Interfaces.RealOutput powTotMea "Measured power"
          annotation (Placement(transformation(extent={{100,-100},{120,-80}}),
              iconTransformation(extent={{100,-100},{120,-80}})));
        Modelica.Thermal.HeatTransfer.Celsius.FromKelvin  supplyTemptoCelsius
          annotation (Placement(transformation(extent={{20,-88},{36,-72}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin supplyTemptoKelvin
          annotation (Placement(transformation(extent={{-76,-88},{-60,-72}})));
        Modelica.Blocks.Math.Add sta annotation (Placement(transformation(
              extent={{6,-6},{-6,6}},
              rotation=180,
              origin={-76,90})));
        Modelica.Blocks.Interfaces.RealOutput staMea "Measured stage"
          annotation (Placement(transformation(extent={{100,60},{120,80}}),
              iconTransformation(extent={{100,60},{120,80}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin outsideTemptoKelvin
          annotation (Placement(transformation(extent={{-84,-8},{-68,8}})));
        Modelica.Blocks.Interfaces.RealOutput powTotMod "Modeled power"
          annotation (Placement(transformation(extent={{100,10},{120,30}}),
              iconTransformation(extent={{100,10},{120,30}})));
        Modelica.Blocks.Interfaces.RealOutput supTemMod
          "Modeled supply air temperature" annotation (Placement(transformation(
                extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                  -10},{120,10}})));
        Modelica.Blocks.Interfaces.BooleanOutput heaCalMod annotation (
            Placement(transformation(extent={{100,-30},{120,-10}}),
              iconTransformation(extent={{100,-30},{120,-10}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin rooTemptoKelvin
          annotation (Placement(transformation(extent={{-76,-56},{-60,-40}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin retTemptoKelvin
          annotation (Placement(transformation(extent={{-84,12},{-68,28}})));
        Modelica.Thermal.HeatTransfer.Celsius.FromKelvin supplyTempModtoCelsius
          annotation (Placement(transformation(extent={{72,-8},{88,8}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin setpointTemptoKelvin
          annotation (Placement(transformation(extent={{-76,-34},{-60,-18}})));
        Modelica.Blocks.Sources.Constant cp(final k=1006)
          "Fixed specific heat of air" annotation (Placement(transformation(
              extent={{8,8},{-8,-8}},
              rotation=180,
              origin={-40,66})));
        Modelica.Blocks.Math.Add dTMea(k2=-1) annotation (Placement(transformation(
              extent={{6,-6},{-6,6}},
              rotation=180,
              origin={48,-30})));
        Modelica.Blocks.Math.Add dTMod(k2=-1) annotation (Placement(transformation(
              extent={{6,-6},{-6,6}},
              rotation=180,
              origin={48,30})));
        Modelica.Blocks.Math.Product mcp annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={48,56})));
        Modelica.Blocks.Interfaces.RealOutput qdotMod "Modeled thermal power"
          annotation (Placement(transformation(extent={{100,34},{120,54}}),
              iconTransformation(extent={{100,10},{120,30}})));
        Modelica.Blocks.Interfaces.RealOutput qdotMea "Measured thermal power"
          annotation (Placement(transformation(extent={{100,-62},{120,-42}}),
              iconTransformation(extent={{100,10},{120,30}})));
        Modelica.Blocks.Math.Product mcpdTMod annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={82,44})));
        Modelica.Blocks.Math.Product mcpdTMea annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={84,-44})));
        Modelica.Blocks.Interfaces.RealOutput PIHeaDemMea
          "Measured PI heating demand" annotation (Placement(transformation(extent={{100,
                  110},{120,90}}), iconTransformation(extent={{100,60},{120,80}})));
        Modelica.Blocks.Math.Gain gaiPIHeaDem(k=0.01) annotation (Placement(
              transformation(
              extent={{-4,4},{4,-4}},
              rotation=0,
              origin={88,100})));
        Modelica.Blocks.Interfaces.RealOutput PIMod "Measured thermal power"
          annotation (Placement(transformation(extent={{100,-46},{120,-26}}),
              iconTransformation(extent={{100,10},{120,30}})));

      equation

        connect(from_cfm.y, m3s_kgs.u2) annotation (Line(points={{-66.4,38},{-62,38},{
                -62,40.4},{-57.2,40.4}},          color={0,0,127}));
        connect(m3s_kgs.u1, den.y) annotation (Line(points={{-57.2,47.6},{-64,47.6},{-64,
                66},{-67.2,66}},               color={0,0,127}));
        connect(m3s_kgs.y, aachen_HP_2stage_FMU.u_m_flow) annotation (Line(
              points={{-43.4,44},{-32,44},{-32,13.4},{-16.8,13.4}},
                                                            color={0,0,127}));
        connect(combiTimeTable.y[5], from_cfm.u) annotation (Line(points={{-99,
                0},{-94,0},{-94,38},{-85.6,38}}, color={0,0,127}));
        connect(supplyTemptoCelsius.Celsius, supTemMea) annotation (Line(points=
               {{36.8,-80},{74,-80},{74,-70},{110,-70}}, color={0,0,127}));
        connect(supplyTemptoKelvin.Kelvin,supplyTemptoCelsius. Kelvin)
          annotation (Line(points={{-59.2,-80},{18.4,-80}},
                                                        color={0,0,127}));
        connect(combiTimeTable.y[3], supplyTemptoKelvin.Fahrenheit) annotation (
           Line(points={{-99,0},{-94,0},{-94,-80},{-77.6,-80}}, color={0,0,127}));
        connect(combiTimeTable.y[9], powTotMea) annotation (Line(points={{-99,0},
                {-94,0},{-94,-90},{110,-90}}, color={0,0,127}));
        connect(combiTimeTable.y[10], sta.u2) annotation (Line(points={{-99,0},
                {-94,0},{-94,93.6},{-83.2,93.6}}, color={0,0,127}));
        connect(combiTimeTable.y[11], sta.u1) annotation (Line(points={{-99,0},
                {-94,0},{-94,86.4},{-83.2,86.4}}, color={0,0,127}));
        connect(combiTimeTable.y[4], outsideTemptoKelvin.Fahrenheit)
          annotation (Line(points={{-99,0},{-85.6,0}}, color={0,0,127}));
        connect(outsideTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TDryBul)
          annotation (Line(points={{-67.2,0},{-44,0},{-44,6.8},{-16.8,6.8}},
                                                       color={0,0,127}));
        connect(sumTem.y, aveTem.u) annotation (Line(points={{-43.4,16},{-40,16},
                {-40,8},{-38.8,8}}, color={0,0,127}));
        connect(aveTem.y, aachen_HP_2stage_FMU.u_TMix)
          annotation (Line(points={{-29.6,8},{-24,8},{-24,-13.2},{-16.8,-13.2}},
                                                       color={0,0,127}));
        connect(powTotMod, powTotMod)
          annotation (Line(points={{110,20},{110,20}}, color={0,0,127}));
        connect(aachen_HP_2stage_FMU.y_PEleHP, powTotMod) annotation (Line(
              points={{28,4},{60,4},{60,20},{110,20}},       color={0,0,127}));
        connect(aachen_HP_2stage_FMU.y_HeaCal, heaCalMod) annotation (Line(
              points={{28,-4},{60,-4},{60,-20},{110,-20}},     color={255,0,255}));
        connect(combiTimeTable.y[1], rooTemptoKelvin.Fahrenheit) annotation (
            Line(points={{-99,0},{-94,0},{-94,-48},{-77.6,-48}}, color={0,0,127}));
        connect(rooTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TRoo)
          annotation (Line(points={{-59.2,-48},{-40,-48},{-40,0},{-16.8,0}},
              color={0,0,127}));
        connect(retTemptoKelvin.Kelvin, sumTem.u1) annotation (Line(points={{
                -67.2,20},{-58,20},{-58,19.6},{-57.2,19.6}}, color={0,0,127}));
        connect(combiTimeTable.y[2], retTemptoKelvin.Fahrenheit) annotation (
            Line(points={{-99,0},{-94,0},{-94,20},{-85.6,20}}, color={0,0,127}));
        connect(outsideTemptoKelvin.Kelvin, sumTem.u2) annotation (Line(points=
                {{-67.2,0},{-62,0},{-62,12},{-58,12},{-58,12.4},{-57.2,12.4}},
              color={0,0,127}));
        connect(aachen_HP_2stage_FMU.y_TSup, supplyTempModtoCelsius.Kelvin)
          annotation (Line(points={{28,12},{60,12},{60,0},{70.4,0}},   color={0,
                0,127}));
        connect(supplyTempModtoCelsius.Celsius, supTemMod)
          annotation (Line(points={{88.8,0},{110,0}}, color={0,0,127}));
        connect(sta.y, staMea) annotation (Line(points={{-69.4,90},{16,90},{16,
                70},{110,70}}, color={0,0,127}));
        connect(combiTimeTable.y[12], setpointTemptoKelvin.Fahrenheit) annotation (
            Line(points={{-99,0},{-94,0},{-94,-26},{-77.6,-26}}, color={0,0,127}));
        connect(setpointTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TRooSetPoi)
          annotation (Line(points={{-59.2,-26},{-50,-26},{-50,-6.6},{-16.8,-6.6}},
                                                                             color={0,
                0,127}));
        connect(m3s_kgs.y, mcp.u2) annotation (Line(points={{-43.4,44},{-32,44},{-32,52.4},
                {40.8,52.4}}, color={0,0,127}));
        connect(cp.y, mcp.u1) annotation (Line(points={{-31.2,66},{10,66},{10,60},{40,
                60},{40,59.6},{40.8,59.6}}, color={0,0,127}));
        connect(aachen_HP_2stage_FMU.u_TMix, dTMea.u2) annotation (Line(points={{-16.8,
                -13.2},{-30,-13.2},{-30,-26.4},{40.8,-26.4}},
                                                   color={0,0,127}));
        connect(aachen_HP_2stage_FMU.y_TSup, dTMod.u1) annotation (Line(points={{28,12},
                {32,12},{32,26.4},{40.8,26.4}},  color={0,0,127}));
        connect(aachen_HP_2stage_FMU.u_TMix, dTMod.u2) annotation (Line(points={{-16.8,
                -13.2},{-30,-13.2},{-30,33.6},{40.8,33.6}},
                                                 color={0,0,127}));
        connect(supplyTemptoKelvin.Kelvin, dTMea.u1) annotation (Line(points={{-59.2,-80},
                {-10,-80},{-10,-33.6},{40.8,-33.6}}, color={0,0,127}));
        connect(mcpdTMea.y, qdotMea)
          annotation (Line(points={{90.6,-44},{100,-44},{100,-52},{110,-52}},
                                                          color={0,0,127}));
        connect(mcpdTMod.y, qdotMod)
          annotation (Line(points={{88.6,44},{110,44}}, color={0,0,127}));
        connect(dTMod.y, mcpdTMod.u2) annotation (Line(points={{54.6,30},{60,30},{60,40.4},
                {74.8,40.4}}, color={0,0,127}));
        connect(dTMea.y, mcpdTMea.u1) annotation (Line(points={{54.6,-30},{60,-30},{60,
                -40},{76,-40},{76,-40.4},{76.8,-40.4}}, color={0,0,127}));
        connect(mcp.y, mcpdTMod.u1) annotation (Line(points={{54.6,56},{64,56},{64,48},
                {74,48},{74,47.6},{74.8,47.6}}, color={0,0,127}));
        connect(mcp.y, mcpdTMea.u2) annotation (Line(points={{54.6,56},{64,56},{64,-47.6},
                {76.8,-47.6}}, color={0,0,127}));
        connect(PIHeaDemMea, gaiPIHeaDem.y)
          annotation (Line(points={{110,100},{92.4,100}}, color={0,0,127}));
        connect(combiTimeTable.y[15], gaiPIHeaDem.u) annotation (Line(points={{-99,0},
                {-94,0},{-94,100},{83.2,100}}, color={0,0,127}));
        connect(aachen_HP_2stage_FMU.y_PI, PIMod) annotation (Line(points={{28,-12},
                {62,-12},{62,-36},{110,-36}},          color={0,0,127}));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}})),
          experiment(
            StopTime=42000,
            Interval=1,
            Tolerance=1e-06),
      __Dymola_Commands(file="modelica://AixLib/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/HeatPump.mos"
              "Simulate and plot"),
          Documentation(info="<html><h4>
  <span style=\"color: #008000\">Overview</span>
</h4>
<p>
  Simple test set-up for the HeatPumpDetailed model. The heat pump is
  turned on and off while the source temperature increases linearly.
  Outputs are the electric power consumption of the heat pump and the
  supply temperature.
</p>
<p>
  Besides using the default simple table data, the user should also
  test tabulated data from <a href=
  \"modelica://AixLib.DataBase.HeatPump\">AixLib.DataBase.HeatPump</a> or
  polynomial functions.
</p>
</html>",   revisions="<html><ul>
  <li>
    <i>May 22, 2019</i> by Julian Matthes:<br/>
    Rebuild due to the introducion of the thermal machine partial model
    (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/715\">#715</a>)
  </li>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>"),__Dymola_Commands(file="Modelica://AixLib/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/HeatPump.mos" "Simulate and plot"),
          Icon(coordinateSystem(extent={{-100,-100},{100,80}})));
      end TesFMU_compile;
      annotation (Icon(graphics={
            Rectangle(
              lineColor={200,200,200},
              fillColor={248,248,248},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-100.0,-100.0},{100.0,100.0}},
              radius=25.0),
            Rectangle(
              lineColor={128,128,128},
              extent={{-100.0,-100.0},{100.0,100.0}},
              radius=25.0),
            Polygon(
              origin={8.0,14.0},
              lineColor={78,138,73},
              fillColor={78,138,73},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}));
    end Examples;

    package Validation
      "Collection of models that illustrate model use and test models"

      model HeatPumpCalibration "Example for the reversible heat pump model."
       extends Modelica.Icons.Example;

        replaceable package Medium_sin = Buildings.Media.Air
          constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
        replaceable package Medium_sou = Buildings.Media.Air
          constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
        Buildings.Fluid.Sources.MassFlowSource_T             sourceSideMassFlowSource(
          use_T_in=true,
          m_flow=1,
          nPorts=1,
          redeclare package Medium = Medium_sou,
          T=275.15) "Ideal mass flow source at the inlet of the source side"
                    annotation (Placement(transformation(extent={{-54,-80},{-34,-60}})));

        Buildings.Fluid.Sources.Boundary_pT               sourceSideFixedBoundary(
                                                                               nPorts=
             1, redeclare package Medium = Medium_sou)
                "Fixed boundary at the outlet of the source side"
                annotation (Placement(transformation(extent={{-11,11},{11,-11}},
              rotation=0,
              origin={-81,3})));
        Modelica.Blocks.Sources.Constant T_amb_internal(k=291.15)
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=-90,
              origin={0,-64})));
        hil_flexlab_model.Fluid.HeatPumps.HeatPump heatPump(
          Q_useNominal=6535,
          refIneFre_constant=0.00333,
          useBusConnectorOnly=true,
          CEva=100,
          GEvaOut=5,
          CCon=100,
          GConOut=5,
          dpEva_nominal=0,
          dpCon_nominal=0,
          VCon=0.4,
          use_conCap=false,
          redeclare package Medium_con = Medium_sin,
          redeclare package Medium_eva = Medium_sou,
          use_refIne=true,
          use_rev=false,
          TCon_start=290.15,
          TEva_start=281.15,
          redeclare model PerDataMainHP =
              AixLib.DataBase.HeatPump.PerformanceData.LookUpTable2D (dataTable=
                 hil_flexlab_model.Fluid.HeatPumps.Data.RongxinSampleHP()),
          redeclare model PerDataRevHP =
              AixLib.DataBase.Chiller.PerformanceData.LookUpTable2D (smoothness=
                 Modelica.Blocks.Types.Smoothness.LinearSegments, dataTable=
                  AixLib.DataBase.Chiller.EN14511.Vitocal200AWO201()),
          VEva=0.04,
          use_evaCap=false,
          scalingFactor=1,
          energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
          mFlow_conNominal=0.5,
          mFlow_evaNominal=0.5,
          use_autoCalc=false,
          TAmbEva_nominal=273.15,
          TAmbCon_nominal=288.15)
                             annotation (Placement(transformation(
              extent={{-24,-29},{24,29}},
              rotation=270,
              origin={2,-21})));

        Modelica.Blocks.Sources.BooleanConstant booleanConstant
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
              rotation=270,
              origin={16,78})));

        Buildings.Fluid.Sensors.TemperatureTwoPort
                                                senTAct(
          final m_flow_nominal=heatPump.m1_flow_nominal,
          final tau=1,
          final initType=Modelica.Blocks.Types.Init.InitialState,
          final tauHeaTra=1200,
          final allowFlowReversal=heatPump.allowFlowReversalCon,
          final transferHeat=false,
          redeclare final package Medium = Medium_sin,
          final T_start=303.15,
          final TAmb=291.15) "Temperature at sink inlet" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={54,-64})));
        Modelica.Blocks.Logical.Hysteresis hysHeating(
          pre_y_start=true,
          uLow=273.15 + 31.2,
          uHigh=273.15 + 32.2)
          annotation (Placement(transformation(extent={{66,58},{56,68}})));
        Modelica.Blocks.Math.BooleanToReal booleanToReal
          annotation (Placement(transformation(extent={{5,-5},{-5,5}},
              rotation=90,
              origin={7,29})));

        Buildings.Fluid.MixingVolumes.MixingVolume
                                                Room(
          nPorts=2,
          final use_C_flow=false,
          final m_flow_nominal=heatPump.m1_flow_nominal,
          final V=5,
          final allowFlowReversal=true,
          redeclare package Medium = Medium_sin)
          "Volume of Condenser" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={86,-20})));

        Modelica.Blocks.Logical.Not not2 "Negate output of hysteresis"
          annotation (Placement(transformation(extent={{-5,-5},{5,5}},
              origin={45,63},
              rotation=180)));
        Buildings.Fluid.Sources.Boundary_pT sinkSideFixedBoundary(     nPorts=1,
            redeclare package Medium = Medium_sin)
          "Fixed boundary at the outlet of the sink side" annotation (Placement(
              transformation(
              extent={{10,-10},{-10,10}},
              rotation=0,
              origin={88,-64})));
        Modelica.Blocks.Sources.Constant iceFac(final k=1)
          "Fixed value for icing factor. 1 means no icing/frosting (full heat transfer in heat exchanger)" annotation (Placement(
              transformation(
              extent={{8,8},{-8,-8}},
              rotation=180,
              origin={-66,38})));
        Modelica.Blocks.Logical.LogicalSwitch logicalSwitch
          annotation (Placement(transformation(extent={{24,48},{14,58}})));
        Modelica.Blocks.Logical.Hysteresis hysCooling(
          pre_y_start=false,
          uLow=273.15 + 15,
          uHigh=273.15 + 19)
          annotation (Placement(transformation(extent={{66,42},{56,52}})));
        AixLib.Controls.Interfaces.VapourCompressionMachineControlBus sigBus1
          annotation (Placement(transformation(extent={{-36,16},{-6,50}}),
              iconTransformation(extent={{-24,24},{-6,50}})));
        Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
          tableOnFile=true,
          tableName="tab1",
          fileName=ModelicaServices.ExternalReferences.loadResource(
              "modelica://hil_flexlab_model/Data/2022-02-08_HP_Filtered.txt"),
          columns=6:18,
          timeScale=60) annotation (Placement(transformation(extent={{-140,60},{-120,80}})));

        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin roomTemptoKelvin
          annotation (Placement(transformation(extent={{54,98},{74,118}})));
        Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature roomTemp
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={130,30})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin returnTemptoKelvin
          annotation (Placement(transformation(extent={{-34,78},{-14,98}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin outsideTemptoKelvin
          annotation (Placement(transformation(extent={{-90,-76},{-70,-56}})));
        Buildings.Controls.OBC.UnitConversions.From_cfm from_cfm
          annotation (Placement(transformation(extent={{-70,60},{-50,80}})));
        Buildings.Fluid.Sensors.DensityTwoPort senDen(redeclare package Medium =
              Buildings.Media.Air,   m_flow_nominal=0.2)
          annotation (Placement(transformation(extent={{48,-10},{68,10}})));
        Modelica.Blocks.Math.Product m3s_kgs
          annotation (Placement(transformation(extent={{-34,54},{-14,74}})));
        Modelica.Blocks.Interfaces.RealOutput supplyTempMea
          "Measured supply air temperature"
          annotation (Placement(transformation(extent={{100,-94},{120,-74}})));
        Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin supplyTemptoKelvin
          annotation (Placement(transformation(extent={{-90,-94},{-70,-74}})));
        Modelica.Blocks.Interfaces.RealOutput powerTotMea "Measured power"
          annotation (Placement(transformation(extent={{100,-110},{120,-90}})));
        Buildings.Fluid.Movers.FlowControlled_m_flow fanSup(
          m_flow_nominal=0.2,
          addPowerToMedium=false,
          nominalValuesDefineDefaultPressureCurve=true,
          dp_nominal=600,
          per(use_powerCharacteristic=false),
          energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
          use_inputFilter=true,
          redeclare package Medium = Medium_sin)
                                              "Supply fan"
          annotation (Placement(transformation(extent={{44,18},{24,38}})));
        Modelica.Blocks.Interfaces.RealOutput returnTempMea
          "Measured supply air temperature"
          annotation (Placement(transformation(extent={{100,78},{120,98}})));
        Modelica.Thermal.HeatTransfer.Celsius.FromKelvin  supplyTemptoCelsius
          annotation (Placement(transformation(extent={{20,-94},{40,-74}})));
        Modelica.Thermal.HeatTransfer.Celsius.FromKelvin returnTemptoCelsius
          annotation (Placement(transformation(extent={{54,78},{74,98}})));
        Modelica.Blocks.Math.Gain gain(k=0.5)
          annotation (Placement(transformation(extent={{-88,-50},{-68,-30}})));
        Modelica.Blocks.Math.Product sta_nSet
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-38,-14})));
        Modelica.Blocks.Math.Add sta annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-126,-8})));
        Modelica.Blocks.Sources.Constant basPow(final k=175)
          "baseline power for heat pump RTU" annotation (Placement(
              transformation(
              extent={{8,8},{-8,-8}},
              rotation=180,
              origin={92,66})));
        Modelica.Blocks.Math.Add pow annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=180,
              origin={152,60})));
        Modelica.Blocks.Interfaces.RealOutput powerTotMod "Modeled power"
          annotation (Placement(transformation(extent={{170,50},{190,70}})));
      equation

        connect(sourceSideMassFlowSource.ports[1], heatPump.port_a2) annotation (Line(
              points={{-34,-70},{-24,-70},{-24,-45},{-12.5,-45}}, color={0,127,255}));
        connect(heatPump.port_b2, sourceSideFixedBoundary.ports[1]) annotation (Line(
              points={{-12.5,3},{-70,3}},                   color={0,127,255}));
        connect(heatPump.port_b1, senTAct.port_a) annotation (Line(points={{16.5,-45},
                {30,-45},{30,-64},{44,-64}}, color={0,127,255}));
        connect(senTAct.T, hysHeating.u) annotation (Line(points={{54,-53},{54,-54},{
                54,-54},{54,-54},{54,-8},{70,-8},{70,63},{67,63}}, color={0,0,127}));
        connect(hysHeating.y, not2.u)
          annotation (Line(points={{55.5,63},{51,63}}, color={255,0,255}));
        connect(senTAct.port_b, sinkSideFixedBoundary.ports[1]) annotation (Line(
              points={{64,-64},{72,-64},{72,-64},{78,-64}}, color={0,127,255}));
        connect(senTAct.port_b, Room.ports[1]) annotation (Line(points={{64,-64},{66,-64},
                {66,-18},{76,-18}},      color={0,127,255}));
        connect(logicalSwitch.u1, not2.y) annotation (Line(points={{25,57},{36,57},{
                36,63},{39.5,63}}, color={255,0,255}));
        connect(hysCooling.y, logicalSwitch.u3) annotation (Line(points={{55.5,47},
                {36,47},{36,49},{25,49}},color={255,0,255}));
        connect(senTAct.T, hysCooling.u) annotation (Line(points={{54,-53},{54,
                -8},{70,-8},{70,47},{67,47}},
              color={0,0,127}));
        connect(booleanConstant.y, logicalSwitch.u2) annotation (Line(points={{
                16,71.4},{16,66},{32,66},{32,53},{25,53}}, color={255,0,255}));
        connect(logicalSwitch.y, booleanToReal.u)
          annotation (Line(points={{13.5,53},{7,53},{7,35}}, color={255,0,255}));
        connect(booleanConstant.y, sigBus1.modeSet) annotation (Line(points={{
                16,71.4},{-10,71.4},{-10,33.085},{-20.925,33.085}}, color={255,
                0,255}), Text(
            string="%second",
            index=1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        connect(iceFac.y, sigBus1.iceFacMea) annotation (Line(points={{-57.2,38},{-34,
                38},{-34,33.085},{-20.925,33.085}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(sigBus1, heatPump.sigBus) annotation (Line(
            points={{-21,33},{-21,16},{-10,16},{-10,2.76},{-7.425,2.76}},
            color={255,204,51},
            thickness=0.5), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        connect(roomTemp.port, Room.heatPort) annotation (Line(points={{130,20},{130,0},
                {86,0},{86,-10}}, color={191,0,0}));
        connect(roomTemptoKelvin.Kelvin, roomTemp.T)
          annotation (Line(points={{75,108},{130,108},{130,42}}, color={0,0,127}));
        connect(combiTimeTable.y[1], roomTemptoKelvin.Fahrenheit) annotation (Line(
              points={{-119,70},{-80,70},{-80,108},{52,108}}, color={0,0,127}));
        connect(combiTimeTable.y[2], returnTemptoKelvin.Fahrenheit) annotation (Line(
              points={{-119,70},{-80,70},{-80,88},{-36,88}},color={0,0,127}));
        connect(outsideTemptoKelvin.Kelvin, sourceSideMassFlowSource.T_in)
          annotation (Line(points={{-69,-66},{-56,-66}}, color={0,0,127}));
        connect(combiTimeTable.y[4], outsideTemptoKelvin.Fahrenheit) annotation (Line(
              points={{-119,70},{-106,70},{-106,-66},{-92,-66}}, color={0,0,127}));
        connect(combiTimeTable.y[5], from_cfm.u)
          annotation (Line(points={{-119,70},{-72,70}}, color={0,0,127}));
        connect(Room.ports[2], senDen.port_b) annotation (Line(points={{76,-22},{72,-22},
                {72,0},{68,0}}, color={0,127,255}));
        connect(from_cfm.y, m3s_kgs.u1)
          annotation (Line(points={{-48,70},{-36,70}}, color={0,0,127}));
        connect(senDen.d, m3s_kgs.u2) annotation (Line(points={{58,11},{-44,11},{-44,58},
                {-36,58}}, color={0,0,127}));
        connect(combiTimeTable.y[3], supplyTemptoKelvin.Fahrenheit) annotation (Line(
              points={{-119,70},{-106,70},{-106,-84},{-92,-84}}, color={0,0,127}));
        connect(senDen.port_a, fanSup.port_a) annotation (Line(points={{48,0},{
                46,0},{46,28},{44,28}},
                                 color={0,127,255}));
        connect(heatPump.port_a1, fanSup.port_b)
          annotation (Line(points={{16.5,3},{16.5,28},{24,28}}, color={0,127,255}));
        connect(m3s_kgs.y, fanSup.m_flow_in) annotation (Line(points={{-13,64},
                {-2,64},{-2,44},{34,44},{34,40}},
                                          color={0,0,127}));
        connect(combiTimeTable.y[9], powerTotMea) annotation (Line(points={{
                -119,70},{-106,70},{-106,-100},{110,-100}}, color={0,0,127}));
        connect(supplyTemptoKelvin.Kelvin, supplyTemptoCelsius.Kelvin)
          annotation (Line(points={{-69,-84},{18,-84}}, color={0,0,127}));
        connect(supplyTemptoCelsius.Celsius, supplyTempMea)
          annotation (Line(points={{41,-84},{110,-84}}, color={0,0,127}));
        connect(returnTemptoKelvin.Kelvin, returnTemptoCelsius.Kelvin)
          annotation (Line(points={{-13,88},{52,88}}, color={0,0,127}));
        connect(returnTemptoCelsius.Celsius, returnTempMea)
          annotation (Line(points={{75,88},{110,88}}, color={0,0,127}));
        connect(gain.y, sta_nSet.u1)
          annotation (Line(points={{-67,-40},{-44,-40},{-44,-26}}, color={0,0,127}));
        connect(booleanToReal.y, sta_nSet.u2) annotation (Line(points={{7,23.5},{7,20},
                {-24,20},{-24,-34},{-32,-34},{-32,-26}}, color={0,0,127}));
        connect(sta_nSet.y, sigBus1.nSet) annotation (Line(points={{-38,-3},{-38,24},{
                -24,24},{-24,33.085},{-20.925,33.085}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(sta.u1, combiTimeTable.y[10]) annotation (Line(points={{-132,4},{-132,
                24},{-106,24},{-106,70},{-119,70}}, color={0,0,127}));
        connect(sta.u2, combiTimeTable.y[11]) annotation (Line(points={{-120,4},{-120,
                24},{-106,24},{-106,70},{-119,70}}, color={0,0,127}));
        connect(sta.y, gain.u) annotation (Line(points={{-126,-19},{-126,-40},{-90,-40}},
              color={0,0,127}));
        connect(basPow.y, pow.u2)
          annotation (Line(points={{100.8,66},{140,66}}, color={0,0,127}));
        connect(pow.y, powerTotMod)
          annotation (Line(points={{163,60},{180,60}}, color={0,0,127}));
        connect(pow.u1, sigBus1.PelMea) annotation (Line(points={{140,54},{100,
                54},{100,32},{54,32},{54,40},{-20,40},{-20,33.085},{-20.925,
                33.085}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}})),
          experiment(
            StopTime=7000,
            Interval=60,
            Tolerance=1e-06),
      __Dymola_Commands(file="modelica://AixLib/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/HeatPump.mos"
              "Simulate and plot"),
          Documentation(info="<html><h4>
  <span style=\"color: #008000\">Overview</span>
</h4>
<p>
  Simple test set-up for the HeatPumpDetailed model. The heat pump is
  turned on and off while the source temperature increases linearly.
  Outputs are the electric power consumption of the heat pump and the
  supply temperature.
</p>
<p>
  Besides using the default simple table data, the user should also
  test tabulated data from <a href=
  \"modelica://AixLib.DataBase.HeatPump\">AixLib.DataBase.HeatPump</a> or
  polynomial functions.
</p>
</html>",   revisions="<html><ul>
  <li>
    <i>May 22, 2019</i> by Julian Matthes:<br/>
    Rebuild due to the introducion of the thermal machine partial model
    (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/715\">#715</a>)
  </li>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>"),__Dymola_Commands(file="Modelica://AixLib/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/HeatPump.mos" "Simulate and plot"),
          Icon(coordinateSystem(extent={{-100,-100},{100,80}})));
      end HeatPumpCalibration;

      annotation (Icon(graphics={
            Rectangle(
              lineColor={200,200,200},
              fillColor={248,248,248},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-100.0,-100.0},{100.0,100.0}},
              radius=25.0),
            Rectangle(
              lineColor={128,128,128},
              extent={{-100.0,-100.0},{100.0,100.0}},
              radius=25.0),
            Polygon(
              origin={8.0,14.0},
              lineColor={78,138,73},
              fillColor={78,138,73},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}));
    end Validation;

    package BaseClasses "base class models for RTU HP"

      model RTUHP "Model for RTU HP"

       replaceable package Medium_sou = Buildings.Media.Air;
       replaceable package Medium_sin = Buildings.Media.Air;
       parameter Real refIneFre = refIneFre "refrigerant inertia parameter";

       Buildings.Fluid.Sources.MassFlowSource_T inSou(
          use_T_in=true,
          m_flow=1,
          nPorts=1,
          redeclare package Medium = Medium_sou) "Ideal mass flow source at the inlet of the source side"
          annotation (Placement(transformation(extent={{-62,-74},{-42,-54}})));
       Buildings.Fluid.Sources.Boundary_pT outSou(nPorts=1, redeclare package
            Medium = Medium_sou)
          "Fixed boundary at the outlet of the source side" annotation (
            Placement(transformation(
              extent={{-11,11},{11,-11}},
              rotation=0,
              origin={-53,-29})));
       HeatPump heaPum(
          Q_useNominal=6535,
          refIneFre_constant= refIneFre,
          nthOrder=3,
          useBusConnectorOnly=true,
          CEva=100,
          GEvaOut=5,
          CCon=100,
          GConOut=5,
          dpEva_nominal=0,
          dpCon_nominal=0,
          VCon=0.4,
          use_conCap=false,
          redeclare package Medium_con = Medium_sin,
          redeclare package Medium_eva = Medium_sou,
          use_refIne=true,
          use_rev=false,
          TCon_start=290.15,
          TEva_start=281.15,
          redeclare model PerDataMainHP =
              AixLib.DataBase.HeatPump.PerformanceData.LookUpTable2D (dataTable=
                 hil_flexlab_model.Fluid.HeatPumps.Data.RongxinSampleHP()),
          redeclare model PerDataRevHP =
              AixLib.DataBase.Chiller.PerformanceData.LookUpTable2D (smoothness=
                 Modelica.Blocks.Types.Smoothness.LinearSegments, dataTable=
                  AixLib.DataBase.Chiller.EN14511.Vitocal200AWO201()),
          VEva=0.04,
          use_evaCap=false,
          scalingFactor=1.35,
          energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
          mFlow_conNominal=0.5,
          mFlow_evaNominal=0.5,
          use_autoCalc=true,
          TAmbEva_nominal=273.15,
          TAmbCon_nominal=288.15) annotation (Placement(transformation(
              extent={{-23,-28},{23,28}},
              rotation=0,
              origin={3.00001,-14})));

       Modelica.Blocks.Sources.BooleanConstant heaOn annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={-52,64})));

        Buildings.Fluid.Sensors.TemperatureTwoPort senTAct(
          final m_flow_nominal=heaPum.m1_flow_nominal,
          final tau=1,
          final initType=Modelica.Blocks.Types.Init.InitialState,
          final tauHeaTra=1200,
          final allowFlowReversal=heaPum.allowFlowReversalCon,
          final transferHeat=false,
          redeclare final package Medium = Medium_sin,
          final T_start=303.15,
          final TAmb=291.15) "Temperature at sink inlet" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={60,0})));
       Modelica.Blocks.Sources.Constant iceFac(final k=1)
         "Fixed value for icing factor. 1 means no icing/frosting (full heat transfer in heat exchanger)" annotation (Placement(
             transformation(
             extent={{8,8},{-8,-8}},
             rotation=180,
             origin={-60,20})));
       Modelica.Blocks.Math.Gain nSetGai(k=0.5)
          annotation (Placement(transformation(extent={{-90,36},{-70,56}})));
       AixLib.Controls.Interfaces.VapourCompressionMachineControlBus sigBus1
         annotation (Placement(transformation(extent={{-36,16},{-6,50}}),
             iconTransformation(extent={{-24,24},{-6,50}})));
       Modelica.Blocks.Interfaces.RealOutput PEle(quantity="Power", unit="W")
          "Electrical power consumed by the unit"
          annotation (Placement(transformation(extent={{100,70},{120,90}})));
       Modelica.Blocks.Interfaces.RealInput TEvaIn(quantity=
              "ThermodynamicTemperature", unit="K", displayUnit="degC")
          "Outside air dry bulb temperature" annotation (Placement(
              transformation(extent={{-120,-90},{-100,-70}})));
       Modelica.Blocks.Interfaces.RealInput sta "Heating stage" annotation (
            Placement(transformation(extent={{-120,70},{-100,90}}),
              iconTransformation(extent={{-120,70},{-100,90}})));
       Modelica.Blocks.Interfaces.RealOutput TSup(quantity=
              "ThermodynamicTemperature", unit="K", displayUnit="degC")
          "Electrical power consumed by the unit"
          annotation (Placement(transformation(extent={{100,50},{120,70}})));
       Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
             Medium_sin)
         annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
       Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
             Medium_sin)
         annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      equation
        connect(inSou.ports[1], heaPum.port_a2) annotation (Line(points={{-42,
                -64},{26,-64},{26,-28}}, color={0,127,255}));
        connect(heaPum.port_b2, outSou.ports[1]) annotation (Line(points={{-20,
                -28},{-42,-28},{-42,-29}}, color={0,127,255}));
        connect(heaPum.port_b1, senTAct.port_a)
          annotation (Line(points={{26,0},{50,0}}, color={0,127,255}));
        connect(heaOn.y, sigBus1.modeSet) annotation (Line(points={{-45.4,64},{
                -22,64},{-22,33.085},{-20.925,33.085}}, color={255,0,255}),
            Text(
            string="%second",
            index=1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
       connect(iceFac.y,sigBus1. iceFacMea) annotation (Line(points={{-51.2,20},{-24,
               20},{-24,32},{-22,32},{-22,33.085},{-20.925,33.085}},
                                                   color={0,0,127}), Text(
           string="%second",
           index=1,
           extent={{6,3},{6,3}},
           horizontalAlignment=TextAlignment.Left));
        connect(sigBus1, heaPum.sigBus) annotation (Line(
            points={{-21,33},{-21,16},{-30,16},{-30,-23.1},{-19.77,-23.1}},
            color={255,204,51},
            thickness=0.5), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        connect(sigBus1.PelMea, PEle) annotation (Line(
            points={{-20.925,33.085},{-4,33.085},{-4,80},{110,80}},
            color={255,204,51},
            thickness=0.5), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        connect(nSetGai.y, sigBus1.nSet) annotation (Line(points={{-69,46},{-46,
                46},{-46,33.085},{-20.925,33.085}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(senTAct.T, TSup) annotation (Line(points={{60,11},{60,60},{110,
                60}}, color={0,0,127}));
        connect(port_a, heaPum.port_a1)
          annotation (Line(points={{-100,0},{-20,0}}, color={0,127,255}));
       connect(senTAct.port_b,port_b)
         annotation (Line(points={{70,0},{100,0}}, color={0,127,255}));
        connect(TEvaIn, inSou.T_in) annotation (Line(points={{-110,-80},{-86,-80},
                {-86,-60},{-64,-60}}, color={0,0,127}));
        connect(sta, nSetGai.u) annotation (Line(points={{-110,80},{-100,80},{
                -100,46},{-92,46}}, color={0,0,127}));
       annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
             coordinateSystem(preserveAspectRatio=false)));
      end RTUHP;
      annotation (Icon(graphics={
            Rectangle(
              lineColor={200,200,200},
              fillColor={248,248,248},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-100.0,-100.0},{100.0,100.0}},
              radius=25.0),
            Rectangle(
              lineColor={128,128,128},
              extent={{-100.0,-100.0},{100.0,100.0}},
              radius=25.0),
            Ellipse(
              extent={{-30.0,-30.0},{30.0,30.0}},
              lineColor={128,128,128},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
    end BaseClasses;
    annotation (Icon(graphics={
          Rectangle(
            lineColor={200,200,200},
            fillColor={248,248,248},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0),
          Rectangle(
            lineColor={128,128,128},
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0),
          Ellipse(
            origin={10.0,10.0},
            fillColor={76,76,76},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            extent={{-80.0,-80.0},{-20.0,-20.0}}),
          Ellipse(
            origin={10.0,10.0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            extent={{0.0,-80.0},{60.0,-20.0}}),
          Ellipse(
            origin={10.0,10.0},
            fillColor={128,128,128},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            extent={{0.0,0.0},{60.0,60.0}}),
          Ellipse(
            origin={10.0,10.0},
            lineColor={128,128,128},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            extent={{-80.0,0.0},{-20.0,60.0}})}));
  end HeatPumps;

  model Aachen_HP_noIEC_2stage
    "Air supply unit model with heatpump heating and cooling and auxiliary electric heater for heating"
    extends hil_flexlab_model.BaseClasses.partialAirUnit;
    parameter Modelica.SIunits.DimensionlessRatio COP_heating = 3.5 "Coefficient of performance in heating";
    parameter Modelica.SIunits.DimensionlessRatio COP_cooling = 3.5 "Coefficient of performance in cooling";
    Modelica.Blocks.Interfaces.RealOutput PHea
      "Heating thermal power consumption"
      annotation (Placement(transformation(extent={{200,110},{220,130}})));
    Modelica.Blocks.Interfaces.RealOutput PCoo
      "Cooling electrical power consumption"
      annotation (Placement(transformation(extent={{200,90},{220,110}})));
    Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.Data.Generic.DXCoil datCoi(
      nSta=2,
      minSpeRat=0,
      sta={
      Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.Data.Generic.BaseClasses.Stage(
          spe=0.66,
          nomVal=
          Buildings.Fluid.HeatExchangers.DXCoils.AirCooled.Data.Generic.BaseClasses.NominalValues(
             Q_flow_nominal=-QCoo_flow_nominal*0.66,
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
            ffMax=10)),
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

    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{120,90},{140,110}})));
    Modelica.Blocks.Sources.RealExpression copCoo(y=
          hil_flexlab_model.BaseClasses.Functions.COP_ASHP(abs(senTSup.T -
          TDryBul.y)))
      annotation (Placement(transformation(extent={{120,118},{140,138}})));
    Modelica.Blocks.Math.Gain cooCor(k=-1)
      "Correction for cooling power to be positive"
      annotation (Placement(transformation(extent={{146,124},{154,132}})));
    Modelica.Blocks.Math.Division pow
      annotation (Placement(transformation(extent={{160,110},{180,90}})));
    Modelica.Blocks.Math.Gain TDryBul(k=1)
      annotation (Placement(transformation(extent={{20,150},{40,170}})));
    Modelica.Blocks.Sources.RealExpression copHea(y=
          hil_flexlab_model.BaseClasses.Functions.COP_ASHP(abs(senTSup.T -
          TDryBul.y)))
      annotation (Placement(transformation(extent={{40,118},{60,138}})));
    hil_flexlab_model.BaseClasses.COP_ASHP_AuxHeat powHeaPum(QHeaPum_flow_nominal=QCoo_flow_nominal)
      "Power consumption calculation for heat pump heating"
      annotation (Placement(transformation(extent={{90,110},{110,130}})));
    Modelica.Blocks.Interfaces.IntegerInput n_Sta
      annotation (Placement(transformation(extent={{-240,-100},{-200,-60}})));
    HeatPumps.BaseClasses.RTUHP partialRTUHP
      annotation (Placement(transformation(extent={{38,20},{74,58}})));
  equation
    connect(copCoo.y, cooCor.u)
      annotation (Line(points={{141,128},{145.2,128}}, color={0,0,127}));
    connect(cooCor.y, pow.u2) annotation (Line(points={{154.4,128},{158,128},{158,
            106}}, color={0,0,127}));
    connect(add.y, pow.u1) annotation (Line(points={{141,100},{152,100},{152,94},
            {158,94}}, color={0,0,127}));
    connect(pow.y, PCoo)
      annotation (Line(points={{181,100},{210,100}}, color={0,0,127}));
    connect(weaBus.TDryBul, TDryBul.u) annotation (Line(
        points={{-180,170},{-180,160},{18,160}},
        color={255,204,51},
        thickness=0.5), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(add.y, QCoo) annotation (Line(points={{141,100},{152,100},{152,76},{
            160,76},{160,-80},{210,-80}}, color={0,0,127}));
    connect(powHeaPum.copHeaPum, copHea.y) annotation (Line(points={{88,124},{70,
            124},{70,128},{61,128}}, color={0,0,127}));
    connect(powHeaPum.PEle, PHea) annotation (Line(points={{111,130},{116,130},{
            116,120},{210,120}}, color={0,0,127}));
    connect(totalRes.port_b, partialRTUHP.port_a) annotation (Line(points={{20,
            40},{36,40},{36,39},{38,39}}, color={0,127,255}));
    connect(partialRTUHP.port_b, senMasFloSup.port_a) annotation (Line(points={
            {74,39},{86,39},{86,40},{100,40}}, color={0,127,255}));
    connect(TDryBul.y, partialRTUHP.TEvaIn) annotation (Line(points={{41,160},{
            26,160},{26,23.8},{36.2,23.8}}, color={0,0,127}));
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
  end Aachen_HP_noIEC_2stage;

  model Aachen_HP_2stage_FMU
    "Air supply unit model with heatpump heating and cooling and auxiliary electric heater for heating"

    replaceable package Medium_sou = Buildings.Media.Air;
    replaceable package Medium_sin = Buildings.Media.Air;
    parameter Real refIneFre = 0.015 "refrigerant inertia parameter";
    parameter Real k_hea=0.18 "Proportional gain of heating controller";
    parameter Modelica.SIunits.Time Ti_hea=2400 "Integral time constant of heating controller";
    parameter Modelica.SIunits.ThermodynamicTemperature maxSAT = 310 "max supply air temperature";
    parameter Real uLowSta1 = 0.05 "PI lower bound to activate stage 1";
    parameter Real uUppSta1 = 0.15 "PI upper bound to activate stage 1";
    parameter Real uLowSta2 = 0.35 "PI lower bound to activate stage 2";
    parameter Real uUppSta2 = 0.45 "PI upper bound to activate stage 2";
    parameter Real kSta1 = 0.05 "PI center line to activate stage 1";
    parameter Real kSta2 = 0.35 "PI center line to activate stage 2";
    parameter Real banSta1 = 0.01 "PI band to activate stage 1";
    parameter Real banSta2 = 0.01 "PI band to activate stage 2";

    HeatPumps.BaseClasses.RTUHP rtuHP(
      redeclare package Medium_sin = Medium_sin,
      redeclare package Medium_sou = Medium_sou,
      refIneFre=refIneFre) annotation (Placement(transformation(extent={{0,28},{32,60}})));
    Buildings.Fluid.Sources.MassFlowSource_T supFan(
      redeclare package Medium = Medium_sou,
      use_m_flow_in=true,
      use_T_in=true,
      nPorts=1) annotation (Placement(transformation(extent={{-80,-2},{-60,18}})));
    Modelica.Blocks.Interfaces.RealInput u_m_flow(unit="kg/s") annotation (
        Placement(transformation(extent={{-140,60},{-100,100}}),
          iconTransformation(extent={{-140,60},{-100,100}})));
    Buildings.Fluid.Sources.Boundary_pT roo(nPorts=1, redeclare package Medium =
          Medium_sou) "Fixed boundary at the outlet of the source side"
      annotation (Placement(transformation(
          extent={{-11,11},{11,-11}},
          rotation=180,
          origin={79,21})));
    Modelica.Blocks.Interfaces.RealOutput y_TSup(unit="K", displayUnit="degC")
      annotation (Placement(transformation(extent={{100,32},{120,52}})));
    Modelica.Blocks.Interfaces.RealOutput y_PEleHP(unit="W")
      annotation (Placement(transformation(extent={{100,58},{120,78}})));
    BaseClasses.Controls.RTU_control_FMU_Delay rtuConFMU(
      k_hea=k_hea,
      Ti_hea=Ti_hea,
      uLowSta1=uLowSta1,
      uUppSta1=uUppSta1,
      uLowSta2=uLowSta2,
      uUppSta2=uUppSta2,
      maxSAT = maxSAT,
      kSta1=kSta1,
      kSta2=kSta2,
      banSta1=banSta1,
      banSta2=banSta2)
      annotation (Placement(transformation(extent={{0,-72},{28,-44}})));
    Modelica.Blocks.Interfaces.RealInput u_TDryBul(unit="K", displayUnit="degC")
      "Zone temperature measurement" annotation (Placement(transformation(extent={
              {-20,-20},{20,20}}, origin={-120,-32}), iconTransformation(extent={{
              -140,-20},{-100,20}})));
    Modelica.Blocks.Interfaces.RealInput u_TRoo(unit="K", displayUnit="degC")
      "Zone temperature measurement" annotation (Placement(transformation(extent={
              {-20,-20},{20,20}}, origin={-120,-90}), iconTransformation(extent={{
              -140,-100},{-100,-60}})));
    Modelica.Blocks.Interfaces.RealInput u_TRooSetPoi(unit="K", displayUnit=
         "degC") "Zone temperature measurement" annotation (Placement(
          transformation(extent={{-20,-20},{20,20}}, origin={-120,-60}),
          iconTransformation(extent={{-140,-60},{-100,-20}})));
    Modelica.Blocks.Interfaces.RealInput u_TMix(unit="K", displayUnit="degC")
      "Zone temperature measurement" annotation (Placement(transformation(extent={
              {-20,-20},{20,20}}, origin={-120,0}), iconTransformation(extent={{-140,
              20},{-100,60}})));
    Modelica.Blocks.Interfaces.BooleanOutput y_HeaCal
      annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput y_PI
      annotation (Placement(transformation(extent={{100,-82},{120,-62}})));
  equation
    connect(supFan.ports[1], rtuHP.port_a) annotation (Line(points={{-60,8},{-16,8},
            {-16,44},{0,44}}, color={0,127,255}));
    connect(u_m_flow, supFan.m_flow_in) annotation (Line(points={{-120,80},{-90,80},
            {-90,16},{-82,16}}, color={0,0,127}));
    connect(rtuHP.port_b, roo.ports[1]) annotation (Line(points={{32,44},{52,44},{
            52,21},{68,21}}, color={0,127,255}));
    connect(rtuHP.TSup, y_TSup) annotation (Line(points={{33.6,53.6},{64,53.6},
            {64,42},{110,42}},             color={0,0,127}));
    connect(rtuHP.PEle, y_PEleHP) annotation (Line(points={{33.6,56.8},{64,56.8},{
            64,68},{110,68}}, color={0,0,127}));
    connect(rtuConFMU.heaSta, rtuHP.sta) annotation (Line(points={{30.52,
            -52.9091},{36,-52.9091},{36,10},{-10,10},{-10,56},{-1.6,56},{-1.6,
            56.8}},                                           color={0,0,127}));
    connect(u_TDryBul, rtuHP.TEvaIn) annotation (Line(points={{-120,-32},{-40,-32},
            {-40,31.2},{-1.6,31.2}}, color={0,0,127}));
    connect(supFan.T_in, u_TMix) annotation (Line(points={{-82,12},{-90,12},{-90,0},
            {-120,0}}, color={0,0,127}));
    connect(u_TRoo, rtuConFMU.TRoo) annotation (Line(points={{-120,-90},{-38,
            -90},{-38,-64.3636},{-2.8,-64.3636}},
                                 color={0,0,127}));
    connect(rtuConFMU.TSup, rtuHP.TSup) annotation (Line(points={{-2.8,-72},{
            -22,-72},{-22,-90},{42,-90},{42,54},{34,54},{34,53.6},{33.6,53.6}},
                                                                       color={0,0,
            127}));
    connect(u_TRooSetPoi, rtuConFMU.TSetRooHea) annotation (Line(points={{-120,
            -60},{-50,-60},{-50,-49.0909},{-2.8,-49.0909}}, color={0,0,127}));
    connect(rtuConFMU.heaCal, y_HeaCal) annotation (Line(points={{30.52,
            -59.5273},{65.17,-59.5273},{65.17,-40},{110,-40}}, color={255,0,255}));
    connect(rtuConFMU.PI_y, y_PI) annotation (Line(points={{30.52,-66.4},{67.26,
            -66.4},{67.26,-72},{110,-72}}, color={0,0,127}));
    annotation (                              experiment(
        StartTime=19872000,
        StopTime=19958400,
        Interval=60,
        Tolerance=1e-06), Icon(graphics={
                                  Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Text(
            extent={{-56,64},{68,-60}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Solid,
            fillColor={175,175,175},
            textString="fmu",
            textStyle={TextStyle.Bold})}));
  end Aachen_HP_2stage_FMU;
  annotation (Icon(graphics={
        Rectangle(
          lineColor={200,200,200},
          fillColor={248,248,248},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-100.0,-100.0},{100.0,100.0}},
          radius=25.0),
        Rectangle(
          lineColor={128,128,128},
          extent={{-100.0,-100.0},{100.0,100.0}},
          radius=25.0),
        Polygon(points={{-70,26},{68,-44},{68,26},{2,-10},{-70,-42},{-70,26}},
            lineColor={0,0,0}),
        Line(points={{2,42},{2,-10}}, color={0,0,0}),
        Rectangle(
          extent={{-18,50},{22,42}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end Fluid;
