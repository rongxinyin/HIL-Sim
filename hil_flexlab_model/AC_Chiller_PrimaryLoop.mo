within hil_flexlab_model;
model AC_Chiller_PrimaryLoop
  "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

  package MediumA = Buildings.Media.Air "Medium model for air";
  package MediumW = Buildings.Media.Water "Medium model for water";
   parameter
    hil_flexlab_model.Data.AirCooled.ElectricEIRChiller_York_YCAL0019EE_54_2kW_2_9COP_None
    per     "Chiller performance data"
    annotation (Placement(transformation(extent={{216,-320},{232,-304}})));

    constant Real QCoo_flow_nominal=per.QEva_flow_nominal
    "constant Real mChiEva_flow_nominal=per.mEva_flow_nominal";
    constant Real mChiCon_flow_nominal=per.mCon_flow_nominal;



  parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
  parameter Modelica.SIunits.Temperature TSetSupAir=286.15;

parameter Modelica.SIunits.MassFlowRate mChiEva_flow_nominal=per.mEva_flow_nominal
    "Design mass flow rate of chiller";
parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
    "Design mass flow rate of secondary loop";


  Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=TSupChi_nominal)
    "Set point for chiller temperature"
    annotation (Placement(transformation(extent={{306,-306},{318,-294}})));
  Modelica.Blocks.Math.BooleanToReal booToInt(final realTrue=
        mChiEva_flow_nominal) "Boolean to integer conversion"
    annotation (Placement(transformation(extent={{276,-264},{286,-254}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pumChiWat(
    use_inputFilter=false,
    allowFlowReversal=false,
    redeclare package Medium = MediumW,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=mChiEva_flow_nominal,
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
        origin={309,-219})));
  Buildings.Fluid.Chillers.ElectricEIR chi(
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    redeclare package Medium1 = MediumA,
    redeclare package Medium2 = MediumW,
    m2_flow_nominal=mChiEva_flow_nominal,
    show_T=true,
    dp1_nominal=0,
     dp2_nominal=12E3,
    m1_flow_nominal=mChiCon_flow_nominal,
    per=per)
    "Air cooled chiller"
    annotation (Placement(transformation(extent={{240,-272},{224,-288}})));

  Buildings.Fluid.FixedResistances.Junction chw_sup(
    redeclare package Medium = MediumW,
    m_flow_nominal={mChiEva_flow_nominal + mSec_flow_nominal,-mSec_flow_nominal,
        mChiEva_flow_nominal},
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
    m_flow_nominal={mSec_flow_nominal,-(mChiEva_flow_nominal + mSec_flow_nominal),
        mChiEva_flow_nominal},
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
  Modelica.Blocks.Interfaces.RealInput mdot_chw_in annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={180,-98}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={162,-74})));
  Modelica.Blocks.Interfaces.RealOutput Tout annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={398,-90}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={354,-64})));
  Buildings.Fluid.Sources.MassFlowSource_T out_air(
    redeclare package Medium = MediumA,
    use_m_flow_in=false,
    m_flow=mChiCon_flow_nominal,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={402,-318})));
  Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={442,-322}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={410,-316})));
  Buildings.Fluid.Sources.Boundary_pT bou1(redeclare package Medium = MediumA,
      nPorts=1)
    annotation (Placement(transformation(extent={{126,-326},{146,-306}})));
equation

  connect(booToInt.y,pumChiWat. m_flow_in)
    annotation (Line(points={{286.5,-259},{300,-259},{300,-219},{298.2,-219}},
                                                  color={0,0,127}));
  connect(chi.port_b2, pumChiWat.port_a) annotation (Line(points={{240,-275.2},
          {309,-275.2},{309,-228}},
                             color={0,127,255}));
  connect(TSetSupChiConst.y, chi.TSet) annotation (Line(points={{318.6,-300},{
          338,-300},{338,-277.6},{241.6,-277.6}},
                                        color={0,0,127}));
  connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{309,-210},{
          308,-210},{308,-186}}, color={0,127,255}));
  connect(chw_ret.port_1, chi.port_a2) annotation (Line(points={{180,-186},{180,-280},
          {224,-280},{224,-275.2}}, color={0,127,255}));
  connect(chi.on, booToInt.u) annotation (Line(points={{241.6,-282.4},{257.8,-282.4},
          {257.8,-259},{275,-259}}, color={255,0,255}));
  connect(chw_sup.port_3, chw_ret.port_3)
    annotation (Line(points={{298,-176},{190,-176}}, color={0,127,255}));
  connect(chiOn, chi.on) annotation (Line(points={{258,-98},{258,-282.4},{241.6,-282.4}},
                  color={255,0,255}));
  connect(mdot_chw_in, sec_ret.m_flow_in) annotation (Line(points={{180,-98},{180,
          -128},{188,-128}}, color={0,0,127}));
  connect(T_chw_in, sec_ret.T_in) annotation (Line(points={{216,-98},{216,-128},{
          184,-128}}, color={0,0,127}));
  connect(senTem.port_b,bou. ports[1]) annotation (Line(points={{370,-136},{396,-136}},
                                        color={0,127,255}));
  connect(senTem.T,Tout)
    annotation (Line(points={{360,-125},{360,-106},{398,-106},{398,-90}},
                                                     color={0,0,127}));
  connect(sec_ret.ports[1], chw_ret.port_2)
    annotation (Line(points={{180,-150},{180,-166}}, color={0,127,255}));
  connect(chw_sup.port_1, senTem.port_a) annotation (Line(points={{308,-166},{308,
          -136},{350,-136}}, color={0,127,255}));
  connect(chi.port_a1, out_air.ports[1]) annotation (Line(points={{240,-284.8},{316,
          -284.8},{316,-318},{392,-318}}, color={0,127,255}));
  connect(chi.port_b1, bou1.ports[1]) annotation (Line(points={{224,-284.8},{186,
          -284.8},{186,-316},{146,-316}}, color={0,127,255}));
  connect(T_air_in, out_air.T_in)
    annotation (Line(points={{442,-322},{414,-322}}, color={0,0,127}));
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
end AC_Chiller_PrimaryLoop;
