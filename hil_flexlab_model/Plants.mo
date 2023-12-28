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
      CCC_test.obsolete_hil_flexlab_model.HeatPumps.BlackBox_Generic_TSetpoint
        blackBox_Generic_TSetpoint annotation (Placement(transformation(
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

    block DamperValvesTest_modifyHeatingSequence
      "Output signals for controlling VAV reheat box damper and valve position"

      parameter Real dTDisZonSetMax(
        final unit="K",
        final displayUnit="K",
        final quantity="TemperatureDifference")=11
        "Zone maximum discharge air temperature above heating setpoint";
      parameter Real TDisMin(
        final unit="K",
        final displayUnit="degC",
        final quantity="ThermodynamicTemperature")=283.15
        "Lowest discharge air temperature";

      parameter Buildings.Controls.OBC.CDL.Types.SimpleController controllerTypeVal=
        Buildings.Controls.OBC.CDL.Types.SimpleController.PI
        "Type of controller"
        annotation(Dialog(group="Valve"));

      parameter Real kVal(final unit="1/K")=0.5
        "Gain of controller for valve control"
        annotation(Dialog(group="Valve"));

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

      parameter Boolean have_pressureIndependentDamper = true
        "True: the VAV damper is pressure independent (with built-in flow controller)"
        annotation(Dialog(group="Damper"));

      parameter Buildings.Controls.OBC.CDL.Types.SimpleController controllerTypeDam=
        Buildings.Controls.OBC.CDL.Types.SimpleController.PI
        "Type of controller"
        annotation(Dialog(group="Damper"));

      parameter Real kDam(final unit="1")=0.5
        "Gain of controller for damper control"
        annotation(Dialog(group="Damper"));

      parameter Real TiDam(
        final unit="s",
        final quantity="Time")=300
        "Time constant of integrator block for damper control"
        annotation(Dialog(group="Damper",
        enable=controllerTypeDam == Buildings.Controls.OBC.CDL.Types.SimpleController.PI
            or controllerTypeDam == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));

      parameter Real TdDam(
        final unit="s",
        final quantity="Time")=0.1
        "Time constant of derivative block for damper control"
        annotation (Dialog(group="Damper",
          enable=controllerTypeDam == Buildings.Controls.OBC.CDL.Types.SimpleController.PD
              or controllerTypeDam == Buildings.Controls.OBC.CDL.Types.SimpleController.PID));

      parameter Real V_flow_nominal(
        final unit="m3/s",
        final quantity="VolumeFlowRate",
        final min=1E-10)
        "Nominal volume flow rate, used to normalize control error"
        annotation(Dialog(group="Damper"));

      Buildings.Controls.OBC.CDL.Interfaces.RealInput uHea(
        final min=0,
        final max=1,
        final unit="1")
        "Heating control signal"
        annotation (Placement(transformation(extent={{-360,-160},{-320,-120}}),
            iconTransformation(extent={{-140,-40},{-100,0}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput uCoo(
        final min=0,
        final max=1,
        final unit="1")
        "Cooling control signal"
        annotation (Placement(transformation(extent={{-360,260},{-320,300}}),
            iconTransformation(extent={{-140,80},{-100,120}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput VActCooMax_flow(
        final min=0,
        final unit="m3/s",
        final quantity="VolumeFlowRate")
        "Active cooling maximum airflow rate"
        annotation (Placement(transformation(extent={{-360,180},{-320,220}}),
            iconTransformation(extent={{-140,40},{-100,80}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput VActCooMin_flow(
        final min=0,
        final unit="m3/s",
        final quantity="VolumeFlowRate")
        "Active cooling minimum airflow rate"
        annotation (Placement(transformation(extent={{-360,220},{-320,260}}),
            iconTransformation(extent={{-140,60},{-100,100}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput VActMin_flow(
        final min=0,
        final unit="m3/s",
        final quantity="VolumeFlowRate")
        "Active minimum airflow rate"
        annotation (Placement(transformation(extent={{-360,50},{-320,90}}),
            iconTransformation(extent={{-140,20},{-100,60}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput VActHeaMin_flow(
        final min=0,
        final unit="m3/s",
        final quantity="VolumeFlowRate")
        "Active heating minimum airflow rate"
        annotation (Placement(transformation(extent={{-360,-300},{-320,-260}}),
            iconTransformation(extent={{-140,-80},{-100,-40}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput VActHeaMax_flow(
        final min=0,
        final unit="m3/s",
        final quantity="VolumeFlowRate")
        "Active heating maximum airflow rate"
        annotation (Placement(transformation(extent={{-360,-330},{-320,-290}}),
            iconTransformation(extent={{-140,-100},{-100,-60}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput VDis_flow(
        final min=0,
        final unit="m3/s",
        final quantity="VolumeFlowRate") if not have_pressureIndependentDamper
        "Measured discharge airflow rate airflow rate"
        annotation (Placement(transformation(extent={{-360,320},{-320,360}}),
          iconTransformation(extent={{-20,-20},{20,20}},rotation=90,origin={40,-120})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput TSup(
        final unit="K",
        final displayUnit="degC",
        final quantity="ThermodynamicTemperature")
        "Supply air temperature from central air handler"
        annotation (Placement(transformation(extent={{-360,-50},{-320,-10}}),
            iconTransformation(extent={{-140,0},{-100,40}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput THeaSet(
        final unit="K",
        final displayUnit="degC",
        final quantity="ThermodynamicTemperature")
        "Zone heating setpoint temperature"
        annotation (Placement(transformation(extent={{-360,-80},{-320,-40}}),
            iconTransformation(extent={{-140,-20},{-100,20}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput TZon(
        final unit="K",
        final displayUnit="degC",
        final quantity="ThermodynamicTemperature")
        "Measured zone temperature"
        annotation (Placement(transformation(extent={{-360,-270},{-320,-230}}),
            iconTransformation(extent={{-140,-60},{-100,-20}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealInput TDis(
        final unit="K",
        final displayUnit="degC",
        final quantity="ThermodynamicTemperature")
        "Measured discharge air temperature"
        annotation (Placement(transformation(extent={{-360,110},{-320,150}}),
          iconTransformation(extent={{-20,-20},{20,20}},rotation=90,origin={-40,-120})));
      Buildings.Controls.OBC.CDL.Interfaces.IntegerInput uOpeMod
        "Zone operation mode"
        annotation (Placement(transformation(extent={{-360,-370},{-320,-330}}),
            iconTransformation(extent={{-140,-120},{-100,-80}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealOutput yDam(
        final min=0,
        final max=1,
        final unit="1") "Signal for VAV damper"
        annotation (Placement(transformation(extent={{320,20},{360,60}}),
            iconTransformation(extent={{100,20},{140,60}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealOutput yHeaVal(
        final min=0,
        final max=1,
        final unit="1")
        "Reheater valve position"
        annotation (Placement(transformation(extent={{320,-40},{360,0}}),
            iconTransformation(extent={{100,-60},{140,-20}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealOutput VDisSet_flow(
        final min=0,
        final unit="m3/s",
        final quantity="VolumeFlowRate") "Discharge airflow setpoint"
        annotation (Placement(transformation(extent={{320,240},{360,280}}),
            iconTransformation(extent={{100,60},{140,100}})));
      Buildings.Controls.OBC.CDL.Interfaces.RealOutput TDisHeaSet(
        final unit="K",
        final displayUnit="degC",
        final quantity="ThermodynamicTemperature")
        "Discharge airflow setpoint temperature for heating"
        annotation (Placement(transformation(extent={{320,-160},{360,-120}}),
            iconTransformation(extent={{100,-100},{140,-60}})));

      Buildings.Controls.OBC.CDL.Logical.Not not1 "Logical not"
        annotation (Placement(transformation(extent={{-220,40},{-200,60}})));
      Buildings.Controls.OBC.CDL.Logical.Not not2 "Logical not"
        annotation (Placement(transformation(extent={{-220,0},{-200,20}})));
      Buildings.Controls.OBC.CDL.Logical.Not not4 "Logical not"
        annotation (Placement(transformation(extent={{-202,120},{-182,140}})));
      Buildings.Controls.OBC.CDL.Logical.And and2
        "Check if current zone state is deadband"
        annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
      Buildings.Controls.OBC.CDL.Logical.And and4 "Logical and"
        annotation (Placement(transformation(extent={{-60,200},{-40,220}})));
      Buildings.Controls.OBC.CDL.Continuous.Line lin
        "Active airflow setpoint for cooling"
        annotation (Placement(transformation(extent={{-160,270},{-140,290}})));
      Buildings.Controls.OBC.CDL.Continuous.Line conTDisHeaSet
        "Discharge air temperature for heating"
        annotation (Placement(transformation(extent={{-120,-82},{-100,-62}})));
      Buildings.Controls.OBC.CDL.Continuous.Line lin3
        "Active airflow setpoint for heating"
        annotation (Placement(transformation(extent={{-80,-310},{-60,-290}})));
      Buildings.Controls.Continuous.LimPID         conVal(
        final controllerType=controllerTypeVal,
        final k=kVal,
        final Ti=TiVal,
        final Td=TdVal,
        final yMax=1,
        final yMin=0,
        u_s(final unit="K", displayUnit="degC"),
        u_m(final unit="K", displayUnit="degC"),
        reset=Buildings.Types.Reset.Parameter)
        "Hot water valve controller"
        annotation (Placement(transformation(extent={{34,-90},{54,-70}})));
      Buildings.Controls.Continuous.LimPID         conDam(
        final controllerType=controllerTypeDam,
        final k=kDam,
        final Ti=TiDam,
        final Td=TdDam,
        final yMax=1,
        final yMin=0,
        final reset=Buildings.Types.Reset.Parameter,
        final y_reset=0) if not have_pressureIndependentDamper
        "Damper position controller"
        annotation (Placement(transformation(extent={{280,220},{300,240}})));
      Buildings.Controls.OBC.CDL.Continuous.Switch swi
        "Output active cooling airflow according to cooling control signal"
        annotation (Placement(transformation(extent={{140,260},{160,280}})));
      Buildings.Controls.OBC.CDL.Continuous.Switch swi1
        "Output active airflow when it is in deadband state"
        annotation (Placement(transformation(extent={{132,40},{152,60}})));
      Buildings.Controls.OBC.CDL.Continuous.Switch swi2
        "Acitive heating airflow rate"
        annotation (Placement(transformation(extent={{80,-260},{100,-240}})));
      Buildings.Controls.OBC.CDL.Continuous.Switch swi4
        "Output active heating airflow according to heating control signal"
        annotation (Placement(transformation(extent={{140,-260},{160,-240}})));
      Buildings.Controls.OBC.CDL.Continuous.Switch swi5
        "Output active cooling airflow "
        annotation (Placement(transformation(extent={{60,200},{80,220}})));

    protected
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant conZer(
        final k=0) "Constant zero"
        annotation (Placement(transformation(extent={{-280,300},{-260,320}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant conZer1(
        final k=0) "Constant zero"
        annotation (Placement(transformation(extent={{100,240},{120,260}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant conZer2(
        final k=0) "Constant zero"
        annotation (Placement(transformation(extent={{-80,-2},{-60,18}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant conZer3(
        final k=0) "Constant zero"
        annotation (Placement(transformation(extent={{-260,-110},{-240,-90}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant conZer6(
        final k=0) "Constant zero"
        annotation (Placement(transformation(extent={{80,-310},{100,-290}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant conOne(
        final k=1) "Constant one"
        annotation (Placement(transformation(extent={{-220,300},{-200,320}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant conOne2(
        final k=1) "Constant real value"
        annotation (Placement(transformation(extent={{-180,-340},{-160,-320}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant conHal(
        final k=0.5) "Constant real value"
        annotation (Placement(transformation(extent={{-200,-110},{-180,-90}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant conHal1(
        final k=0.5) "Constant real value"
        annotation (Placement(transformation(extent={{-260,-340},{-240,-320}})));
      Buildings.Obsolete.Controls.OBC.CDL.Continuous.AddParameter addPar(final p=
            dTDisZonSetMax, final k=1) "Maximum heating discharge temperature"
        annotation (Placement(transformation(extent={{-260,-70},{-240,-50}})));
      Buildings.Obsolete.Controls.OBC.CDL.Continuous.AddParameter addPar1(final k=1,
          final p=2.8) "Zone temperature pluTZonSets 2.8 degC"
        annotation (Placement(transformation(extent={{-260,-260},{-240,-240}})));
      Buildings.Controls.OBC.CDL.Continuous.Hysteresis hys2(uHigh=0.002, uLow=0.001)
        "Check if cooling control signal is greater than zero"
        annotation (Placement(transformation(extent={{-280,222},{-260,242}})));
      Buildings.Controls.OBC.CDL.Continuous.Hysteresis hys3(
        final uHigh=0.05,
        final uLow=0.01)
        "Check if heating control signal is greater than 0"
        annotation (Placement(transformation(extent={{-260,-220},{-240,-200}})));
      Buildings.Controls.OBC.CDL.Continuous.Hysteresis hys4(
        final uLow=TDisMin - 0.1,
        final uHigh=TDisMin + 0.1)
        "Check if discharge air temperature is greater than lowest discharge air temperature"
        annotation (Placement(transformation(extent={{-240,120},{-220,140}})));
      Buildings.Controls.OBC.CDL.Continuous.Hysteresis hys6(
        final uLow=-0.1,
        final uHigh=0.1)
        "Check if supply air temperature is greater than room temperature"
        annotation (Placement(transformation(extent={{-120,190},{-100,210}})));
      Buildings.Controls.OBC.CDL.Continuous.Hysteresis hys7(
        final uLow=-0.1,
        final uHigh=0.1)
        "Check if discharge air temperature is greater than room temperature plus 2.8 degC"
        annotation (Placement(transformation(extent={{-80,-260},{-60,-240}})));
      Buildings.Obsolete.Controls.OBC.CDL.Continuous.Add add1(final k2=-1)
        "Calculate temperature difference between discharge air and room plus 2.8 degC"
        annotation (Placement(transformation(extent={{-120,-260},{-100,-240}})));
      Buildings.Obsolete.Controls.OBC.CDL.Continuous.Add add2(final k2=-1)
        "Calculate temperature difference between AHU supply air and room "
        annotation (Placement(transformation(extent={{-160,190},{-140,210}})));
      Buildings.Controls.OBC.CDL.Logical.TrueHoldWithReset truHol2(duration=600)
        "Check if the true input holds for certain time"
        annotation (Placement(transformation(extent={{-222,-220},{-202,-200}})));
      Buildings.Controls.OBC.CDL.Logical.TrueDelay truDel3(delayTime=600)
        "Check if the true input holds for certain time"
        annotation (Placement(transformation(extent={{-160,120},{-140,140}})));
      Buildings.Controls.OBC.CDL.Logical.TrueDelay truDel4(delayTime=0)
        "Check if the true input holds for certain time"
        annotation (Placement(transformation(extent={{-240,220},{-220,240}})));
      Buildings.Controls.OBC.CDL.Integers.Equal isUno "Output true if the operation mode is unoccupied"
        annotation (Placement(transformation(extent={{220,-322},{240,-302}})));
      Buildings.Controls.OBC.CDL.Integers.Sources.Constant unOcc(final k=
            Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Types.OperationModes.unoccupied)
        "Constant signal for unoccupied mode"
        annotation (Placement(transformation(extent={{170,-322},{190,-302}})));
      Buildings.Controls.OBC.CDL.Continuous.Switch watValPosUno
        "Output hot water valve position"
        annotation (Placement(transformation(extent={{280,-30},{300,-10}})));
      Buildings.Controls.OBC.CDL.Continuous.Switch damPosUno
        "Output damper position"
        annotation (Placement(transformation(extent={{280,60},{300,80}})));
      Buildings.Controls.OBC.CDL.Logical.Not not5 "Negation of input signal"
        annotation (Placement(transformation(extent={{200,-260},{220,-240}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant lowDisAirTem(
        final k=TDisMin)
        "Lowest allowed discharge air temperature"
        annotation (Placement(transformation(extent={{-68,-108},{-48,-88}})));
      Buildings.Controls.OBC.CDL.Continuous.Switch swi6
        "Output hot water valve position in case of low discharge air temperature"
        annotation (Placement(transformation(extent={{-30,-90},{-10,-70}})));
      Buildings.Controls.OBC.CDL.Logical.Or or2 "Logical not"
        annotation (Placement(transformation(extent={{-68,-64},{-48,-44}})));
      Buildings.Controls.OBC.CDL.Logical.Not not3 "Logical not"
        annotation (Placement(transformation(extent={{-120,120},{-100,140}})));
      Buildings.Controls.OBC.CDL.Continuous.Switch swi3
        "Output hot water valve position in case of low discharge air temperature"
        annotation (Placement(transformation(extent={{104,-82},{124,-62}})));
      Buildings.Controls.OBC.CDL.Logical.Not not6 "Negation of input signal"
        annotation (Placement(transformation(extent={{-40,-192},{-20,-172}})));
      Buildings.Controls.OBC.CDL.Logical.And and1
        "Check if it is not in heating mode and the discharge temperature is not too low"
        annotation (Placement(transformation(extent={{20,-56},{40,-36}})));
      Buildings.Obsolete.Controls.OBC.CDL.Continuous.Add add3
        "Active airflow setpoint"
        annotation (Placement(transformation(extent={{200,250},{220,270}})));
      Buildings.Obsolete.Controls.OBC.CDL.Continuous.Add add4
        "Active airflow set point"
        annotation (Placement(transformation(extent={{180,40},{200,60}})));
      Buildings.Controls.OBC.CDL.Continuous.Divide VDis_flowNor
        if not have_pressureIndependentDamper
        "Normalized discharge volume flow rate"
        annotation (Placement(transformation(extent={{240,150},{260,170}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant nomFlow(
        final k=V_flow_nominal)
        "Nominal volume flow rate"
        annotation (Placement(transformation(extent={{200,200},{220,220}})));
      Buildings.Controls.OBC.CDL.Continuous.Divide VDisSet_flowNor
        "Normalized setpoint for discharge volume flow rate"
        annotation (Placement(transformation(extent={{240,220},{260,240}})));
      Buildings.Controls.OBC.CDL.Continuous.MultiplyByParameter gai(final k=1)
                   if have_pressureIndependentDamper
        "Block that can be disabled so remove the connection"
        annotation (Placement(transformation(extent={{220,120},{240,140}})));

    equation
      connect(uCoo, lin.u)
        annotation (Line(points={{-340,280},{-162,280}}, color={0,0,127}));
      connect(conZer.y, lin.x1)
        annotation (Line(points={{-258,310},{-240,310},{-240,288},{-162,288}},
          color={0,0,127}));
      connect(VActCooMin_flow, lin.f1)
        annotation (Line(points={{-340,240},{-300,240},{-300,284},{-162,284}},
          color={0,0,127}));
      connect(conOne.y, lin.x2)
        annotation (Line(points={{-198,310},{-180,310},{-180,276},{-162,276}},
          color={0,0,127}));
      connect(VActCooMax_flow, lin.f2)
        annotation (Line(points={{-340,200},{-180,200},{-180,272},{-162,272}},
          color={0,0,127}));
      connect(uCoo, hys2.u)
        annotation (Line(points={{-340,280},{-290,280},{-290,232},{-282,232}},
          color={0,0,127}));
      connect(conZer1.y, swi.u3)
        annotation (Line(points={{122,250},{130,250},{130,262},{138,262}},
          color={0,0,127}));
      connect(VActMin_flow, swi1.u1)
        annotation (Line(points={{-340,70},{30,70},{30,58},{130,58}},
          color={0,0,127}));
      connect(and2.y, swi1.u2)
        annotation (Line(points={{-58,50},{130,50}}, color={255,0,255}));
      connect(conZer2.y, swi1.u3)
        annotation (Line(points={{-58,8},{-20,8},{-20,42},{130,42}},
          color={0,0,127}));
      connect(uHea, hys3.u)
        annotation (Line(points={{-340,-140},{-280,-140},{-280,-210},{-262,-210}},
          color={0,0,127}));
      connect(conZer3.y, conTDisHeaSet.x1)
        annotation (Line(points={{-238,-100},{-220,-100},{-220,-64},{-122,-64}},
          color={0,0,127}));
      connect(TSup, conTDisHeaSet.f1)
        annotation (Line(points={{-340,-30},{-160,-30},{-160,-68},{-122,-68}},
          color={0,0,127}));
      connect(uHea, conTDisHeaSet.u)
        annotation (Line(points={{-340,-140},{-140,-140},{-140,-72},{-122,-72}},
          color={0,0,127}));
      connect(conHal.y, conTDisHeaSet.x2)
        annotation (Line(points={{-178,-100},{-160,-100},{-160,-76},{-122,-76}},
          color={0,0,127}));
      connect(addPar.y, conTDisHeaSet.f2)
        annotation (Line(points={{-238,-60},{-136,-60},{-136,-80},{-122,-80}},
          color={0,0,127}));
      connect(THeaSet, addPar.u)
        annotation (Line(points={{-340,-60},{-262,-60}}, color={0,0,127}));
      connect(uHea, lin3.u)
        annotation (Line(points={{-340,-140},{-280,-140},{-280,-300},{-82,-300}},
          color={0,0,127}));
      connect(conHal1.y, lin3.x1)
        annotation (Line(points={{-238,-330},{-200,-330},{-200,-292},{-82,-292}},
          color={0,0,127}));
      connect(conOne2.y, lin3.x2)
        annotation (Line(points={{-158,-330},{-140,-330},{-140,-304},{-82,-304}},
          color={0,0,127}));
      connect(VActHeaMax_flow, lin3.f2)
        annotation (Line(points={{-340,-310},{-120,-310},{-120,-308},{-82,-308}},
          color={0,0,127}));
      connect(VActHeaMin_flow, lin3.f1)
        annotation (Line(points={{-340,-280},{-120,-280},{-120,-296},{-82,-296}},
          color={0,0,127}));
      connect(TZon, addPar1.u)
        annotation (Line(points={{-340,-250},{-262,-250}}, color={0,0,127}));
      connect(VActHeaMin_flow, swi2.u3)
        annotation (Line(points={{-340,-280},{60,-280},{60,-258},{78,-258}},
          color={0,0,127}));
      connect(TDis, hys4.u)
        annotation (Line(points={{-340,130},{-242,130}},
          color={0,0,127}));
      connect(swi2.y, swi4.u1)
        annotation (Line(points={{102,-250},{112,-250},{112,-242},{138,-242}},
          color={0,0,127}));
      connect(conZer6.y, swi4.u3)
        annotation (Line(points={{102,-300},{120,-300},{120,-258},{138,-258}},
          color={0,0,127}));
      connect(VActMin_flow, swi5.u1)
        annotation (Line(points={{-340,70},{30,70},{30,218},{58,218}},
          color={0,0,127}));
      connect(and4.y, swi5.u2)
        annotation (Line(points={{-38,210},{58,210}},color={255,0,255}));
      connect(lin.y, swi5.u3)
        annotation (Line(points={{-138,280},{40,280},{40,202},{58,202}},
          color={0,0,127}));
      connect(swi5.y, swi.u1)
        annotation (Line(points={{82,210},{94,210},{94,278},{138,278}},
          color={0,0,127}));
      connect(hys4.y, not4.u)
        annotation (Line(points={{-218,130},{-204,130}}, color={255,0,255}));
      connect(TSup, add2.u1)
        annotation (Line(points={{-340,-30},{-300,-30},{-300,180},{-176,180},{-176,206},
              {-162,206}},        color={0,0,127}));
      connect(TZon, add2.u2)
        annotation (Line(points={{-340,-250},{-296,-250},{-296,176},{-172,176},{-172,
              194},{-162,194}},   color={0,0,127}));
      connect(add2.y, hys6.u)
        annotation (Line(points={{-138,200},{-122,200}}, color={0,0,127}));
      connect(hys6.y, and4.u2)
        annotation (Line(points={{-98,200},{-80,200},{-80,202},{-62,202}},
          color={255,0,255}));
      connect(conTDisHeaSet.y, add1.u1)
        annotation (Line(points={{-98,-72},{-80,-72},{-80,-220},{-140,-220},{-140,-244},
              {-122,-244}},          color={0,0,127}));
      connect(addPar1.y, add1.u2)
        annotation (Line(points={{-238,-250},{-140,-250},{-140,-256},{-122,-256}},
          color={0,0,127}));
      connect(add1.y, hys7.u)
        annotation (Line(points={{-98,-250},{-82,-250}},
          color={0,0,127}));
      connect(conTDisHeaSet.y, TDisHeaSet)
        annotation (Line(points={{-98,-72},{-80,-72},{-80,-140},{340,-140}},
          color={0,0,127}));
      connect(hys3.y, truHol2.u)
        annotation (Line(points={{-238,-210},{-224,-210}}, color={255,0,255}));
      connect(truHol2.y, swi4.u2)
        annotation (Line(points={{-200,-210},{120,-210},{120,-250},{138,-250}},
          color={255,0,255}));
      connect(hys2.y, truDel4.u)
        annotation (Line(points={{-258,232},{-250,232},{-250,230},{-242,230}},
                                                         color={255,0,255}));
      connect(truDel4.y, and4.u1)
        annotation (Line(points={{-218,230},{-80,230},{-80,210},{-62,210}},
          color={255,0,255}));
      connect(truDel4.y, swi.u2)
        annotation (Line(points={{-218,230},{-20,230},{-20,270},{138,270}},
          color={255,0,255}));
      connect(truHol2.y, not2.u)
        annotation (Line(points={{-200,-210},{-180,-210},{-180,-128},{-280,-128},{-280,
              10},{-222,10}}, color={255,0,255}));
      connect(truDel4.y, not1.u)
        annotation (Line(points={{-218,230},{-200,230},{-200,184},{-304,184},{-304,50},
              {-222,50}}, color={255,0,255}));
      connect(not1.y, and2.u1)
        annotation (Line(points={{-198,50},{-82,50}}, color={255,0,255}));
      connect(not2.y, and2.u2)
        annotation (Line(points={{-198,10},{-180,10},{-180,42},{-82,42}},
          color={255,0,255}));
      connect(conVal.u_m, TDis) annotation (Line(points={{44,-92},{44,-124},{-308,-124},
              {-308,130},{-340,130}}, color={0,0,127}));
      connect(hys7.y, swi2.u2)
        annotation (Line(points={{-58,-250},{78,-250}}, color={255,0,255}));
      connect(unOcc.y, isUno.u1)
        annotation (Line(points={{192,-312},{218,-312}}, color={255,127,0}));
      connect(isUno.u2, uOpeMod) annotation (Line(points={{218,-320},{200,-320},{200,
              -350},{-340,-350}}, color={255,127,0}));
      connect(isUno.y, watValPosUno.u2) annotation (Line(points={{242,-312},{266,-312},
              {266,-20},{278,-20}}, color={255,0,255}));
      connect(conZer2.y, watValPosUno.u1) annotation (Line(points={{-58,8},{-20,8},{
              -20,-12},{278,-12}},  color={0,0,127}));
      connect(watValPosUno.y, yHeaVal)
        annotation (Line(points={{302,-20},{340,-20}}, color={0,0,127}));
      connect(conZer2.y, damPosUno.u1) annotation (Line(points={{-58,8},{-20,8},{-20,
              -12},{250,-12},{250,78},{278,78}}, color={0,0,127}));
      connect(conDam.y, damPosUno.u3) annotation (Line(points={{301,230},{310,230},
              {310,100},{272,100},{272,62},{278,62}},color={0,0,127}));
      connect(damPosUno.y, yDam) annotation (Line(points={{302,70},{308,70},{308,40},
              {340,40}}, color={0,0,127}));
      connect(isUno.y, damPosUno.u2) annotation (Line(points={{242,-312},{266,-312},
              {266,70},{278,70}}, color={255,0,255}));
      connect(isUno.y, not5.u) annotation (Line(points={{242,-312},{266,-312},{266,-280},
              {180,-280},{180,-250},{198,-250}}, color={255,0,255}));
      connect(not5.y, conDam.trigger) annotation (Line(points={{222,-250},{232,-250},
              {232,170},{282,170},{282,218}}, color={255,0,255}));
      connect(truHol2.y, or2.u2) annotation (Line(points={{-200,-210},{-88,-210},{-88,
              -62},{-70,-62}},     color={255,0,255}));
      connect(truDel3.y, not3.u)
        annotation (Line(points={{-138,130},{-122,130}}, color={255,0,255}));
      connect(not3.y, or2.u1) annotation (Line(points={{-98,130},{-88,130},{-88,-54},
              {-70,-54}}, color={255,0,255}));
      connect(or2.y, swi6.u2) annotation (Line(points={{-46,-54},{-40,-54},{-40,-80},
              {-32,-80}}, color={255,0,255}));
      connect(conTDisHeaSet.y, swi6.u1)
        annotation (Line(points={{-98,-72},{-32,-72}}, color={0,0,127}));
      connect(swi6.u3, lowDisAirTem.y) annotation (Line(points={{-32,-88},{-40,-88},
              {-40,-98},{-46,-98}}, color={0,0,127}));
      connect(swi3.y, watValPosUno.u3) annotation (Line(points={{126,-72},{200,-72},
              {200,-28},{278,-28}}, color={0,0,127}));
      connect(truHol2.y, not6.u) annotation (Line(points={{-200,-210},{-60,-210},{-60,
              -182},{-42,-182}}, color={255,0,255}));
      connect(not6.y, and1.u2) annotation (Line(points={{-18,-182},{0,-182},{0,-54},
              {18,-54}},color={255,0,255}));
      connect(and1.y, swi3.u2) annotation (Line(points={{42,-46},{64,-46},{64,-72},{
              102,-72}}, color={255,0,255}));
      connect(conVal.y, swi3.u3)
        annotation (Line(points={{55,-80},{102,-80}},   color={0,0,127}));
      connect(swi3.u1, conZer2.y) annotation (Line(points={{102,-64},{76,-64},{76,-12},
              {-20,-12},{-20,8},{-58,8}}, color={0,0,127}));
      connect(not3.y, and1.u1) annotation (Line(points={{-98,130},{0,130},{0,-46},{18,
              -46}}, color={255,0,255}));
      connect(not4.y, truDel3.u)
        annotation (Line(points={{-180,130},{-162,130}}, color={255,0,255}));
      connect(not5.y, conVal.trigger) annotation (Line(points={{222,-250},{232,-250},
              {232,-132},{36,-132},{36,-92}},  color={255,0,255}));
      connect(swi6.y, conVal.u_s)
        annotation (Line(points={{-8,-80},{32,-80}},   color={0,0,127}));
      connect(swi1.y, add4.u1) annotation (Line(points={{154,50},{168,50},{168,56},{
              178,56}}, color={0,0,127}));
      connect(swi4.y, add4.u2) annotation (Line(points={{162,-250},{170,-250},{170,44},
              {178,44}}, color={0,0,127}));
      connect(swi.y, add3.u1) annotation (Line(points={{162,270},{180,270},{180,266},
              {198,266}}, color={0,0,127}));
      connect(add4.y, add3.u2) annotation (Line(points={{202,50},{220,50},{220,80},{
              180,80},{180,254},{198,254}}, color={0,0,127}));
      connect(add3.y, VDisSet_flow)
        annotation (Line(points={{222,260},{340,260}}, color={0,0,127}));
      connect(VDis_flow, VDis_flowNor.u1) annotation (Line(points={{-340,340},{190,340},
              {190,166},{238,166}}, color={0,0,127}));
      connect(nomFlow.y, VDis_flowNor.u2) annotation (Line(points={{222,210},{230,210},
              {230,154},{238,154}}, color={0,0,127}));
      connect(VDis_flowNor.y, conDam.u_m)
        annotation (Line(points={{262,160},{290,160},{290,218}}, color={0,0,127}));
      connect(nomFlow.y, VDisSet_flowNor.u2) annotation (Line(points={{222,210},{230,
              210},{230,224},{238,224}},                     color={0,0,127}));
      connect(add3.y, VDisSet_flowNor.u1) annotation (Line(points={{222,260},{230,260},
              {230,236},{238,236}}, color={0,0,127}));
      connect(VDisSet_flowNor.y, conDam.u_s)
        annotation (Line(points={{262,230},{278,230}}, color={0,0,127}));
      connect(VDisSet_flowNor.y, gai.u) annotation (Line(points={{262,230},{270,230},
              {270,180},{210,180},{210,130},{218,130}}, color={0,0,127}));
      connect(gai.y, damPosUno.u3) annotation (Line(points={{242,130},{272,130},{272,
              62},{278,62}}, color={0,0,127}));

      connect(VActHeaMin_flow, swi2.u1) annotation (Line(points={{-340,-280},{32,
              -280},{32,-242},{78,-242}}, color={0,0,127}));
    annotation (
      defaultComponentName="damVal",
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-320,-360},{320,360}}),
            graphics={
            Rectangle(
              extent={{-298,318},{158,182}},
              lineColor={0,0,0},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Rectangle(
              extent={{-298,-22},{158,-118}},
              lineColor={0,0,0},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Rectangle(
              extent={{-298,158},{158,102}},
              lineColor={0,0,0},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Rectangle(
              extent={{-298,72},{158,-4}},
              lineColor={0,0,0},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Rectangle(
              extent={{-298,-162},{158,-338}},
              lineColor={0,0,0},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Text(
              extent={{-40,318},{154,280}},
              lineColor={0,0,127},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              horizontalAlignment=TextAlignment.Right,
              textString="Active airflow setpoint
in cooling state"),
            Text(
              extent={{32,136},{216,104}},
              lineColor={0,0,127},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              horizontalAlignment=TextAlignment.Left,
              textString="Override if TDis is lower than TDisMin
(e.g., AHU overcools)"),
            Text(
              extent={{-52,42},{154,0}},
              lineColor={0,0,127},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              horizontalAlignment=TextAlignment.Right,
              textString="Active airflow setpoint
in deadband state"),
            Text(
              extent={{88,-26},{150,-44}},
              lineColor={0,0,127},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              horizontalAlignment=TextAlignment.Right,
              textString="Valve control"),
            Text(
              extent={{-44,-164},{154,-200}},
              lineColor={0,0,127},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              horizontalAlignment=TextAlignment.Right,
              textString="Active airflow setpoint
in heating state")}),
      Icon(coordinateSystem(extent={{-100,-100},{100,100}}),
           graphics={
            Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,140},{100,100}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{-98,68},{-62,54}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="VActCooMax_flow"),
            Text(
              extent={{-98,88},{-62,74}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="VActCooMin_flow"),
            Text(
              extent={{-98,-76},{-60,-90}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="VActHeaMax_flow"),
            Text(
              extent={{-98,-54},{-62,-66}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="VActHeaMin_flow"),
            Text(
              extent={{-98,44},{-70,38}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="VActMin_flow"),
            Text(
              extent={{-100,102},{-80,96}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="uCoo"),
            Text(
              extent={{-100,-18},{-80,-24}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="uHea"),
            Text(
              extent={{-100,2},{-76,-4}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="THeaSet"),
            Text(
              extent={{-100,24},{-80,16}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="TSup"),
            Text(
              extent={{-11.5,3.5},{11.5,-3.5}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="TDis",
              origin={-41.5,-89.5},
              rotation=90),
            Text(
              extent={{-100,-36},{-80,-42}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="TZon"),
            Text(
              visible=not have_pressureIndependentDamper,
              extent={{-11.5,4.5},{11.5,-4.5}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              origin={39.5,-85.5},
              rotation=90,
              textString="VDis_flow"),
            Text(
              extent={{72,44},{98,34}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="yDam",
              horizontalAlignment=TextAlignment.Right),
            Text(
              extent={{66,-34},{98,-48}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              horizontalAlignment=TextAlignment.Right,
              textString="yHeaVal"),
            Line(points={{-50,64},{-50,-48},{62,-48}}, color={95,95,95}),
            Line(
              points={{-50,14},{-26,-18},{-2,-18},{-2,-22},{14,-22},{14,-16},{62,48}},
              color={0,0,255},
              thickness=0.5),
            Line(
              points={{-2,-22},{-2,-48}},
              color={215,215,215},
              pattern=LinePattern.Dash),
            Line(
              points={{-26,-18},{-26,36}},
              color={215,215,215},
              pattern=LinePattern.Dash),
            Line(
              points={{-26,36},{-50,36}},
              color={95,95,95},
              thickness=0.5),
            Line(
              points={{-26,36},{-2,-48}},
              color={95,95,95},
              thickness=0.5),
        Polygon(
          points={{-64,-58},{-42,-52},{-42,-64},{-64,-58}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(points={{-2,-58},{-60,-58}}, color={95,95,95}),
        Line(points={{16,-58},{78,-58}},  color={95,95,95}),
        Polygon(
          points={{80,-58},{58,-52},{58,-64},{80,-58}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
            Text(
              extent={{60,88},{98,76}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              horizontalAlignment=TextAlignment.Right,
              textString="VDisSet_flow"),
            Text(
              extent={{60,-74},{98,-86}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              horizontalAlignment=TextAlignment.Right,
              textString="TDisHeaSet"),
            Text(
              extent={{-98,-96},{-78,-102}},
              lineColor={0,0,127},
              pattern=LinePattern.Dash,
              textString="uOpeMod")}),
      Documentation(info="<html>
<p>
This sequence sets the damper and valve position for VAV reheat terminal unit.
The implementation is according to ASHRAE Guideline 36 (G36), PART 5.E.6. The
calculation is done following the steps below.
</p>
<ol>
<li>
<p>
When the zone state is cooling (<code>uCoo>0</code>), then the cooling loop output
<code>uCoo</code> shall be mapped to the airflow
setpoint from the cooling minimum <code>VActCooMin_flow</code> to the cooling maximum
<code>VActCooMax_flow</code> airflow setpoints. The hot water valve is closed (<code>yHeaVal=0</code>)
unless the discharge air temperature <code>TDis</code> is below the minimum
setpoint (10 &deg;C).</p>
</li>
<li>
<p>If supply air temperature <code>TSup</code> from the AHU is greater than
room temperature <code>TZon</code>, cooling supply airflow setpoint shall be
no higher than the minimum.
</p>
</li>
<li>
<p>
When the zone state is Deadband (<code>uCoo=0</code> and <code>uHea=0</code>), then
the active airflow setpoint shall be the minimum airflow setpoint <code>VActMin_flow</code>.
Hot water valve is closed unless the discharge air temperature is below the minimum
setpoint (10 &deg;C).
</p>
</li>
<li>
<p>
When the zone state is Heating (<code>uHea>0</code>), then
the heating loop shall maintain space temperature at the heating setpoint
as follows:</p>
<ul>
<li>From 0-50%, the heating loop output <code>uHea</code> shall reset the
discharge temperature setpoint from current AHU SAT setpoint <code>TSup</code>
to a maximum of <code>dTDisZonSetMax</code> above space temperature setpoint. The airflow
setpoint shall be the heating minimum <code>VActHeaMin_flow</code>.</li>
<li>From 50-100%, if the discharge air temperature <code>TDis</code> is
greater than room temperature plus 2.8 Kelvin, the heating loop output <code>uHea</code>
shall reset the airflow setpoint from the heating minimum airflow setpoint
<code>VActHeaMin_flow</code> to the heating maximum airflow setpoint
<code>VActHeaMax_flow</code>.</li>
</ul>
</li>
<li>
<p>The hot water valve (or modulating electric heating coil) shall be modulated
to maintain the discharge temperature at setpoint.
</p>
</li>
<li>
<p>
The VAV damper shall be modulated by a control loop to maintain the measured
airflow at the active setpoint.
</p>
</li>
</ol>

<p>The sequences of controlling damper and valve position for VAV reheat terminal
unit are described in the following figure below.</p>
<p align=\"center\">
<img alt=\"Image of damper and valve control for VAV reheat terminal unit\"
src=\"modelica://Buildings/Resources/Images/Controls/OBC/ASHRAE/G36_PR1/TerminalUnits/Reheat/DamperValves.png\"/>
</p>
</html>",     revisions="<html>
<ul>
<li>
April 18, 2020, by Jianjun Hu:<br/>
Added option to check if the VAV damper is pressure independent.<br/>
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/1873\">#1873</a>.
</li>
<li>
March 11, 2020, by Jianjun Hu:<br/>
Replaced multisum block with add blocks, replaced gain block used for normalization
with division block.<br/>
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/1830\">#1830</a>.
</li>
<li>
September 10, 2017, by Jianjun Hu:<br/>
First implementation.
</li>
</ul>
</html>"));
    end DamperValvesTest_modifyHeatingSequence;

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

      Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.SetPoints.ActiveAirFlow
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
        final CO2Set=CO2Set) "Active airflow rate setpoint"
        annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
      hil_flexlab_model.Plants.BaseClasses.DamperValvesTest_modifyHeatingSequence
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
      Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.SystemRequests
        sysReq(
        final samplePeriod=samplePeriod,
        final have_heaWatCoi=have_heaWatCoi,
        final have_heaPla=have_heaPla,
        final errTZonCoo_1=errTZonCoo_1,
        final errTZonCoo_2=errTZonCoo_2,
        final errTDis_1=errTDis_1,
        final errTDis_2=errTDis_2,
        final durTimTem=durTimTem,
        final durTimFlo=durTimFlo,
        final durTimDisAir=durTimDisAir) "Number of system requests"
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
      Buildings.Controls.OBC.CDL.Integers.Sources.Constant conIntUn(final k=
            Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Types.OperationModes.unoccupied)
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
<a href=\"modelica://Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.SetPoints.ActiveAirFlow\">
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
See <a href=\"modelica://Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.DamperValves\">
Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.DamperValves</a>.
</p>
<h4>d. System reset requests generation</h4>
<p>
According to Part 5.E.9, this sequence outputs the system reset requests, i.e.
cooling supply air temperature reset requests <code>yZonTemResReq</code>,
static pressure reset requests <code>yZonPreResReq</code>, hot water reset
requests <code>yHeaValResReq</code>, and the boiler plant reset requests
<code>yHeaPlaReq</code>. See
<a href=\"modelica://Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Reheat.SystemRequests\">
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
