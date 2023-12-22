within hil_flexlab_model.Test2.Fluid1.HeatPumps.BaseClasses;
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
 Buildings.Fluid.Sources.Boundary_pT outSou(nPorts=1, redeclare package Medium =
               Medium_sou)
    "Fixed boundary at the outlet of the source side" annotation (
      Placement(transformation(
        extent={{-11,11},{11,-11}},
        rotation=0,
        origin={-53,-29})));
  hil_flexlab_model.Test2.Fluid1.HeatPumps.HeatPump heaPum(
    Q_useNominal=6535,
    refIneFre_constant=refIneFre,
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
        AixLib.DataBase.HeatPump.PerformanceData.LookUpTable2D (dataTable
          =hil_flexlab_model.Test2.Fluid1.HeatPumps.Data.RongxinSampleHP()),
    redeclare model PerDataRevHP =
        AixLib.DataBase.Chiller.PerformanceData.LookUpTable2D (smoothness
          =Modelica.Blocks.Types.Smoothness.LinearSegments, dataTable=
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
