within hil_flexlab_model;
model AC_AWHP_PrimaryLoop_addpts
  "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

  package MediumA = Buildings.Media.Air "Medium model for air";
  package MediumW = Buildings.Media.Water "Medium model for water";
  constant Modelica.Units.SI.MassFlowRate m_flow=0.4 "Nominal mass flow rate";


  parameter Modelica.Units.SI.Temperature TSupChi_nominal=281.15;
  parameter Modelica.Units.SI.Temperature TSetSupAir=286.15;


  parameter Modelica.Units.SI.MassFlowRate mSec_flow_nominal=0.33
    "Design mass flow rate of secondary loop";

  Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=TSupChi_nominal)
    "Set point for chiller temperature"
    annotation (Placement(transformation(extent={{130,-258},{142,-246}})));
  Modelica.Blocks.Math.BooleanToReal booToInt(final realTrue=
        m_flow) "Boolean to integer conversion"
    annotation (Placement(transformation(extent={{256,-202},{266,-192}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pumChiWat(
    use_inputFilter=false,
    allowFlowReversal=false,
    redeclare package Medium = MediumW,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow,
    addPowerToMedium=false,
    per(
      hydraulicEfficiency(eta={1}),
      motorEfficiency(eta={0.9}),
      motorCooledByFluid=false),
    dp_nominal=12000,
    inputType=Buildings.Fluid.Types.InputType.Continuous,
    nominalValuesDefineDefaultPressureCurve=true)
    "Pump for chilled water loop"
    annotation (
      Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={307,-221})));

  Buildings.Fluid.FixedResistances.Junction chw_sup(
    redeclare package Medium = MediumW,
    m_flow_nominal={m_flow + mSec_flow_nominal,-mSec_flow_nominal,
        m_flow},
    from_dp=true,
    linearized=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={308,-176})));
  Buildings.Fluid.FixedResistances.Junction chw_ret(
    redeclare package Medium = MediumW,
    m_flow_nominal={mSec_flow_nominal,-(m_flow + mSec_flow_nominal),
        m_flow},
    from_dp=true,
    linearized=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={180,-176})));
  Buildings.Fluid.Sources.MassFlowSource_T sec_ret(
    redeclare package Medium = MediumW,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={180,-140})));
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = MediumW,
      nPorts=1)                                                                                    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={406,-136})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
        Buildings.Media.Water, m_flow_nominal=mSec_flow_nominal)
    annotation (Placement(transformation(extent={{350,-146},{370,-126}})));
  Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=270,
        origin={258,-98}),  iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={110,-292})));
  Modelica.Blocks.Interfaces.RealInput T_chw_in annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={216,-98}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={230,-74})));
  Modelica.Blocks.Interfaces.RealInput m_flow_sec annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={180,-98}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={162,-74})));
  Modelica.Blocks.Interfaces.RealOutput T_chw_out annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={398,-90}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={358,-58})));
  Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={442,-322}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={410,-316})));
  Modelica.Blocks.Interfaces.RealOutput chi_P annotation (Placement(
        transformation(
        extent={{-22,-22},{22,22}},
        rotation=180,
        origin={80,-266}),  iconTransformation(
        extent={{-22,-22},{22,22}},
        rotation=270,
        origin={170,-342})));
  Modelica.Blocks.Interfaces.RealOutput pum_P annotation (Placement(
        transformation(extent={{412,-218},{450,-180}}), iconTransformation(
          extent={{412,-212},{450,-174}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
      Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
    annotation (Placement(transformation(extent={{186,-238},{206,-218}})));
  Modelica.Blocks.Interfaces.RealOutput T_pch_in annotation (Placement(
        transformation(
        extent={{-27,-27},{27,27}},
        rotation=180,
        origin={77,-217}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={86,-190})));
  Modelica.Blocks.Interfaces.RealOutput m_flow_pri annotation (Placement(
        transformation(extent={{416,-262},{454,-224}}), iconTransformation(
          extent={{412,-262},{450,-224}})));
   hil_flexlab_model.HeatPumps.BlackBox_Generic_TSetpoint AirWaterHP(
    tauHeatLoss=3600,
    QNom=10590,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=m_flow,
    modulation_min=16,
    modulation_start=25)
                        annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={228,-240})));
  Buildings.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={376,-292})));
  Modelica.Blocks.Interfaces.RealOutput chi_spd annotation (Placement(
        transformation(
        extent={{-22,-22},{22,22}},
        rotation=180,
        origin={80,-292}), iconTransformation(
        extent={{-22,-22},{22,22}},
        rotation=270,
        origin={120,-342})));
  Modelica.Blocks.Interfaces.RealOutput chi_COP annotation (Placement(
        transformation(
        extent={{-22,-22},{22,22}},
        rotation=180,
        origin={82,-326}), iconTransformation(
        extent={{-22,-22},{22,22}},
        rotation=270,
        origin={222,-342})));
equation

  connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{307,-212},
          {308,-212},{308,-186}},color={0,127,255}));
  connect(chw_sup.port_3, chw_ret.port_3)
    annotation (Line(points={{298,-176},{190,-176}}, color={0,127,255}));
  connect(m_flow_sec, sec_ret.m_flow_in) annotation (Line(points={{180,-98},{
          180,-128},{188,-128}}, color={0,0,127}));
  connect(T_chw_in, sec_ret.T_in) annotation (Line(points={{216,-98},{216,-128},{
          184,-128}}, color={0,0,127}));
  connect(senTem.port_b,bou. ports[1]) annotation (Line(points={{370,-136},{396,-136}},
                                        color={0,127,255}));
  connect(senTem.T, T_chw_out) annotation (Line(points={{360,-125},{360,-106},{
          398,-106},{398,-90}}, color={0,0,127}));
  connect(sec_ret.ports[1], chw_ret.port_2)
    annotation (Line(points={{180,-150},{180,-166}}, color={0,127,255}));
  connect(chw_sup.port_1, senTem.port_a) annotation (Line(points={{308,-166},{308,
          -136},{350,-136}}, color={0,127,255}));
  connect(pumChiWat.P, pum_P) annotation (Line(points={{298.9,-211.1},{431,-211.1},
          {431,-199}},         color={0,0,127}));
  connect(chw_ret.port_1, sen_retTem.port_a) annotation (Line(points={{180,-186},
          {180,-228},{186,-228}}, color={0,127,255}));
  connect(sen_retTem.T, T_pch_in)
    annotation (Line(points={{196,-217},{77,-217}}, color={0,0,127}));
  connect(T_chw_out, T_chw_out) annotation (Line(points={{398,-90},{398,-97},{
          398,-97},{398,-90}}, color={0,0,127}));
  connect(pumChiWat.m_flow_actual, m_flow_pri) annotation (Line(points={{302.5,-211.1},
          {361.25,-211.1},{361.25,-243},{435,-243}},         color={0,0,127}));
  connect(TSetSupChiConst.y, AirWaterHP.TSet) annotation (Line(points={{142.6,
          -252},{188,-252},{188,-246},{216,-246}}, color={0,0,127}));
  connect(T_air_in, AirWaterHP.TSource) annotation (Line(points={{442,-322},{
          230,-322},{230,-258.6},{228.8,-258.6}}, color={0,0,127}));
  connect(AirWaterHP.port_a, sen_retTem.port_b) annotation (Line(points={{234,
          -230},{220,-230},{220,-228},{206,-228}}, color={0,127,255}));
  connect(T_air_in, prescribedTemperature.T) annotation (Line(points={{442,-322},
          {418,-322},{418,-292},{388,-292}}, color={0,0,127}));
  connect(prescribedTemperature.port, AirWaterHP.heatPort) annotation (Line(
        points={{366,-292},{304,-292},{304,-240},{238,-240}}, color={191,0,0}));
  connect(booToInt.u, AirWaterHP.HP_On) annotation (Line(points={{255,-197},{255,
          -197.5},{220.4,-197.5},{220.4,-258.4}}, color={255,0,255}));
  connect(chi_spd, chi_spd)
    annotation (Line(points={{80,-292},{80,-292}}, color={0,0,127}));
  connect(chi_P, chi_P)
    annotation (Line(points={{80,-266},{80,-266}}, color={0,0,127}));
  connect(AirWaterHP.COP_HP, chi_COP) annotation (Line(points={{238,-249},{172,-249},
          {172,-326},{82,-326}}, color={0,0,127}));
  connect(AirWaterHP.Mod, chi_spd) annotation (Line(points={{238,-243},{170,-243},
          {170,-292},{80,-292}}, color={0,0,127}));
  connect(AirWaterHP.PEl, chi_P) annotation (Line(points={{238,-246},{172,-246},
          {172,-266},{80,-266}}, color={0,0,127}));
  connect(pumChiWat.port_a, AirWaterHP.port_b) annotation (Line(points={{307,-230},
          {264,-230},{264,-216},{222,-216},{222,-230}}, color={0,127,255}));
  connect(AirWaterHP.HP_On, chiOn) annotation (Line(points={{220.4,-258.4},{220.4,
          -184.2},{258,-184.2},{258,-98}}, color={255,0,255}));
  connect(pumChiWat.m_flow_in, booToInt.y) annotation (Line(points={{296.2,-221},
          {281.1,-221},{281.1,-197},{266.5,-197}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,-340},
            {420,-60}}),        graphics={Line(points={{310,404}}, color={28,
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
</html>"),
    Icon(coordinateSystem(extent={{100,-340},{420,-60}}), graphics={
        Rectangle(
          extent={{-70,80},{70,-80}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          origin={312,-216},
          rotation=360),
        Rectangle(
          extent={{-100.5,5},{100.5,-5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          origin={313.5,-157},
          rotation=360),
        Rectangle(
          extent={{-100.5,5},{100.5,-5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          origin={313.5,-277},
          rotation=360),
        Rectangle(
          extent={{-57,9},{57,-9}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={313,-157},
          rotation=360),
        Rectangle(
          extent={{-57,9},{57,-9}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={313,-277},
          rotation=360),
        Rectangle(
          extent={{-100.5,5},{100.5,-5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          origin={307.5,-157},
          rotation=360),
        Rectangle(
          extent={{-100.5,5},{100.5,-5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          origin={313.5,-275},
          rotation=360),
        Rectangle(
          extent={{-50,-5},{50,5}},
          lineColor={0,0,127},
          pattern=LinePattern.None,
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid,
          origin={368,-159},
          rotation=360),
        Polygon(
          points={{0,6},{-10,-6},{10,-6},{0,6}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={352,-218},
          rotation=360),
        Polygon(
          points={{0,-5},{-10,5},{10,5},{0,-5}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={352,-205},
          rotation=360),
        Rectangle(
          extent={{-2,20},{2,-20}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={270,-186},
          rotation=360),
        Rectangle(
          extent={{-2,20},{2,-20}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={270,-248},
          rotation=360),
        Rectangle(
          extent={{-2,51},{2,-51}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={352,-217},
          rotation=360),
        Ellipse(
          extent={{-16,16},{16,-16}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={270,-216},
          rotation=180),
        Polygon(
          points={{0,8},{-16,-8},{16,-8},{0,8}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          origin={270,-216},
          rotation=180),
        Rectangle(
          extent={{-50,-5},{50,5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          origin={270,-277},
          rotation=360)}));
end AC_AWHP_PrimaryLoop_addpts;
