within hil_flexlab_model;
package Plants
  model BaseCoolingVarCOP
    "Basic cooling plant with variable COP components"
    extends hil_flexlab_model.Plants.BaseClasses.partialPlant(m_flow_nominal=
          mAWHP_flow_nominal + mTes_flow_nominal, senTemRet);
    parameter Modelica.Units.SI.MassFlowRate mAWHP_flow_nominal
      "Nominal mass flowrate of air-to-water heat pump";
    parameter Modelica.Units.SI.MassFlowRate mSwec_flow_nominal
      "Nominal mass flowrate of swec";
    parameter Modelica.Units.SI.MassFlowRate mTes_flow_nominal
      "Nominal mass flowrate of tes";
    parameter Modelica.Units.SI.ThermalConductivity k=0.584
      "Thermal conductivity of PCM";
    parameter Modelica.Units.SI.SpecificHeatCapacity c=2910
      "Specific heat capacity of PCM";
    parameter Modelica.Units.SI.Density d=1500 "Mass density of PCM";
    parameter Modelica.Units.SI.Temperature TSol=273.15 + 29.5
      "Solidus temperature of PCM.";
    parameter Modelica.Units.SI.Temperature TLiq=273.15 + 29.66
      "Liquidus temperature of PCM";
    parameter Modelica.Units.SI.SpecificInternalEnergy LHea=278140
      "Latent heat of phase change";
    hil_flexlab_model.Plants.BaseClasses.ASHPCoolingBlackBox AWHP(
      redeclare package Medium = Medium,
      mSou_flow_nominal=mAWHP_flow_nominal,
      Q_flow_nominal=Q_flow_nominal) "Air-to-water heat pump"
      annotation (Placement(transformation(extent={{-40,140},{-20,160}})));
    Buildings.Fluid.FixedResistances.Junction spl2(
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_nominal*{1,1,-1},
      dp_nominal={0,0,0}) "Flow splitter for supply" annotation (Placement(
          transformation(
          extent={{10,10},{-10,-10}},
          rotation=90,
          origin={20,126})));
    Buildings.Fluid.FixedResistances.Junction spl1(
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_nominal*{1,-1,-1},
      dp_nominal={0,0,0}) "Flow splitter for supply" annotation (Placement(
          transformation(
          extent={{10,10},{-10,-10}},
          rotation=90,
          origin={20,174})));
    Buildings.Fluid.Sensors.TemperatureTwoPort senTemSupAWHP(
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_nominal)
             "Temperature sensor for supply water after AWHP" annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=-90,
          origin={20,100})));
    RTUPCM.HVAC.Plants.BaseClasses.Tes TES(
      redeclare package Medium = Medium,
      mTes_flow_nominal=mTes_flow_nominal,
      k=k,
      c=c,
      d=d,
      TSol=TSol,
      TLiq=TLiq,
      LHea=LHea,
      Tes_nominal=Tes_nominal)
      annotation (Placement(transformation(extent={{-40,-2},{-20,20}})));
    Buildings.Fluid.FixedResistances.Junction spl3(
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_nominal*{1,-1,-1},
      dp_nominal={0,0,0}) "Flow splitter for supply" annotation (Placement(
          transformation(
          extent={{10,10},{-10,-10}},
          rotation=90,
          origin={20,70})));
    Buildings.Fluid.FixedResistances.Junction spl4(
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_nominal*{1,-1,-1},
      dp_nominal={0,0,0}) "Flow splitter for supply" annotation (Placement(
          transformation(
          extent={{10,10},{-10,-10}},
          rotation=90,
          origin={20,-70})));
    Buildings.Fluid.FixedResistances.Junction spl5(
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_nominal*{1,-1,-1},
      dp_nominal={0,0,0}) "Flow splitter for supply" annotation (Placement(
          transformation(
          extent={{10,10},{-10,-10}},
          rotation=90,
          origin={20,-120})));
    Buildings.Fluid.Sensors.TemperatureTwoPort senTemRetSwe(
      redeclare package Medium = Medium,
      m_flow_nominal=m_flow_nominal)
             "Temperature sensor for return water after Swec" annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=-90,
          origin={20,-248})));
    Buildings.Fluid.Sources.Boundary_pT ref(redeclare package Medium = Medium,
        nPorts=1) "Reference pressure"
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={60,230})));
    Modelica.Blocks.Interfaces.RealInput uASHP
      "Control signal for pump serving source [0-1]"
      annotation (Placement(transformation(extent={{-140,180},{-100,220}})));
    Modelica.Blocks.Interfaces.RealInput uTes
      "Control signal for tes charging [-1-0] and discharging [0-1]"
      annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    Modelica.Blocks.Interfaces.RealOutput TTes "Outlet fluid temperature of TES"
      annotation (Placement(transformation(extent={{100,90},{120,110}})));
    Modelica.Blocks.Interfaces.RealOutput PEle(unit="W") "Electrical power consumption"
      annotation (Placement(transformation(extent={{100,250},{120,270}})));
    Modelica.Blocks.Math.MultiSum multiSum(nu=1)
      annotation (Placement(transformation(extent={{74,254},{86,266}})));
    parameter Modelica.Units.SI.DimensionlessRatio COPCoo_ASHP=3
      "Cooling COP of ASHP";
    parameter Modelica.Units.SI.DimensionlessRatio COPCoo_SWEC=3
      "Cooling COP of SWEC";
    parameter Modelica.Units.SI.Energy Tes_nominal "Design TES capacity";
    Modelica.Blocks.Interfaces.RealInput TSetASHP
      "Set point temperature of the fluid that leaves the heatpump"
      annotation (Placement(transformation(extent={{-140,120},{-100,160}})));
    Modelica.Blocks.Interfaces.RealOutput SOC "state of charge of PCM"
      annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput TRetASHP(unit="K")
      "Temperature of return water to ASHP"
      annotation (Placement(transformation(extent={{100,-230},{120,-210}})));
    Modelica.Blocks.Interfaces.RealOutput TASHP "Temperature leaving the ASHP"
      annotation (Placement(transformation(extent={{100,138},{120,158}}),
          iconTransformation(extent={{100,138},{120,158}})));
    Modelica.Blocks.Interfaces.RealInput uTDryBul
      "Outside air dry bulb temperature"
      annotation (Placement(transformation(extent={{-140,216},{-100,256}})));
  equation
    connect(spl1.port_3, AWHP.port_a) annotation (Line(points={{10,174},{0,174},{
            0,156},{-20,156}},
                             color={0,127,255}));
    connect(AWHP.port_b, spl2.port_3) annotation (Line(points={{-20,144},{0,144},
            {0,126},{10,126}},color={0,127,255}));
    connect(spl2.port_2, senTemSupAWHP.port_a)
      annotation (Line(points={{20,116},{20,110}}, color={0,127,255}));
    connect(senTemSupAWHP.port_b, spl3.port_1)
      annotation (Line(points={{20,90},{20,80}}, color={0,127,255}));
    connect(spl3.port_3, TES.port_a1) annotation (Line(points={{10,70},{0,70},{0,17.8},
            {-20,17.8}}, color={0,127,255}));
    connect(spl4.port_3, TES.port_a2) annotation (Line(points={{10,-70},{0,-70},{
            0,4.6},{-20,4.6}},
                             color={0,127,255}));
    connect(TES.port_b, spl5.port_3) annotation (Line(points={{-20,0.2},{-10,0.2},
            {-10,-120},{10,-120}}, color={0,127,255}));
    connect(senTemRetSwe.port_b, spl1.port_1) annotation (Line(points={{20,-258},
            {20,-260},{60,-260},{60,200},{20,200},{20,184}},color={0,127,255}));
    connect(ref.ports[1], spl1.port_1) annotation (Line(points={{60,220},{60,200},
            {20,200},{20,184}}, color={0,127,255}));
    connect(senTemRet.port_b, spl4.port_1)
      annotation (Line(points={{30,-30},{20,-30},{20,-60}}, color={0,127,255}));
    connect(AWHP.uPum, uASHP) annotation (Line(points={{-42,156},{-60,156},{-60,200},
            {-120,200}}, color={0,0,127}));
    connect(TES.uTes, uTes) annotation (Line(points={{-42,20},{-72,20},{-72,0},{-120,
            0}}, color={0,0,127}));
    connect(TES.TTes, TTes) annotation (Line(points={{-19,20},{-10,20},{-10,86},{
            80,86},{80,100},{110,100}}, color={0,0,127}));
    connect(spl1.port_2, spl2.port_1)
      annotation (Line(points={{20,164},{20,136}}, color={0,127,255}));
    connect(spl4.port_2, spl5.port_1)
      annotation (Line(points={{20,-80},{20,-110}}, color={0,127,255}));
    connect(senTemSupAWHP.T, TSup) annotation (Line(points={{9,100},{0,100},{0,
            122},{110,122}},
                        color={0,0,127}));
    connect(spl3.port_2, senMasFloSup.port_a) annotation (Line(points={{20,60},{20,
            18},{80,18},{80,34}}, color={0,127,255}));
    connect(multiSum.y, PEle)
      annotation (Line(points={{87.02,260},{110,260}}, color={0,0,127}));
    connect(AWHP.PEle, multiSum.u[1]) annotation (Line(points={{-19,160},{-10,160},
            {-10,260},{74,260}},     color={0,0,127}));
    connect(AWHP.TSetSou, TSetASHP) annotation (Line(points={{-42,153},{-72,153},
            {-72,140},{-120,140}}, color={0,0,127}));
    connect(TES.SOC, SOC) annotation (Line(points={{-19,-2},{20,-2},{20,0},{110,0}},
          color={0,0,127}));
    connect(senTemRetSwe.T, TRetASHP) annotation (Line(points={{9,-248},{0,-248},
            {0,-240},{80,-240},{80,-220},{110,-220}}, color={0,0,127}));
    connect(AWHP.TSup, TASHP) annotation (Line(points={{-19,148},{26,148},{26,
            148},{110,148}},
                        color={0,0,127}));
    connect(senTemRetSwe.port_a, spl5.port_2)
      annotation (Line(points={{20,-238},{20,-130}}, color={0,127,255}));
    connect(AWHP.TDryBul, uTDryBul) annotation (Line(points={{-42,158.8},{-42,236.4},
            {-120,236.4},{-120,236}}, color={0,0,127}));
  end BaseCoolingVarCOP;

  package BaseClasses
    model ASHPCoolingBlackBox "Heat pump for cooling with variable COP"
      extends partialSourceCoo;
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
    end ASHPCoolingBlackBox;

    partial model partialSourceCoo
      "Base primary system with single source for cooling"
      replaceable package Medium = Buildings.Media.Water "Water media model";
      parameter Modelica.Units.SI.MassFlowRate mSou_flow_nominal
        "Nominal mass flow rate through source";
      parameter Modelica.Units.SI.Power Q_flow_nominal
        "Nominal thermal power of source";
      Buildings.Fluid.Movers.FlowControlled_m_flow pumSou(
        redeclare package Medium = Medium,
        m_flow_nominal=mSou_flow_nominal,
        addPowerToMedium=false,
        nominalValuesDefineDefaultPressureCurve=true,
        dp_nominal=0) "Pump serving source" annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={0,60})));
      Buildings.Fluid.Sensors.TemperatureTwoPort senTemSouSup(
        redeclare package Medium = Medium,
        m_flow_nominal=mSou_flow_nominal)
               "Temperature sensor for source supply water"
        annotation (Placement(transformation(extent={{20,-70},{40,-50}})));
      Buildings.Fluid.Sensors.TemperatureTwoPort senTemSouRet(
        redeclare package Medium = Medium,
        m_flow_nominal=mSou_flow_nominal)
               "Temperature sensor for source return water"
        annotation (Placement(transformation(extent={{20,50},{40,70}})));
      Modelica.Blocks.Interfaces.RealInput uPum
        "Control signal for pump serving source [0-1]"
        annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
      Modelica.Blocks.Math.Gain gai(k=mSou_flow_nominal)
        "Gain for control signal controlling source pump"
        annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
      Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
            Medium) "Fluid connector a (return to source)"
        annotation (Placement(transformation(extent={{90,50},{110,70}})));
      Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
            Medium) "Fluid connector b (supply from source)"
        annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
      Modelica.Blocks.Interfaces.RealOutput TSup
        "Temperature leaving the heating or cooling source"
        annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=1e-4) annotation (
          Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=0,
            origin={-90,60})));
      HeatPumps.BlackBox_Generic_TSetpoint blackBox_Generic_TSetpoint
        annotation (Placement(transformation(
            extent={{11,-13},{-11,13}},
            rotation=180,
            origin={-47,-7})));
      Buildings.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
        annotation (Placement(transformation(
            extent={{7,-7},{-7,7}},
            rotation=180,
            origin={-77,21})));
    equation
      connect(senTemSouRet.port_a, pumSou.port_a)
        annotation (Line(points={{20,60},{10,60}}, color={0,127,255}));
      connect(gai.y, pumSou.m_flow_in) annotation (Line(points={{-59,60},{-50,60},{
              -50,80},{0,80},{0,72},{8.88178e-16,72}},
                                                 color={0,0,127}));
      connect(port_a, senTemSouRet.port_b)
        annotation (Line(points={{100,60},{40,60}}, color={0,127,255}));
      connect(senTemSouSup.port_b, port_b)
        annotation (Line(points={{40,-60},{100,-60}}, color={0,127,255}));
      connect(senTemSouSup.T, TSup) annotation (Line(points={{30,-49},{30,-40},{80,
              -40},{80,-20},{110,-20}}, color={0,0,127}));
      connect(gai.u, limiter.y)
        annotation (Line(points={{-82,60},{-85.6,60}}, color={0,0,127}));
      connect(limiter.u, uPum)
        annotation (Line(points={{-94.8,60},{-120,60}}, color={0,0,127}));
      connect(senTemSouSup.port_a, blackBox_Generic_TSetpoint.port_b)
        annotation (Line(points={{20,-60},{-36,-60},{-36,-14.8}}, color={0,127,
              255}));
      connect(pumSou.port_b, blackBox_Generic_TSetpoint.port_a) annotation (
          Line(points={{-10,60},{-36,60},{-36,0.8}}, color={0,127,255}));
      connect(prescribedTemperature.port, blackBox_Generic_TSetpoint.heatPort)
        annotation (Line(points={{-70,21},{-48,21},{-48,6},{-47,6}}, color={191,
              0,0}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end partialSourceCoo;

    partial model partialPlant "A partial model for a plant implementation"
      replaceable package Medium = Buildings.Media.Water "Water media model";
      parameter Modelica.Units.SI.MassFlowRate m_flow_nominal
        "Nominal mass flowrate of plant";
      parameter Modelica.Units.SI.Power Q_flow_nominal
        "Nominal heating or cooling power of plant";
      Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
            Medium) "Fluid connector b (return)"
        annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
      Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
            Medium) "Fluid connector b (supply)"
        annotation (Placement(transformation(extent={{90,26},{110,46}}),
            iconTransformation(extent={{90,26},{110,46}})));
      Modelica.Blocks.Interfaces.RealOutput TSup(unit="K")
        "Temperature of supply water"
        annotation (Placement(transformation(extent={{100,112},{120,132}}),
            iconTransformation(extent={{100,112},{120,132}})));
      Buildings.Fluid.Sensors.TemperatureTwoPort senTemRet(
        redeclare package Medium = Medium,
        m_flow_nominal=m_flow_nominal)
               "Temperature sensor for return water" annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={40,-30})));
      Buildings.Fluid.Sensors.MassFlowRate senMasFloSup(redeclare package
          Medium =
            Medium) "Mass flow sensor for supply water" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={78,20})));
      Modelica.Blocks.Interfaces.RealOutput TRet(unit="K")
        "Temperature of return water from coil"
        annotation (Placement(transformation(extent={{100,54},{120,74}}),
            iconTransformation(extent={{100,54},{120,74}})));
    equation
      connect(senTemRet.port_a, port_a) annotation (Line(points={{50,-30},{80,-30},
              {80,-60},{100,-60}}, color={0,127,255}));
      connect(senMasFloSup.port_b, port_b)
        annotation (Line(points={{78,30},{88,30},{88,36},{100,36}},
                                                            color={0,127,255}));
      connect(TRet, senTemRet.T)
        annotation (Line(points={{110,64},{40,64},{40,-19}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-260},
                {100,260}})),                                        Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-260},{100,260}})));
    end partialPlant;
  end BaseClasses;

  package Controls
    model Plant_Controller
      Modelica.Blocks.Sources.Constant conTesCha(k=-0.5)
        "Control signal for TES charging"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-34,-66})));
      Modelica.Blocks.Math.RealToInteger intRea "Integer to real"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={82,-22})));
      Modelica.Blocks.Sources.CombiTimeTable SchTes(
        table=[casDat.chargeStartMornS,0; casDat.chargeEndMornS,2; casDat.dischargeStartS,
            1; casDat.dischargeEndS,2; casDat.chargeStartNightS,0; casDat.chargeEndNightS,
            0],
        smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
        extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
        "TES charging and discharging schedule"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={116,-18})));
      RTUPCM.HVAC.Plants.BaseClasses.Controller4
                                     C4Coo(
        TLimCha=casDat.TSolCoo - 1,
        deadbandCha=1,
        TLimDis=casDat.TLiqCoo + 1,
        deadbandDis=1,
        Cold=true) "Controller to enable charging and discharging"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={18,-10})));
      Modelica.Blocks.Logical.Switch swiTes "TES charging and discharging switch"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-62,10})));
                               hil_flexlab_model.Plants.Controls.Controller1Cooling_old
                                            C1Coo "C1 controller for cooling"
        annotation (Placement(transformation(extent={{10,-16},{-10,16}},
            rotation=0,
            origin={-24,74})));
      Modelica.Blocks.Interfaces.RealOutput yTES
        "Temperature of return water to ASHP" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-72,110})));
      Modelica.Blocks.Interfaces.RealInput uTSet
        "Control signal discharge limit for TES" annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={97,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={96,-116})));
      Modelica.Blocks.Interfaces.BooleanInput enaChi
        "Control signal discharge limit for TES" annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={33,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={0,-116})));
      Modelica.Blocks.Interfaces.RealInput uTMea
        "Supply temp feedback to controller"     annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={55,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={32,-116})));
      Modelica.Blocks.Interfaces.RealOutput yASHP
        "Temperature of return water to ASHP" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-48,110})));
      Modelica.Blocks.Interfaces.RealInput uTTes
        "TES temp feedback to controller" annotation (Placement(transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={77,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={64,-116})));
    equation
      connect(conTesCha.y,swiTes. u1) annotation (Line(points={{-45,-66},{4,-66},
              {4,18},{-50,18}},color={0,0,127}));
      connect(C4Coo.enaDis, C1Coo.enaTesDis) annotation (Line(points={{7,-14},{
              -6,-14},{-6,78},{-12,78}},    color={255,0,255}));
      connect(C4Coo.enaCha,swiTes. u2) annotation (Line(points={{7,-6},{8,-6},{
              8,10},{-50,10}}, color={255,0,255}));
      connect(C1Coo.yTesDis, swiTes.u3) annotation (Line(points={{-36,80},{-36,
              2},{-50,2}},     color={0,0,127}));
      connect(C4Coo.mode, intRea.y) annotation (Line(points={{30,-2},{60,-2},{
              60,-22},{71,-22}},
                         color={255,127,0}));
      connect(SchTes.y[1], intRea.u)
        annotation (Line(points={{105,-18},{94,-18},{94,-22}},
                                                      color={0,0,127}));
      connect(swiTes.y, yTES)
        annotation (Line(points={{-73,10},{-72,10},{-72,110}}, color={0,0,127}));
      connect(C1Coo.TSet, uTSet) annotation (Line(points={{-12,88},{96,88},{96,
              -115},{97,-115}},
                         color={0,0,127}));
      connect(C1Coo.enaCoo, enaChi) annotation (Line(points={{-12,58},{34,58},{
              34,-115},{33,-115}},
                          color={255,0,255}));
      connect(uTMea, C1Coo.TMea) annotation (Line(points={{55,-115},{55,-30.5},
              {-24,-30.5},{-24,56}},
                                color={0,0,127}));
      connect(C1Coo.enaASHP, enaChi) annotation (Line(points={{-12,70},{34,70},
              {34,-115},{33,-115}},color={255,0,255}));
      connect(C1Coo.yASHP, yASHP) annotation (Line(points={{-36,68},{-48,68},{
              -48,110}}, color={0,0,127}));
      connect(uTTes, C4Coo.Ttes) annotation (Line(points={{77,-115},{77,-62.5},
              {30,-62.5},{30,-10}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Plant_Controller;

    model Controller1Cooling "Controller 1 for cooling"
      parameter Modelica.Units.SI.DimensionlessRatio stage_tes_to_swec=1/3
        "PI signal at which to stage on Swec, if enabled";
      parameter Modelica.Units.SI.DimensionlessRatio stage_swec_to_ashp=2/3
        "PI signal at which to stage on ASHP, if enabled";
      Buildings.Controls.Continuous.LimPID conPI(
        controllerType=Modelica.Blocks.Types.SimpleController.PI,
        k=0.1,
        Ti=120,
        reset=Buildings.Types.Reset.Parameter,
        reverseActing=not (true)) "Feedback controller"
        annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
      Modelica.Blocks.Interfaces.RealInput TSet "Temperature setpoint"
        annotation (Placement(transformation(extent={{-140,120},{-100,160}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealOutput yTesDis
        "Control signal for TES discharging"
        annotation (Placement(transformation(extent={{100,40},{140,80}})));
      Modelica.Blocks.Interfaces.RealInput TMea "Measured temperature" annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-180})));
      Modelica.Blocks.Interfaces.RealInput uTesLim
        "Control signal discharge limit for TES"
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
      Modelica.Blocks.Logical.Switch swiTes "Switch for TES"
        annotation (Placement(transformation(extent={{66,22},{86,42}})));
      Modelica.Blocks.Interfaces.BooleanInput enaTesDis
        "Enable signal for TES discharge"
        annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
      Modelica.Blocks.Interfaces.BooleanInput enaCoo "Enable signal for cooling"
        annotation (Placement(transformation(extent={{-140,-180},{-100,-140}})));
      Modelica.Blocks.Logical.Not not1 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,-110})));
      Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol(trueHoldDuration=
            15*60) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,-140})));
    protected
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con0(final k=0)
        "Contant that outputs zero"
        annotation (Placement(transformation(extent={{-30,30},{-10,50}})));
      Buildings.Controls.OBC.CDL.Continuous.Line TES
        "Block to compute the setpoint for TES"
        annotation (Placement(transformation(extent={{30,30},{50,50}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con33(final k=
            stage_tes_to_swec)
        "Contant that outputs 1/3"
        annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant off(final k=0)
        "Contant that outputs zero"
        annotation (Placement(transformation(extent={{-20,140},{0,160}})));
    equation
      connect(conPI.u_s, TSet) annotation (Line(points={{-82,0},{-90,0},{-90,140},{
              -120,140}}, color={0,0,127}));
      connect(con0.y, TES.x1) annotation (Line(points={{-8,40},{-6,40},{-6,48},{28,
              48}}, color={0,0,127}));
      connect(con0.y, TES.f1) annotation (Line(points={{-8,40},{-6,40},{-6,44},{28,
              44}}, color={0,0,127}));
      connect(con33.y, TES.x2)
        annotation (Line(points={{-8,0},{0,0},{0,36},{28,36}}, color={0,0,127}));
      connect(conPI.y, TES.u) annotation (Line(points={{-59,0},{-50,0},{-50,20},
              {12,20},{12,40},{28,40}},
                                    color={0,0,127}));
      connect(conPI.u_m, TMea) annotation (Line(points={{-70,-12},{-70,-90},{0,-90},
              {0,-180}},       color={0,0,127}));
      connect(uTesLim, TES.f2) annotation (Line(points={{-120,80},{-50,80},{-50,102},
              {28,102},{28,32}}, color={0,0,127}));
      connect(TES.y, swiTes.u1)
        annotation (Line(points={{52,40},{64,40}}, color={0,0,127}));
      connect(swiTes.y, yTesDis) annotation (Line(points={{87,32},{90,32},{90,60},{
              120,60}}, color={0,0,127}));
      connect(off.y, swiTes.u3) annotation (Line(points={{2,150},{56,150},{56,24},{
              64,24}}, color={0,0,127}));
      connect(enaTesDis, swiTes.u2) annotation (Line(points={{-120,40},{-94,40},{-94,
              24},{52,24},{52,32},{64,32}}, color={255,0,255}));
      connect(truFalHol.y, not1.u)
        annotation (Line(points={{-80,-128},{-80,-122}}, color={255,0,255}));
      connect(truFalHol.u, enaCoo) annotation (Line(points={{-80,-152},{-80,-160},{
              -120,-160}}, color={255,0,255}));
      connect(not1.y, conPI.trigger) annotation (Line(points={{-80,-99},{-80,-20},{
              -78,-20},{-78,-12}}, color={255,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -160},{100,160}})), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-100,-160},{100,160}})));
    end Controller1Cooling;

    model Controller1Cooling_old "Controller 1 for cooling"
      parameter Modelica.Units.SI.DimensionlessRatio stage_tes_to_ashp=1/2
        "PI signal at which to stage on Swec, if enabled";
      Buildings.Controls.Continuous.LimPID conPI(
        controllerType=Modelica.Blocks.Types.SimpleController.PI,
        k=0.1,
        Ti=120,
        reset=Buildings.Types.Reset.Parameter) "Feedback controller"
        annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
      Modelica.Blocks.Interfaces.RealInput TSet "Temperature setpoint"
        annotation (Placement(transformation(extent={{-140,120},{-100,160}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealOutput yTesDis
        "Control signal for TES discharging"
        annotation (Placement(transformation(extent={{100,40},{140,80}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealOutput yASHP
        "Control signal for ASHP"
        annotation (Placement(transformation(extent={{100,-80},{140,-40}})));
      Modelica.Blocks.Interfaces.RealInput TMea "Measured temperature" annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-180})));
      Modelica.Blocks.Interfaces.RealInput uTesLim
        "Control signal discharge limit for TES"
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
      Modelica.Blocks.Logical.Switch swiTes "Switch for TES"
        annotation (Placement(transformation(extent={{66,22},{86,42}})));
      Modelica.Blocks.Logical.Switch swiASHP "Switch for ASHP"
        annotation (Placement(transformation(extent={{66,-58},{86,-38}})));
      Modelica.Blocks.Interfaces.BooleanInput enaTesDis
        "Enable signal for TES discharge"
        annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
      Modelica.Blocks.Interfaces.BooleanInput enaASHP "Enable signal for ASHP"
        annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
      Modelica.Blocks.Interfaces.BooleanInput enaCoo "Enable signal for cooling"
        annotation (Placement(transformation(extent={{-140,-180},{-100,-140}})));
      Modelica.Blocks.Logical.Not not1 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,-110})));
      Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol(trueHoldDuration=
            15*60) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,-140})));
      Modelica.Blocks.Logical.And and1
        annotation (Placement(transformation(extent={{20,-120},{40,-100}})));
    protected
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con0(final k=0)
        "Contant that outputs zero"
        annotation (Placement(transformation(extent={{-30,30},{-10,50}})));
      Buildings.Controls.OBC.CDL.Continuous.Line TES
        "Block to compute the setpoint for TES"
        annotation (Placement(transformation(extent={{30,30},{50,50}})));
    protected
      Buildings.Controls.OBC.CDL.Continuous.Line AWHP
        "Block to compute the setpoint for ASHP"
        annotation (Placement(transformation(extent={{30,-50},{50,-30}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con1(final k=1.0)
        "Contant that outputs 1.0"
        annotation (Placement(transformation(extent={{-30,-70},{-10,-50}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant on(final k=1)
        "Contant that outputs one"
        annotation (Placement(transformation(extent={{-30,60},{-10,80}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant off(final k=0)
        "Contant that outputs zero"
        annotation (Placement(transformation(extent={{-20,140},{0,160}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con50(final k=
            stage_tes_to_ashp)
        "Contant that outputs 1/2"
        annotation (Placement(transformation(extent={{-58,-40},{-38,-20}})));
    equation
      connect(conPI.u_s, TSet) annotation (Line(points={{-82,0},{-90,0},{-90,140},{
              -120,140}}, color={0,0,127}));
      connect(con0.y, TES.x1) annotation (Line(points={{-8,40},{-6,40},{-6,48},{28,
              48}}, color={0,0,127}));
      connect(con0.y, TES.f1) annotation (Line(points={{-8,40},{-6,40},{-6,44},{28,
              44}}, color={0,0,127}));
      connect(conPI.y, TES.u) annotation (Line(points={{-59,0},{-50,0},{-50,20},{12,
              20},{12,40},{28,40}}, color={0,0,127}));
      connect(on.y, AWHP.f2) annotation (Line(points={{-8,70},{10,70},{10,-48},{28,
              -48}}, color={0,0,127}));
      connect(AWHP.f1, TES.x1) annotation (Line(points={{28,-36},{-6,-36},{-6,48},{
              28,48}}, color={0,0,127}));
      connect(AWHP.u, TES.u) annotation (Line(points={{28,-40},{12,-40},{12,40},{28,
              40}}, color={0,0,127}));
      connect(AWHP.x2, con1.y) annotation (Line(points={{28,-44},{0,-44},{0,-60},{
              -8,-60}}, color={0,0,127}));
      connect(conPI.u_m, TMea) annotation (Line(points={{-70,-12},{-70,-90},{0,-90},
              {0,-180}},       color={0,0,127}));
      connect(uTesLim, TES.f2) annotation (Line(points={{-120,80},{-50,80},{-50,102},
              {28,102},{28,32}}, color={0,0,127}));
      connect(TES.y, swiTes.u1)
        annotation (Line(points={{52,40},{64,40}}, color={0,0,127}));
      connect(swiTes.y, yTesDis) annotation (Line(points={{87,32},{90,32},{90,60},{
              120,60}}, color={0,0,127}));
      connect(swiASHP.u1, AWHP.y)
        annotation (Line(points={{64,-40},{52,-40}}, color={0,0,127}));
      connect(swiASHP.y, yASHP) annotation (Line(points={{87,-48},{90,-48},{90,-60},
              {120,-60}}, color={0,0,127}));
      connect(off.y, swiTes.u3) annotation (Line(points={{2,150},{56,150},{56,24},{
              64,24}}, color={0,0,127}));
      connect(swiASHP.u3, swiTes.u3) annotation (Line(points={{64,-56},{56,-56},{56,
              24},{64,24}}, color={0,0,127}));
      connect(enaTesDis, swiTes.u2) annotation (Line(points={{-120,40},{-94,40},{-94,
              24},{52,24},{52,32},{64,32}}, color={255,0,255}));
      connect(truFalHol.y, not1.u)
        annotation (Line(points={{-80,-128},{-80,-122}}, color={255,0,255}));
      connect(truFalHol.u, enaCoo) annotation (Line(points={{-80,-152},{-80,-160},{
              -120,-160}}, color={255,0,255}));
      connect(not1.y, conPI.trigger) annotation (Line(points={{-80,-99},{-80,-20},{
              -78,-20},{-78,-12}}, color={255,0,255}));
      connect(and1.u2, enaCoo) annotation (Line(points={{18,-118},{-40,-118},{-40,
              -160},{-120,-160}}, color={255,0,255}));
      connect(and1.u1, enaASHP) annotation (Line(points={{18,-110},{-40,-110},{-40,
              -80},{-92,-80},{-92,-40},{-120,-40}},
                                               color={255,0,255}));
      connect(and1.y, swiASHP.u2) annotation (Line(points={{41,-110},{58,-110},{58,
              -48},{64,-48}}, color={255,0,255}));
      connect(AWHP.x1, con50.y) annotation (Line(points={{28,-32},{-6,-32},{-6,
              -30},{-36,-30}}, color={0,0,127}));
      connect(con50.y, TES.x2) annotation (Line(points={{-36,-30},{-6,-30},{-6,
              36},{28,36}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -160},{100,160}})), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-100,-160},{100,160}})));
    end Controller1Cooling_old;

    model Controller4 "Controller 4"
      parameter Modelica.Units.SI.Temperature TLimCha "Limit for charging";
      parameter Modelica.Units.SI.TemperatureDifference deadbandCha
        "Hysteresis deadband for TLimCha";
      parameter Modelica.Units.SI.Temperature TLimDis "Limit for discharging";
      parameter Modelica.Units.SI.TemperatureDifference deadbandDis
        "Hysteresis deadband for TLimDis";
      parameter Boolean Cold "True for cooling pcm, False for heating pcm";
      Modelica.Blocks.Logical.Hysteresis hysCha(
        uLow=TLimCha - deadbandCha,
        uHigh=TLimCha + deadbandCha,
        pre_y_start=true) "Hysteresis for charging"
        annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
      Modelica.Blocks.Interfaces.RealInput Ttes
        "Temperature of thermal energy storage"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Logical.LogicalSwitch swiCha
        "Switch for charging hot or cold pcm"
        annotation (Placement(transformation(extent={{20,20},{40,40}})));
      Modelica.Blocks.Sources.BooleanConstant conCold(k=Cold)
        "Constant for Cold parameter"
        annotation (Placement(transformation(extent={{-82,-30},{-62,-10}})));
      Modelica.Blocks.Logical.Not notColdCha "Not cold for charging"
        annotation (Placement(transformation(extent={{-10,0},{10,20}})));
      Modelica.Blocks.Interfaces.BooleanOutput enaCha "Enable pcm charging"
        annotation (Placement(transformation(extent={{100,30},{120,50}})));
      Modelica.Blocks.Logical.Hysteresis hysDis(
        uLow=TLimDis - deadbandDis,
        uHigh=TLimDis + deadbandDis,
        pre_y_start=true) "Hysteresis for discharging"
        annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
      Modelica.Blocks.Logical.LogicalSwitch swiCha1
        "Switch for charging hot or cold pcm"
        annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
      Modelica.Blocks.Logical.Not notColdDis "Not cold for discharging"
        annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
      Modelica.Blocks.Interfaces.BooleanOutput enaDis "Enable pcm discharging"
        annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
      Modelica.Blocks.Interfaces.IntegerInput mode
        "Current mode (0 = charging, 1 = discharging, 2 = off)"
        annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
      Modelica.Blocks.Math.IntegerToReal intRea "Integer to real"
        annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
      Modelica.Blocks.Logical.LessEqualThreshold detCha
        "Detect if charging mode, otherwise discharging mode"
        annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
      Modelica.Blocks.Logical.And andCha "And for charging mode"
        annotation (Placement(transformation(extent={{60,40},{80,60}})));
      Modelica.Blocks.Logical.And andDis "And for discharging mode"
        annotation (Placement(transformation(extent={{60,-100},{80,-80}})));
      Modelica.Blocks.Logical.Not notCha "Not for charging" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={50,-30})));
      Modelica.Blocks.Logical.GreaterEqualThreshold detOff(threshold=2)
        "Detect if off mode"
        annotation (Placement(transformation(extent={{-40,80},{-20,100}})));
      Modelica.Blocks.Logical.And andCha1
                                         "And for charging mode"
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Modelica.Blocks.Logical.And andDis2 "And for discharging mode"
        annotation (Placement(transformation(extent={{80,-20},{100,0}})));
      Modelica.Blocks.Logical.Not notOff "Not for turning off"
        annotation (Placement(transformation(extent={{20,80},{40,100}})));
    equation
      connect(Ttes, hysCha.u)
        annotation (Line(points={{-120,0},{-90,0},{-90,30},{-62,30}},
                                                    color={0,0,127}));
      connect(conCold.y, swiCha.u2) annotation (Line(points={{-61,-20},{-20,-20},{
              -20,30},{18,30}},
                    color={255,0,255}));
      connect(hysCha.y, swiCha.u1) annotation (Line(points={{-39,30},{-28,30},{-28,
              38},{18,38}},
                        color={255,0,255}));
      connect(hysCha.y, notColdCha.u) annotation (Line(points={{-39,30},{-28,30},{
              -28,10},{-12,10}},
                           color={255,0,255}));
      connect(notColdCha.y, swiCha.u3) annotation (Line(points={{11,10},{14,10},{14,
              22},{18,22}}, color={255,0,255}));
      connect(Ttes, hysDis.u) annotation (Line(points={{-120,0},{-90,0},{-90,-70},{
              -62,-70}},
                     color={0,0,127}));
      connect(conCold.y, swiCha1.u2) annotation (Line(points={{-61,-20},{-20,-20},{
              -20,-70},{18,-70}},
                         color={255,0,255}));
      connect(hysDis.y, notColdDis.u) annotation (Line(points={{-39,-70},{-26,-70},
              {-26,-50},{-12,-50}},
                             color={255,0,255}));
      connect(notColdDis.y, swiCha1.u1) annotation (Line(points={{11,-50},{14,-50},
              {14,-62},{18,-62}},color={255,0,255}));
      connect(hysDis.y, swiCha1.u3) annotation (Line(points={{-39,-70},{-26,-70},{
              -26,-78},{18,-78}},
                              color={255,0,255}));
      connect(mode, intRea.u)
        annotation (Line(points={{-120,80},{-90,80},{-90,60},{-82,60}},
                                                      color={255,127,0}));
      connect(intRea.y, detCha.u)
        annotation (Line(points={{-59,60},{-42,60}}, color={0,0,127}));
      connect(swiCha1.y, andDis.u2) annotation (Line(points={{41,-70},{46,-70},{46,
              -98},{58,-98}}, color={255,0,255}));
      connect(swiCha.y, andCha.u2) annotation (Line(points={{41,30},{46,30},{46,42},
              {58,42}}, color={255,0,255}));
      connect(detCha.y, andCha.u1) annotation (Line(points={{-19,60},{50,60},{50,50},
              {58,50}}, color={255,0,255}));
      connect(detCha.y, notCha.u)
        annotation (Line(points={{-19,60},{50,60},{50,-18}},
                                                           color={255,0,255}));
      connect(notCha.y, andDis.u1)
        annotation (Line(points={{50,-41},{50,-90},{58,-90}}, color={255,0,255}));
      connect(intRea.y, detOff.u) annotation (Line(points={{-59,60},{-50,60},{-50,
              90},{-42,90}}, color={0,0,127}));
      connect(andCha.y, andCha1.u2) annotation (Line(points={{81,50},{90,50},{90,70},
              {70,70},{70,82},{78,82}}, color={255,0,255}));
      connect(andCha1.y, enaCha)
        annotation (Line(points={{101,90},{110,90},{110,40}}, color={255,0,255}));
      connect(andDis.y, andDis2.u2) annotation (Line(points={{81,-90},{88,-90},{88,
              -68},{68,-68},{68,-18},{78,-18}}, color={255,0,255}));
      connect(detOff.y, notOff.u)
        annotation (Line(points={{-19,90},{18,90}}, color={255,0,255}));
      connect(notOff.y, andCha1.u1)
        annotation (Line(points={{41,90},{78,90}}, color={255,0,255}));
      connect(notOff.y, andDis2.u1) annotation (Line(points={{41,90},{52,90},{52,
              -10},{78,-10}}, color={255,0,255}));
      connect(andDis2.y, enaDis) annotation (Line(points={{101,-10},{110,-10},{110,
              -40}}, color={255,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Controller4;

    block Controller_modifyHeatingSequence "Controller for room VAV box"

      parameter Real samplePeriod(
        final unit="s",
        final quantity="Time")
        "Sample period of component, set to the same value as the trim and respond that process yPreSetReq";
      parameter Real V_flow_nominal(
        final unit="m3/s",
        final quantity="VolumeFlowRate")
        "Volume flow rate of this thermal zone";
      parameter Real AFlo(
        final unit="m2",
        final quantity="Area") "Area of the zone";

      parameter Buildings.Controls.OBC.CDL.Types.SimpleController controllerTypeCoo=
         Buildings.Controls.OBC.CDL.Types.SimpleController.PI "Type of controller"
        annotation (Dialog(group="Cooling loop signal"));

      parameter Real kCoo(final unit="1/K") = 0.1
        "Gain for cooling control loop signal"
        annotation(Dialog(group="Cooling loop signal"));

      parameter Real TiCoo(
        final unit="s",
        final quantity="Time")=900
        "Time constant of integrator block for cooling control loop signal"
        annotation(Dialog(group="Cooling loop signal",
          enable=controllerTypeCoo == Buildings.Controls.OBC.CDL.Types.SimpleController.PI
              or controllerTypeCoo == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));

      parameter Real TdCoo(
        final unit="s",
        final quantity="Time")=0.1
        "Time constant of derivative block for cooling control loop signal"
        annotation (Dialog(group="Cooling loop signal",
          enable=controllerTypeCoo == Buildings.Controls.OBC.CDL.Types.SimpleController.PD
              or controllerTypeCoo == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));

      parameter Buildings.Controls.OBC.CDL.Types.SimpleController controllerTypeHea=
        Buildings.Controls.OBC.CDL.Types.SimpleController.PI
        "Type of controller"
        annotation(Dialog(group="Heating loop signal"));
      parameter Real kHea(final unit="1/K")=0.1
        "Gain for heating control loop signal"
        annotation(Dialog(group="Heating loop signal"));

      parameter Real TiHea(
        final unit="s",
        final quantity="Time")=900
        "Time constant of integrator block for heating control loop signal"
        annotation(Dialog(group="Heating loop signal",
        enable=controllerTypeHea == Buildings.Controls.OBC.CDL.Types.SimpleController.PI
            or controllerTypeHea == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));

      parameter Real TdHea(
        final unit="s",
        final quantity="Time")=0.1
        "Time constant of derivative block for heating control loop signal"
        annotation (Dialog(group="Heating loop signal",
          enable=controllerTypeHea == Buildings.Controls.OBC.CDL.Types.SimpleController.PD
              or controllerTypeHea == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));

      parameter Buildings.Controls.OBC.CDL.Types.SimpleController controllerTypeVal=
        Buildings.Controls.OBC.CDL.Types.SimpleController.PI
        "Type of controller"
        annotation (Dialog(group="Valve"));

      parameter Real kVal=0.5
        "Gain of controller for valve control"
        annotation (Dialog(group="Valve"));

      parameter Real TiVal(
        final unit="s",
        final quantity="Time")=300
        "Time constant of integrator block for valve control"
        annotation(Dialog(group="Valve",
        enable=controllerTypeVal == Buildings.Controls.OBC.CDL.Types.SimpleController.PI
            or controllerTypeVal == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));

      parameter Real TdVal(
        final unit="s",
        final quantity="Time")=0.1
        "Time constant of derivative block for valve control"
        annotation (Dialog(group="Valve",
          enable=controllerTypeVal == Buildings.Controls.OBC.CDL.Types.SimpleController.PD
              or controllerTypeVal == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));

      parameter Buildings.Controls.OBC.CDL.Types.SimpleController controllerTypeDam=
        Buildings.Controls.OBC.CDL.Types.SimpleController.PI
        "Type of controller"
        annotation (Dialog(group="Damper"));

      parameter Real kDam(final unit="1")=0.5
        "Gain of controller for damper control"
        annotation (Dialog(group="Damper"));

      parameter Real TiDam(
        final unit="s",
        final quantity="Time")=300
        "Time constant of integrator block for damper control"
        annotation (Dialog(group="Damper",
          enable=controllerTypeDam == Buildings.Controls.OBC.CDL.Types.SimpleController.PI
              or controllerTypeDam == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));

      parameter Real TdDam(
        final unit="s",
        final quantity="Time")=0.1
        "Time constant of derivative block for damper control"
        annotation (Dialog(group="Damper",
          enable=controllerTypeDam == Buildings.Controls.OBC.CDL.Types.SimpleController.PD
              or controllerTypeDam == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));

      parameter Boolean have_occSen=false
        "Set to true if the zone has occupancy sensor"
        annotation (Dialog(tab="Airflow setpoint", group="Zone sensors"));
      parameter Boolean have_winSen=false
        "Set to true if the zone has window status sensor"
        annotation (Dialog(tab="Airflow setpoint", group="Zone sensors"));
      parameter Boolean have_CO2Sen=false
        "Set to true if the zone has CO2 sensor"
        annotation (Dialog(tab="Airflow setpoint", group="Zone sensors"));
      parameter Real VDisCooSetMax_flow(
        final unit="m3/s",
        final quantity="VolumeFlowRate")=V_flow_nominal
        "Zone maximum cooling airflow setpoint"
        annotation (Dialog(tab="Airflow setpoint", group="Nominal conditions"));
      parameter Real VDisSetMin_flow(
        final unit="m3/s",
        final quantity="VolumeFlowRate")=0.15*V_flow_nominal
        "Zone minimum airflow setpoint"
        annotation (Dialog(tab="Airflow setpoint", group="Nominal conditions"));
      parameter Real VDisHeaSetMax_flow(
        final unit="m3/s",
        final quantity="VolumeFlowRate")=V_flow_nominal
        "Zone maximum heating airflow setpoint"
        annotation (Dialog(tab="Airflow setpoint", group="Nominal conditions"));
      parameter Real VDisConMin_flow(
        final unit="m3/s",
        final quantity="VolumeFlowRate")=0.1*V_flow_nominal
        "VAV box controllable minimum"
        annotation (Dialog(tab="Airflow setpoint", group="Nominal conditions"));
      parameter Real VOutPerAre_flow(final unit = "m3/(s.m2)")=3e-4
        "Outdoor air rate per unit area"
        annotation (Dialog(tab="Airflow setpoint", group="Nominal conditions"));
      parameter Real VOutPerPer_flow(
        final unit="m3/s",
        final quantity="VolumeFlowRate")=2.5e-3
        "Outdoor air rate per person"
        annotation (Dialog(tab="Airflow setpoint", group="Nominal conditions"));
      parameter Real CO2Set=894 "CO2 setpoint in ppm"
        annotation (Dialog(tab="Airflow setpoint", group="Nominal conditions"));
      parameter Real dTDisZonSetMax(
        final unit="K",
        final displayUnit="K",
        final quantity="TemperatureDifference")=11
        "Zone maximum discharge air temperature above heating setpoint"
        annotation (Dialog(tab="Damper and valve", group="Parameters"));
      parameter Real TDisMin(
        final unit="K",
        final displayUnit="degC",
        final quantity="ThermodynamicTemperature")=283.15
        "Lowest discharge air temperature"
        annotation (Dialog(tab="Damper and valve", group="Parameters"));
      parameter Boolean have_heaWatCoi=true
        "Flag, true if there is a hot water coil"
        annotation (Dialog(tab="System requests", group="Parameters"));
      parameter Boolean have_heaPla=false
        "Flag, true if there is a boiler plant"
        annotation (Dialog(tab="System requests", group="Parameters"));
      parameter Real errTZonCoo_1(
        final unit="K",
        final displayUnit="K",
        final quantity="TemperatureDifference")=2.8
        "Limit value of difference between zone temperature and cooling setpoint
    for generating 3 cooling SAT reset requests"
        annotation (Dialog(tab="System requests", group="Parameters"));
      parameter Real errTZonCoo_2(
        final unit="K",
        final displayUnit="K",
        final quantity="TemperatureDifference")=1.7
        "Limit value of difference between zone temperature and cooling setpoint
    for generating 2 cooling SAT reset requests"
        annotation (Dialog(tab="System requests", group="Parameters"));
      parameter Real errTDis_1(
        final unit="K",
        final displayUnit="K",
        final quantity="TemperatureDifference")=17
        "Limit value of difference between discharge air temperature and its setpoint
    for generating 3 hot water reset requests"
        annotation (Dialog(tab="System requests", group="Parameters"));
      parameter Real errTDis_2(
        final unit="K",
        final displayUnit="K",
        final quantity="TemperatureDifference")=8.3
        "Limit value of difference between discharge air temperature and its setpoint
    for generating 2 hot water reset requests"
        annotation (Dialog(tab="System requests", group="Parameters"));
      parameter Real durTimTem(
        final unit="s",
        final quantity="Time")=120
        "Duration time of zone temperature exceeds setpoint"
        annotation (Dialog(tab="System requests", group="Duration times"));
      parameter Real durTimFlo(
        final unit="s",
        final quantity="Time")=60
        "Duration time of airflow rate less than setpoint"
        annotation (Dialog(tab="System requests", group="Duration times"));
      parameter Real durTimDisAir(
        final unit="s",
        final quantity="Time")=300
        "Duration time of discharge air temperature is less than setpoint"
        annotation (Dialog(tab="System requests", group="Duration times"));

      Buildings.Controls.OBC.CDL.Interfaces.RealInput TZonHeaSet(
        final quantity="ThermodynamicTemperature",
        final unit = "K",
        final displayUnit = "degC")
        "Setpoint temperature for room for heating"
        annotation (Placement(transformation(extent={{-180,140},{-140,180}}),
            iconTransformation(extent={{-140,80},{-100,120}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput TZonCooSet(
        final quantity="ThermodynamicTemperature",
        final unit = "K",
        final displayUnit = "degC")
        "Setpoint temperature for room for cooling"
        annotation (Placement(transformation(extent={{-180,100},{-140,140}}),
            iconTransformation(extent={{-140,60},{-100,100}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput TZon(
        final quantity="ThermodynamicTemperature",
        final unit = "K",
        final displayUnit = "degC")
        "Measured room temperature"
        annotation (Placement(transformation(extent={{-180,-34},{-140,6}}),
            iconTransformation(extent={{-140,-20},{-100,20}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput TDis(
        final quantity="ThermodynamicTemperature",
        final unit = "K",
        final displayUnit = "degC")
        "Measured supply air temperature after heating coil"
        annotation (Placement(transformation(extent={{-180,-130},{-140,-90}}),
            iconTransformation(extent={{-140,-80},{-100,-40}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput VDis_flow(
        final unit="m3/s",
        final quantity="VolumeFlowRate")
        "Measured discharge airflow rate"
        annotation (Placement(transformation(extent={{-180,-70},{-140,-30}}),
            iconTransformation(extent={{-140,-40},{-100,0}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput TSupAHU(
        final quantity="ThermodynamicTemperature",
        final unit = "K",
        final displayUnit = "degC")
        "AHU supply air temperature"
        annotation (Placement(transformation(extent={{-180,-160},{-140,-120}}),
            iconTransformation(extent={{-140,-100},{-100,-60}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput ppmCO2 if have_CO2Sen
        "Measured CO2 concentration"
        annotation (Placement(transformation(extent={{-180,60},{-140,100}}),
            iconTransformation(extent={{-140,40},{-100,80}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput nOcc if have_occSen
        "Number of occupants"
        annotation (Placement(transformation(extent={{-180,30},{-140,70}}),
            iconTransformation(extent={{-140,20},{-100,60}})));
      Buildings.Controls.OBC.CDL.Interfaces.BooleanInput uWin if have_winSen
        "Window status, true if open, false if closed"
        annotation (Placement(transformation(extent={{-180,0},{-140,40}}),
            iconTransformation(extent={{-140,0},{-100,40}})));
      Buildings.Controls.OBC.CDL.Interfaces.IntegerInput uOpeMod
        "Zone operation mode"
        annotation (Placement(transformation(extent={{-180,-190},{-140,-150}}),
            iconTransformation(extent={{-140,-120},{-100,-80}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput yDam_actual
        "Actual VAV damper position"
        annotation (Placement(transformation(extent={{-180,-100},{-140,-60}}),
            iconTransformation(extent={{-140,-60},{-100,-20}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealOutput yVal(
        final min=0,
        final max=1,
        final unit="1")
        "Signal for heating coil valve"
        annotation (Placement(transformation(extent={{140,-40},{180,0}}),
            iconTransformation(extent={{100,-10},{140,30}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealOutput yDam(
        final min=0,
        final max=1,
        final unit="1")
        "Signal for VAV damper"
        annotation (Placement(transformation(extent={{140,60},{180,100}}),
            iconTransformation(extent={{100,40},{140,80}})));
      Buildings.Controls.OBC.CDL.Interfaces.IntegerOutput yZonTemResReq
        "Zone cooling supply air temperature reset request"
        annotation (Placement(transformation(extent={{140,-100},{180,-60}}),
            iconTransformation(extent={{100,-60},{140,-20}})));
      Buildings.Controls.OBC.CDL.Interfaces.IntegerOutput yZonPreResReq
        "Zone static pressure reset requests"
        annotation (Placement(transformation(extent={{140,-140},{180,-100}}),
            iconTransformation(extent={{100,-100},{140,-60}})));

      Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.SetPoints.ActiveAirFlow
        actAirSet(
        final AFlo=AFlo,
        final have_occSen=have_occSen,
        final have_winSen=have_winSen,
        final have_CO2Sen=have_CO2Sen,
        final VDisCooSetMax_flow=VDisCooSetMax_flow,
        final VDisSetMin_flow=VDisSetMin_flow,
        final VDisHeaSetMax_flow=VDisHeaSetMax_flow,
        final VDisConMin_flow=VDisConMin_flow,
        final VOutPerAre_flow=VOutPerAre_flow,
        final VOutPerPer_flow=VOutPerPer_flow,
        final CO2Set=CO2Set)
        "Active airflow rate setpoint"
        annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
      hil_flexlab_model.BaseClasses.DamperValvesTest_modifyHeatingSequence
        damVal(
        final controllerTypeVal=controllerTypeVal,
        final kVal=kVal,
        final TiVal=TiVal,
        final TdVal=TdVal,
        final controllerTypeDam=controllerTypeDam,
        final kDam=kDam,
        final TiDam=TiDam,
        final TdDam=TdDam,
        final dTDisZonSetMax=dTDisZonSetMax,
        final TDisMin=TDisMin,
        V_flow_nominal=max(VDisCooSetMax_flow, VDisHeaSetMax_flow))
        "Damper and valve controller"
        annotation (Placement(transformation(extent={{20,-20},{40,0}})));
      Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.SystemRequests sysReq(
        final samplePeriod=samplePeriod,
        final have_heaWatCoi=have_heaWatCoi,
        final have_heaPla=have_heaPla,
        final errTZonCoo_1=errTZonCoo_1,
        final errTZonCoo_2=errTZonCoo_2,
        final errTDis_1=errTDis_1,
        final errTDis_2=errTDis_2,
        final durTimTem=durTimTem,
        final durTimFlo=durTimFlo,
        final durTimDisAir=durTimDisAir)
        "Number of system requests"
        annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
      Buildings.Controls.Continuous.LimPID         conHeaLoo(
        final controllerType=controllerTypeHea,
        final k=kHea,
        final Ti=TiHea,
        final Td=TdHea,
        final yMax=1,
        final yMin=0,
        reset=Buildings.Types.Reset.Parameter)                  "Heating loop signal"
        annotation (Placement(transformation(extent={{-110,150},{-90,170}})));
      Buildings.Controls.Continuous.LimPID         conCooLoo(
        final controllerType=controllerTypeCoo,
        final k=kCoo,
        final Ti=TiCoo,
        final Td=TdCoo,
        final yMax=1,
        final yMin=0,
        reverseActing=false,
        reset=Buildings.Types.Reset.Parameter)                  "Cooling loop signal"
        annotation (Placement(transformation(extent={{-110,110},{-90,130}})));

    protected
      Buildings.Controls.OBC.CDL.Integers.Equal isUnOcc
        "Output true if unoccupied"
        annotation (Placement(transformation(extent={{-18,-160},{2,-140}})));
      Buildings.Controls.OBC.CDL.Integers.Sources.Constant conIntUn(
        final k=Buildings.Controls.OBC.ASHRAE.G36_PR1.Types.OperationModes.unoccupied)
        "Constant signal for unoccupied mode"
        annotation (Placement(transformation(extent={{-60,-160},{-40,-140}})));
      Buildings.Controls.OBC.CDL.Logical.Not isNotUn
      "Output true if not unoccupied"
        annotation (Placement(transformation(extent={{20,-160},{40,-140}})));

    equation
      connect(sysReq.TZonCooSet, TZonCooSet)
        annotation (Line(points={{78,-82},{-120,-82},{-120,120},{-160,120}},
          color={0,0,127}));
      connect(sysReq.TZon, TZon)
        annotation (Line(points={{78,-84},{0,-84},{0,-14},{-160,-14}},
          color={0,0,127}));
      connect(sysReq.VDisSet_flow, damVal.VDisSet_flow)
        annotation (Line(points={{78,-88},{64,-88},{64,-2},{42,-2}},
          color={0,0,127}));
      connect(sysReq.VDis_flow, VDis_flow)
        annotation (Line(points={{78,-90},{34,-90},{34,-50},{-160,-50}},
          color={0,0,127}));
      connect(sysReq.TDisHeaSet, damVal.TDisHeaSet)
        annotation (Line(points={{78,-94},{58,-94},{58,-18},{42,-18}},
          color={0,0,127}));
      connect(damVal.yDam, yDam)
        annotation (Line(points={{42,-6},{120,-6},{120,80},{160,80}},
          color={0,0,127}));
      connect(damVal.yHeaVal, yVal)
        annotation (Line(points={{42,-14},{120,-14},{120,-20},{160,-20}},
          color={0,0,127}));
      connect(damVal.VDis_flow, VDis_flow)
        annotation (Line(points={{34,-22},{34,-50},{-160,-50}},color={0,0,127}));
      connect(damVal.TDis, TDis)
        annotation (Line(points={{26,-22},{26,-110},{-160,-110}},
                                                               color={0,0,127}));
      connect(sysReq.TDis, TDis)
        annotation (Line(points={{78,-96},{26,-96},{26,-110},{-160,-110}},
          color={0,0,127}));
      connect(damVal.yHeaVal, sysReq.uHeaVal)
        annotation (Line(points={{42,-14},{50,-14},{50,-98},{78,-98}},
                                                                 color={0,0,127}));
      connect(TZon, damVal.TZon) annotation (Line(points={{-160,-14},{18,-14}},
                       color={0,0,127}));
      connect(damVal.TSup, TSupAHU) annotation (Line(points={{18,-8},{-80,-8},{-80,-140},
              {-160,-140}},color={0,0,127}));
      connect(actAirSet.VActCooMax_flow, damVal.VActCooMax_flow) annotation (Line(points={{-18,78},
              {0,78},{0,-4},{18,-4}},      color={0,0,127}));
      connect(actAirSet.VActCooMin_flow, damVal.VActCooMin_flow) annotation (Line(points={{-18,75},
              {-2,75},{-2,-2},{18,-2}},      color={0,0,127}));
      connect(actAirSet.VActMin_flow, damVal.VActMin_flow) annotation (Line(points={{-18,72},
              {-4,72},{-4,-6},{18,-6}}, color={0,0,127}));
      connect(actAirSet.VActHeaMin_flow, damVal.VActHeaMin_flow) annotation (Line(points={{-18,69},
              {-6,69},{-6,-16},{18,-16}},  color={0,0,127}));
      connect(actAirSet.VActHeaMax_flow, damVal.VActHeaMax_flow) annotation (Line(points={{-18,66},
              {-8,66},{-8,-18},{18,-18}},  color={0,0,127}));
      connect(damVal.THeaSet, TZonHeaSet)
        annotation (Line(points={{18,-10},{-124,-10},{-124,160},{-160,160}},
          color={0,0,127}));
      connect(actAirSet.VActCooMax_flow, damVal.VActCooMax_flow)
        annotation (Line(points={{-18,78},{0,78},{0,-4},{18,-4}},
          color={0,0,127}));
      connect(actAirSet.VActCooMin_flow, damVal.VActCooMin_flow)
        annotation (Line(points={{-18,75},{-2,75},{-2,-2},{18,-2}},
          color={0,0,127}));
      connect(actAirSet.VActMin_flow, damVal.VActMin_flow)
        annotation (Line(points={{-18,72},{-4,72},{-4,-6},{18,-6}},
          color={0,0,127}));
      connect(actAirSet.VActHeaMin_flow, damVal.VActHeaMin_flow)
        annotation (Line(points={{-18,69},{-6,69},{-6,-16},{18,-16}},
          color={0,0,127}));
      connect(actAirSet.VActHeaMax_flow, damVal.VActHeaMax_flow)
        annotation (Line(points={{-18,66},{-8,66},{-8,-18},{18,-18}},
          color={0,0,127}));
      connect(actAirSet.uOpeMod, uOpeMod)
        annotation (Line(points={{-42,78},{-112,78},{-112,-170},{-160,-170}},
          color={255,127,0}));
      connect(sysReq.yZonTemResReq, yZonTemResReq)
        annotation (Line(points={{102,-83},{120,-83},{120,-80},{160,-80}},
          color={255,127,0}));
      connect(sysReq.yZonPreResReq, yZonPreResReq)
        annotation (Line(points={{102,-88},{120,-88},{120,-120},{160,-120}},
          color={255,127,0}));
      connect(actAirSet.ppmCO2, ppmCO2)
        annotation (Line(points={{-42,74},{-60,74},{-60,80},{-160,80}},
          color={0,0,127}));
      connect(actAirSet.nOcc, nOcc)
        annotation (Line(points={{-42,66},{-60,66},{-60,50},{-160,50}},
          color={0,0,127}));
      connect(actAirSet.uWin, uWin)
        annotation (Line(points={{-42,62},{-56,62},{-56,20},{-160,20}},
          color={255,0,255}));
      connect(TZonHeaSet, conHeaLoo.u_s)
        annotation (Line(points={{-160,160},{-112,160}}, color={0,0,127}));
      connect(TZonCooSet, conCooLoo.u_s)
        annotation (Line(points={{-160,120},{-112,120}}, color={0,0,127}));
      connect(TZon, conHeaLoo.u_m)
        annotation (Line(points={{-160,-14},{-122,-14},{-122,140},{-100,140},{-100,148}},
                       color={0,0,127}));
      connect(TZon, conCooLoo.u_m)
        annotation (Line(points={{-160,-14},{-122,-14},{-122,100},{-100,100},{-100,108}},
                       color={0,0,127}));
      connect(conCooLoo.y, damVal.uCoo)
        annotation (Line(points={{-89,120},{8,120},{8,0},{18,0}},
          color={0,0,127}));
      connect(conHeaLoo.y, damVal.uHea)
        annotation (Line(points={{-89,160},{12,160},{12,-12},{18,-12}},
          color={0,0,127}));
      connect(conCooLoo.y, sysReq.uCoo)
        annotation (Line(points={{-89,120},{8,120},{8,-86},{78,-86}},
          color={0,0,127}));
      connect(damVal.uOpeMod, uOpeMod) annotation (Line(points={{18,-20},{-112,-20},
              {-112,-170},{-160,-170}},
                                      color={255,127,0}));
      connect(conIntUn.y, isUnOcc.u1)
        annotation (Line(points={{-38,-150},{-20,-150}}, color={255,127,0}));
      connect(uOpeMod, isUnOcc.u2) annotation (Line(points={{-160,-170},{-32,-170},{
              -32,-158},{-20,-158}}, color={255,127,0}));
      connect(isUnOcc.y, isNotUn.u)
        annotation (Line(points={{4,-150},{18,-150}},   color={255,0,255}));
      connect(isNotUn.y, conCooLoo.trigger) annotation (Line(points={{42,-150},{60,
              -150},{60,-120},{-116,-120},{-116,104},{-108,104},{-108,108}},
                                                                       color={255,0,
              255}));
      connect(isNotUn.y, conHeaLoo.trigger) annotation (Line(points={{42,-150},{60,
              -150},{60,-120},{-116,-120},{-116,142},{-108,142},{-108,148}},
                                                                       color={255,0,
              255}));
      connect(sysReq.yDam_actual,yDam_actual)  annotation (Line(points={{78,-92},{-124,
              -92},{-124,-80},{-160,-80}}, color={0,0,127}));

    annotation (defaultComponentName="terUniCon",
      Icon(graphics={Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,-54},{-78,-64}},
              lineColor={0,0,127},
              textString="TDis"),
            Text(
              extent={{-100,-70},{-70,-82}},
              lineColor={0,0,127},
              textString="TSup"),
            Text(
              extent={{70,18},{98,4}},
              lineColor={0,0,127},
              textString="yVal"),
            Text(
              extent={{68,70},{96,56}},
              lineColor={0,0,127},
              textString="yDam"),
            Text(
              extent={{-98,100},{-46,88}},
              lineColor={0,0,127},
              textString="TZonHeaSet"),
            Text(
              extent={{-98,-14},{-68,-26}},
              lineColor={0,0,127},
              textString="VDis_flow"),
            Text(
              extent={{-120,160},{114,108}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-96,6},{-74,-8}},
              lineColor={0,0,127},
              textString="TZon"),
            Text(
              extent={{-100,84},{-46,74}},
              lineColor={0,0,127},
              textString="TZonCooSet"),
            Text(
              extent={{-100,-86},{-52,-98}},
              lineColor={0,0,127},
              textString="uOpeMod"),
            Text(
              visible=have_occSen,
              extent={{-100,36},{-74,26}},
              lineColor={0,0,127},
              textString="nOcc"),
            Text(
              visible=have_CO2Sen,
              extent={{-96,60},{-58,42}},
              lineColor={0,0,127},
              textString="ppmCO2"),
            Text(
              visible=have_winSen,
              extent={{-100,14},{-72,4}},
              lineColor={0,0,127},
              textString="uWin"),
            Text(
              extent={{22,-20},{96,-58}},
              lineColor={0,0,127},
              textString="yZonTemResReq"),
            Text(
              extent={{24,-62},{96,-96}},
              lineColor={0,0,127},
              textString="yZonPreResReq"),
            Text(
              extent={{-98,-34},{-50,-44}},
              lineColor={0,0,127},
              textString="uDam_actual")}),
        Diagram(coordinateSystem(extent={{-140,-180},{140,180}})),
    Documentation(info="<html>
<p>
Controller for terminal box of VAV system with reheat according to ASHRAE
Guideline 36, Part 5.E. It outputs damper position <code>yDam</code>,
hot water valve position <code>yVal</code>, AHU cooling supply temperature
setpoint reset request <code>yZonTemResReq</code>, and static pressure setpoint
reset request <code>yZonPreResReq</code>.
</p>
<p>The sequence consists of four subsequences. </p>
<h4>a. Heating and cooling control loop</h4>
<p>
The subsequence is implementd according to Part 5.B.5. The measured zone
temperature <code>TZon</code>, zone setpoints temperatures <code>TZonHeaSet</code> and
<code>TZonCooSet</code> are inputs to the block <code>conHeaLoo</code> and 
<code>conCooLoo</code> to generate the control loop signal. 
</p>
<h4>b. Active airflow setpoint calculation</h4>
<p>
This sequence sets the active maximum and minimum airflow according to
Part 5.E.3-5. Depending on operation modes <code>uOpeMod</code>, it sets the
airflow rate limits for cooling and heating supply. See
<a href=\"modelica://Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.SetPoints.ActiveAirFlow\">
Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.SetPoints.ActiveAirFlow</a>.
</p>
<h4>c. Damper and valve control</h4>
<p>
This sequence sets the damper and valve position for VAV reheat terminal unit.
The implementation is according to Part 5.E.6. According to heating and cooling
control loop signal, it calculates the discharge air temperature setpoint
<code>TDisHeaSet</code>. Along with the defined maximum and minimum airflow, measured
zone temperature, the sequence outputs <code>yDam</code>, <code>yVal</code>,
<code>TDisHeaSet</code> and discharge airflow rate setpoint <code>VDisSet_flow</code>.
See <a href=\"modelica://Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.DamperValves\">
Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.DamperValves</a>.
</p>
<h4>d. System reset requests generation</h4>
<p>
According to Part 5.E.9, this sequence outputs the system reset requests, i.e.
cooling supply air temperature reset requests <code>yZonTemResReq</code>,
static pressure reset requests <code>yZonPreResReq</code>, hot water reset
requests <code>yHeaValResReq</code>, and the boiler plant reset requests
<code>yHeaPlaReq</code>. See
<a href=\"modelica://Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.SystemRequests\">
Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.SystemRequests</a>.
</p>
</html>",     revisions="<html>
<ul>
<li>
April 18, 2020, by Jianjun Hu:<br/>
Added actual VAV damper position as the input for generating system request.<br/>
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/1873\">issue 1873</a>.
</li>
<li>
March 06, 2020, by Jianjun Hu:<br/>
Added default component name.<br/>
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/1809\">issue 1809</a>.
</li>
<li>
November 15, 2017, by Michael Wetter:<br/>
Added integrator reset.
</li>
<li>
October 27, 2017, by Jianjun Hu:<br/>
Moved it from example package.
</li>
<li>
September 25, 2017, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
    end Controller_modifyHeatingSequence;
  end Controls;

end Plants;
