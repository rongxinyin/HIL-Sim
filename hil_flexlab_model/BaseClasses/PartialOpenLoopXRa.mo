within hil_flexlab_model.BaseClasses;
partial model PartialOpenLoopXRa
  "Validated Partial model of variable air volume flow system with terminal reheat and one VAV zone at flexlab xra"

  package MediumA = Buildings.Media.Air "Medium model for air";
  package MediumW = Buildings.Media.Water "Medium model for water";

  constant Integer numZon=1 "Total number of served VAV boxes";
  constant Real leakageFrac=0.2 "Leakage fraction of AHU upstream duct";
  parameter Modelica.Units.SI.Volume VRooCel=AFloCel*XRA.TestCell.hRoo
    "Room volume cell";
  parameter Modelica.Units.SI.Volume VRooPle=AFloPle*flexlabXRA.ple.hRoo
    "Room volume plenum";

  parameter Modelica.Units.SI.Area AFloCel=XRA.TestCell.AFlo "Floor area cell";
  parameter Modelica.Units.SI.Area AFloPle=flexlabXRA.ple.AFlo
    "Floor area plenum";

  parameter Modelica.Units.SI.Area AFlo[numZon]={XRA.TestCell.AFlo}
    "Floor area of each zone";
  final parameter Modelica.Units.SI.Area ATot=sum(AFlo) "Total floor area";

  constant Real conv=1.2/3600 "Conversion factor for nominal mass flow rate";
  parameter Modelica.Units.SI.MassFlowRate mCel_flow_nominal=0.106*1.2
    "Design mass flow rate cell";
  parameter Modelica.Units.SI.MassFlowRate m_flow_nominal=1.0*(
      mCel_flow_nominal) "Nominal mass flow rate";
  parameter Modelica.Units.SI.Angle lat=37.87*3.14159/180 "Latitude";

  parameter Modelica.Units.SI.Temperature THeaOn=293.15
    "Heating setpoint during on";
  parameter Modelica.Units.SI.Temperature THeaOff=285.15
    "Heating setpoint during off";
  parameter Modelica.Units.SI.Temperature TCooOn=273.15 + 23.3
    "Cooling setpoint during on";
  parameter Modelica.Units.SI.Temperature TCooOff=303.15
    "Cooling setpoint during off";
  parameter Modelica.Units.SI.PressureDifference dpBuiStaSet(min=0) = 12
    "Building static pressure";
  parameter Real yFanMin = 0.1 "Minimum fan speed";

//  parameter Modelica.SIunits.HeatFlowRate QHeaCoi_nominal= 2.5*yFanMin*m_flow_nominal*1000*(20 - 4)
//    "Nominal capacity of heating coil";

  parameter Boolean allowFlowReversal=true
    "= false to simplify equations, assuming, but not enforcing, no flow reversal"
    annotation (Evaluate=true);

  parameter Boolean use_windPressure=true "Set to true to enable wind pressure";

  parameter Boolean sampleModel=true
    "Set to true to time-sample the model, which can give shorter simulation time if there is already time sampling in the system model"
    annotation (Evaluate=true, Dialog(tab=
          "Experimental (may be changed in future releases)"));

  Buildings.Fluid.Sources.Outside amb(redeclare package Medium = MediumA,
      nPorts=3) "Ambient conditions"
    annotation (Placement(transformation(extent={{-136,-56},{-114,-34}})));
//  Buildings.Fluid.HeatExchangers.DryCoilCounterFlow heaCoi(
//    redeclare package Medium1 = MediumW,
//    redeclare package Medium2 = MediumA,
//    UA_nominal = QHeaCoi_nominal/Buildings.Fluid.HeatExchangers.BaseClasses.lmtd(
//      T_a1=45,
//      T_b1=35,
//      T_a2=3,
//      T_b2=20),
//    m2_flow_nominal=m_flow_nominal,
//    allowFlowReversal1=false,
//    allowFlowReversal2=allowFlowReversal,
//    dp1_nominal=0,
//    dp2_nominal=200 + 200 + 100 + 40,
//    m1_flow_nominal=QHeaCoi_nominal/4200/10,
//    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
//    "Heating coil"
//    annotation (Placement(transformation(extent={{118,-36},{98,-56}})));

  Buildings.Fluid.HeatExchangers.DryCoilEffectivenessNTU heaCoi(
    redeclare package Medium1 = MediumW,
    redeclare package Medium2 = MediumA,
    m1_flow_nominal=m_flow_nominal*1000*(10 - (-20))/4200/10,
    m2_flow_nominal=m_flow_nominal,
    configuration=Buildings.Fluid.Types.HeatExchangerConfiguration.CounterFlow,
    Q_flow_nominal=m_flow_nominal*1006*(16.7 - 8.5),
    dp1_nominal=0,
    dp2_nominal=200 + 200 + 100 + 40,
    allowFlowReversal1=false,
    allowFlowReversal2=allowFlowReversal,
    T_a1_nominal=318.15,
    T_a2_nominal=281.65) "Heating coil"
    annotation (Placement(transformation(extent={{118,-36},{98,-56}})));

  Buildings.Fluid.HeatExchangers.WetCoilCounterFlow cooCoi(
    UA_nominal=3*m_flow_nominal*1000*15/
        Buildings.Fluid.HeatExchangers.BaseClasses.lmtd(
        T_a1=26.2,
        T_b1=12.8,
        T_a2=6,
        T_b2=16),
    redeclare package Medium1 = MediumW,
    redeclare package Medium2 = MediumA,
    m1_flow_nominal=m_flow_nominal*1000*15/4200/10,
    m2_flow_nominal=m_flow_nominal,
    dp2_nominal=0,
    dp1_nominal=0,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    allowFlowReversal1=false,
    allowFlowReversal2=allowFlowReversal) "Cooling coil"
    annotation (Placement(transformation(extent={{210,-36},{190,-56}})));
  Buildings.Fluid.FixedResistances.PressureDrop dpRetDuc(
    m_flow_nominal=m_flow_nominal,
    redeclare package Medium = MediumA,
    allowFlowReversal=allowFlowReversal,
    dp_nominal=40) "Pressure drop for return duct"
    annotation (Placement(transformation(extent={{400,130},{380,150}})));
  Buildings.Fluid.Movers.SpeedControlled_y fanSup(
    redeclare package Medium = MediumA,
    per(pressure(V_flow={0,m_flow_nominal/1.2*2}, dp=2*{780 + 10 + dpBuiStaSet,
            0})),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) "Supply air fan"
    annotation (Placement(transformation(extent={{300,-50},{320,-30}})));

  Buildings.Fluid.Sensors.VolumeFlowRate senSupFlo(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    "Sensor for supply fan flow rate"
    annotation (Placement(transformation(extent={{400,-50},{420,-30}})));

  Buildings.Fluid.Sensors.VolumeFlowRate senRetFlo(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    "Sensor for return fan flow rate"
    annotation (Placement(transformation(extent={{360,130},{340,150}})));

  Buildings.Fluid.Sources.Boundary_pT sinHea(
    redeclare package Medium = MediumW,
    p=300000,
    T=318.15,
    nPorts=1) "Sink for heating coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-122})));
  Buildings.Fluid.Sources.Boundary_pT sinCoo(
    redeclare package Medium = MediumW,
    p=300000,
    T=285.15,
    nPorts=1) "Sink for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={180,-120})));
  Modelica.Blocks.Routing.RealPassThrough TOut(y(
      final quantity="ThermodynamicTemperature",
      final unit="K",
      displayUnit="degC",
      min=0))
    annotation (Placement(transformation(extent={{-300,170},{-280,190}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TSup(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{330,-50},{350,-30}})));
  Buildings.Fluid.Sensors.RelativePressure dpDisSupFan(redeclare package Medium =
        MediumA) "Supply fan static discharge pressure" annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={320,0})));
  Buildings.Controls.SetPoints.OccupancySchedule occSch(occupancy=3600*{6,19})
    "Occupancy schedule"
    annotation (Placement(transformation(extent={{-318,-220},{-298,-200}})));
  Buildings.Fluid.Sources.MassFlowSource_T souCoo(
    redeclare package Medium = MediumW,
    T=279.15,
    nPorts=1,
    use_m_flow_in=true) "Source for cooling coil" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={230,-120})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TRet(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=allowFlowReversal) "Return air temperature sensor"
    annotation (Placement(transformation(extent={{110,130},{90,150}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TMix(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=allowFlowReversal) "Mixed air temperature sensor"
    annotation (Placement(transformation(extent={{30,-50},{50,-30}})));
  Buildings.Fluid.Sources.MassFlowSource_T souHea(
    redeclare package Medium = MediumW,
    T=318.15,
    use_m_flow_in=true,
    nPorts=1)           "Source for heating coil" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={132,-120})));
  Buildings.Fluid.Sensors.VolumeFlowRate VOut1(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal) "Outside air volume flow rate"
    annotation (Placement(transformation(extent={{-72,-44},{-50,-22}})));

  Buildings.Examples.VAVReheat.ThermalZones.VAVBranch celA(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    m_flow_nominal=mNor_flow_nominal,
    VRoo=VRooNor,
    allowFlowReversal=allowFlowReversal) "thermal zone"
    annotation (Placement(transformation(extent={{698,18},{738,58}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
        Modelica.Utilities.Files.loadResource("Resources/weatherdata/US_Berkeley_2021_0822.mos"))
    annotation (Placement(transformation(extent={{-360,170},{-340,190}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather Data Bus"
    annotation (Placement(transformation(extent={{-330,170},{-310,190}}),
        iconTransformation(extent={{-360,170},{-340,190}})));

  Buildings.Fluid.Sensors.TemperatureTwoPort TSupNor(
    redeclare package Medium = MediumA,
    initType=Modelica.Blocks.Types.Init.InitialState,
    m_flow_nominal=mNor_flow_nominal,
    allowFlowReversal=allowFlowReversal) "Discharge air temperature"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={708,90})));
  Buildings.Fluid.Sensors.VolumeFlowRate VSupNor_flow(
    redeclare package Medium = MediumA,
    initType=Modelica.Blocks.Types.Init.InitialState,
    m_flow_nominal=mNor_flow_nominal,
    allowFlowReversal=allowFlowReversal) "Discharge air flow rate" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={708,128})));
  Buildings.Examples.VAVReheat.BaseClasses.MixingBox eco(
    redeclare package Medium = MediumA,
    mOut_flow_nominal=m_flow_nominal,
    dpOut_nominal=10,
    mRec_flow_nominal=m_flow_nominal,
    dpRec_nominal=10,
    mExh_flow_nominal=m_flow_nominal,
    dpExh_nominal=10,
    from_dp=false) "Economizer" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,-46})));

  Results res(
    final A=ATot,
    PFan=fanSup.P + 0,
    PHea=heaCoi.Q2_flow + cor.terHea.Q1_flow + sou.terHea.Q1_flow + celA.terHea.Q1_flow,
    PCooSen=cooCoi.QSen2_flow,
    PCooLat=cooCoi.QLat2_flow) "Results of the simulation";

  /*fanRet*/

protected
  model Results "Model to store the results of the simulation"
    parameter Modelica.Units.SI.Area A "Floor area";
    input Modelica.Units.SI.Power PFan "Fan energy";
    input Modelica.Units.SI.Power PHea "Heating energy";
    input Modelica.Units.SI.Power PCooSen "Sensible cooling energy";
    input Modelica.Units.SI.Power PCooLat "Latent cooling energy";

    Real EFan(
      unit="J/m2",
      start=0,
      nominal=1E5,
      fixed=true) "Fan energy";
    Real EHea(
      unit="J/m2",
      start=0,
      nominal=1E5,
      fixed=true) "Heating energy";
    Real ECooSen(
      unit="J/m2",
      start=0,
      nominal=1E5,
      fixed=true) "Sensible cooling energy";
    Real ECooLat(
      unit="J/m2",
      start=0,
      nominal=1E5,
      fixed=true) "Latent cooling energy";
    Real ECoo(unit="J/m2") "Total cooling energy";
  equation

    A*der(EFan) = PFan;
    A*der(EHea) = PHea;
    A*der(ECooSen) = PCooSen;
    A*der(ECooLat) = PCooLat;
    ECoo = ECooSen + ECooLat;

  end Results;
public
  Buildings.Controls.OBC.CDL.Continuous.MultiplyByParameter gaiHeaCoi(k=
        m_flow_nominal*1000*40/4200/10) "Gain for heating coil mass flow rate"
    annotation (Placement(transformation(extent={{100,-220},{120,-200}})));
  Buildings.Controls.OBC.CDL.Continuous.MultiplyByParameter gaiCooCoi(k=
        m_flow_nominal*1000*15/4200/10) "Gain for cooling coil mass flow rate"
    annotation (Placement(transformation(extent={{100,-258},{120,-238}})));
  Buildings.Controls.OBC.CDL.Logical.OnOffController freSta(bandwidth=1)
    "Freeze stat for heating coil"
    annotation (Placement(transformation(extent={{0,-102},{20,-82}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant freStaTSetPoi(k=273.15
         + 3) "Freeze stat set point for heating coil"
    annotation (Placement(transformation(extent={{-40,-96},{-20,-76}})));
  ThermalZones.FlexlabXRA flexlabXRA
    annotation (Placement(transformation(extent={{722,388},{1008,694}})));
equation
  connect(fanSup.port_b, dpDisSupFan.port_a) annotation (Line(
      points={{320,-40},{320,-10}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
  connect(TSup.port_a, fanSup.port_b) annotation (Line(
      points={{330,-40},{320,-40}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(amb.ports[1], VOut1.port_a) annotation (Line(
      points={{-114,-42.0667},{-94,-42.0667},{-94,-33},{-72,-33}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(cooCoi.port_b1, sinCoo.ports[1]) annotation (Line(
      points={{190,-52},{180,-52},{180,-110}},
      color={28,108,200},
      thickness=0.5));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-340,180},{-320,180}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus.TDryBul, TOut.u) annotation (Line(
      points={{-320,180},{-302,180}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(amb.weaBus, weaBus) annotation (Line(
      points={{-136,-44.78},{-320,-44.78},{-320,180}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(cooCoi.port_b2, fanSup.port_a) annotation (Line(
      points={{210,-40},{300,-40}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));

  connect(celA.port_b, TSupNor.port_a) annotation (Line(
      points={{708,58},{708,80}},
      color={0,127,255},
      thickness=0.5));

  connect(TSupNor.port_b, VSupNor_flow.port_a) annotation (Line(
      points={{708,100},{708,118}},
      color={0,127,255},
      thickness=0.5));

  connect(VOut1.port_b, eco.port_Out) annotation (Line(
      points={{-50,-33},{-42,-33},{-42,-40},{-20,-40}},
      color={0,127,255},
      thickness=0.5));
  connect(eco.port_Sup, TMix.port_a) annotation (Line(
      points={{0,-40},{30,-40}},
      color={0,127,255},
      thickness=0.5));
  connect(eco.port_Exh, amb.ports[2]) annotation (Line(
      points={{-20,-52},{-96,-52},{-96,-45},{-114,-45}},
      color={0,127,255},
      thickness=0.5));
  connect(eco.port_Ret, TRet.port_b) annotation (Line(
      points={{0,-52},{10,-52},{10,140},{90,140}},
      color={0,127,255},
      thickness=0.5));
  connect(senRetFlo.port_a, dpRetDuc.port_b)
    annotation (Line(points={{360,140},{380,140}}, color={0,127,255}));
  connect(TSup.port_b, senSupFlo.port_a)
    annotation (Line(points={{350,-40},{400,-40}}, color={0,127,255}));
  connect(cooCoi.port_a1, souCoo.ports[1]) annotation (Line(
      points={{210,-52},{230,-52},{230,-110}},
      color={28,108,200},
      thickness=0.5));
  connect(gaiHeaCoi.y, souHea.m_flow_in) annotation (Line(points={{122,-210},{
          124,-210},{124,-132}}, color={0,0,127}));
  connect(gaiCooCoi.y, souCoo.m_flow_in) annotation (Line(points={{122,-248},{
          222,-248},{222,-132}}, color={0,0,127}));
  connect(dpDisSupFan.port_b, amb.ports[3]) annotation (Line(
      points={{320,10},{320,14},{-88,14},{-88,-47.9333},{-114,-47.9333}},
      color={0,0,0},
      pattern=LinePattern.Dot));
  connect(senRetFlo.port_b, TRet.port_a) annotation (Line(points={{340,140},{
          226,140},{110,140}}, color={0,127,255}));
  connect(freStaTSetPoi.y, freSta.reference)
    annotation (Line(points={{-18,-86},{-2,-86}}, color={0,0,127}));
  connect(freSta.u, TMix.T) annotation (Line(points={{-2,-98},{-10,-98},{-10,-70},
          {20,-70},{20,-20},{40,-20},{40,-29}}, color={0,0,127}));
  connect(TMix.port_b, heaCoi.port_a2) annotation (Line(
      points={{50,-40},{98,-40}},
      color={0,127,255},
      thickness=0.5));
  connect(heaCoi.port_b2, cooCoi.port_a2) annotation (Line(
      points={{118,-40},{190,-40}},
      color={0,127,255},
      thickness=0.5));
  connect(souHea.ports[1], heaCoi.port_a1) annotation (Line(
      points={{132,-110},{132,-52},{118,-52}},
      color={28,108,200},
      thickness=0.5));
  connect(heaCoi.port_b1, sinHea.ports[1]) annotation (Line(
      points={{98,-52},{80,-52},{80,-112}},
      color={28,108,200},
      thickness=0.5));
  connect(senSupFlo.port_b, celA.port_a) annotation (Line(points={{420,-40},{708,
          -40},{708,18}}, color={0,127,255}));
  connect(weaBus, flexlabXRA.weaBus) annotation (Line(
      points={{-320,180},{399,180},{399,558.34},{910.964,558.34}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(VSupNor_flow.port_b, flexlabXRA.portsCell[2]) annotation (Line(points={{708,138},
          {708,222},{878,222},{878,517.54},{838.443,517.54}},           color={0,
          127,255}));
  connect(flexlabXRA.portsCell[2], dpRetDuc.port_a) annotation (Line(points={{838.443,
          517.54},{590,517.54},{590,140},{400,140}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-380,
            -400},{1420,600}}), graphics={Line(points={{310,404}}, color={28,
              108,200}), Line(
          points={{34,406}},
          color={0,127,255},
          smooth=Smooth.Bezier)}),
                                 Documentation(info="<html>
<p>
This model consist of an HVAC system, a building envelope model and a model
for air flow through building leakage and through open doors.
</p>
<p>
The HVAC system is a variable air volume (VAV) flow system with economizer
and a heating and cooling coil in the air handler unit. There is also a
reheat coil and an air damper in each of the five zone inlet branches.
The figure below shows the schematic diagram of the HVAC system
</p>
<p align=\"center\">
<img alt=\"image\" src=\"modelica://Buildings/Resources/Images/Examples/VAVReheat/vavSchematics.png\" border=\"1\"/>
</p>
<p>
Most of the HVAC control in this model is open loop.
Two models that extend this model, namely
<a href=\"modelica://Buildings.Examples.VAVReheat.ASHRAE2006\">
Buildings.Examples.VAVReheat.ASHRAE2006</a>
and
<a href=\"modelica://Buildings.Examples.VAVReheat.Guideline36\">
Buildings.Examples.VAVReheat.Guideline36</a>
add closed loop control. See these models for a description of
the control sequence.
</p>
<p>
To model the heat transfer through the building envelope,
a model of five interconnected rooms is used.
The five room model is representative of one floor of the
new construction medium office building for Chicago, IL,
as described in the set of DOE Commercial Building Benchmarks
(Deru et al, 2009). There are four perimeter zones and one core zone.
The envelope thermal properties meet ASHRAE Standard 90.1-2004.
The thermal room model computes transient heat conduction through
walls, floors and ceilings and long-wave radiative heat exchange between
surfaces. The convective heat transfer coefficient is computed based
on the temperature difference between the surface and the room air.
There is also a layer-by-layer short-wave radiation,
long-wave radiation, convection and conduction heat transfer model for the
windows. The model is similar to the
Window 5 model and described in TARCOG 2006.
</p>
<p>
Each thermal zone can have air flow from the HVAC system, through leakages of the building envelope (except for the core zone) and through bi-directional air exchange through open doors that connect adjacent zones. The bi-directional air exchange is modeled based on the differences in static pressure between adjacent rooms at a reference height plus the difference in static pressure across the door height as a function of the difference in air density.
Infiltration is a function of the
flow imbalance of the HVAC system.
</p>
<h4>References</h4>
<p>
Deru M., K. Field, D. Studer, K. Benne, B. Griffith, P. Torcellini,
 M. Halverson, D. Winiarski, B. Liu, M. Rosenberg, J. Huang, M. Yazdanian, and D. Crawley.
<i>DOE commercial building research benchmarks for commercial buildings</i>.
Technical report, U.S. Department of Energy, Energy Efficiency and
Renewable Energy, Office of Building Technologies, Washington, DC, 2009.
</p>
<p>
TARCOG 2006: Carli, Inc., TARCOG: Mathematical models for calculation
of thermal performance of glazing systems with our without
shading devices, Technical Report, Oct. 17, 2006.
</p>
</html>", revisions="<html>
<ul>
<li>
September 26, 2017, by Michael Wetter:<br/>
Separated physical model from control to facilitate implementation of alternate control
sequences.
</li>
<li>
May 19, 2016, by Michael Wetter:<br/>
Changed chilled water supply temperature to <i>6&circ;C</i>.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/509\">#509</a>.
</li>
<li>
April 26, 2016, by Michael Wetter:<br/>
Changed controller for freeze protection as the old implementation closed
the outdoor air damper during summer.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/511\">#511</a>.
</li>
<li>
January 22, 2016, by Michael Wetter:<br/>
Corrected type declaration of pressure difference.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/404\">#404</a>.
</li>
<li>
September 24, 2015 by Michael Wetter:<br/>
Set default temperature for medium to avoid conflicting
start values for alias variables of the temperature
of the building and the ambient air.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/426\">issue 426</a>.
</li>
</ul>
</html>"));
end PartialOpenLoopXRa;
