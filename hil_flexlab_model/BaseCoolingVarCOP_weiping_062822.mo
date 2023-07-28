within hil_flexlab_model;
model BaseCoolingVarCOP_weiping_062822
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


  parameter Modelica.Units.SI.Power Q_flow_nominal;
  parameter Modelica.Units.SI.Energy Tes_nominal "Design TES capacity";
  parameter Modelica.Units.SI.PressureDifference dp_nominal(min=0, displayUnit=
        "Pa")
    "Nominal pressure raise, used for default pressure curve if not specified in record per";
  parameter Modelica.Units.SI.PressureDifference dpFixed_nominal(displayUnit=
        "Pa", min=0)
    "Pressure drop of pipe and other resistances that are in series";
  parameter Modelica.Units.SI.PressureDifference dpValve_nominal(displayUnit=
        "Pa", min=0) "Nominal pressure drop of fully open valve";

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
  Tes_weiping_062822                 TES(
    redeclare package Medium = Medium,
    mTes_flow_nominal=mTes_flow_nominal,
    k=k,
    c=c,
    d=d,
    TSol=TSol,
    TLiq=TLiq,
    LHea=LHea,
    Tes_nominal=Tes_nominal,
    dp_nominal=dp_nominal,
    dpFixed_nominal=dpFixed_nominal,
    dpValve_nominal=dpValve_nominal)
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
  Modelica.Blocks.Interfaces.RealOutput PEle(unit="W")
    "Electrical power consumption"
    annotation (Placement(transformation(extent={{100,250},{120,270}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=1)
    annotation (Placement(transformation(extent={{74,254},{86,266}})));
  parameter Modelica.Units.SI.DimensionlessRatio COPCoo_ASHP=3
    "Cooling COP of ASHP";
  parameter Modelica.Units.SI.DimensionlessRatio COPCoo_SWEC=3
    "Cooling COP of SWEC";

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
    annotation (Placement(transformation(extent={{-140,218},{-100,258}})));

  ASHPCoolingBlackBox_weiping_062822 AWHP(mSou_flow_nominal=mAWHP_flow_nominal,
  Q_flow_nominal=Q_flow_nominal,dp_nominal=dp_nominal)
    annotation (Placement(transformation(extent={{-52,140},{-32,160}})));


  Modelica.Blocks.Interfaces.RealOutput COP_HP "Electrical power consumption"
    annotation (Placement(transformation(extent={{100,228},{120,248}})));
  Modelica.Blocks.Interfaces.RealOutput HP_spd "Heat pump speed"
    annotation (Placement(transformation(extent={{100,208},{120,228}})));
equation
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
  connect(TES.SOC, SOC) annotation (Line(points={{-19,-2},{20,-2},{20,0},{110,0}},
        color={0,0,127}));
  connect(senTemRetSwe.T, TRetASHP) annotation (Line(points={{9,-248},{0,-248},
          {0,-240},{80,-240},{80,-220},{110,-220}}, color={0,0,127}));
  connect(senTemRetSwe.port_a, spl5.port_2)
    annotation (Line(points={{20,-238},{20,-130}}, color={0,127,255}));
  connect(AWHP.TSetSou, TSetASHP) annotation (Line(points={{-54,153},{-72,153},{
          -72,140},{-120,140}}, color={0,0,127}));
  connect(AWHP.TDryBul, uTDryBul) annotation (Line(points={{-54,158.8},{-120,158.8},
          {-120,238}}, color={0,0,127}));
  connect(AWHP.uPum, uASHP) annotation (Line(points={{-54,156},{-120,156},{-120,
          200}}, color={0,0,127}));
  connect(AWHP.PEle, multiSum.u[1]) annotation (Line(points={{-31,160},{40,160},
          {40,260},{74,260}}, color={0,0,127}));
  connect(AWHP.port_a, spl1.port_3) annotation (Line(points={{-32,156},{0,156},{
          0,174},{10,174}}, color={0,127,255}));
  connect(AWHP.port_b, spl2.port_3) annotation (Line(points={{-32,144},{-14,144},
          {-14,126},{10,126}}, color={0,127,255}));
  connect(AWHP.TSup, TASHP)
    annotation (Line(points={{-31,148},{110,148}}, color={0,0,127}));
  connect(AWHP.yCOP, COP_HP) annotation (Line(points={{-31,158.2},{36.5,158.2},
          {36.5,238},{110,238}}, color={0,0,127}));
  connect(AWHP.ySpd, HP_spd) annotation (Line(points={{-31,154.4},{36.5,154.4},
          {36.5,218},{110,218}}, color={0,0,127}));
end BaseCoolingVarCOP_weiping_062822;
