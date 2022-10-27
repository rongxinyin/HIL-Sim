within hil_flexlab_model;
package Plants

  model AirCooledChiller_PrimaryLoop
   extends hil_flexlab_model.BaseClasses.Chiller_Prim_Loop;
   package MediumA = Buildings.Media.Air "Medium model for air";
    package MediumW = Buildings.Media.Water "Medium model for water";

    constant Real mChiEva_flow_nominal=1000*0.0095;

    Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}},
          rotation=270,
          origin={250,-120}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={190,-244})));
    Buildings.Fluid.Sources.MassFlowSource_T boundary(
      redeclare package Medium = MediumW,
      use_m_flow_in=true,
      use_T_in=true,
      nPorts=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={180,-152})));
    Modelica.Blocks.Interfaces.RealInput T_chw_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={220,-116})));
    Modelica.Blocks.Interfaces.RealInput m_chw_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={184,-116})));
    Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = MediumW,            nPorts=1) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={378,-164})));
    Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
          Buildings.Media.Water)
      annotation (Placement(transformation(extent={{332,-174},{352,-154}})));
    Modelica.Blocks.Interfaces.RealOutput Tout annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={342,-120})));
    Buildings.Fluid.Sources.MassFlowSource_T boundary1(
      redeclare package Medium = MediumA,
      use_m_flow_in=false,
      m_flow=mChiCon_flow_nominal,
      use_T_in=true,
      nPorts=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={380,-310})));
    Buildings.Fluid.Sources.Boundary_pT bou1(redeclare package Medium = MediumA, nPorts=1)
      annotation (Placement(transformation(extent={{184,-316},{204,-296}})));
    Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={420,-314})));
  equation
    connect(chiOn, chi.on) annotation (Line(points={{250,-120},{250,-282.4},{
            241.6,-282.4}},
                    color={255,0,255}));
    connect(booToInt.u, chi.on) annotation (Line(points={{275,-259},{377,-259},{
            377,-282.4},{241.6,-282.4}},
                               color={255,0,255}));
    connect(m_chw_in, boundary.m_flow_in) annotation (Line(points={{184,-116},{184,
            -140},{188,-140}},     color={0,0,127}));
    connect(T_chw_in, boundary.T_in) annotation (Line(points={{220,-116},{220,-140},
            {184,-140}},       color={0,0,127}));
    connect(senTem.port_b, bou.ports[1]) annotation (Line(points={{352,-164},{366,
            -164},{366,-164},{368,-164}}, color={0,127,255}));
    connect(senTem.T, Tout)
      annotation (Line(points={{342,-153},{342,-120}}, color={0,0,127}));
    connect(boundary1.ports[1], chi.port_a1) annotation (Line(points={{370,-310},
            {326,-310},{326,-284.8},{240,-284.8}}, color={0,127,255}));
    connect(boundary.ports[1], jun1.port_2)
      annotation (Line(points={{180,-162},{180,-166}}, color={0,127,255}));
    connect(jun.port_1, senTem.port_a)
      annotation (Line(points={{308,-164},{332,-164}}, color={0,127,255}));
    connect(chi.port_b1, bou1.ports[1]) annotation (Line(points={{224,-284.8},{
            214,-284.8},{214,-306},{204,-306}}, color={0,127,255}));
    connect(boundary1.T_in, T_air_in)
      annotation (Line(points={{392,-314},{420,-314}}, color={0,0,127}));
                                          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
              {180,-320},{400,-140}}), graphics={
          Rectangle(
            extent={{-70,80},{70,-80}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid,
            origin={286,-244},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={287.5,-185},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={287.5,-305},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={287,-185},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={287,-305},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={281.5,-185},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={287.5,-303},
            rotation=360),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,127},
            pattern=LinePattern.None,
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            origin={342,-187},
            rotation=360),
          Polygon(
            points={{0,6},{-10,-6},{10,-6},{0,6}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={326,-246},
            rotation=360),
          Polygon(
            points={{0,-5},{-10,5},{10,5},{0,-5}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={326,-233},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={244,-214},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={244,-276},
            rotation=360),
          Rectangle(
            extent={{-2,51},{2,-51}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={326,-245},
            rotation=360),
          Ellipse(
            extent={{-16,16},{16,-16}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={244,-244},
            rotation=180),
          Polygon(
            points={{0,8},{-16,-8},{16,-8},{0,8}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={244,-244},
            rotation=180),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={244,-305},
            rotation=360)}),                                                                             Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{180,-320},{400,
              -140}})));
  end AirCooledChiller_PrimaryLoop;

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
      annotation (Placement(transformation(extent={{264,-322},{276,-310}})));
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
      annotation (Placement(transformation(extent={{240,-270},{224,-286}})));

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
    connect(chi.port_b2, pumChiWat.port_a) annotation (Line(points={{240,-273.2},
            {309,-273.2},{309,-228}},
                               color={0,127,255}));
    connect(TSetSupChiConst.y, chi.TSet) annotation (Line(points={{276.6,-316},{
            338,-316},{338,-275.6},{241.6,-275.6}},
                                          color={0,0,127}));
    connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{309,-210},{
            308,-210},{308,-186}}, color={0,127,255}));
    connect(chw_ret.port_1, chi.port_a2) annotation (Line(points={{180,-186},{180,
            -280},{224,-280},{224,-273.2}},
                                      color={0,127,255}));
    connect(chi.on, booToInt.u) annotation (Line(points={{241.6,-280.4},{257.8,
            -280.4},{257.8,-259},{275,-259}},
                                      color={255,0,255}));
    connect(chw_sup.port_3, chw_ret.port_3)
      annotation (Line(points={{298,-176},{190,-176}}, color={0,127,255}));
    connect(chiOn, chi.on) annotation (Line(points={{258,-98},{258,-280.4},{241.6,
            -280.4}},
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
    connect(chi.port_a1, out_air.ports[1]) annotation (Line(points={{240,-282.8},
            {316,-282.8},{316,-318},{392,-318}},
                                            color={0,127,255}));
    connect(chi.port_b1, bou1.ports[1]) annotation (Line(points={{224,-282.8},{
            186,-282.8},{186,-316},{146,-316}},
                                            color={0,127,255}));
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
</html>",   revisions="<html>
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

  model AC_Chiller_PrimaryLoop_addpts
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
          origin={309,-221})));
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
      annotation (Placement(transformation(extent={{126,-324},{146,-304}})));
    Modelica.Blocks.Interfaces.RealOutput chi_P annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={80,-270}),  iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={170,-342})));
    Modelica.Blocks.Interfaces.RealOutput pum_P annotation (Placement(
          transformation(extent={{412,-218},{450,-180}}), iconTransformation(
            extent={{412,-212},{450,-174}})));
    Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
        Medium = Buildings.Media.Water, m_flow_nominal=mChiEva_flow_nominal)
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
  equation

    connect(booToInt.y,pumChiWat. m_flow_in)
      annotation (Line(points={{286.5,-259},{290,-259},{290,-221},{298.2,-221}},
                                                    color={0,0,127}));
    connect(chi.port_b2, pumChiWat.port_a) annotation (Line(points={{240,-275.2},
            {309,-275.2},{309,-230}},
                               color={0,127,255}));
    connect(TSetSupChiConst.y, chi.TSet) annotation (Line(points={{318.6,-300},{
            338,-300},{338,-277.6},{241.6,-277.6}},
                                          color={0,0,127}));
    connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{309,-212},
            {308,-212},{308,-186}},color={0,127,255}));
    connect(chi.on, booToInt.u) annotation (Line(points={{241.6,-282.4},{257.8,-282.4},
            {257.8,-259},{275,-259}}, color={255,0,255}));
    connect(chw_sup.port_3, chw_ret.port_3)
      annotation (Line(points={{298,-176},{190,-176}}, color={0,127,255}));
    connect(chiOn, chi.on) annotation (Line(points={{258,-98},{258,-282.4},{241.6,-282.4}},
                    color={255,0,255}));
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
    connect(chi.port_a1, out_air.ports[1]) annotation (Line(points={{240,-284.8},{316,
            -284.8},{316,-318},{392,-318}}, color={0,127,255}));
    connect(chi.port_b1, bou1.ports[1]) annotation (Line(points={{224,-284.8},{
            186,-284.8},{186,-314},{146,-314}},
                                            color={0,127,255}));
    connect(T_air_in, out_air.T_in)
      annotation (Line(points={{442,-322},{414,-322}}, color={0,0,127}));
    connect(chi.P, chi_P) annotation (Line(points={{223.2,-287.2},{80,-287.2},{80,
            -270}},     color={0,0,127}));
    connect(chw_ret.port_1, sen_retTem.port_a) annotation (Line(points={{180,-186},
            {180,-228},{186,-228}}, color={0,127,255}));
    connect(sen_retTem.port_b, chi.port_a2) annotation (Line(points={{206,-228},{
            212,-228},{212,-275.2},{224,-275.2}}, color={0,127,255}));
    connect(sen_retTem.T, T_pch_in)
      annotation (Line(points={{196,-217},{77,-217}}, color={0,0,127}));
    connect(T_chw_out, T_chw_out) annotation (Line(points={{398,-90},{398,-97},{
            398,-97},{398,-90}}, color={0,0,127}));
    connect(pumChiWat.m_flow_actual, m_flow_pri) annotation (Line(points={{304.5,
            -211.1},{361.25,-211.1},{361.25,-243},{435,-243}}, color={0,0,127}));
    connect(pumChiWat.P, pum_P) annotation (Line(points={{300.9,-211.1},{301.45,
            -211.1},{301.45,-199},{431,-199}}, color={0,0,127}));
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
</html>",   revisions="<html>
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
  end AC_Chiller_PrimaryLoop_addpts;

  model AC_AWHP_PrimaryLoop_addpts
    "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

    package MediumA = Buildings.Media.Air "Medium model for air";
    package MediumW = Buildings.Media.Water "Medium model for water";
      constant Modelica.SIunits.MassFlowRate m_flow=0.4
      "Nominal mass flow rate";

    parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
    parameter Modelica.SIunits.Temperature TSetSupAir=286.15;

  parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
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
</html>",   revisions="<html>
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

  model AC_AWHP_PrimaryLoop_addpts_wTES
    "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

    package MediumA = Buildings.Media.Air "Medium model for air";
    package MediumW = Buildings.Media.Water "Medium model for water";
      constant Modelica.SIunits.MassFlowRate m_flow=0.4
      "Nominal mass flow rate";

    parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
    parameter Modelica.SIunits.Temperature TSetSupAir=286.15;

  parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
      "Design mass flow rate of secondary loop";

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
          origin={308,-136})));
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
          origin={168,-136})));
    Buildings.Fluid.Sources.MassFlowSource_T sec_ret(
      redeclare package Medium = MediumW,
      use_m_flow_in=true,
      use_T_in=true,
      nPorts=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={168,-90})));
    Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = MediumW,
        nPorts=1)                                                                                    annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={408,-136})));
    Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
          Buildings.Media.Water, m_flow_nominal=mSec_flow_nominal)
      annotation (Placement(transformation(extent={{348,-106},{368,-86}})));
    Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}},
          rotation=270,
          origin={246,36}),   iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={80,-292})));
    Modelica.Blocks.Interfaces.RealInput T_chw_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={194,36}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={228,40})));
    Modelica.Blocks.Interfaces.RealInput m_flow_sec annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={120,38}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={152,40})));
    Modelica.Blocks.Interfaces.RealOutput T_chw_out annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={360,40}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={390,40})));
    Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={576,-322}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={580,-314})));
    Modelica.Blocks.Interfaces.RealOutput chi_P annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={76,-264}),  iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={168,-360})));
    Modelica.Blocks.Interfaces.RealOutput pum_P annotation (Placement(
          transformation(extent={{560,-216},{598,-178}}), iconTransformation(
            extent={{560,-210},{598,-172}})));
    Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
        Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
      annotation (Placement(transformation(extent={{-11,13},{11,-13}},
          rotation=270,
          origin={169,-181})));
    Modelica.Blocks.Interfaces.RealOutput T_pch_in annotation (Placement(
          transformation(
          extent={{-27,-27},{27,27}},
          rotation=180,
          origin={77,-217}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={78,-186})));
    Modelica.Blocks.Interfaces.RealOutput m_flow_pri annotation (Placement(
          transformation(extent={{560,-266},{598,-228}}), iconTransformation(
            extent={{560,-266},{598,-228}})));
    Modelica.Blocks.Interfaces.RealOutput chi_spd annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={78,-292}), iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={122,-360})));
    Modelica.Blocks.Interfaces.RealOutput chi_COP annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={78,-324}), iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={212,-360})));
    Plants.BaseClasses.BaseCoolingVarCOP coo annotation (Placement(
          transformation(
          extent={{-20,-56},{20,56}},
          rotation=90,
          origin={222,-240})));
    Plants.Controls.Plant_Controller plaCon
      annotation (Placement(transformation(extent={{252,-316},{304,-290}})));
    Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=TSupChi_nominal)
      "Set point for chiller temperature"
      annotation (Placement(transformation(extent={{198,-312},{210,-300}})));
  equation

    connect(chw_sup.port_3, chw_ret.port_3)
      annotation (Line(points={{298,-136},{178,-136}}, color={0,127,255}));
    connect(m_flow_sec, sec_ret.m_flow_in) annotation (Line(points={{120,38},{120,
            -78},{176,-78}},       color={0,0,127}));
    connect(T_chw_in, sec_ret.T_in) annotation (Line(points={{194,36},{194,-78},{
            172,-78}},  color={0,0,127}));
    connect(senTem.port_b,bou. ports[1]) annotation (Line(points={{368,-96},{
            384,-96},{384,-136},{398,-136}},
                                          color={0,127,255}));
    connect(senTem.T, T_chw_out) annotation (Line(points={{358,-85},{358,-22},{
            360,-22},{360,40}},   color={0,0,127}));
    connect(sec_ret.ports[1], chw_ret.port_2)
      annotation (Line(points={{168,-100},{168,-126}}, color={0,127,255}));
    connect(chw_sup.port_1, senTem.port_a) annotation (Line(points={{308,-126},
            {308,-96},{348,-96}},
                               color={0,127,255}));
    connect(chw_ret.port_1, sen_retTem.port_a) annotation (Line(points={{168,-146},
            {168,-170},{169,-170}}, color={0,127,255}));
    connect(sen_retTem.T, T_pch_in)
      annotation (Line(points={{154.7,-181},{114,-181},{114,-217},{77,-217}},
                                                      color={0,0,127}));
    connect(T_chw_out, T_chw_out) annotation (Line(points={{360,40},{360,40}},
                                 color={0,0,127}));
    connect(chi_spd, chi_spd)
      annotation (Line(points={{78,-292},{78,-292}}, color={0,0,127}));
    connect(chi_P, chi_P)
      annotation (Line(points={{76,-264},{76,-264}}, color={0,0,127}));
    connect(sen_retTem.port_b, coo.port_b) annotation (Line(points={{169,-192},
            {208,-192},{208,-220},{214.246,-220}},color={0,127,255}));
    connect(coo.port_a, chw_sup.port_2) annotation (Line(points={{234.923,-220},
            {234.923,-199},{308,-199},{308,-146}},color={0,127,255}));
    connect(coo.uTDryBul, T_air_in) annotation (Line(points={{171.169,-264},{
            169.584,-264},{169.584,-322},{576,-322}}, color={0,0,127}));
    connect(plant_Controller.yTES, coo.uTes) annotation (Line(points={{259.28,-286.7},
            {253.64,-286.7},{253.64,-264},{222,-264}}, color={0,0,127}));
    connect(TSetSupChiConst.y, coo.TSetASHP) annotation (Line(points={{210.6,
            -306},{210.6,-282},{191.846,-282},{191.846,-264}},
                                                         color={0,0,127}));
    connect(plant_Controller.yASHP, coo.uASHP) annotation (Line(points={{265.52,-286.7},
            {177.76,-286.7},{177.76,-264},{178.923,-264}}, color={0,0,127}));
    connect(plant_Controller.enaChi, chiOn) annotation (Line(points={{284.24,
            -316.08},{284.24,-314},{354,-314},{354,-160},{246,-160},{246,36}},
                                                                       color={255,
            0,255}));
    connect(senTem.T, plant_Controller.uTMea) annotation (Line(points={{358,-85},
            {358,-204},{322,-204},{322,-262},{287.08,-262},{287.08,-320.08}},
                                                           color={0,0,127}));
    connect(TSetSupChiConst.y, plant_Controller.uTSet) annotation (Line(points={{210.6,
            -306},{262,-306},{262,-315.95},{301.66,-315.95}}, color={0,0,127}));
    connect(senTem.T, plaCon.uTMea) annotation (Line(points={{358,-85},{358,
            -204},{322,-204},{322,-262},{286.32,-262},{286.32,-318.08}},
                                                                   color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,
              -340},{560,20}}),   graphics={Line(points={{310,404}}, color={28,
                108,200}), Line(
            points={{34,406}},
            color={0,127,255},
            smooth=Smooth.Bezier),
          Text(
            textString="Edit Here",
            extent={{192,-226},{260,-248}},
            lineColor={28,108,200})}),
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
</html>",   revisions="<html>
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
      Icon(coordinateSystem(extent={{100,-340},{560,20}}),  graphics={
          Rectangle(
            extent={{-70,80},{70,-80}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid,
            origin={208,-152},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-213},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-93},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-213},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={203.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={209.5,-211},
            rotation=360),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,127},
            pattern=LinePattern.None,
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            origin={264,-95},
            rotation=360),
          Polygon(
            points={{0,6},{-10,-6},{10,-6},{0,6}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-154},
            rotation=360),
          Polygon(
            points={{0,-5},{-10,5},{10,5},{0,-5}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-141},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-122},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-184},
            rotation=360),
          Rectangle(
            extent={{-2,51},{2,-51}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-153},
            rotation=360),
          Ellipse(
            extent={{-16,16},{16,-16}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Polygon(
            points={{0,8},{-16,-8},{16,-8},{0,8}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-213},
            rotation=360),
          Rectangle(
            extent={{318,-136},{328,-178}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{302,-152},{344,-160}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-76},{526,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{356,-151},{557,-161}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{492,-72},{496,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{416,-72},{420,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{454,-76},{458,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-152},{526,-158}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(extent={{100,20},{558,-338}}, lineColor={135,135,135})}));
  end AC_AWHP_PrimaryLoop_addpts_wTES;

  model AC_AWHP_PrimaryLoop_addpts_wTES_no_y_
    "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

    package MediumA = Buildings.Media.Air "Medium model for air";
    package MediumW = Buildings.Media.Water "Medium model for water";

    parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
    parameter Modelica.SIunits.Temperature TSetSupAir=286.15;
    constant Modelica.SIunits.MassFlowRate m_flow=0.4
      "Nominal mass flow rate";
    parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
      "Design mass flow rate of secondary loop";

    parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
    parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
    parameter Modelica.SIunits.Density d=1500 "Mass density of PCM";
    parameter Modelica.SIunits.Temperature TSol=273.15 + 29.5 "Solidus temperature of PCM.";
    parameter Modelica.SIunits.Temperature TLiq=273.15 + 29.66 "Liquidus temperature of PCM";
    parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";

    parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")=0
      "Nominal pressure raise, used for default pressure curve if not specified in record per";
    parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0) = 1000
      "Pressure drop of pipe and other resistances that are in series";
    parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0) = 1000
      "Nominal pressure drop of fully open valve";

    Buildings.Fluid.Sources.MassFlowSource_T sec_ret(
      redeclare package Medium = MediumW,
      use_m_flow_in=true,
      use_T_in=true,
      nPorts=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={158,-92})));
    Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = MediumW,
        nPorts=1)                                                                                    annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={458,-138})));
    Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
          Buildings.Media.Water, m_flow_nominal=mSec_flow_nominal)
      annotation (Placement(transformation(extent={{350,-106},{370,-86}})));
    Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}},
          rotation=270,
          origin={246,36}),   iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={80,-292})));
    Modelica.Blocks.Interfaces.RealInput T_chw_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={194,36}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={228,40})));
    Modelica.Blocks.Interfaces.RealInput m_flow_sec annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={120,38}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={152,40})));
    Modelica.Blocks.Interfaces.RealOutput T_chw_out annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={360,40}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={390,40})));
    Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={576,-322}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={580,-314})));
    hil_flexlab_model.Plants.Baseclasses_WH.Plant_Controller_weiping_062822
      plaCon(
      chargeStartMorn_CTes=casDat.chargeStartMorn_CTes,
      chargeEndMorn_CTes=casDat.chargeEndMorn_CTes,
      dischargeStart_CTes=casDat.dischargeStart_CTes,
      dischargeEnd_CTes=casDat.dischargeEnd_CTes,
      chargeStartNight_CTes=casDat.chargeStartNight_CTes,
      chargeEndNight_CTes=casDat.chargeEndNight_CTes,
      TSolCoo=casDat.TSolCoo,
      TLiqCoo=casDat.TLiqCoo)
      annotation (Placement(transformation(extent={{266,-306},{318,-280}})));
    Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
      "Set point for chiller temperature"
      annotation (Placement(transformation(extent={{180,-320},{192,-308}})));
    hil_flexlab_model.Plants.Baseclasses_WH.BaseCoolingVarCOP_noref coo(
      m_flow_nominal=casDat.mAWHP_flow_nominal + casDat.mTes_flow_nominal,
      k=casDat.kPCMCoo,
      c=casDat.cPCMCoo,
      d=casDat.dPCMCoo,
      TSol=casDat.TSolCoo,
      TLiq=casDat.TLiqCoo,
      LHea=casDat.LHeaCoo,
      Q_flow_nominal=casDat.QCoo_flow_nominal,
      mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,
      mTes_flow_nominal=casDat.mTes_flow_nominal,
      Tes_nominal=casDat.LTes_nominal,
      dp_nominal=casDat.dp_nominal,
      dpFixed_nominal=casDat.dpFixed_nominal,
      dpValve_nominal=casDat.dpValve_nominal) annotation (Placement(
          transformation(
          extent={{-16,49},{16,-49}},
          rotation=90,
          origin={237,-244})));

     hil_flexlab_model.Data.BBR_3C_Med casDat
      "Case study data"
      annotation (Placement(transformation(extent={{120,-310},{146,-336}})));

    Modelica.Blocks.Sources.Constant TSetSupChiConst1(final k=casDat.TSetSupCW)
      "Set point for chiller temperature"
      annotation (Placement(transformation(extent={{244,-346},{256,-334}})));
    Buildings.Fluid.FixedResistances.Junction chw_ret(
      redeclare package Medium = MediumW,
      m_flow_nominal={mSec_flow_nominal,-(m_flow + mSec_flow_nominal),m_flow},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={156,-140})));
    Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
        Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
      annotation (Placement(transformation(extent={{-11,13},{11,-13}},
          rotation=270,
          origin={155,-189})));
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
          origin={315,-209})));
    Modelica.Blocks.Math.BooleanToReal booToInt(final realTrue=m_flow)
                                "Boolean to integer conversion"
      annotation (Placement(transformation(extent={{278,-208},{288,-198}})));
    Buildings.Fluid.FixedResistances.Junction chw_sup(
      redeclare package Medium = MediumW,
      m_flow_nominal={m_flow + mSec_flow_nominal,-mSec_flow_nominal,m_flow},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={344,-138})));
      Modelica.Blocks.Sources.CombiTimeTable SchTes(
      table=[casDat.chargeStartMorn_CTes,0; casDat.chargeEndMorn_CTes,2; casDat.dischargeStart_CTes,
          1; casDat.dischargeEnd_CTes,2; casDat.chargeStartNight_CTes,0; casDat.chargeEndNight_CTes,
          0],
      smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
      extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
      "TES charging and discharging schedule"
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=0,
          origin={420,-290})));
  equation

    connect(senTem.port_b,bou. ports[1]) annotation (Line(points={{370,-96},{384,-96},
            {384,-138},{448,-138}},       color={0,127,255}));
    connect(T_chw_out, T_chw_out) annotation (Line(points={{360,40},{360,40}},
                                 color={0,0,127}));
    connect(coo.TSetASHP, TSetSupChiConst.y) annotation (Line(points={{263.385,
            -263.2},{263.385,-314},{192.6,-314}},
                                          color={0,0,127}));
    connect(coo.uASHP, plaCon.yASHP) annotation (Line(points={{274.692,-263.2},
            {274.692,-278.7},{279.52,-278.7}},
                                      color={0,0,127}));
    connect(plaCon.uTTes, coo.TTes) annotation (Line(points={{308.64,-308.08},{
            308,-308.08},{308,-318},{378,-318},{378,-226.4},{255.846,-226.4}},
                                                           color={0,0,127}));
    connect(plaCon.uTSet, TSetSupChiConst1.y) annotation (Line(points={{316.96,-308.08},
            {316.96,-320.04},{256.6,-320.04},{256.6,-340}},          color={0,0,
            127}));
    connect(coo.TSup, plaCon.uTMea) annotation (Line(points={{259.992,-226.4},{
            396,-226.4},{396,-334},{352,-334},{352,-330},{300,-330},{300,
            -308.08},{300.32,-308.08}},            color={0,0,127}));
    connect(T_air_in, coo.uTDryBul) annotation (Line(points={{576,-322},{374,
            -322},{374,-263.2},{281.854,-263.2}},
                                        color={0,0,127}));
    connect(plaCon.yTES, coo.uTes) annotation (Line(points={{268.6,-278.7},{242.3,
            -278.7},{242.3,-263.2},{237,-263.2}},
                                              color={0,0,127}));
    connect(sec_ret.T_in, T_chw_in) annotation (Line(points={{162,-80},{184,-80},{
            184,36},{194,36}}, color={0,0,127}));
    connect(m_flow_sec, sec_ret.m_flow_in) annotation (Line(points={{120,38},{148,
            38},{148,-80},{166,-80}}, color={0,0,127}));
    connect(plaCon.enaChi, chiOn) annotation (Line(points={{282.64,-308.08},{
            268,-308.08},{268,36},{246,36}},
                                color={255,0,255}));
    connect(senTem.T, T_chw_out)
      annotation (Line(points={{360,-85},{360,-85},{360,40}}, color={0,0,127}));
    connect(coo.port_b, pumChiWat.port_a) annotation (Line(points={{243.785,
            -228},{282,-228},{282,-220},{315,-220},{315,-218}},
                                                          color={0,127,255}));
    connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{315,-200},
            {344.5,-200},{344.5,-148},{344,-148}}, color={0,127,255}));
    connect(booToInt.y, pumChiWat.m_flow_in) annotation (Line(points={{288.5,-203},
            {291.25,-203},{291.25,-209},{304.2,-209}}, color={0,0,127}));
    connect(coo.port_a, sen_retTem.port_b) annotation (Line(points={{225.692,
            -228},{182,-228},{182,-200},{155,-200}},
                                               color={0,127,255}));
    connect(sen_retTem.port_a, chw_ret.port_1) annotation (Line(points={{155,-178},
            {155,-170},{156,-170},{156,-150}}, color={0,127,255}));
    connect(chw_ret.port_2, sec_ret.ports[1]) annotation (Line(points={{156,-130},
            {156,-102},{158,-102}}, color={0,127,255}));
    connect(chw_ret.port_3, chw_sup.port_3)
      annotation (Line(points={{166,-140},{260,-140},{260,-138},{334,-138}},
                                                       color={0,127,255}));
    connect(booToInt.u, chiOn) annotation (Line(points={{277,-203},{268,-203},{268,
            36},{246,36}}, color={255,0,255}));
    connect(senTem.port_a, chw_sup.port_1) annotation (Line(points={{350,-96},{348,
            -96},{348,-128},{344,-128}}, color={0,127,255}));
    connect(SchTes.y[1], plaCon.uSch) annotation (Line(points={{409,-290},{364,
            -290},{364,-302.88},{322.16,-302.88}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,
              -340},{560,20}}),   graphics={Line(points={{310,404}}, color={28,
                108,200}), Line(
            points={{34,406}},
            color={0,127,255},
            smooth=Smooth.Bezier),
          Text(
            textString="Edit Here",
            extent={{192,-226},{260,-248}},
            lineColor={28,108,200})}),
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
</html>",   revisions="<html>
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
      Icon(coordinateSystem(extent={{100,-340},{560,20}}),  graphics={
          Rectangle(
            extent={{-70,80},{70,-80}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid,
            origin={208,-152},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-213},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-93},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-213},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={203.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={209.5,-211},
            rotation=360),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,127},
            pattern=LinePattern.None,
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            origin={264,-95},
            rotation=360),
          Polygon(
            points={{0,6},{-10,-6},{10,-6},{0,6}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-154},
            rotation=360),
          Polygon(
            points={{0,-5},{-10,5},{10,5},{0,-5}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-141},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-122},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-184},
            rotation=360),
          Rectangle(
            extent={{-2,51},{2,-51}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-153},
            rotation=360),
          Ellipse(
            extent={{-16,16},{16,-16}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Polygon(
            points={{0,8},{-16,-8},{16,-8},{0,8}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-213},
            rotation=360),
          Rectangle(
            extent={{318,-136},{328,-178}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{302,-152},{344,-160}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-76},{526,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{356,-151},{557,-161}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{492,-72},{496,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{416,-72},{420,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{454,-76},{458,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-152},{526,-158}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(extent={{100,20},{558,-338}}, lineColor={135,135,135})}));
  end AC_AWHP_PrimaryLoop_addpts_wTES_no_y_;

  model AC_AWHP_PrimaryLoop_addpts_wTES_3SP
    "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

    package MediumA = Buildings.Media.Air "Medium model for air";
    package MediumW = Buildings.Media.Water "Medium model for water";
    package MediumG = Buildings.Media.Antifreeze.PropyleneGlycolWater(property_T=283.15, X_a=0.09) "Medium model for 9% prop glycol mix with water";
      constant Modelica.SIunits.MassFlowRate m_flow=0.4
      "Nominal mass flow rate";

    parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
    parameter Modelica.SIunits.Temperature TSetSupAir=286.15;

  parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
      "Design mass flow rate of secondary loop";

    Buildings.Fluid.FixedResistances.Junction chw_sup(
      redeclare package Medium = MediumG,
      m_flow_nominal={m_flow + mSec_flow_nominal,-mSec_flow_nominal,
          m_flow},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={308,-136})));
    Buildings.Fluid.FixedResistances.Junction chw_ret(
      redeclare package Medium = MediumG,
      m_flow_nominal={mSec_flow_nominal,-(m_flow + mSec_flow_nominal),
          m_flow},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={168,-136})));
    Buildings.Fluid.Sources.MassFlowSource_T sec_ret(
      redeclare package Medium = MediumG,
      use_m_flow_in=true,
      use_T_in=true,
      nPorts=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={168,-90})));
    Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = MediumG,
        nPorts=1)                                                                                    annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={408,-136})));
    Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
          MediumG, m_flow_nominal=mSec_flow_nominal)
      annotation (Placement(transformation(extent={{348,-106},{368,-86}})));
    Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}},
          rotation=270,
          origin={246,36}),   iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={80,-292})));
    Modelica.Blocks.Interfaces.RealInput T_chw_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={194,36}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={228,40})));
    Modelica.Blocks.Interfaces.RealInput m_flow_sec annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={120,38}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={152,40})));
    Modelica.Blocks.Interfaces.RealOutput T_chw_out annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={360,40}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={390,40})));
    Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={598,-320}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={602,-390})));
    Modelica.Blocks.Interfaces.RealOutput chi_P annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={76,-264}),  iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={162,-446})));
    Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
        Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
      annotation (Placement(transformation(extent={{-11,13},{11,-13}},
          rotation=270,
          origin={169,-181})));
    Modelica.Blocks.Interfaces.RealOutput T_pch_in annotation (Placement(
          transformation(
          extent={{-27,-27},{27,27}},
          rotation=180,
          origin={77,-217}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={78,-186})));
    Modelica.Blocks.Interfaces.RealOutput chi_COP annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={78,-296}), iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={234,-440})));
    hil_flexlab_model.Plants.Baseclasses_WH.BaseCoolingVarCOP_3SP coo( m_flow_nominal=casDat.mAWHP_flow_nominal + casDat.mTes_flow_nominal,
      k=casDat.kPCMCoo,
      c=casDat.cPCMCoo,
      d=casDat.dPCMCoo,
      TSol=casDat.TSolCoo,
      TLiq=casDat.TLiqCoo,
      LHea=casDat.LHeaCoo,
      Q_flow_nominal=casDat.QCoo_flow_nominal,
      mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,
      mTes_flow_nominal=casDat.mTes_flow_nominal,
      Tes_nominal=casDat.LTes_nominal,
      dp_nominal=casDat.dp_nominal,
      dpFixed_nominal=casDat.dpFixed_nominal,
      dpValve_nominal=casDat.dpValve_nominal) annotation (Placement(
          transformation(
          extent={{-20,-56},{20,56}},
          rotation=90,
          origin={222,-240})));
    hil_flexlab_model.Plants.Baseclasses_WH.Plant_Controller_3SP plaCon(TSolCoo=casDat.TSolCoo, TLiqCoo=casDat.TLiqCoo)
      annotation (Placement(transformation(extent={{252,-316},{304,-290}})));
    Modelica.Blocks.Math.BooleanToReal booToInt(final realTrue=m_flow)
                                "Boolean to integer conversion"
      annotation (Placement(transformation(extent={{252,-188},{262,-178}})));
    Buildings.Fluid.Movers.FlowControlled_m_flow pumChiWat(
      use_inputFilter=false,
      allowFlowReversal=false,
      redeclare package Medium = MediumG,
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
          origin={299,-183})));
    RTUPCM.HVAC.Plants.BaseClasses.ChargeControlSOC
                                        chaConCoo(
      QTes=casDat.CTes_nominal,
      m_flow_nominal=casDat.mTes_flow_nominal,
      TSup=casDat.TSolCoo - 4,
      TTes=casDat.TSolCoo,
      dt=(casDat.chargeEndNight_CTes - casDat.chargeStartNight_CTes) + (casDat.chargeEndMorn_CTes
           - casDat.chargeStartMorn_CTes)) "Charge controller for cooling"
      annotation (Placement(transformation(extent={{542,-400},{522,-380}})));
    Modelica.Blocks.Sources.Constant TSetSupChiConst1(final k=casDat.TSetSupCW)
      "Set point for chiller temperature"
      annotation (Placement(transformation(extent={{454,-394},{466,-382}})));
    Modelica.Blocks.Interfaces.RealInput TES_Mode annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={602,-406}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={604,-334})));


     hil_flexlab_model.Data.BBR_3C_Med_downsized casDat
      "Case study data"
      annotation (Placement(transformation(extent={{110,-250},{134,-274}})));

    Modelica.Blocks.Interfaces.RealOutput tes_SOC annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={78,-338}), iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={234,-440})));
  equation

    connect(chw_sup.port_3, chw_ret.port_3)
      annotation (Line(points={{298,-136},{178,-136}}, color={0,127,255}));
    connect(m_flow_sec, sec_ret.m_flow_in) annotation (Line(points={{120,38},{120,
            -78},{176,-78}},       color={0,0,127}));
    connect(T_chw_in, sec_ret.T_in) annotation (Line(points={{194,36},{194,-78},{
            172,-78}},  color={0,0,127}));
    connect(senTem.port_b,bou. ports[1]) annotation (Line(points={{368,-96},{384,-96},
            {384,-136},{398,-136}},       color={0,127,255}));
    connect(senTem.T, T_chw_out) annotation (Line(points={{358,-85},{358,-22},{360,
            -22},{360,40}},       color={0,0,127}));
    connect(sec_ret.ports[1], chw_ret.port_2)
      annotation (Line(points={{168,-100},{168,-126}}, color={0,127,255}));
    connect(chw_sup.port_1, senTem.port_a) annotation (Line(points={{308,-126},{308,
            -96},{348,-96}},   color={0,127,255}));
    connect(chw_ret.port_1, sen_retTem.port_a) annotation (Line(points={{168,-146},
            {168,-170},{169,-170}}, color={0,127,255}));
    connect(sen_retTem.T, T_pch_in)
      annotation (Line(points={{154.7,-181},{114,-181},{114,-217},{77,-217}},
                                                      color={0,0,127}));
    connect(T_chw_out, T_chw_out) annotation (Line(points={{360,40},{360,40}},
                                 color={0,0,127}));
    connect(chi_P, chi_P)
      annotation (Line(points={{76,-264},{76,-264}}, color={0,0,127}));
    connect(sen_retTem.port_b, coo.port_b) annotation (Line(points={{169,-192},
            {208,-192},{208,-220},{214.246,-220}},color={0,127,255}));
    connect(coo.uTDryBul, T_air_in) annotation (Line(points={{170.738,-264},{
            169.584,-264},{169.584,-320},{598,-320}}, color={0,0,127}));
    connect(plaCon.yTES, coo.uTes) annotation (Line(points={{253.625,-288.7},{253.64,
            -288.7},{253.64,-264},{222,-264}},         color={0,0,127}));
    connect(plaCon.yASHP, coo.uASHP) annotation (Line(points={{260.45,-288.7},{
            177.76,-288.7},{177.76,-264},{178.923,-264}},  color={0,0,127}));
    connect(plaCon.enaChi, chiOn) annotation (Line(points={{262.4,-318.08},{262.4,
            -314},{354,-314},{354,-160},{246,-160},{246,36}},          color={255,
            0,255}));
    connect(senTem.T, plaCon.uTMea) annotation (Line(points={{358,-85},{358,-204},
            {322,-204},{322,-262},{273.45,-262},{273.45,-318.08}},
                                                           color={0,0,127}));
    connect(senTem.T, plaCon.uTMea) annotation (Line(points={{358,-85},{358,-204},
            {322,-204},{322,-262},{273.45,-262},{273.45,-318.08}}, color={0,0,127}));
    connect(coo.PEle, chi_P) annotation (Line(points={{166,-218},{132,-218},{132,-264},
            {76,-264}}, color={0,0,127}));
    connect(plaCon.yPum,booToInt. u) annotation (Line(points={{263.7,-288.7},{263.7,
            -243.25},{251,-243.25},{251,-183}},        color={255,0,255}));
    connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{299,-174},
            {304,-174},{304,-146},{308,-146}}, color={0,127,255}));
    connect(pumChiWat.m_flow_in, booToInt.y) annotation (Line(points={{288.2,-183},
            {274.1,-183},{274.1,-183},{262.5,-183}}, color={0,0,127}));
    connect(pumChiWat.port_a, coo.port_a) annotation (Line(points={{299,-192},{
            268,-192},{268,-220},{234.923,-220}},
                                              color={0,127,255}));
    connect(coo.COP_HP, chi_COP) annotation (Line(points={{171.6,-218},{134,
            -218},{134,-296},{78,-296}},
                                   color={0,0,127}));
    connect(plaCon.uChaCon,chaConCoo. y) annotation (Line(points={{267.925,-318.08},
            {267.925,-390},{521,-390}},        color={0,0,127}));
    connect(coo.SOC,chaConCoo. SOC) annotation (Line(points={{222,-218},{222,-278},
            {578,-278},{578,-390},{544,-390}},       color={0,0,127}));
    connect(plaCon.uTSet,TSetSupChiConst1. y) annotation (Line(points={{283.85,
            -318.08},{283.85,-370.04},{466.6,-370.04},{466.6,-388}}, color={0,0,
            127}));
    connect(TES_Mode, plaCon.uSch) annotation (Line(points={{602,-406},{458,-406},
            {458,-312.62},{306.925,-312.62}}, color={0,0,127}));
    connect(plaCon.yenaCha, chaConCoo.enaCha) annotation (Line(points={{266.625,-288.7},
            {407.312,-288.7},{407.312,-382},{544,-382}}, color={255,0,255}));
    connect(coo.TRet, plaCon.uTRet) annotation (Line(points={{208.215,-218},{
            244,-218},{244,-318.08},{278.65,-318.08}},
                                             color={0,0,127}));
    connect(coo.TTes, plaCon.uTTes) annotation (Line(points={{200.462,-218},{
            240,-218},{240,-318.08},{278.65,-318.08}},
                                             color={0,0,127}));
    connect(coo.SOC, tes_SOC) annotation (Line(points={{222,-218},{162,-218},{
            162,-338},{78,-338}}, color={0,0,127}));
    connect(plaCon.yTSet, coo.TSetASHP) annotation (Line(points={{257.525,
            -288.7},{224.762,-288.7},{224.762,-264},{191.846,-264}}, color={0,0,
            127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,-420},
              {580,20}}),         graphics={Line(points={{310,404}}, color={28,
                108,200}), Line(
            points={{34,406}},
            color={0,127,255},
            smooth=Smooth.Bezier),
          Text(
            textString="Edit Here",
            extent={{192,-226},{260,-248}},
            lineColor={28,108,200})}),
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
</html>",   revisions="<html>
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
      Icon(coordinateSystem(extent={{100,-420},{580,20}}),  graphics={
          Rectangle(
            extent={{-70,80},{70,-80}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid,
            origin={208,-152},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-213},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-93},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-213},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={203.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={209.5,-211},
            rotation=360),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,127},
            pattern=LinePattern.None,
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            origin={264,-95},
            rotation=360),
          Polygon(
            points={{0,6},{-10,-6},{10,-6},{0,6}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-154},
            rotation=360),
          Polygon(
            points={{0,-5},{-10,5},{10,5},{0,-5}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-141},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-122},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-184},
            rotation=360),
          Rectangle(
            extent={{-2,51},{2,-51}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-153},
            rotation=360),
          Ellipse(
            extent={{-16,16},{16,-16}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Polygon(
            points={{0,8},{-16,-8},{16,-8},{0,8}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-213},
            rotation=360),
          Rectangle(
            extent={{318,-136},{328,-178}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{302,-152},{344,-160}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-76},{526,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{356,-151},{557,-161}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{492,-72},{496,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{416,-72},{420,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{454,-76},{458,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-152},{526,-158}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(extent={{108,-4},{566,-362}}, lineColor={135,135,135})}));
  end AC_AWHP_PrimaryLoop_addpts_wTES_3SP;

  model AC_AWHP_PrimaryLoop_addpts_wTES_3SP_noprim
    "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

    package MediumA = Buildings.Media.Air "Medium model for air";
    package MediumW = Buildings.Media.Water "Medium model for water";
    package MediumG = Buildings.Media.Antifreeze.PropyleneGlycolWater(property_T=283.15, X_a=0.09) "Medium model for 9% prop glycol mix with water";
      constant Modelica.SIunits.MassFlowRate m_flow=0.4
      "Nominal mass flow rate";

    parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
    parameter Modelica.SIunits.Temperature TSetSupAir=286.15;

  parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
      "Design mass flow rate of secondary loop";
    parameter Modelica.SIunits.Power QCoo_flow_nominal = 2166.0 "Design cooling capacity" annotation(Dialog(group="Climate Data"));
    parameter Modelica.SIunits.Energy CTes_nominal = 27190800.0 "Design cold storage capacity (factor * 1kWh)" annotation(Dialog(group="Climate Data"));
    parameter Modelica.SIunits.TemperatureDifference dTCoo = 11-9 "Inlet temperature difference in cold TES rack" annotation(Dialog(group="System Specifications"));

    parameter Modelica.SIunits.DimensionlessRatio CTesScale = CTes_nominal/130000 "Scale factor for cold TES prototype size" annotation(Dialog(group="Climate Data"));
    parameter Modelica.SIunits.MassFlowRate mAWHP_flow_nominal = QCoo_flow_nominal/(4201*dTCoo) "Design water flowrate of cooling system" annotation(Dialog(group="System Specifications"));
    parameter Modelica.SIunits.MassFlowRate mTes_flow_nominal = mAWHP_flow_nominal "Design water flowrate through TES" annotation(Dialog(group="System Specifications"));
    parameter Modelica.SIunits.Temperature T_start_pcm = casDat.TSolCoo - 2 "start temp to calc SOC";
    Buildings.Fluid.Sources.MassFlowSource_T sec_ret(
      redeclare package Medium = MediumG,
      use_m_flow_in=true,
      use_T_in=true,
      nPorts=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={168,-90})));
    Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = MediumG,
        nPorts=1)                                                                                    annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={408,-136})));
    Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
          MediumG, m_flow_nominal=mSec_flow_nominal)
      annotation (Placement(transformation(extent={{348,-106},{368,-86}})));
    Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}},
          rotation=270,
          origin={246,36}),   iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={80,-292})));
    Modelica.Blocks.Interfaces.RealInput T_chw_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={194,36}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={228,40})));
    Modelica.Blocks.Interfaces.RealInput m_flow_sec annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={120,38}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={152,40})));
    Modelica.Blocks.Interfaces.RealOutput T_chw_out annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={360,40}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={390,40})));
    Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={598,-320}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={602,-390})));
    Modelica.Blocks.Interfaces.RealOutput chi_P annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={76,-206}),  iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={162,-446})));
    Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
        Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
      annotation (Placement(transformation(extent={{-11,13},{11,-13}},
          rotation=270,
          origin={169,-181})));
    Modelica.Blocks.Interfaces.RealOutput T_pch_in annotation (Placement(
          transformation(
          extent={{-24,-24},{24,24}},
          rotation=180,
          origin={76,-162}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={78,-186})));
    Modelica.Blocks.Interfaces.RealOutput chi_COP annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={78,-244}), iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={234,-440})));
    hil_flexlab_model.Plants.Baseclasses_WH.BaseCoolingVarCOP_3SP coo( m_flow_nominal=mAWHP_flow_nominal + mTes_flow_nominal,
      k=casDat.kPCMCoo,
      c=casDat.cPCMCoo,
      d=casDat.dPCMCoo,
      TSol=casDat.TSolCoo,
      TLiq=casDat.TLiqCoo,
      LHea=casDat.LHeaCoo,
      Q_flow_nominal=QCoo_flow_nominal,
      mAWHP_flow_nominal=mAWHP_flow_nominal,
      mTes_flow_nominal=mTes_flow_nominal,
      Tes_nominal=CTes_nominal,
      dp_nominal=casDat.dp_nominal,
      dpFixed_nominal=casDat.dpFixed_nominal,
      dpValve_nominal=casDat.dpValve_nominal,
      T_start=T_start_pcm) annotation (Placement(
          transformation(
          extent={{-23,63},{23,-63}},
          rotation=90,
          origin={229,-241})));
    hil_flexlab_model.Plants.Baseclasses_WH.Plant_Controller_3SP plaCon(TSolCoo=casDat.TSolCoo, TLiqCoo=casDat.TLiqCoo)
      annotation (Placement(transformation(extent={{252,-316},{304,-290}})));
    RTUPCM.HVAC.Plants.BaseClasses.ChargeControlSOC
                                        chaConCoo(
      QTes=CTes_nominal,
      m_flow_nominal=mTes_flow_nominal,
      TSup=casDat.TSolCoo - 4,
      TTes=casDat.TSolCoo,
      dt=(casDat.chargeEndNight_CTes - casDat.chargeStartNight_CTes) + (casDat.chargeEndMorn_CTes
           - casDat.chargeStartMorn_CTes)) "Charge controller for cooling"
      annotation (Placement(transformation(extent={{542,-400},{522,-380}})));
    Modelica.Blocks.Sources.Constant TSetSupChiConst1(final k=273.15 + 8)
      "Set point for chiller temperature"
      annotation (Placement(transformation(extent={{454,-394},{466,-382}})));
    Modelica.Blocks.Interfaces.RealInput TES_Mode annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={602,-406}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={604,-334})));

     hil_flexlab_model.Data.BBR_3C_Med_downsized casDat
      "Case study data"
      annotation (Placement(transformation(extent={{110,-250},{134,-274}})));

    Modelica.Blocks.Interfaces.RealOutput tes_SOC annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={78,-280}), iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={234,-440})));
    Modelica.Blocks.Interfaces.RealOutput y_TSet annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={78,-310}), iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={234,-440})));
    Modelica.Blocks.Interfaces.RealOutput tes_uPCM annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={78,-344}), iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={234,-440})));
    Modelica.Blocks.Interfaces.RealOutput tes_mPCM annotation (Placement(
          transformation(
          extent={{-22,-22},{22,22}},
          rotation=180,
          origin={78,-378}), iconTransformation(
          extent={{-22,-22},{22,22}},
          rotation=270,
          origin={234,-440})));
  equation

    connect(m_flow_sec, sec_ret.m_flow_in) annotation (Line(points={{120,38},{120,
            -78},{176,-78}},       color={0,0,127}));
    connect(T_chw_in, sec_ret.T_in) annotation (Line(points={{194,36},{194,-78},{
            172,-78}},  color={0,0,127}));
    connect(senTem.port_b,bou. ports[1]) annotation (Line(points={{368,-96},{384,-96},
            {384,-136},{398,-136}},       color={0,127,255}));
    connect(senTem.T, T_chw_out) annotation (Line(points={{358,-85},{358,-22},{360,
            -22},{360,40}},       color={0,0,127}));
    connect(sen_retTem.T, T_pch_in)
      annotation (Line(points={{154.7,-181},{116,-181},{116,-162},{76,-162}},
                                                      color={0,0,127}));
    connect(T_chw_out, T_chw_out) annotation (Line(points={{360,40},{360,40}},
                                 color={0,0,127}));
    connect(chi_P, chi_P)
      annotation (Line(points={{76,-206},{76,-206}}, color={0,0,127}));
    connect(coo.uTDryBul, T_air_in) annotation (Line(points={{286.669,-268.6},{
            169.584,-268.6},{169.584,-320},{598,-320}},
                                                      color={0,0,127}));
    connect(plaCon.yTES, coo.uTes) annotation (Line(points={{253.625,-288.7},{191.64,
            -288.7},{191.64,-268.6},{229,-268.6}},     color={0,0,127}));
    connect(plaCon.yASHP, coo.uASHP) annotation (Line(points={{260.45,-288.7},{
            177.76,-288.7},{177.76,-268.6},{277.462,-268.6}},
                                                           color={0,0,127}));
    connect(plaCon.enaChi, chiOn) annotation (Line(points={{262.4,-318.08},{262.4,
            -314},{354,-314},{354,-160},{246,-160},{246,36}},          color={255,
            0,255}));
    connect(senTem.T, plaCon.uTMea) annotation (Line(points={{358,-85},{358,-204},
            {322,-204},{322,-262},{273.45,-262},{273.45,-318.08}},
                                                           color={0,0,127}));
    connect(senTem.T, plaCon.uTMea) annotation (Line(points={{358,-85},{358,-204},
            {322,-204},{322,-262},{273.45,-262},{273.45,-318.08}}, color={0,0,127}));
    connect(coo.PEle, chi_P) annotation (Line(points={{292,-215.7},{132,-215.7},{132,
            -206},{76,-206}},
                        color={0,0,127}));
    connect(coo.COP_HP, chi_COP) annotation (Line(points={{285.7,-215.7},{134,-215.7},
            {134,-244},{78,-244}}, color={0,0,127}));
    connect(plaCon.uChaCon,chaConCoo. y) annotation (Line(points={{267.925,-318.08},
            {267.925,-390},{521,-390}},        color={0,0,127}));
    connect(coo.SOC,chaConCoo. SOC) annotation (Line(points={{229,-215.7},{229,-278},
            {578,-278},{578,-390},{544,-390}},       color={0,0,127}));
    connect(plaCon.uTSet,TSetSupChiConst1. y) annotation (Line(points={{283.85,-318.08},
            {283.85,-368.04},{466.6,-368.04},{466.6,-388}},          color={0,0,
            127}));
    connect(TES_Mode, plaCon.uSch) annotation (Line(points={{602,-406},{458,
            -406},{458,-312.62},{306.925,-312.62}},
                                              color={0,0,127}));
    connect(plaCon.yenaCha, chaConCoo.enaCha) annotation (Line(points={{266.625,-288.7},
            {407.312,-288.7},{407.312,-382},{544,-382}}, color={255,0,255}));
    connect(coo.TRet, plaCon.uTRet) annotation (Line(points={{244.508,-215.7},{
            244,-215.7},{244,-318.08},{278.65,-318.08}},
                                             color={0,0,127}));
    connect(coo.TTes, plaCon.uTTes) annotation (Line(points={{253.231,-215.7},{
            240,-215.7},{240,-318.08},{278.65,-318.08}},
                                             color={0,0,127}));
    connect(coo.SOC, tes_SOC) annotation (Line(points={{229,-215.7},{162,-215.7},{
            162,-280},{78,-280}}, color={0,0,127}));
    connect(sec_ret.ports[1], sen_retTem.port_a) annotation (Line(points={{168,
            -100},{168,-170},{169,-170}},            color={0,127,255}));
    connect(plaCon.yTSet, coo.TSetASHP) annotation (Line(points={{257.525,
            -288.7},{221.762,-288.7},{221.762,-268.6},{262.923,-268.6}},
                                                                     color={0,0,
            127}));
    connect(plaCon.yTSet, y_TSet) annotation (Line(points={{257.525,-288.7},{178.762,
            -288.7},{178.762,-310},{78,-310}}, color={0,0,127}));
    connect(sen_retTem.port_b, coo.port_a) annotation (Line(points={{169,-192},
            {203.5,-192},{203.5,-218},{214.462,-218}}, color={0,127,255}));
    connect(senTem.port_a, coo.port_b) annotation (Line(points={{348,-96},{284,
            -96},{284,-218},{237.723,-218}}, color={0,127,255}));
    connect(tes_uPCM, coo.out_uPCM) annotation (Line(points={{78,-344},{154,
            -344},{154,-215.7},{225.608,-215.7}},
                                            color={0,0,127}));
    connect(coo.out_mPCM, tes_mPCM) annotation (Line(points={{221.731,-215.7},{
            221.731,-377.85},{78,-377.85},{78,-378}},
                                              color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,-420},
              {580,20}}),         graphics={Line(points={{310,404}}, color={28,
                108,200}), Line(
            points={{34,406}},
            color={0,127,255},
            smooth=Smooth.Bezier),
          Text(
            textString="Edit Here",
            extent={{192,-226},{260,-248}},
            lineColor={28,108,200})}),
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
</html>",   revisions="<html>
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
      Icon(coordinateSystem(extent={{100,-420},{580,20}}),  graphics={
          Rectangle(
            extent={{-70,80},{70,-80}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid,
            origin={208,-152},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-213},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-93},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-213},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={203.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={209.5,-211},
            rotation=360),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,127},
            pattern=LinePattern.None,
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            origin={264,-95},
            rotation=360),
          Polygon(
            points={{0,6},{-10,-6},{10,-6},{0,6}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-154},
            rotation=360),
          Polygon(
            points={{0,-5},{-10,5},{10,5},{0,-5}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-141},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-122},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-184},
            rotation=360),
          Rectangle(
            extent={{-2,51},{2,-51}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-153},
            rotation=360),
          Ellipse(
            extent={{-16,16},{16,-16}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Polygon(
            points={{0,8},{-16,-8},{16,-8},{0,8}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-213},
            rotation=360),
          Rectangle(
            extent={{318,-136},{328,-178}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{302,-152},{344,-160}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-76},{526,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{356,-151},{557,-161}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{492,-72},{496,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{416,-72},{420,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{454,-76},{458,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-152},{526,-158}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(extent={{108,-4},{566,-362}}, lineColor={135,135,135})}));
  end AC_AWHP_PrimaryLoop_addpts_wTES_3SP_noprim;

  model AC_AWHP_wTES_ports
    "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

    package MediumA = Buildings.Media.Air "Medium model for air";
    package MediumW = Buildings.Media.Water "Medium model for water";

    parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
    parameter Modelica.SIunits.Temperature TSetSupAir=286.15;
    constant Modelica.SIunits.MassFlowRate m_flow=0.4
      "Nominal mass flow rate";
    parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
      "Design mass flow rate of secondary loop";

    parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
    parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
    parameter Modelica.SIunits.Density d=1500 "Mass density of PCM";
    parameter Modelica.SIunits.Temperature TSol=273.15 + 29.5 "Solidus temperature of PCM.";
    parameter Modelica.SIunits.Temperature TLiq=273.15 + 29.66 " Liquidus temperature of PCM";
    parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";

    parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")=0
      "Nominal pressure raise, used for default pressure curve if not specified in record per";
    parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0) = 1000
      "Pressure drop of pipe and other resistances that are in series";
    parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0) = 1000
      "Nominal pressure drop of fully open valve";

    Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={576,-274}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={580,-314})));
    hil_flexlab_model.Plants.Baseclasses_WH.Plant_Controller_weiping_062822
      plaCon(TSolCoo=casDat.TSolCoo, TLiqCoo=casDat.TLiqCoo)
      annotation (Placement(transformation(extent={{270,-222},{322,-192}})));
    Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
      "Set point for chiller temperature"
      annotation (Placement(transformation(extent={{184,-236},{196,-224}})));
    hil_flexlab_model.Plants.Baseclasses_WH.BaseCoolingVarCOP_weiping_062822
      coo(
      m_flow_nominal=casDat.mAWHP_flow_nominal + casDat.mTes_flow_nominal,
      k=casDat.kPCMCoo,
      c=casDat.cPCMCoo,
      d=casDat.dPCMCoo,
      TSol=casDat.TSolCoo,
      TLiq=casDat.TLiqCoo,
      LHea=casDat.LHeaCoo,
      Q_flow_nominal=casDat.QCoo_flow_nominal,
      mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,
      mTes_flow_nominal=casDat.mTes_flow_nominal,
      Tes_nominal=casDat.LTes_nominal,
      dp_nominal=casDat.dp_nominal,
      dpFixed_nominal=casDat.dpFixed_nominal,
      dpValve_nominal=casDat.dpValve_nominal) annotation (Placement(
          transformation(
          extent={{-16,49},{16,-49}},
          rotation=90,
          origin={241,-160})));

     hil_flexlab_model.Data.BBR_3C_Med_downsized casDat
      "Case study data"
      annotation (Placement(transformation(extent={{110,-250},{134,-274}})));

    Modelica.Blocks.Sources.Constant TSetSupChiConst1(final k=casDat.TSetSupCW)
      "Set point for chiller temperature"
      annotation (Placement(transformation(extent={{248,-262},{260,-250}})));
    Buildings.Fluid.FixedResistances.Junction chw_ret(
      redeclare package Medium = MediumW,
      m_flow_nominal={mSec_flow_nominal,-(m_flow + mSec_flow_nominal),m_flow},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={166,-50})));
    Buildings.Fluid.FixedResistances.Junction chw_sup(
      redeclare package Medium = MediumW,
      m_flow_nominal={m_flow + mSec_flow_nominal,-mSec_flow_nominal,m_flow},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={396,-46})));
    Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
        Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
      annotation (Placement(transformation(extent={{-11,13},{11,-13}},
          rotation=270,
          origin={167,-99})));
    Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}},
          rotation=270,
          origin={278,38}),   iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={76,-214})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
          MediumW) "Fluid connector b (supply from source)"
      annotation (Placement(transformation(extent={{366,-30},{416,20}}),
          iconTransformation(extent={{366,-30},{416,20}})));
    Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
          MediumW) "Fluid connector a (return to source)"
      annotation (Placement(transformation(extent={{146,4},{196,50}}),
          iconTransformation(extent={{218,-30},{270,20}})));
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
          origin={339,-115})));
    Modelica.Blocks.Math.BooleanToReal booToInt(final realTrue=m_flow)
                                "Boolean to integer conversion"
      annotation (Placement(transformation(extent={{294,-114},{304,-104}})));
      Modelica.Blocks.Sources.CombiTimeTable SchTes(
      table=[casDat.chargeStartMorn_CTes,0; casDat.chargeEndMorn_CTes,2; casDat.dischargeStart_CTes,1;
          casDat.dischargeEnd_CTes,2; casDat.chargeStartNight_CTes,0; casDat.chargeEndNight_CTes,0],
      smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
      extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
      "TES charging and discharging schedule"
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=0,
          origin={356,-204})));

    RTUPCM.HVAC.Plants.BaseClasses.ChargeControlSOC
                                        chaConCoo(
      QTes=casDat.CTes_nominal,
      m_flow_nominal=casDat.mTes_flow_nominal,
      TSup=casDat.TSolCoo - 4,
      TTes=casDat.TSolCoo,
      dt=(casDat.chargeEndNight_CTes - casDat.chargeStartNight_CTes) + (casDat.chargeEndMorn_CTes
           - casDat.chargeStartMorn_CTes)) "Charge controller for cooling"
      annotation (Placement(transformation(extent={{334,-268},{314,-248}})));
  equation

    connect(coo.TSetASHP, TSetSupChiConst.y) annotation (Line(points={{267.385,
            -179.2},{267.385,-230},{196.6,-230}},
                                          color={0,0,127}));
    connect(coo.uASHP, plaCon.yASHP) annotation (Line(points={{278.692,-179.2},
            {278.692,-190.5},{283.52,-190.5}},
                                      color={0,0,127}));
    connect(plaCon.uTTes, coo.TTes) annotation (Line(points={{312.64,-224.4},{
            324,-224.4},{324,-236},{394,-236},{394,-142.4},{259.846,-142.4}},
                                                           color={0,0,127}));
    connect(plaCon.uTSet, TSetSupChiConst1.y) annotation (Line(points={{320.96,-224.4},
            {320.96,-236.04},{260.6,-236.04},{260.6,-256}},          color={0,0,
            127}));
    connect(T_air_in, coo.uTDryBul) annotation (Line(points={{576,-274},{378,
            -274},{378,-179.2},{285.854,-179.2}},
                                        color={0,0,127}));
    connect(plaCon.yTES, coo.uTes) annotation (Line(points={{272.6,-190.5},{
            248.3,-190.5},{248.3,-179.2},{241,-179.2}},
                                              color={0,0,127}));
    connect(sen_retTem.port_a,chw_ret. port_1) annotation (Line(points={{167,-88},
            {167,-67},{166,-67},{166,-60}},    color={0,127,255}));
    connect(chw_sup.port_3,chw_ret. port_3)
      annotation (Line(points={{386,-46},{352,-46},{352,-50},{176,-50}},
                                                       color={0,127,255}));
    connect(sen_retTem.port_b, coo.port_a) annotation (Line(points={{167,-110},
            {168,-110},{168,-144},{229.692,-144}},
                                              color={0,127,255}));
    connect(chw_sup.port_1, port_b) annotation (Line(points={{396,-36},{396,9.5},{
            391,9.5},{391,-5}},
                            color={0,127,255}));
    connect(chw_ret.port_2, port_a) annotation (Line(points={{166,-40},{166,7.5},{
            171,7.5},{171,27}},
                            color={0,127,255}));
    connect(plaCon.enaChi, chiOn) annotation (Line(points={{286.64,-224.4},{442,
            -224.4},{442,38},{278,38}},
                                color={255,0,255}));
    connect(port_b, port_b) annotation (Line(points={{391,-5},{392,-5},{392,-6},{389,
            -6},{391,-6},{391,-5}}, color={0,127,255}));
    connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{339,-106},
            {367.5,-106},{367.5,-56},{396,-56}}, color={0,127,255}));
    connect(pumChiWat.port_a, coo.port_b) annotation (Line(points={{339,-124},{
            294,-124},{294,-144},{247.785,-144}},
                                              color={0,127,255}));
    connect(booToInt.y, pumChiWat.m_flow_in) annotation (Line(points={{304.5,-109},
            {317.25,-109},{317.25,-115},{328.2,-115}}, color={0,0,127}));
    connect(SchTes.y[1], plaCon.uSch) annotation (Line(points={{345,-204},{338,-204},
            {338,-218.4},{326.16,-218.4}}, color={0,0,127}));
    connect(coo.TSup, plaCon.uTMea) annotation (Line(points={{263.992,-142.4},{
            263.992,-184.2},{304.32,-184.2},{304.32,-224.4}}, color={0,0,127}));
    connect(plaCon.yPum, booToInt.u) annotation (Line(points={{288.72,-190.5},{
            288.72,-151.25},{293,-151.25},{293,-109}}, color={255,0,255}));
    connect(plaCon.yenaCha, chaConCoo.enaCha) annotation (Line(points={{293.4,
            -190.5},{293.4,-216.25},{336,-216.25},{336,-250}}, color={255,0,255}));
    connect(coo.SOC, chaConCoo.SOC) annotation (Line(points={{241,-142.4},{241,
            -146},{370,-146},{370,-258},{336,-258}}, color={0,0,127}));
    connect(plaCon.uChaCon, chaConCoo.y) annotation (Line(points={{295.48,
            -224.4},{295.48,-258},{313,-258}}, color={0,0,127}));
    connect(coo.TRet, plaCon.uTRet) annotation (Line(points={{253.062,-142.4},{
            253.062,-184.2},{312.64,-184.2},{312.64,-224.4}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,-280},
              {560,20}}),         graphics={Line(points={{310,404}}, color={28,
                108,200}), Line(
            points={{34,406}},
            color={0,127,255},
            smooth=Smooth.Bezier),
          Text(
            textString="Edit Here",
            extent={{196,-142},{264,-164}},
            lineColor={28,108,200})}),
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
</html>",   revisions="<html>
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
      Icon(coordinateSystem(extent={{100,-280},{560,20}}),  graphics={
          Rectangle(
            extent={{-70,80},{70,-80}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid,
            origin={208,-152},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-213},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-93},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-213},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={203.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={209.5,-211},
            rotation=360),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,127},
            pattern=LinePattern.None,
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            origin={264,-95},
            rotation=360),
          Polygon(
            points={{0,6},{-10,-6},{10,-6},{0,6}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-154},
            rotation=360),
          Polygon(
            points={{0,-5},{-10,5},{10,5},{0,-5}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-141},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-122},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-184},
            rotation=360),
          Rectangle(
            extent={{-2,51},{2,-51}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-153},
            rotation=360),
          Ellipse(
            extent={{-16,16},{16,-16}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Polygon(
            points={{0,8},{-16,-8},{16,-8},{0,8}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-213},
            rotation=360),
          Rectangle(
            extent={{318,-136},{328,-178}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{302,-152},{344,-160}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-76},{526,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{356,-151},{557,-161}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{492,-72},{496,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{416,-72},{420,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{454,-76},{458,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-152},{526,-158}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(extent={{100,20},{558,-338}}, lineColor={135,135,135})}));
  end AC_AWHP_wTES_ports;

  model AC_AWHP_wTES_ports_3SP
    "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

    package MediumA = Buildings.Media.Air "Medium model for air";
    package MediumW = Buildings.Media.Water "Medium model for water";

    parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
    parameter Modelica.SIunits.Temperature TSetSupAir=286.15;
    constant Modelica.SIunits.MassFlowRate m_flow=0.4
      "Nominal mass flow rate";
    parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
      "Design mass flow rate of secondary loop";

    parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
    parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
    parameter Modelica.SIunits.Density d=1500 "Mass density of PCM";
    parameter Modelica.SIunits.Temperature TSol=273.15 + 29.5 "Solidus temperature of PCM.";
    parameter Modelica.SIunits.Temperature TLiq=273.15 + 29.66 " Liquidus temperature of PCM";
    parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";

    parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")=0
      "Nominal pressure raise, used for default pressure curve if not specified in record per";
    parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0) = 1000
      "Pressure drop of pipe and other resistances that are in series";
    parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0) = 1000
      "Nominal pressure drop of fully open valve";

    Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={576,-274}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={580,-314})));
    hil_flexlab_model.Plants.Baseclasses_WH.Plant_Controller_3SP
      plaCon(TSolCoo=casDat.TSolCoo, TLiqCoo=casDat.TLiqCoo)
      annotation (Placement(transformation(extent={{270,-222},{322,-192}})));
    hil_flexlab_model.Plants.Baseclasses_WH.BaseCoolingVarCOP_weiping_062822
      coo(
      m_flow_nominal=casDat.mAWHP_flow_nominal + casDat.mTes_flow_nominal,
      k=casDat.kPCMCoo,
      c=casDat.cPCMCoo,
      d=casDat.dPCMCoo,
      TSol=casDat.TSolCoo,
      TLiq=casDat.TLiqCoo,
      LHea=casDat.LHeaCoo,
      Q_flow_nominal=casDat.QCoo_flow_nominal,
      mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,
      mTes_flow_nominal=casDat.mTes_flow_nominal,
      Tes_nominal=casDat.LTes_nominal,
      dp_nominal=casDat.dp_nominal,
      dpFixed_nominal=casDat.dpFixed_nominal,
      dpValve_nominal=casDat.dpValve_nominal) annotation (Placement(
          transformation(
          extent={{-16,49},{16,-49}},
          rotation=90,
          origin={241,-160})));

     hil_flexlab_model.Data.BBR_3C_Med_downsized casDat
      "Case study data"
      annotation (Placement(transformation(extent={{110,-250},{134,-274}})));

    Modelica.Blocks.Sources.Constant TSetSupChiConst1(final k=casDat.TSetSupCW)
      "Set point for chiller temperature"
      annotation (Placement(transformation(extent={{248,-262},{260,-250}})));
    Buildings.Fluid.FixedResistances.Junction chw_ret(
      redeclare package Medium = MediumW,
      m_flow_nominal={mSec_flow_nominal,-(m_flow + mSec_flow_nominal),m_flow},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={166,-50})));
    Buildings.Fluid.FixedResistances.Junction chw_sup(
      redeclare package Medium = MediumW,
      m_flow_nominal={m_flow + mSec_flow_nominal,-mSec_flow_nominal,m_flow},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={396,-56})));
    Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
        Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
      annotation (Placement(transformation(extent={{-11,13},{11,-13}},
          rotation=270,
          origin={167,-99})));
    Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}},
          rotation=270,
          origin={278,38}),   iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={76,-214})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
          MediumW) "Fluid connector b (supply from source)"
      annotation (Placement(transformation(extent={{366,-30},{416,20}}),
          iconTransformation(extent={{366,-30},{416,20}})));
    Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
          MediumW) "Fluid connector a (return to source)"
      annotation (Placement(transformation(extent={{146,4},{196,50}}),
          iconTransformation(extent={{218,-30},{270,20}})));
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
          origin={339,-115})));
    Modelica.Blocks.Math.BooleanToReal booToInt(final realTrue=m_flow)
                                "Boolean to integer conversion"
      annotation (Placement(transformation(extent={{294,-114},{304,-104}})));
      Modelica.Blocks.Sources.CombiTimeTable SchTes(
      table=[casDat.chargeStartMorn_CTes,0; casDat.chargeEndMorn_CTes,2; casDat.dischargeStart_CTes,1;
          casDat.dischargeEnd_CTes,2; casDat.chargeStartNight_CTes,0; casDat.chargeEndNight_CTes,0],
      smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
      extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
      "TES charging and discharging schedule"
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=0,
          origin={356,-204})));

    RTUPCM.HVAC.Plants.BaseClasses.ChargeControlSOC
                                        chaConCoo(
      QTes=casDat.CTes_nominal,
      m_flow_nominal=casDat.mTes_flow_nominal,
      TSup=casDat.TSolCoo - 4,
      TTes=casDat.TSolCoo,
      dt=(casDat.chargeEndNight_CTes - casDat.chargeStartNight_CTes) + (casDat.chargeEndMorn_CTes
           - casDat.chargeStartMorn_CTes)) "Charge controller for cooling"
      annotation (Placement(transformation(extent={{336,-268},{316,-248}})));
    Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
          Buildings.Media.Water, m_flow_nominal=mSec_flow_nominal)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=270,
          origin={396,-32})));
  equation

    connect(coo.uASHP, plaCon.yASHP) annotation (Line(points={{278.692,-179.2},
            {278.692,-190.5},{278.45,-190.5}},
                                      color={0,0,127}));
    connect(plaCon.uTTes, coo.TTes) annotation (Line(points={{296.65,-224.4},{
            324,-224.4},{324,-236},{394,-236},{394,-142.4},{259.846,-142.4}},
                                                           color={0,0,127}));
    connect(plaCon.uTSet, TSetSupChiConst1.y) annotation (Line(points={{301.85,
            -224.4},{301.85,-236.04},{260.6,-236.04},{260.6,-256}},  color={0,0,
            127}));
    connect(T_air_in, coo.uTDryBul) annotation (Line(points={{576,-274},{378,
            -274},{378,-179.2},{285.854,-179.2}},
                                        color={0,0,127}));
    connect(plaCon.yTES, coo.uTes) annotation (Line(points={{271.625,-190.5},{
            248.3,-190.5},{248.3,-179.2},{241,-179.2}},
                                              color={0,0,127}));
    connect(sen_retTem.port_a,chw_ret. port_1) annotation (Line(points={{167,-88},
            {167,-67},{166,-67},{166,-60}},    color={0,127,255}));
    connect(chw_sup.port_3,chw_ret. port_3)
      annotation (Line(points={{386,-56},{282,-56},{282,-50},{176,-50}},
                                                       color={0,127,255}));
    connect(sen_retTem.port_b, coo.port_a) annotation (Line(points={{167,-110},
            {168,-110},{168,-144},{229.692,-144}},
                                              color={0,127,255}));
    connect(chw_ret.port_2, port_a) annotation (Line(points={{166,-40},{166,7.5},{
            171,7.5},{171,27}},
                            color={0,127,255}));
    connect(plaCon.enaChi, chiOn) annotation (Line(points={{280.4,-224.4},{442,
            -224.4},{442,38},{278,38}},
                                color={255,0,255}));
    connect(port_b, port_b) annotation (Line(points={{391,-5},{392,-5},{392,-6},{389,
            -6},{391,-6},{391,-5}}, color={0,127,255}));
    connect(pumChiWat.port_a, coo.port_b) annotation (Line(points={{339,-124},{
            294,-124},{294,-144},{247.785,-144}},
                                              color={0,127,255}));
    connect(booToInt.y, pumChiWat.m_flow_in) annotation (Line(points={{304.5,-109},
            {317.25,-109},{317.25,-115},{328.2,-115}}, color={0,0,127}));
    connect(SchTes.y[1], plaCon.uSch) annotation (Line(points={{345,-204},{338,
            -204},{338,-218.1},{324.925,-218.1}},
                                           color={0,0,127}));
    connect(coo.TSup, plaCon.uTMea) annotation (Line(points={{263.992,-142.4},{
            263.992,-184.2},{291.45,-184.2},{291.45,-224.4}}, color={0,0,127}));
    connect(plaCon.yPum, booToInt.u) annotation (Line(points={{281.7,-190.5},{
            281.7,-151.25},{293,-151.25},{293,-109}},  color={255,0,255}));
    connect(plaCon.yenaCha, chaConCoo.enaCha) annotation (Line(points={{284.625,
            -190.5},{284.625,-216.25},{338,-216.25},{338,-250}},
                                                               color={255,0,255}));
    connect(coo.SOC, chaConCoo.SOC) annotation (Line(points={{241,-142.4},{241,
            -146},{372,-146},{372,-258},{338,-258}}, color={0,0,127}));
    connect(plaCon.uChaCon, chaConCoo.y) annotation (Line(points={{285.925,
            -224.4},{285.925,-258},{315,-258}},color={0,0,127}));
    connect(coo.TRet, plaCon.uTRet) annotation (Line(points={{253.062,-142.4},{
            253.062,-184.2},{296.65,-184.2},{296.65,-224.4}}, color={0,0,127}));
    connect(coo.TSetASHP, plaCon.yTSet) annotation (Line(points={{267.385,
            -179.2},{267.385,-186.6},{275.525,-186.6},{275.525,-190.5}}, color=
            {0,0,127}));
    connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{339,
            -106},{367.5,-106},{367.5,-66},{396,-66}}, color={0,127,255}));
    connect(chw_sup.port_1, senTem.port_b)
      annotation (Line(points={{396,-46},{396,-42}}, color={0,127,255}));
    connect(senTem.port_a, port_b) annotation (Line(points={{396,-22},{396,9.5},
            {391,9.5},{391,-5}}, color={0,127,255}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,-280},
              {560,20}}),         graphics={Line(points={{310,404}}, color={28,
                108,200}), Line(
            points={{34,406}},
            color={0,127,255},
            smooth=Smooth.Bezier),
          Text(
            textString="Edit Here",
            extent={{196,-142},{264,-164}},
            lineColor={28,108,200})}),
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
</html>",   revisions="<html>
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
      Icon(coordinateSystem(extent={{100,-280},{560,20}}),  graphics={
          Rectangle(
            extent={{-70,80},{70,-80}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid,
            origin={208,-152},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-213},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-93},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-213},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={203.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={209.5,-211},
            rotation=360),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,127},
            pattern=LinePattern.None,
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            origin={264,-95},
            rotation=360),
          Polygon(
            points={{0,6},{-10,-6},{10,-6},{0,6}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-154},
            rotation=360),
          Polygon(
            points={{0,-5},{-10,5},{10,5},{0,-5}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-141},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-122},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-184},
            rotation=360),
          Rectangle(
            extent={{-2,51},{2,-51}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-153},
            rotation=360),
          Ellipse(
            extent={{-16,16},{16,-16}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Polygon(
            points={{0,8},{-16,-8},{16,-8},{0,8}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-213},
            rotation=360),
          Rectangle(
            extent={{318,-136},{328,-178}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{302,-152},{344,-160}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-76},{526,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{356,-151},{557,-161}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{492,-72},{496,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{416,-72},{420,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{454,-76},{458,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-152},{526,-158}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(extent={{100,20},{558,-338}}, lineColor={135,135,135})}));
  end AC_AWHP_wTES_ports_3SP;

  model AC_AWHP_wTES_ports_3SP_noprim
    "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

    package MediumA = Buildings.Media.Air "Medium model for air";
    package MediumW = Buildings.Media.Water "Medium model for water";
    package MediumG = Buildings.Media.Antifreeze.PropyleneGlycolWater(property_T=283.15, X_a=0.09) "Medium model for 9% prop glycol mix with water";

    parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
    parameter Modelica.SIunits.Temperature TSetSupAir=286.15;
    constant Modelica.SIunits.MassFlowRate m_flow=0.4
      "Nominal mass flow rate";
    parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
      "Design mass flow rate of secondary loop";

    parameter Modelica.SIunits.Power QCoo_flow_nominal = 3040.0 "Design cooling capacity" annotation(Dialog(group="Climate Data"));
    parameter Modelica.SIunits.Energy CTes_nominal = 52344000.0 "Design cold storage capacity (factor * 1kWh)" annotation(Dialog(group="Climate Data"));
    parameter Modelica.SIunits.TemperatureDifference dTCoo = 11-9 "Inlet temperature difference in cold TES rack" annotation(Dialog(group="System Specifications"));

    parameter Modelica.SIunits.DimensionlessRatio CTesScale = CTes_nominal/130000 "Scale factor for cold TES prototype size" annotation(Dialog(group="Climate Data"));
    parameter Modelica.SIunits.MassFlowRate mAWHP_flow_nominal = QCoo_flow_nominal/(4201*dTCoo) "Design water flowrate of cooling system" annotation(Dialog(group="System Specifications"));
    parameter Modelica.SIunits.MassFlowRate mTes_flow_nominal = mAWHP_flow_nominal "Design water flowrate through TES" annotation(Dialog(group="System Specifications"));


    parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
    parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
    parameter Modelica.SIunits.Density d=1500 "Mass density of PCM";
    parameter Modelica.SIunits.Temperature TSol=273.15 + 29.5 "Solidus temperature of PCM.";
    parameter Modelica.SIunits.Temperature TLiq=273.15 + 29.66 " Liquidus temperature of PCM";
    parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";

    parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")=0
      "Nominal pressure raise, used for default pressure curve if not specified in record per";
    parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0) = 1000
      "Pressure drop of pipe and other resistances that are in series";
    parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0) = 1000
      "Nominal pressure drop of fully open valve";

    Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={576,-274}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={580,-314})));
    hil_flexlab_model.Plants.Baseclasses_WH.Plant_Controller_3SP
      plaCon(TSolCoo=casDat.TSolCoo, TLiqCoo=casDat.TLiqCoo)
      annotation (Placement(transformation(extent={{270,-222},{322,-192}})));
    hil_flexlab_model.Plants.Baseclasses_WH.BaseCoolingVarCOP_weiping_062822
      coo(
      m_flow_nominal=mAWHP_flow_nominal + mTes_flow_nominal,
      k=casDat.kPCMCoo,
      c=casDat.cPCMCoo,
      d=casDat.dPCMCoo,
      TSol=casDat.TSolCoo,
      TLiq=casDat.TLiqCoo,
      LHea=casDat.LHeaCoo,
      Q_flow_nominal=QCoo_flow_nominal,
      mAWHP_flow_nominal=mAWHP_flow_nominal,
      mTes_flow_nominal=mTes_flow_nominal,
      Tes_nominal=CTes_nominal,
      dp_nominal=casDat.dp_nominal,
      dpFixed_nominal=casDat.dpFixed_nominal,
      dpValve_nominal=casDat.dpValve_nominal) annotation (Placement(
          transformation(
          extent={{-16,49},{16,-49}},
          rotation=90,
          origin={241,-160})));

     hil_flexlab_model.Data.BBR_3C_Med_downsized casDat
      "Case study data"
      annotation (Placement(transformation(extent={{110,-250},{134,-274}})));

    Modelica.Blocks.Sources.Constant TSetSupChiConst1(final k=273.15 + 8)
      "Set point for chiller temperature"
      annotation (Placement(transformation(extent={{248,-262},{260,-250}})));
    Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
        Medium = MediumG, m_flow_nominal=m_flow)
      annotation (Placement(transformation(extent={{-11,13},{11,-13}},
          rotation=270,
          origin={167,-99})));
    Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}},
          rotation=270,
          origin={278,38}),   iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={76,-214})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
          MediumG) "Fluid connector b (supply from source)"
      annotation (Placement(transformation(extent={{366,-30},{416,20}}),
          iconTransformation(extent={{366,-30},{416,20}})));
    Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
          MediumG) "Fluid connector a (return to source)"
      annotation (Placement(transformation(extent={{146,4},{196,50}}),
          iconTransformation(extent={{218,-30},{270,20}})));
      Modelica.Blocks.Sources.CombiTimeTable SchTes(
      table=[casDat.chargeStartMorn_CTes,0; casDat.chargeEndMorn_CTes,2; casDat.dischargeStart_CTes,1;
          casDat.dischargeEnd_CTes,2; casDat.chargeStartNight_CTes,0; casDat.chargeEndNight_CTes,0],
      smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
      extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
      "TES charging and discharging schedule"
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=0,
          origin={356,-204})));

    RTUPCM.HVAC.Plants.BaseClasses.ChargeControlSOC
                                        chaConCoo(
      QTes=CTes_nominal,
      m_flow_nominal=mTes_flow_nominal,
      TSup=casDat.TSolCoo - 4,
      TTes=casDat.TSolCoo,
      dt=(casDat.chargeEndNight_CTes - casDat.chargeStartNight_CTes) + (casDat.chargeEndMorn_CTes
           - casDat.chargeStartMorn_CTes)) "Charge controller for cooling"
      annotation (Placement(transformation(extent={{336,-268},{316,-248}})));
    Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
          MediumG, m_flow_nominal=mSec_flow_nominal)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=270,
          origin={368,-88})));
  equation

    connect(coo.uASHP, plaCon.yASHP) annotation (Line(points={{278.692,-179.2},
            {278.692,-190.5},{278.45,-190.5}},
                                      color={0,0,127}));
    connect(plaCon.uTTes, coo.TTes) annotation (Line(points={{296.65,-224.4},{
            324,-224.4},{324,-236},{394,-236},{394,-142.4},{259.846,-142.4}},
                                                           color={0,0,127}));
    connect(plaCon.uTSet, TSetSupChiConst1.y) annotation (Line(points={{301.85,
            -224.4},{301.85,-236.04},{260.6,-236.04},{260.6,-256}},  color={0,0,
            127}));
    connect(T_air_in, coo.uTDryBul) annotation (Line(points={{576,-274},{378,
            -274},{378,-179.2},{285.854,-179.2}},
                                        color={0,0,127}));
    connect(plaCon.yTES, coo.uTes) annotation (Line(points={{271.625,-190.5},{
            248.3,-190.5},{248.3,-179.2},{241,-179.2}},
                                              color={0,0,127}));
    connect(sen_retTem.port_b, coo.port_a) annotation (Line(points={{167,-110},
            {168,-110},{168,-144},{229.692,-144}},
                                              color={0,127,255}));
    connect(plaCon.enaChi, chiOn) annotation (Line(points={{280.4,-224.4},{276,-224.4},
            {276,38},{278,38}}, color={255,0,255}));
    connect(port_b, port_b) annotation (Line(points={{391,-5},{392,-5},{392,-6},{389,
            -6},{391,-6},{391,-5}}, color={0,127,255}));
    connect(SchTes.y[1], plaCon.uSch) annotation (Line(points={{345,-204},{338,
            -204},{338,-218.1},{324.925,-218.1}},
                                           color={0,0,127}));
    connect(coo.TSup, plaCon.uTMea) annotation (Line(points={{263.992,-142.4},{
            263.992,-184.2},{291.45,-184.2},{291.45,-224.4}}, color={0,0,127}));
    connect(plaCon.yenaCha, chaConCoo.enaCha) annotation (Line(points={{284.625,
            -190.5},{284.625,-216.25},{338,-216.25},{338,-250}},
                                                               color={255,0,255}));
    connect(coo.SOC, chaConCoo.SOC) annotation (Line(points={{241,-142.4},{241,
            -146},{372,-146},{372,-258},{338,-258}}, color={0,0,127}));
    connect(plaCon.uChaCon, chaConCoo.y) annotation (Line(points={{285.925,
            -224.4},{285.925,-258},{315,-258}},color={0,0,127}));
    connect(coo.TRet, plaCon.uTRet) annotation (Line(points={{253.062,-142.4},{
            253.062,-184.2},{296.65,-184.2},{296.65,-224.4}}, color={0,0,127}));
    connect(sen_retTem.port_a, port_a) annotation (Line(points={{167,-88},{170,-88},
            {170,27},{171,27}}, color={0,127,255}));
    connect(senTem.port_b, coo.port_b) annotation (Line(points={{368,-98},{308,
            -98},{308,-144},{247.785,-144}},
                                        color={0,127,255}));
    connect(senTem.port_a, port_b) annotation (Line(points={{368,-78},{380,-78},{380,
            -5},{391,-5}}, color={0,127,255}));
    connect(plaCon.yTSet, coo.TSetASHP) annotation (Line(points={{275.525,
            -190.5},{275.525,-185.25},{267.385,-185.25},{267.385,-179.2}},
          color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,-280},
              {560,20}}),         graphics={Line(points={{310,404}}, color={28,
                108,200}), Line(
            points={{34,406}},
            color={0,127,255},
            smooth=Smooth.Bezier),
          Text(
            textString="Edit Here",
            extent={{196,-142},{264,-164}},
            lineColor={28,108,200})}),
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
</html>",   revisions="<html>
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
      Icon(coordinateSystem(extent={{100,-280},{560,20}}),  graphics={
          Rectangle(
            extent={{-70,80},{70,-80}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid,
            origin={208,-152},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={209.5,-213},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-93},
            rotation=360),
          Rectangle(
            extent={{-57,9},{57,-9}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={209,-213},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={203.5,-93},
            rotation=360),
          Rectangle(
            extent={{-100.5,5},{100.5,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            origin={209.5,-211},
            rotation=360),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,127},
            pattern=LinePattern.None,
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            origin={264,-95},
            rotation=360),
          Polygon(
            points={{0,6},{-10,-6},{10,-6},{0,6}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-154},
            rotation=360),
          Polygon(
            points={{0,-5},{-10,5},{10,5},{0,-5}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-141},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-122},
            rotation=360),
          Rectangle(
            extent={{-2,20},{2,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-184},
            rotation=360),
          Rectangle(
            extent={{-2,51},{2,-51}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={248,-153},
            rotation=360),
          Ellipse(
            extent={{-16,16},{16,-16}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Polygon(
            points={{0,8},{-16,-8},{16,-8},{0,8}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-152},
            rotation=180),
          Rectangle(
            extent={{-50,-5},{50,5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={166,-213},
            rotation=360),
          Rectangle(
            extent={{318,-136},{328,-178}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{302,-152},{344,-160}},
            lineColor={135,135,135},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-76},{526,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{356,-151},{557,-161}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{492,-72},{496,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{416,-72},{420,-232}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{454,-76},{458,-236}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{386,-152},{526,-158}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(extent={{100,20},{558,-338}}, lineColor={135,135,135})}));
  end AC_AWHP_wTES_ports_3SP_noprim;

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
      parameter Modelica.SIunits.MassFlowRate mSou_flow_nominal "Nominal mass flow rate through source";
      parameter Modelica.SIunits.Power Q_flow_nominal "Nominal thermal power of source";
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
      parameter Modelica.SIunits.MassFlowRate m_flow_nominal "Nominal mass flowrate of plant";
      parameter Modelica.SIunits.Power Q_flow_nominal "Nominal heating or cooling power of plant";
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

    model BaseCoolingVarCOP "Basic cooling plant with variable COP components"
      extends hil_flexlab_model.Plants.BaseClasses.partialPlant(m_flow_nominal=
            mAWHP_flow_nominal + mTes_flow_nominal, senTemRet);
      parameter Modelica.SIunits.MassFlowRate mAWHP_flow_nominal "Nominal mass flowrate of air-to-water heat pump";
      parameter Modelica.SIunits.MassFlowRate mSwec_flow_nominal "Nominal mass flowrate of swec";
      parameter Modelica.SIunits.MassFlowRate mTes_flow_nominal "Nominal mass flowrate of tes";
      parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
      parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
      parameter Modelica.SIunits.Density d=1500 "Mass density of PCM";
      parameter Modelica.SIunits.Temperature TSol=273.15 + 29.5 "Solidus temperature of PCM.";
      parameter Modelica.SIunits.Temperature TLiq=273.15 + 29.66 "Liquidus temperature of PCM";
      parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";
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
      parameter Modelica.SIunits.DimensionlessRatio COPCoo_ASHP=3
        "Cooling COP of ASHP";
      parameter Modelica.SIunits.DimensionlessRatio COPCoo_SWEC=3
        "Cooling COP of SWEC";
      parameter Modelica.SIunits.Energy Tes_nominal
        "Design TES capacity";
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
      connect(spl3.port_2, senMasFloSup.port_a) annotation (Line(points={{20,60},
              {20,18},{78,18},{78,10}},
                                    color={0,127,255}));
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

    partial model partialSourceCoo_VarCOP
      "Base primary system with single source for cooling"
      replaceable package Medium = Buildings.Media.Water "Water media model";
      parameter Modelica.SIunits.MassFlowRate mSou_flow_nominal "Nominal mass flow rate through source";
      parameter Modelica.SIunits.Power Q_flow_nominal "Nominal thermal power of source";
      replaceable Buildings.Fluid.HeatExchangers.SensibleCooler_T sou(
        redeclare package Medium = Medium,
        m_flow_nominal=mSou_flow_nominal,
        dp_nominal=0,
        QMin_flow=-Q_flow_nominal)
                      "Primary system base source" annotation (Placement(
            transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-40,0})));
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
    equation
      connect(senTemSouRet.port_a, pumSou.port_a)
        annotation (Line(points={{20,60},{10,60}}, color={0,127,255}));
      connect(gai.y, pumSou.m_flow_in) annotation (Line(points={{-59,60},{-50,60},{
              -50,80},{0,80},{0,72},{8.88178e-16,72}},
                                                 color={0,0,127}));
      connect(port_a, senTemSouRet.port_b)
        annotation (Line(points={{100,60},{40,60}}, color={0,127,255}));
      connect(pumSou.port_b, sou.port_a)
        annotation (Line(points={{-10,60},{-40,60},{-40,10}}, color={0,127,255}));
      connect(senTemSouSup.port_b, port_b)
        annotation (Line(points={{40,-60},{100,-60}}, color={0,127,255}));
      connect(senTemSouSup.port_a, sou.port_b) annotation (Line(points={{20,-60},{
              -40,-60},{-40,-10}}, color={0,127,255}));
      connect(senTemSouSup.T, TSup) annotation (Line(points={{30,-49},{30,-40},{80,
              -40},{80,-20},{110,-20}}, color={0,0,127}));
      connect(gai.u, limiter.y)
        annotation (Line(points={{-82,60},{-85.6,60}}, color={0,0,127}));
      connect(limiter.u, uPum)
        annotation (Line(points={{-94.8,60},{-120,60}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end partialSourceCoo_VarCOP;

    model ASHPCoolingVarCOP "Heat pump for cooling with variable COP"
      extends RTUPCM.HVAC.Plants.BaseClasses.partialSourceCoo(redeclare
          Buildings.Fluid.HeatExchangers.SensibleCooler_T sou);
      Modelica.Blocks.Interfaces.RealOutput PEle(unit="W")
        "Electrical power consumption"
        annotation (Placement(transformation(extent={{100,90},{120,110}})));
      Modelica.Blocks.Sources.RealExpression cop(y=RTUPCM.HVAC.Plants.BaseClasses.Functions.COP_ASHP(
                                                                      abs(TSetSou
             - TDryBul)))
        annotation (Placement(transformation(extent={{0,84},{20,104}})));
      Modelica.Blocks.Math.Division pow
        annotation (Placement(transformation(extent={{46,98},{66,78}})));
      Modelica.Blocks.Interfaces.RealInput TDryBul(unit="K")
        "Dry bulb temperature of source air"
        annotation (Placement(transformation(extent={{-140,68},{-100,108}})));
      Modelica.Blocks.Math.Gain cooCor(k=-1)
        "Correction for cooling power to be positive"
        annotation (Placement(transformation(extent={{26,90},{34,98}})));
      Modelica.Blocks.Interfaces.RealInput TSetSou
        "Set point temperature of the fluid that leaves the heatpump"
        annotation (Placement(transformation(extent={{-140,10},{-100,50}})));
      Modelica.Blocks.Interfaces.RealOutput COP(unit="-") "COP of HP"
        annotation (Placement(transformation(extent={{100,74},{120,94}})));
    equation
      connect(pow.y, PEle) annotation (Line(points={{67,88},{80,88},{80,100},{110,100}},
            color={0,0,127}));
      connect(cop.y, cooCor.u)
        annotation (Line(points={{21,94},{25.2,94}}, color={0,0,127}));
      connect(cooCor.y, pow.u2)
        annotation (Line(points={{34.4,94},{44,94}}, color={0,0,127}));
      connect(sou.Q_flow, pow.u1) annotation (Line(points={{-48,-9},{-48,-20},{
              -20,-20},{-20,88},{20,88},{20,82},{44,82}},
                                                      color={0,0,127}));
      connect(sou.TSet, TSetSou)
        annotation (Line(points={{-48,14},{-48,30},{-120,30}}, color={0,0,127}));
      connect(cop.y, COP) annotation (Line(points={{21,94},{62,94},{62,84},{110,
              84}}, color={0,0,127}));
      annotation (experiment(
          StartTime=21600000,
          StopTime=23328000,
          Interval=900.00288,
          Tolerance=1e-06,
          __Dymola_Algorithm="Radau"));
    end ASHPCoolingVarCOP;

    partial model partialPlant_glycol
      "A partial model for a plant implementation"
      replaceable package Medium =
          Buildings.Media.Antifreeze.PropyleneGlycolWater (                        property_T=283.15, X_a=0.09) "Water media model";
      parameter Modelica.SIunits.MassFlowRate m_flow_nominal "Nominal mass flowrate of plant";
      parameter Modelica.SIunits.Power Q_flow_nominal "Nominal heating or cooling power of plant";
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
      Buildings.Fluid.Sensors.MassFlowRate senMasFloSup(redeclare package Medium =
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
    end partialPlant_glycol;

    model CoilRegisterFourPort "Four port register for a pcm heat exchanger"
      import Modelica.Constants;
      parameter Modelica.SIunits.MassFlowRate m1_flow_nominal "mass flowrate through HPC";
      parameter Modelica.SIunits.MassFlowRate m2_flow_nominal "mass flowrate through LPC";
      parameter Modelica.SIunits.Temperature TStart_pcm "Starting temperature of pcm";
      replaceable parameter RTUPCM.Fluid.HeatExchangers.Data.SAT.SunampQ6 Design "Design of HX";
      RTUPCM.Fluid.HeatExchangers.BaseClasses.HexElementSensibleFourPort_v2 eleHex(
        redeclare package Medium1 = Medium,
        redeclare package Medium2 = Medium,
        m1_flow_nominal=m1_flow_nominal,
        m2_flow_nominal=m2_flow_nominal,
        dp1_nominal=Design.dp1_nominal,
        dp2_nominal=Design.dp2_nominal,
        Design=Design,
        TStart_pcm=TStart_pcm)
        annotation (Placement(transformation(extent={{-12,-12},{12,12}})));
      replaceable package Medium = Buildings.Media.Water "Medium in the component"
          annotation (choicesAllMatching = true);
      parameter Boolean allowFlowReversal = true
        "= true to allow flow reversal in medium, false restricts to design direction (port_a -> port_b)"
        annotation(Dialog(tab="Assumptions"), Evaluate=true);
      Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare each package
          Medium = Medium, each m_flow(start=0, min=if allowFlowReversal then -
              Constants.inf else 0))
        "Fluid connector a for medium (positive design flow direction is from port_a to port_b)"
        annotation (Placement(transformation(extent={{-110,32},{-90,52}}),
            iconTransformation(extent={{-110,32},{-90,52}})));
      Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare each package
          Medium = Medium, each m_flow(start=0, max=if allowFlowReversal then +
              Constants.inf else 0))
        "Fluid connector b for medium (positive design flow direction is from port_a to port_b)"
        annotation (Placement(transformation(extent={{110,32},{90,52}}),
            iconTransformation(extent={{110,32},{90,52}})));
      Modelica.Fluid.Interfaces.FluidPort_a port_a2(redeclare each package
          Medium = Medium, each m_flow(start=0, min=if allowFlowReversal then -
              Constants.inf else 0))
        "Fluid connector a for medium (positive design flow direction is from port_a to port_b)"
        annotation (Placement(transformation(extent={{90,-52},{110,-32}}),
            iconTransformation(extent={{90,-52},{110,-32}})));
      Modelica.Fluid.Interfaces.FluidPort_b port_b2(redeclare each package
          Medium = Medium, each m_flow(start=0, max=if allowFlowReversal then +
              Constants.inf else 0))
        "Fluid connector b for medium (positive design flow direction is from port_a to port_b)"
        annotation (Placement(transformation(extent={{-90,-48},{-110,-28}}),
            iconTransformation(extent={{-90,-48},{-110,-28}})));
      Buildings.Fluid.Sensors.MassFlowRate senMasFloHPC(redeclare package
          Medium =
            Medium)
        annotation (Placement(transformation(extent={{-48,42},{-32,58}})));
      Buildings.Fluid.Sensors.MassFlowRate senMasFloLPC(redeclare package
          Medium =
            Medium)
        annotation (Placement(transformation(extent={{32,-42},{48,-58}})));
      Buildings.Fluid.Sensors.TemperatureTwoPort TInHPC(redeclare package
          Medium =
            Medium, m_flow_nominal=m1_flow_nominal)
        annotation (Placement(transformation(extent={{-78,42},{-62,58}})));
      Buildings.Fluid.Sensors.TemperatureTwoPort TOutHPC(redeclare package
          Medium =
            Medium, m_flow_nominal=m1_flow_nominal)
        annotation (Placement(transformation(extent={{62,42},{78,58}})));
      Buildings.Fluid.Sensors.TemperatureTwoPort TInLPC(redeclare package
          Medium =
            Medium, m_flow_nominal=m2_flow_nominal)
        annotation (Placement(transformation(extent={{62,-42},{78,-58}})));
      Buildings.Fluid.Sensors.TemperatureTwoPort TOutLPC(redeclare package
          Medium =
            Medium, m_flow_nominal=m2_flow_nominal)
        annotation (Placement(transformation(extent={{-78,-42},{-62,-58}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a tubHeaPort_a1 annotation (Placement(transformation(extent={{-108,26},
                {-94,12}}), iconTransformation(extent={{-108,26},{-94,12}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a tubHeaPort_b2 annotation (Placement(transformation(extent={{-108,
                -24},{-94,-10}}), iconTransformation(extent={{-108,-24},{-94,
                -10}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a tubHeaPort_b1 annotation (Placement(transformation(extent={{92,26},
                {106,12}}), iconTransformation(extent={{92,26},{106,12}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a tubHeaPort_a2
        annotation (Placement(transformation(extent={{92,-26},{106,-12}}),
            iconTransformation(extent={{92,-26},{106,-12}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorHPC
        "Heat port for heat exchange with the control volume"
        annotation (Placement(transformation(extent={{-10,90},{10,110}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorLPC
        "Heat port for heat exchange with the control volume"
        annotation (Placement(transformation(extent={{-10,-90},{10,-110}})));
      Modelica.Blocks.Interfaces.RealOutput SOC "state of charge of PCM"
        annotation (Placement(transformation(extent={{100,-100},{120,-80}})));
      Modelica.Blocks.Continuous.Integrator Epcm(k=1) "sum of energy into PCM [J]"
        annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=180,
            origin={-90,-8.88178e-16})));
      Modelica.Blocks.Math.Add Qpcm(k2=+1, k1=+1)
        "sum of heat transfer rates into PCM [W]" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=180,
            origin={-72,0})));
      Modelica.Blocks.Interfaces.RealOutput QHPC
        "convective heat flow from HPC [W]" annotation (Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={110,82}), iconTransformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={110,90})));
      Modelica.Blocks.Interfaces.RealOutput QLPC
        "convective heat flow from LPC [W]" annotation (Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={110,66}), iconTransformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={110,66})));
      Modelica.Blocks.Sources.RealExpression calcSOC(y=RTUPCM.Fluid.HeatExchangers.Functions.SOC(
            Upcm=eleHex.Upcm,
            mpcm=eleHex.mpcm,
            TSol=Design.PCM.TSol,
            cSol=Design.PCM.c,
            LHea=Design.PCM.LHea))
        annotation (Placement(transformation(extent={{40,-100},{60,-80}})));
      Modelica.Blocks.Interfaces.RealOutput EPCM "Connector of Real output signal"
        annotation (Placement(transformation(extent={{100,-76},{120,-56}}),
            iconTransformation(extent={{100,-76},{120,-56}})));
      Modelica.Blocks.Sources.RealExpression calcTesCap(y=RTUPCM.Fluid.HeatExchangers.Functions.Ufg(
                                                                        mpcm=eleHex.mpcm,
            LHea=Design.PCM.LHea))
        annotation (Placement(transformation(extent={{-50,-102},{-70,-82}})));
      Modelica.Blocks.Interfaces.RealOutput Ufg "Value of Real output"
        annotation (Placement(transformation(extent={{-100,-102},{-120,-82}})));
      Modelica.Blocks.Interfaces.RealOutput mPCM "Value of Real output"
        annotation (Placement(transformation(extent={{-100,-86},{-120,-66}}),
            iconTransformation(extent={{-100,-86},{-120,-66}})));
      Modelica.Blocks.Interfaces.RealOutput uPCM "Value of Real output"
        annotation (Placement(transformation(extent={{-100,-68},{-120,-48}}),
            iconTransformation(extent={{-100,-68},{-120,-48}})));
    equation
      connect(port_b2, TOutLPC.port_a)
        annotation (Line(points={{-100,-38},{-90,-38},{-90,-50},{-78,-50}},
                                                        color={0,127,255}));
      connect(port_a1, TInHPC.port_a)
        annotation (Line(points={{-100,42},{-90,42},{-90,50},{-78,50}},
                                                      color={0,127,255}));
      connect(TOutLPC.port_b, eleHex.port_b2) annotation (Line(points={{-62,-50},{
              -20,-50},{-20,-7.2},{-12,-7.2}},
                                       color={0,127,255}));
      connect(TOutHPC.port_b, port_b1)
        annotation (Line(points={{78,50},{90,50},{90,42},{100,42}},
                                                    color={0,127,255}));
      connect(TInLPC.port_b, port_a2)
        annotation (Line(points={{78,-50},{90,-50},{90,-42},{100,-42}},
                                                      color={0,127,255}));
      connect(TOutHPC.port_a, eleHex.port_b1) annotation (Line(points={{62,50},{20,
              50},{20,7.2},{12,7.2}},
                              color={0,127,255}));
      connect(TInHPC.port_b, senMasFloHPC.port_a)
        annotation (Line(points={{-62,50},{-48,50}}, color={0,127,255}));
      connect(senMasFloHPC.port_b, eleHex.port_a1) annotation (Line(points={{-32,50},
              {-20,50},{-20,7.2},{-12,7.2}},
                                         color={0,127,255}));
      connect(senMasFloLPC.port_b, TInLPC.port_a)
        annotation (Line(points={{48,-50},{62,-50}}, color={0,127,255}));
      connect(senMasFloLPC.port_a, eleHex.port_a2) annotation (Line(points={{32,-50},
              {20,-50},{20,-7.2},{12,-7.2}},
                                         color={0,127,255}));
      connect(tubHeaPort_a1, eleHex.tubHeaPort_a1) annotation (Line(points={{-101,19},
              {-53.5,19},{-53.5,4.56},{-12,4.56}},
                                                 color={191,0,0}));
      connect(tubHeaPort_b2, eleHex.tubHeaPort_b2) annotation (Line(points={{-101,
              -17},{-53.5,-17},{-53.5,-4.56},{-12,-4.56}},
                                                    color={191,0,0}));
      connect(eleHex.tubHeaPort_b1, tubHeaPort_b1) annotation (Line(points={{12,4.56},
              {54,4.56},{54,19},{99,19}},color={191,0,0}));
      connect(tubHeaPort_a2, eleHex.tubHeaPort_a2) annotation (Line(points={{99,-19},
              {54.5,-19},{54.5,-4.56},{12,-4.56}},
                                                 color={191,0,0}));
      connect(heaPorHPC, eleHex.heaPor1)
        annotation (Line(points={{0,100},{0,12}}, color={191,0,0}));
      connect(heaPorLPC, eleHex.heaPor2)
        annotation (Line(points={{0,-100},{0,-12}}, color={191,0,0}));
      connect(Epcm.u, Qpcm.y)
        annotation (Line(points={{-82.8,0},{-78.6,0}}, color={0,0,127}));
      connect(Qpcm.u2, eleHex.QpcmHPC) annotation (Line(points={{-64.8,3.6},{-36.4,
              3.6},{-36.4,2.52},{-12.84,2.52}},
                                              color={0,0,127}));
      connect(Qpcm.u1, eleHex.QpcmLPC) annotation (Line(points={{-64.8,-3.6},{-36.4,
              -3.6},{-36.4,-2.52},{-12.84,-2.52}}, color={0,0,127}));
      connect(eleHex.QvolHPC, QHPC) annotation (Line(points={{-3.84,12.96},{-3.92,
              12.96},{-3.92,82},{110,82}}, color={0,0,127}));
      connect(eleHex.QvolLPC, QLPC) annotation (Line(points={{-2.64,-12.96},{-2.64,
              -34},{40,-34},{40,66},{110,66}}, color={0,0,127}));
      connect(calcSOC.y, SOC)
        annotation (Line(points={{61,-90},{110,-90}}, color={0,0,127}));
      connect(Epcm.y, EPCM) annotation (Line(points={{-96.6,0},{-120,0},{-120,-66},
              {110,-66}}, color={0,0,127}));
      connect(calcTesCap.y, Ufg)
        annotation (Line(points={{-71,-92},{-110,-92}}, color={0,0,127}));
      connect(eleHex.Upcm, uPCM) annotation (Line(points={{-14.16,0.96},{-57.08,
              0.96},{-57.08,-58},{-110,-58}}, color={0,0,127}));
      connect(eleHex.mpcm, mPCM) annotation (Line(points={{-14.16,-0.96},{
              -59.08,-0.96},{-59.08,-76},{-110,-76}}, color={0,0,127}));
      annotation (
        Documentation(info="<html>
<p>
Register of a heat exchanger with dynamics on the fluids and the solid.
The register represents one array of pipes that are perpendicular to the
air stream.
The <i>hA</i> value for both fluids is an input.
The driving force for the heat transfer is the temperature difference
between the fluid volumes and the solid in each heat exchanger element.
</p>
</html>",
    revisions="<html>
<ul>
<li>
October 19, 2017, by Michael Wetter:<br/>
Changed initialization of pressure from a <code>constant</code> to a <code>parameter</code>.<br/>
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/1013\">Buildings, issue 1013</a>.
</li>
<li>
February 5, 2015, by Michael Wetter:<br/>
Changed <code>initalize_p</code> from a <code>parameter</code> to a
<code>constant</code>. This is only required in finite volume models
of heat exchangers (to avoid consistent but redundant initial conditions)
and hence it should be set as a <code>constant</code>.
</li>
<li>
December 22, 2014 by Michael Wetter:<br/>
Removed <code>Modelica.Fluid.System</code>
to address issue
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/311\">#311</a>.
</li>
<li>
August 10, 2014, by Michael Wetter:<br/>
Reformulated the multiple iterators in the <code>sum</code> function
as this language construct is not supported in OpenModelica.
</li>
<li>
July 3, 2014, by Michael Wetter:<br/>
Added parameters <code>initialize_p1</code> and <code>initialize_p2</code>.
This is required to enable the coil models to initialize the pressure in the
first volume, but not in the downstream volumes. Otherwise,
the initial equations will be overdetermined, but consistent.
This change was done to avoid a long information message that appears
when translating models.
</li>
<li>
June 26, 2014, by Michael Wetter:<br/>
Removed parameters <code>energyDynamics1</code> and <code>energyDynamics2</code>,
and used instead of these two parameters the new parameter <code>energyDynamics</code>.
Removed parameters <code>steadyState_1</code> and <code>steadyState_2</code>.
This was done as this complexity is not required.
</li>
<li>
August 12, 2008 by Michael Wetter:<br/>
Introduced option to compute each medium using a steady state model or
a dynamic model.
</li>
<li>
March 25, 2008, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"),
    extent=[-20,80; 0,100],    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-70,80},{70,-80}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-100,5},{101,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{36,80},{40,-80}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-40,80},{-36,-80}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-2,80},{2,-80}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-70,4},{70,-2}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
        Placement(transformation(extent={{-20,80},{0,100}})));
    end CoilRegisterFourPort;
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
      parameter Modelica.SIunits.DimensionlessRatio stage_tes_to_swec = 1/3 "PI signal at which to stage on Swec, if enabled";
      parameter Modelica.SIunits.DimensionlessRatio stage_swec_to_ashp = 2/3 "PI signal at which to stage on ASHP, if enabled";
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
      parameter Modelica.SIunits.DimensionlessRatio stage_tes_to_ashp = 1/2 "PI signal at which to stage on Swec, if enabled";
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
      parameter Modelica.SIunits.Temperature TLimCha "Limit for charging";
      parameter Modelica.SIunits.TemperatureDifference deadbandCha "Hysteresis deadband for TLimCha";
      parameter Modelica.SIunits.Temperature TLimDis "Limit for discharging";
      parameter Modelica.SIunits.TemperatureDifference deadbandDis "Hysteresis deadband for TLimDis";
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

    model Controller1Cool_TES_ASHP "Controller 1 for heating"
      parameter Modelica.SIunits.DimensionlessRatio stage_tes_to_ashp = 0.5 "PI signal at which to stage on ASHP, if enabled";
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
        "Enable signal for TES discharging"
        annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
      Modelica.Blocks.Interfaces.BooleanInput enaASHP "Enable signal for ASHP"
        annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
      Modelica.Blocks.Interfaces.BooleanInput enaCoo "Enable signal for heating"
        annotation (Placement(transformation(extent={{-140,-180},{-100,-140}})));
      Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol(trueHoldDuration=
            15*60) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,-140})));
      Modelica.Blocks.Logical.Not not1 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,-110})));
      Modelica.Blocks.Logical.And and1
        annotation (Placement(transformation(extent={{20,-120},{40,-100}})));
      Buildings.Controls.Continuous.LimPID conPI(
        controllerType=Modelica.Blocks.Types.SimpleController.PI,
        k=0.1,
        Ti=120,
        reset=Buildings.Types.Reset.Parameter,
        reverseActing=not (true)) "Feedback controller"
        annotation (Placement(transformation(extent={{-64,-16},{-44,4}})));
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
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant con50(final k=
            stage_tes_to_ashp)
        "Contant that outputs 1/2"
        annotation (Placement(transformation(extent={{-30,-40},{-10,-20}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant on(final k=1)
        "Contant that outputs one"
        annotation (Placement(transformation(extent={{-30,60},{-10,80}})));
      Buildings.Controls.OBC.CDL.Continuous.Sources.Constant off(final k=0)
        "Contant that outputs zero"
        annotation (Placement(transformation(extent={{-20,140},{0,160}})));
    equation
      connect(con0.y, TES.x1) annotation (Line(points={{-8,40},{-6,40},{-6,48},{28,
              48}}, color={0,0,127}));
      connect(con0.y, TES.f1) annotation (Line(points={{-8,40},{-6,40},{-6,44},{28,
              44}}, color={0,0,127}));
      connect(on.y, AWHP.f2) annotation (Line(points={{-8,70},{10,70},{10,-48},{28,
              -48}}, color={0,0,127}));
      connect(con50.y, AWHP.x1) annotation (Line(points={{-8,-30},{0,-30},{0,-32},{
              28,-32}}, color={0,0,127}));
      connect(AWHP.f1, TES.x1) annotation (Line(points={{28,-36},{-6,-36},{-6,48},{
              28,48}}, color={0,0,127}));
      connect(AWHP.u, TES.u) annotation (Line(points={{28,-40},{12,-40},{12,40},{28,
              40}}, color={0,0,127}));
      connect(AWHP.x2, con1.y) annotation (Line(points={{28,-44},{0,-44},{0,-60},{
              -8,-60}}, color={0,0,127}));
      connect(uTesLim, TES.f2) annotation (Line(points={{-120,80},{-50,80},{-50,102},
              {26,102},{26,32},{28,32}},
                                 color={0,0,127}));
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
      connect(TES.x2, AWHP.x1) annotation (Line(points={{28,36},{0,36},{0,-32},{28,
              -32}}, color={0,0,127}));
      connect(enaCoo, truFalHol.u) annotation (Line(points={{-120,-160},{-80,-160},
              {-80,-152}}, color={255,0,255}));
      connect(truFalHol.y, not1.u)
        annotation (Line(points={{-80,-128},{-80,-122}}, color={255,0,255}));
      connect(and1.y, swiASHP.u2) annotation (Line(points={{41,-110},{58,-110},{58,
              -48},{64,-48}}, color={255,0,255}));
      connect(and1.u1, enaASHP) annotation (Line(points={{18,-110},{-40,-110},{-40,
              -80},{-92,-80},{-92,-40},{-120,-40}},
                                               color={255,0,255}));
      connect(enaCoo, and1.u2) annotation (Line(points={{-120,-160},{-40,-160},{-40,
              -118},{18,-118}}, color={255,0,255}));
      connect(TSet, conPI.u_s) annotation (Line(points={{-120,140},{-92,140},{
              -92,-6},{-66,-6}},          color={0,0,127}));
      connect(not1.y, conPI.trigger) annotation (Line(points={{-80,-99},{-72,
              -99},{-72,-18},{-62,-18}}, color={255,0,255}));
      connect(TMea, conPI.u_m) annotation (Line(points={{0,-180},{0,-99},{-54,
              -99},{-54,-18}}, color={0,0,127}));
      connect(conPI.y, AWHP.u) annotation (Line(points={{-43,-6},{-8,-6},{-8,
              -40},{28,-40}}, color={0,0,127}));
      connect(conPI.y, TES.u) annotation (Line(points={{-43,-6},{-7.5,-6},{-7.5,
              40},{28,40}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -160},{100,160}})), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-100,-160},{100,160}})));
    end Controller1Cool_TES_ASHP;
  end Controls;

  package Baseclasses_WH
    model AC_AWHP_PrimaryLoop_addpts_wTES_weiping062822
      "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

      package MediumW = Buildings.Media.Water "Medium model for water";

      constant Modelica.SIunits.MassFlowRate m_flow=0.4
        "Nominal mass flow rate";
      parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
        "Design mass flow rate of secondary loop";

      Buildings.Fluid.Sources.MassFlowSource_T sec_ret(
        redeclare package Medium = MediumW,
        use_m_flow_in=true,
        use_T_in=true,
        nPorts=1) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={168,-90})));
      Buildings.Fluid.FixedResistances.Junction chw_sup(
        redeclare package Medium = MediumW,
        m_flow_nominal={+(m_flow + mSec_flow_nominal),-mSec_flow_nominal,
            -m_flow},
        from_dp=true,
        linearized=true,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={308,-136})));
      Buildings.Fluid.FixedResistances.Junction chw_ret(
        redeclare package Medium = MediumW,
        m_flow_nominal={+mSec_flow_nominal,-(m_flow + mSec_flow_nominal),
            +m_flow},
        from_dp=true,
        linearized=true,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={168,-136})));
      Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = MediumW,
          nPorts=1)                                                                                    annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={408,-136})));
      Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package
          Medium =
            Buildings.Media.Water, m_flow_nominal=mSec_flow_nominal)
        annotation (Placement(transformation(extent={{348,-110},{370,-86}})));
      Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
          Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
        annotation (Placement(transformation(extent={{-12,12},{12,-12}},
            rotation=270,
            origin={168,-182})));
      Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
        "Set point for chiller temperature"
        annotation (Placement(transformation(extent={{176,-318},{188,-306}})));

      Plant_Controller_weiping_062822  plaCon(TSolCoo=casDat.TSolCoo,TLiqCoo=casDat.TLiqCoo,
        chargeStartMorn_CTes=casDat.chargeStartMorn_CTes,
        chargeEndMorn_CTes=casDat.chargeEndMorn_CTes,
        dischargeStart_CTes=casDat.dischargeStart_CTes,
        dischargeEnd_CTes=casDat.dischargeEnd_CTes,
        chargeStartNight_CTes=casDat.chargeStartNight_CTes,
        chargeEndNight_CTes=casDat.chargeEndNight_CTes)
        annotation (Placement(transformation(extent={{268,-304},{320,-278}})));

      BaseCoolingVarCOP_weiping_062822 coo(m_flow_nominal=casDat.mAWHP_flow_nominal+
       casDat.mTes_flow_nominal, k=casDat.kPCMCoo, c=casDat.cPCMCoo, d=casDat.dPCMCoo, TSol=casDat.TSolCoo, TLiq=casDat.TLiqCoo, LHea=casDat.LHeaCoo,
       Q_flow_nominal=casDat.QCoo_flow_nominal, mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,mTes_flow_nominal=casDat.mTes_flow_nominal,
       Tes_nominal=casDat.CTes_nominal, dp_nominal=casDat.dp_nominal, dpFixed_nominal=
       casDat.dpFixed_nominal, dpValve_nominal=casDat.dpValve_nominal) annotation (Placement(transformation(
            extent={{-20,-53},{20,53}},
            rotation=90,
            origin={221,-238})));

      hil_flexlab_model.Data.BBR_3C_Med casDat
        "Case study data"
        annotation (Placement(transformation(extent={{490,10},{550,-50}})));

      Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={246,36}),   iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={80,-292})));
      Modelica.Blocks.Interfaces.RealInput T_chw_in annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={194,36}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={228,40})));
      Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={576,-330}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={580,-314})));
      Modelica.Blocks.Interfaces.RealInput m_flow_sec annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={120,38}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={152,40})));

      Modelica.Blocks.Interfaces.RealOutput T_chw_out annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={360,40}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={390,40})));
      Modelica.Blocks.Interfaces.RealOutput chi_P annotation (Placement(
            transformation(
            extent={{-22,-22},{22,22}},
            rotation=180,
            origin={78,-260}),  iconTransformation(
            extent={{-22,-22},{22,22}},
            rotation=270,
            origin={168,-360})));
      Modelica.Blocks.Interfaces.RealOutput T_pch_in annotation (Placement(
            transformation(
            extent={{-21,-21},{21,21}},
            rotation=180,
            origin={79,-231}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={78,-186})));
      Modelica.Blocks.Interfaces.RealOutput chi_spd annotation (Placement(
            transformation(
            extent={{-22,-22},{22,22}},
            rotation=180,
            origin={78,-290}), iconTransformation(
            extent={{-22,-22},{22,22}},
            rotation=270,
            origin={122,-360})));
      Modelica.Blocks.Interfaces.RealOutput chi_COP annotation (Placement(
            transformation(
            extent={{-22,-22},{22,22}},
            rotation=180,
            origin={78,-320}), iconTransformation(
            extent={{-22,-22},{22,22}},
            rotation=270,
            origin={212,-360})));
      Modelica.Blocks.Interfaces.RealOutput pum_P annotation (Placement(
            transformation(extent={{560,-230},{598,-192}}), iconTransformation(
              extent={{560,-210},{598,-172}})));
      Modelica.Blocks.Interfaces.RealOutput m_flow_pri annotation (Placement(
            transformation(extent={{560,-280},{598,-242}}), iconTransformation(
              extent={{560,-266},{598,-228}})));

    equation
      connect(senTem.port_b,bou.ports[1]) annotation (Line(points={{370,-98},{384,-98},
              {384,-136},{398,-136}},       color={0,127,255}));
      connect(senTem.T, T_chw_out) annotation (Line(points={{359,-84.8},{359,22},{360,
              22},{360,40}},        color={0,0,127}));
      connect(chw_sup.port_1, senTem.port_a) annotation (Line(points={{308,-126},{308,
              -98},{348,-98}},   color={0,127,255}));
      connect(T_air_in, coo.uTDryBul) annotation (Line(points={{576,-330},{172,
              -330},{172,-262},{172.485,-262}},
                                          color={0,0,127}));
      connect(TSetSupChiConst.y, coo.TSetASHP) annotation (Line(points={{188.6,
              -312},{192,-312},{192,-262},{192.462,-262}},
                                                     color={0,0,127}));
      connect(TSetSupChiConst.y, plaCon.uTSet) annotation (Line(points={{188.6,-312},
              {320,-312},{320,-306.08},{318.96,-306.08}}, color={0,0,127}));
      connect(plaCon.yASHP, coo.uASHP) annotation (Line(points={{281.52,-276.7},
              {281.52,-276},{282,-276},{282,-270},{180,-270},{180,-262},{
              180.231,-262}},
            color={0,0,127}));
      connect(plaCon.yTES, coo.uTes) annotation (Line(points={{270.6,-276.7},{
              270.6,-276},{272,-276},{272,-268},{220,-268},{220,-262},{221,-262}},
                                                                             color={
              0,0,127}));
      connect(coo.port_a, chw_sup.port_2) annotation (Line(points={{233.231,
              -218},{232,-218},{232,-160},{308,-160},{308,-146}},
                                                       color={0,127,255}));
      connect(chw_ret.port_3, chw_sup.port_3)
        annotation (Line(points={{178,-136},{298,-136}}, color={0,127,255}));
      connect(coo.port_b, sen_retTem.port_b) annotation (Line(points={{213.662,
              -218},{214,-218},{214,-194},{168,-194}},
                                                 color={0,127,255}));
      connect(sen_retTem.port_a, chw_ret.port_1)
        annotation (Line(points={{168,-170},{168,-146}}, color={0,127,255}));
      connect(chw_ret.port_2, sec_ret.ports[1]) annotation (Line(points={{168,-126},
              {168,-126},{168,-100}}, color={0,127,255}));
      connect(m_flow_sec, sec_ret.m_flow_in) annotation (Line(points={{120,38},{120,
              -20},{176,-20},{176,-78}}, color={0,0,127}));
      connect(T_chw_in, sec_ret.T_in) annotation (Line(points={{194,36},{194,-40},{170,
              -40},{170,-78},{172,-78}}, color={0,0,127}));
      connect(plaCon.enaChi, chiOn) annotation (Line(points={{284.64,-306.08},{
              284.64,-324},{368,-324},{368,-194},{246,-194},{246,36}},
                                                          color={255,0,255}));
      connect(coo.TTes, plaCon.uTTes) annotation (Line(points={{200.615,-216},{
              200,-216},{200,-206},{340,-206},{340,-316},{310,-316},{310,
              -306.08},{310.64,-306.08}},
            color={0,0,127}));
      connect(senTem.T, plaCon.uTMea) annotation (Line(points={{359,-84.8},{359,-76},
              {440,-76},{440,-320},{302.32,-320},{302.32,-306.08}}, color={0,0,127}));
      connect(sen_retTem.T, T_pch_in) annotation (Line(points={{154.8,-182},{126,-182},
              {126,-231},{79,-231}}, color={0,0,127}));
      connect(coo.PEle, chi_P) annotation (Line(points={{168,-216},{168,-212},{136,-212},
              {136,-260},{78,-260}}, color={0,0,127}));
      connect(coo.COP_HP, chi_COP) annotation (Line(points={{173.3,-216},{172,
              -216},{172,-208},{146,-208},{146,-320},{78,-320}},
                                                           color={0,0,127}));
      connect(coo.HP_spd, chi_spd) annotation (Line(points={{176.562,-216},{176,
              -216},{176,-204},{156,-204},{156,-290},{78,-290}},
                                                           color={0,0,127}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,
                -340},{560,20}}),   graphics={Line(points={{310,404}}, color={28,
                  108,200}), Line(
              points={{34,406}},
              color={0,127,255},
              smooth=Smooth.Bezier),
            Text(
              textString="Edit Here",
              extent={{192,-226},{260,-248}},
              lineColor={28,108,200})}),
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
</html>",     revisions="<html>
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
        Icon(coordinateSystem(extent={{100,-340},{560,20}}),  graphics={
            Rectangle(
              extent={{-70,80},{70,-80}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              origin={208,-152},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={209.5,-93},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={209.5,-213},
              rotation=360),
            Rectangle(
              extent={{-57,9},{57,-9}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={209,-93},
              rotation=360),
            Rectangle(
              extent={{-57,9},{57,-9}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={209,-213},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              origin={203.5,-93},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              origin={209.5,-211},
              rotation=360),
            Rectangle(
              extent={{-50,-5},{50,5}},
              lineColor={0,0,127},
              pattern=LinePattern.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              origin={264,-95},
              rotation=360),
            Polygon(
              points={{0,6},{-10,-6},{10,-6},{0,6}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-154},
              rotation=360),
            Polygon(
              points={{0,-5},{-10,5},{10,5},{0,-5}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-141},
              rotation=360),
            Rectangle(
              extent={{-2,20},{2,-20}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-122},
              rotation=360),
            Rectangle(
              extent={{-2,20},{2,-20}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-184},
              rotation=360),
            Rectangle(
              extent={{-2,51},{2,-51}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-153},
              rotation=360),
            Ellipse(
              extent={{-16,16},{16,-16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-152},
              rotation=180),
            Polygon(
              points={{0,8},{-16,-8},{16,-8},{0,8}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={166,-152},
              rotation=180),
            Rectangle(
              extent={{-50,-5},{50,5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              origin={166,-213},
              rotation=360),
            Rectangle(
              extent={{318,-136},{328,-178}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{302,-152},{344,-160}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{386,-76},{526,-236}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{356,-151},{557,-161}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{492,-72},{496,-232}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{416,-72},{420,-232}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{454,-76},{458,-236}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{386,-152},{526,-158}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(extent={{100,20},{558,-338}}, lineColor={135,135,135})}));
    end AC_AWHP_PrimaryLoop_addpts_wTES_weiping062822;

    model AC_AWHP_PrimaryLoop_addpts_wTES_no_y
      "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

      package MediumA = Buildings.Media.Air "Medium model for air";
      package MediumW = Buildings.Media.Water "Medium model for water";

      constant Modelica.SIunits.MassFlowRate m_flow=0.4
        "Nominal mass flow rate";

      parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
      parameter Modelica.SIunits.Temperature TSetSupAir=286.15;

      parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
        "Design mass flow rate of secondary loop";

      parameter Modelica.SIunits.Power Q_flow_nominal "Nominal heating or cooling power of plant";
      parameter Modelica.SIunits.MassFlowRate mAWHP_flow_nominal "Nominal mass flowrate of air-to-water heat pump";
      parameter Modelica.SIunits.MassFlowRate mSwec_flow_nominal "Nominal mass flowrate of swec";
      parameter Modelica.SIunits.MassFlowRate mTes_flow_nominal "Nominal mass flowrate of tes";
      parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
      parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
      parameter Modelica.SIunits.Density d=1500 "Mass density of PCM";
      parameter Modelica.SIunits.Temperature TSol
                                                 "=273.15 + 29.5 Solidus temperature of PCM.";
      parameter Modelica.SIunits.Temperature TLiq
                                                 "=273.15 + 29.66 Liquidus temperature of PCM";
      parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";
      parameter Modelica.SIunits.Energy Tes_nominal
        "Design TES capacity";
      parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")=0
        "Nominal pressure raise, used for default pressure curve if not specified in record per";
      parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0) = 1000
        "Pressure drop of pipe and other resistances that are in series";
      parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0) = 1000
        "Nominal pressure drop of fully open valve";
      parameter Real table1[:, :] = [casDat.chargeStartMorn_CTes,0;
        casDat.chargeEndMorn_CTes,2;
        casDat.dischargeStart_CTes,1;
        casDat.dischargeEnd_CTes,2;
        casDat.chargeStartNight_CTes,0;
        casDat.chargeEndNight_CTes,0]
        "Table matrix (time = first column; e.g., table=[0, 0; 1, 1; 2, 4])";

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
            origin={308,-136})));
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
            origin={168,-136})));
      Buildings.Fluid.Sources.MassFlowSource_T sec_ret(
        redeclare package Medium = MediumW,
        use_m_flow_in=true,
        use_T_in=true,
        nPorts=1) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={168,-92})));
      Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = MediumW,
          nPorts=1)                                                                                    annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={408,-136})));
      Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package
          Medium =
            Buildings.Media.Water, m_flow_nominal=mSec_flow_nominal)
        annotation (Placement(transformation(extent={{350,-106},{370,-86}})));
      Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={246,36}),   iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={80,-292})));
      Modelica.Blocks.Interfaces.RealInput T_chw_in annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={194,36}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={228,40})));
      Modelica.Blocks.Interfaces.RealInput m_flow_sec annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={120,38}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={152,40})));
      Modelica.Blocks.Interfaces.RealOutput T_chw_out annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={360,40}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={390,40})));
      Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={576,-322}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={580,-314})));
      Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
          Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
        annotation (Placement(transformation(extent={{-11,13},{11,-13}},
            rotation=270,
            origin={169,-181})));
      Plant_Controller_weiping_062822  plaCon(
        chargeStartMorn_CTes=casDat.chargeStartMorn_CTes,
        chargeEndMorn_CTes=casDat.chargeEndMorn_CTes,
        dischargeStart_CTes=casDat.dischargeStart_CTes,
        dischargeEnd_CTes=casDat.dischargeEnd_CTes,
        chargeStartNight_CTes=casDat.chargeStartNight_CTes,
        chargeEndNight_CTes=casDat.chargeEndNight_CTes,  TSolCoo=casDat.TSolCoo,TLiqCoo=casDat.TLiqCoo)
        annotation (Placement(transformation(extent={{266,-306},{318,-280}})));
      Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
        "Set point for chiller temperature"
        annotation (Placement(transformation(extent={{180,-320},{192,-308}})));
      BaseCoolingVarCOP_weiping_062822 coo(m_flow_nominal=casDat.mAWHP_flow_nominal+
       casDat.mTes_flow_nominal, k=casDat.kPCMCoo, c=casDat.cPCMCoo, d=casDat.dPCMCoo, TSol=casDat.TSolCoo, TLiq=casDat.TLiqCoo, LHea=casDat.LHeaCoo,
       Q_flow_nominal=casDat.QCoo_flow_nominal, mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,mTes_flow_nominal=casDat.mTes_flow_nominal,
       Tes_nominal=casDat.LTes_nominal, dp_nominal=casDat.dp_nominal, dpFixed_nominal=
       casDat.dpFixed_nominal, dpValve_nominal=casDat.dpValve_nominal) annotation (Placement(transformation(
            extent={{-16,49},{16,-49}},
            rotation=90,
            origin={237,-244})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
        "Case study data"
        annotation (Placement(transformation(extent={{-8,-92},{52,-152}})));

      Modelica.Blocks.Sources.Constant TSetSupChiConst1(final k=casDat.TSetSupCW)
        "Set point for chiller temperature"
        annotation (Placement(transformation(extent={{302,-338},{314,-326}})));
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
            origin={313,-199})));
      Modelica.Blocks.Math.BooleanToReal booToInt(final realTrue=m_flow)
                    "Boolean to integer conversion"
        annotation (Placement(transformation(extent={{262,-180},{272,-170}})));
    equation

      connect(chw_sup.port_3, chw_ret.port_3)
        annotation (Line(points={{298,-136},{178,-136}}, color={0,127,255}));
      connect(m_flow_sec, sec_ret.m_flow_in) annotation (Line(points={{120,38},{120,
              -80},{176,-80}},       color={0,0,127}));
      connect(T_chw_in, sec_ret.T_in) annotation (Line(points={{194,36},{194,-80},{172,
              -80}},      color={0,0,127}));
      connect(senTem.port_b,bou. ports[1]) annotation (Line(points={{370,-96},{384,-96},
              {384,-136},{398,-136}},       color={0,127,255}));
      connect(senTem.T, T_chw_out) annotation (Line(points={{360,-85},{360,40}},
                                    color={0,0,127}));
      connect(sec_ret.ports[1], chw_ret.port_2)
        annotation (Line(points={{168,-102},{168,-126}}, color={0,127,255}));
      connect(chw_sup.port_1, senTem.port_a) annotation (Line(points={{308,-126},{308,
              -96},{350,-96}},   color={0,127,255}));
      connect(chw_ret.port_1, sen_retTem.port_a) annotation (Line(points={{168,-146},
              {168,-170},{169,-170}}, color={0,127,255}));
      connect(T_chw_out, T_chw_out) annotation (Line(points={{360,40},{360,40}},
                                   color={0,0,127}));
      connect(coo.TSetASHP, TSetSupChiConst.y) annotation (Line(points={{263.385,
              -263.2},{263.385,-314},{192.6,-314}},
                                            color={0,0,127}));
      connect(coo.uASHP, plaCon.yASHP) annotation (Line(points={{274.692,-263.2},
              {274.692,-278.7},{279.52,-278.7}},
                                        color={0,0,127}));
      connect(plaCon.uTTes, coo.TTes) annotation (Line(points={{308.64,-308.08},
              {308,-308.08},{308,-318},{378,-318},{378,-226.4},{255.846,-226.4}},
                                                             color={0,0,127}));
      connect(plaCon.uTSet, TSetSupChiConst1.y) annotation (Line(points={{316.96,-308.08},
              {316.96,-320.04},{314.6,-320.04},{314.6,-332}},          color={0,0,
              127}));
      connect(coo.TSup, plaCon.uTMea) annotation (Line(points={{259.992,-226.4},
              {396,-226.4},{396,-334},{352,-334},{352,-330},{300,-330},{300,
              -308.08},{300.32,-308.08}},            color={0,0,127}));
      connect(plaCon.enaChi, chiOn) annotation (Line(points={{282.64,-308.08},{
              282.64,-141.04},{246,-141.04},{246,36}},
                                       color={255,0,255}));
      connect(T_air_in, coo.uTDryBul) annotation (Line(points={{576,-322},{374,
              -322},{374,-263.2},{281.854,-263.2}},
                                          color={0,0,127}));
      connect(plaCon.yTES, coo.uTes) annotation (Line(points={{268.6,-278.7},{
              242.3,-278.7},{242.3,-263.2},{237,-263.2}},
                                                color={0,0,127}));
      connect(coo.port_a, sen_retTem.port_b) annotation (Line(points={{225.692,
              -228},{230,-228},{230,-192},{169,-192}}, color={0,127,255}));
      connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{313,
              -190},{313,-169},{308,-169},{308,-146}}, color={0,127,255}));
      connect(coo.port_b, pumChiWat.port_a) annotation (Line(points={{243.785,
              -228},{280,-228},{280,-208},{313,-208}}, color={0,127,255}));
      connect(booToInt.y, pumChiWat.m_flow_in) annotation (Line(points={{272.5,
              -175},{288.25,-175},{288.25,-199},{302.2,-199}}, color={0,0,127}));
      connect(booToInt.u, chiOn) annotation (Line(points={{261,-175},{261,-140},{
              246,-140},{246,36}}, color={255,0,255}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,
                -340},{560,20}}),   graphics={Line(points={{310,404}}, color={28,
                  108,200}), Line(
              points={{34,406}},
              color={0,127,255},
              smooth=Smooth.Bezier),
            Text(
              textString="Edit Here",
              extent={{192,-226},{260,-248}},
              lineColor={28,108,200})}),
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
</html>",     revisions="<html>
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
        Icon(coordinateSystem(extent={{100,-340},{560,20}}),  graphics={
            Rectangle(
              extent={{-70,80},{70,-80}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              origin={208,-152},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={209.5,-93},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={209.5,-213},
              rotation=360),
            Rectangle(
              extent={{-57,9},{57,-9}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={209,-93},
              rotation=360),
            Rectangle(
              extent={{-57,9},{57,-9}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={209,-213},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              origin={203.5,-93},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              origin={209.5,-211},
              rotation=360),
            Rectangle(
              extent={{-50,-5},{50,5}},
              lineColor={0,0,127},
              pattern=LinePattern.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              origin={264,-95},
              rotation=360),
            Polygon(
              points={{0,6},{-10,-6},{10,-6},{0,6}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-154},
              rotation=360),
            Polygon(
              points={{0,-5},{-10,5},{10,5},{0,-5}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-141},
              rotation=360),
            Rectangle(
              extent={{-2,20},{2,-20}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-122},
              rotation=360),
            Rectangle(
              extent={{-2,20},{2,-20}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-184},
              rotation=360),
            Rectangle(
              extent={{-2,51},{2,-51}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-153},
              rotation=360),
            Ellipse(
              extent={{-16,16},{16,-16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-152},
              rotation=180),
            Polygon(
              points={{0,8},{-16,-8},{16,-8},{0,8}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={166,-152},
              rotation=180),
            Rectangle(
              extent={{-50,-5},{50,5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              origin={166,-213},
              rotation=360),
            Rectangle(
              extent={{318,-136},{328,-178}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{302,-152},{344,-160}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{386,-76},{526,-236}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{356,-151},{557,-161}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{492,-72},{496,-232}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{416,-72},{420,-232}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{454,-76},{458,-236}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{386,-152},{526,-158}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(extent={{100,20},{558,-338}}, lineColor={135,135,135})}));
    end AC_AWHP_PrimaryLoop_addpts_wTES_no_y;

    model Plant_Controller_weiping_062822
      parameter Real TSolCoo;
      parameter Real TLiqCoo;

      Modelica.Blocks.Math.RealToInteger intRea "Integer to real"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={74,-42})));
    hil_flexlab_model.Plants.Controls.Controller4
                                     C4Coo(
        TLimCha=TSolCoo - 1,
        deadbandCha=1,
        TLimDis=TLiqCoo + 1,
        deadbandDis=1,
        Cold=true) "Controller to enable charging and discharging"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={20,-10})));
      Modelica.Blocks.Logical.Switch swiTes "TES charging and discharging switch"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-62,10})));
      hil_flexlab_model.Plants.Controls.Controller1Cool_TES_ASHP C1Coo "C1 controller for cooling"
        annotation (Placement(transformation(extent={{10,-16},{-10,16}},
            rotation=0,
            origin={-24,74})));
      Modelica.Blocks.Interfaces.RealOutput yTES
        "Temperature of return water to ASHP" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,108}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-90,110})));
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
            origin={-13,-115}),iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={-36,-116})));
      Modelica.Blocks.Interfaces.RealInput uTMea
        "Supply temp feedback to controller"     annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={35,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={32,-116})));
      Modelica.Blocks.Interfaces.RealOutput yASHP
        "Temperature of return water to ASHP" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-48,110})));
      Modelica.Blocks.Interfaces.RealInput uTTes "TES temp feedback to controller"
                                          annotation (Placement(transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={77,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={64,-116})));
      Modelica.Blocks.Sources.Constant conTesChiDisLim(k=1.0)
        "Constant for cold TES discharge limit"
        annotation (Placement(transformation(extent={{74,38},{54,58}})));
      Modelica.Blocks.Sources.BooleanConstant onPlaChi(k=true) "On signal"
        annotation (Placement(transformation(extent={{94,62},{74,82}})));
      Modelica.Blocks.Interfaces.RealInput uSch
        "Schedule of charge/discharge times for TES" annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=180,
            origin={117,-43}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=180,
            origin={116,-76})));
      Modelica.Blocks.Interfaces.BooleanOutput yPum
        "Temperature of return water to ASHP" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-28,110})));
      Modelica.Blocks.Interfaces.RealInput uTRet "TES temp feedback to controller"
        annotation (Placement(transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={55,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={64,-116})));
      Modelica.Blocks.Math.Gain gaiCha(k=-1) "Charge control gain"
                                                                  annotation (
          Placement(transformation(
            extent={{5,-5},{-5,5}},
            rotation=0,
            origin={-31,-61})));
      Modelica.Blocks.Interfaces.RealInput uChaCon
        "Charge Controller input  to Plant controller" annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={13,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={-2,-116})));
      Modelica.Blocks.Interfaces.BooleanOutput yenaCha
        "Enable charge output to Charge Control" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-10,110})));
      Modelica.Blocks.MathBoolean.Or
                                 or2(nu=2)
        annotation (Placement(transformation(extent={{34,22},{22,34}})));
    equation
      connect(C4Coo.enaCha,swiTes. u2) annotation (Line(points={{9,-6},{0,-6},{
              0,10},{-50,10}}, color={255,0,255}));
      connect(C1Coo.yTesDis, swiTes.u3) annotation (Line(points={{-36,80},{-40,80},
              {-40,2},{-50,2}},color={0,0,127}));
      connect(C4Coo.mode, intRea.y) annotation (Line(points={{32,-2},{60,-2},{
              60,-42},{63,-42}},
                         color={255,127,0}));
      connect(swiTes.y, yTES)
        annotation (Line(points={{-73,10},{-80,10},{-80,108}}, color={0,0,127}));
      connect(C1Coo.TSet, uTSet) annotation (Line(points={{-12,88},{96,88},{96,
              -115},{97,-115}},
                         color={0,0,127}));
      connect(uTMea, C1Coo.TMea) annotation (Line(points={{35,-115},{35,-30.5},{-24,
              -30.5},{-24,56}}, color={0,0,127}));
      connect(C1Coo.yASHP, yASHP) annotation (Line(points={{-36,68},{-48,68},{
              -48,110}}, color={0,0,127}));
      connect(uTTes, C4Coo.Ttes) annotation (Line(points={{77,-115},{77,-62},{
              42,-62},{42,-10},{32,-10}},
                                    color={0,0,127}));
      connect(conTesChiDisLim.y, C1Coo.uTesLim) annotation (Line(points={{53,48},{
              30,48},{30,82},{-12,82}}, color={0,0,127}));
      connect(onPlaChi.y, C1Coo.enaASHP) annotation (Line(points={{73,72},{30,72},{
              30,70},{-12,70}}, color={255,0,255}));
      connect(intRea.u, uSch) annotation (Line(points={{86,-42},{102,-42},{102,
              -43},{117,-43}}, color={0,0,127}));
      connect(swiTes.u1, gaiCha.y) annotation (Line(points={{-50,18},{-38,18},{
              -38,-61},{-36.5,-61}}, color={0,0,127}));
      connect(uChaCon, gaiCha.u) annotation (Line(points={{13,-115},{13,-87.5},
              {-25,-87.5},{-25,-61}}, color={0,0,127}));
      connect(C4Coo.enaCha, yenaCha) annotation (Line(points={{9,-6},{0,-6},{0,
              110},{-10,110}}, color={255,0,255}));
      connect(swiTes.u2, or2.u[1]) annotation (Line(points={{-50,10},{48,10},{
              48,30.1},{34,30.1}}, color={255,0,255}));
      connect(enaChi, or2.u[2]) annotation (Line(points={{-13,-115},{-13,-45.5},
              {34,-45.5},{34,25.9}}, color={255,0,255}));
      connect(C1Coo.enaCoo, or2.y) annotation (Line(points={{-12,58},{6,58},{6,
              28},{21.1,28}}, color={255,0,255}));
      connect(or2.y, yPum) annotation (Line(points={{21.1,28},{21.1,94},{-28,94},
              {-28,110}}, color={255,0,255}));
      connect(C4Coo.enaDis, C1Coo.enaTesDis) annotation (Line(points={{9,-14},{
              -2,-14},{-2,78},{-12,78}}, color={255,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Plant_Controller_weiping_062822;

    model Plant_Controller_2SP
      parameter Real TSolCoo;
      parameter Real TLiqCoo;

      Modelica.Blocks.Math.RealToInteger intRea "Integer to real"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={74,-42})));
    hil_flexlab_model.Plants.Controls.Controller4
                                     C4Coo(
        TLimCha=TSolCoo - 1,
        deadbandCha=1,
        TLimDis=TLiqCoo + 1,
        deadbandDis=1,
        Cold=true) "Controller to enable charging and discharging"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={20,-10})));
      Modelica.Blocks.Logical.Switch swiTes "TES charging and discharging switch"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-62,10})));
      hil_flexlab_model.Plants.Controls.Controller1Cool_TES_ASHP C1Coo "C1 controller for cooling"
        annotation (Placement(transformation(extent={{10,-16},{-10,16}},
            rotation=0,
            origin={-24,74})));
      Modelica.Blocks.Interfaces.RealOutput yTES
        "Temperature of return water to ASHP" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,108}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-90,110})));
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
            origin={-13,-115}),iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={-36,-116})));
      Modelica.Blocks.Interfaces.RealInput uTMea
        "Supply temp feedback to controller"     annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={35,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={32,-116})));
      Modelica.Blocks.Interfaces.RealOutput yASHP
        "Temperature of return water to ASHP" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-48,110})));
      Modelica.Blocks.Interfaces.RealInput uTTes "TES temp feedback to controller"
                                          annotation (Placement(transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={77,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={64,-116})));
      Modelica.Blocks.Sources.Constant conTesChiDisLim(k=1.0)
        "Constant for cold TES discharge limit"
        annotation (Placement(transformation(extent={{74,38},{54,58}})));
      Modelica.Blocks.Sources.BooleanConstant onPlaChi(k=true) "On signal"
        annotation (Placement(transformation(extent={{94,62},{74,82}})));
      Modelica.Blocks.Interfaces.RealInput uSch
        "Schedule of charge/discharge times for TES" annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=180,
            origin={117,-43}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=180,
            origin={116,-76})));
      Modelica.Blocks.Interfaces.BooleanOutput yPum
        "Temperature of return water to ASHP" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-28,110})));
      Modelica.Blocks.Interfaces.RealInput uTRet "TES temp feedback to controller"
        annotation (Placement(transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={55,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={64,-116})));
      Modelica.Blocks.Math.Gain gaiCha(k=-1) "Charge control gain"
                                                                  annotation (
          Placement(transformation(
            extent={{5,-5},{-5,5}},
            rotation=0,
            origin={-31,-61})));
      Modelica.Blocks.Interfaces.RealInput uChaCon
        "Charge Controller input  to Plant controller" annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={13,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={-2,-116})));
      Modelica.Blocks.Interfaces.BooleanOutput yenaCha
        "Enable charge output to Charge Control" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-10,110})));
      Modelica.Blocks.MathBoolean.Or
                                 or2(nu=2)
        annotation (Placement(transformation(extent={{34,22},{22,34}})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={84,16})));
      Modelica.Blocks.Sources.Constant conTesChaTemp(k=-2)
        "Constant for cold TES discharge limit"
        annotation (Placement(transformation(extent={{86,-24},{66,-4}})));
      Modelica.Blocks.Logical.Switch swiTes1
                                            "TES charging and discharging switch"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={106,46})));
    equation
      connect(C4Coo.enaCha,swiTes. u2) annotation (Line(points={{9,-6},{0,-6},{
              0,10},{-50,10}}, color={255,0,255}));
      connect(C1Coo.yTesDis, swiTes.u3) annotation (Line(points={{-36,80},{-40,80},
              {-40,2},{-50,2}},color={0,0,127}));
      connect(C4Coo.mode, intRea.y) annotation (Line(points={{32,-2},{60,-2},{
              60,-42},{63,-42}},
                         color={255,127,0}));
      connect(swiTes.y, yTES)
        annotation (Line(points={{-73,10},{-80,10},{-80,108}}, color={0,0,127}));
      connect(uTMea, C1Coo.TMea) annotation (Line(points={{35,-115},{35,-30.5},{-24,
              -30.5},{-24,56}}, color={0,0,127}));
      connect(C1Coo.yASHP, yASHP) annotation (Line(points={{-36,68},{-48,68},{
              -48,110}}, color={0,0,127}));
      connect(uTTes, C4Coo.Ttes) annotation (Line(points={{77,-115},{77,-62},{
              42,-62},{42,-10},{32,-10}},
                                    color={0,0,127}));
      connect(conTesChiDisLim.y, C1Coo.uTesLim) annotation (Line(points={{53,48},{
              30,48},{30,82},{-12,82}}, color={0,0,127}));
      connect(onPlaChi.y, C1Coo.enaASHP) annotation (Line(points={{73,72},{30,72},{
              30,70},{-12,70}}, color={255,0,255}));
      connect(intRea.u, uSch) annotation (Line(points={{86,-42},{102,-42},{102,
              -43},{117,-43}}, color={0,0,127}));
      connect(swiTes.u1, gaiCha.y) annotation (Line(points={{-50,18},{-38,18},{
              -38,-61},{-36.5,-61}}, color={0,0,127}));
      connect(uChaCon, gaiCha.u) annotation (Line(points={{13,-115},{13,-87.5},
              {-25,-87.5},{-25,-61}}, color={0,0,127}));
      connect(C4Coo.enaCha, yenaCha) annotation (Line(points={{9,-6},{0,-6},{0,
              110},{-10,110}}, color={255,0,255}));
      connect(swiTes.u2, or2.u[1]) annotation (Line(points={{-50,10},{48,10},{
              48,30.1},{34,30.1}}, color={255,0,255}));
      connect(enaChi, or2.u[2]) annotation (Line(points={{-13,-115},{-13,-45.5},
              {34,-45.5},{34,25.9}}, color={255,0,255}));
      connect(C1Coo.enaCoo, or2.y) annotation (Line(points={{-12,58},{6,58},{6,
              28},{21.1,28}}, color={255,0,255}));
      connect(or2.y, yPum) annotation (Line(points={{21.1,28},{21.1,94},{-28,94},
              {-28,110}}, color={255,0,255}));
      connect(C4Coo.enaDis, C1Coo.enaTesDis) annotation (Line(points={{9,-14},{
              -2,-14},{-2,78},{-12,78}}, color={255,0,255}));
      connect(add.u2, uTSet) annotation (Line(points={{90,4},{94,4},{94,-115},{
              97,-115}}, color={0,0,127}));
      connect(conTesChaTemp.y, add.u1) annotation (Line(points={{65,-14},{74,
              -14},{74,4},{78,4}}, color={0,0,127}));
      connect(add.y, swiTes1.u1) annotation (Line(points={{84,27},{134,27},{134,
              54},{118,54}}, color={0,0,127}));
      connect(swiTes1.y, C1Coo.TSet) annotation (Line(points={{95,46},{42,46},{
              42,88},{-12,88}}, color={0,0,127}));
      connect(C4Coo.enaCha, swiTes1.u2) annotation (Line(points={{9,-6},{132,-6},
              {132,46},{118,46}}, color={255,0,255}));
      connect(swiTes1.u3, uTSet) annotation (Line(points={{118,38},{124,38},{
              124,-115},{97,-115}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Plant_Controller_2SP;

    model Plant_Controller_3SP
      parameter Real TSolCoo;
      parameter Real TLiqCoo;

      Modelica.Blocks.Math.RealToInteger intRea "Integer to real"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={74,-42})));
    hil_flexlab_model.Plants.Controls.Controller4
                                     C4Coo(
        TLimCha=TSolCoo - 1,
        deadbandCha=1,
        TLimDis=TLiqCoo + 1,
        deadbandDis=1,
        Cold=true) "Controller to enable charging and discharging"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={20,-10})));
      Modelica.Blocks.Logical.Switch swiTes "TES charging and discharging switch"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-62,10})));
      hil_flexlab_model.Plants.Controls.Controller1Cool_TES_ASHP C1Coo "C1 controller for cooling"
        annotation (Placement(transformation(extent={{10,-16},{-10,16}},
            rotation=0,
            origin={-24,74})));
      Modelica.Blocks.Interfaces.RealOutput yTES
        "Temperature of return water to ASHP" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-80,108}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-90,110})));
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
            origin={-13,-115}),iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={-36,-116})));
      Modelica.Blocks.Interfaces.RealInput uTMea
        "Supply temp feedback to controller"     annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={35,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={32,-116})));
      Modelica.Blocks.Interfaces.RealOutput yASHP
        "Temperature of return water to ASHP" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-48,110})));
      Modelica.Blocks.Interfaces.RealInput uTTes "TES temp feedback to controller"
                                          annotation (Placement(transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={77,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={64,-116})));
      Modelica.Blocks.Sources.Constant conTesChiDisLim(k=1.0)
        "Constant for cold TES discharge limit"
        annotation (Placement(transformation(extent={{74,38},{54,58}})));
      Modelica.Blocks.Sources.BooleanConstant onPlaChi(k=true) "On signal"
        annotation (Placement(transformation(extent={{94,62},{74,82}})));
      Modelica.Blocks.Interfaces.RealInput uSch
        "Schedule of charge/discharge times for TES" annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=180,
            origin={223,-79}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=180,
            origin={238,-74})));
      Modelica.Blocks.Interfaces.BooleanOutput yPum
        "Temperature of return water to ASHP" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-28,110})));
      Modelica.Blocks.Interfaces.RealInput uTRet "TES temp feedback to controller"
        annotation (Placement(transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={55,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={64,-116})));
      Modelica.Blocks.Math.Gain gaiCha(k=-1) "Charge control gain"
                                                                  annotation (
          Placement(transformation(
            extent={{5,-5},{-5,5}},
            rotation=0,
            origin={-31,-61})));
      Modelica.Blocks.Interfaces.RealInput uChaCon
        "Charge Controller input  to Plant controller" annotation (Placement(
            transformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={13,-115}), iconTransformation(
            extent={{-15,-15},{15,15}},
            rotation=90,
            origin={-2,-116})));
      Modelica.Blocks.Interfaces.BooleanOutput yenaCha
        "Enable charge output to Charge Control" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-10,110})));
      Modelica.Blocks.MathBoolean.Or
                                 or2(nu=2)
        annotation (Placement(transformation(extent={{34,22},{22,34}})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={112,24})));
      Modelica.Blocks.Sources.Constant conTesChaTemp(k=-4)
        "Constant for cold TES discharge limit"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=180,
            origin={74,12})));
      Modelica.Blocks.Logical.Switch swiTes1
                                            "TES charging and discharging switch"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={240,64})));
      Modelica.Blocks.Logical.Switch swiTes2
                                            "TES charging and discharging switch"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={132,88})));
      Modelica.Blocks.Sources.Constant conTesDisTemp(k=0)
        "Constant for cold TES discharge limit"
        annotation (Placement(transformation(extent={{186,-50},{166,-30}})));
      Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={140,-32})));
      Modelica.Blocks.Interfaces.RealOutput yTSet
        "Temperature setpoint derived from mode logic" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-66,110})));
    equation
      connect(C4Coo.enaCha,swiTes. u2) annotation (Line(points={{9,-6},{0,-6},{
              0,10},{-50,10}}, color={255,0,255}));
      connect(C1Coo.yTesDis, swiTes.u3) annotation (Line(points={{-36,80},{-40,80},
              {-40,2},{-50,2}},color={0,0,127}));
      connect(C4Coo.mode, intRea.y) annotation (Line(points={{32,-2},{60,-2},{
              60,-42},{63,-42}},
                         color={255,127,0}));
      connect(swiTes.y, yTES)
        annotation (Line(points={{-73,10},{-80,10},{-80,108}}, color={0,0,127}));
      connect(uTMea, C1Coo.TMea) annotation (Line(points={{35,-115},{35,-30.5},{-24,
              -30.5},{-24,56}}, color={0,0,127}));
      connect(C1Coo.yASHP, yASHP) annotation (Line(points={{-36,68},{-48,68},{
              -48,110}}, color={0,0,127}));
      connect(uTTes, C4Coo.Ttes) annotation (Line(points={{77,-115},{77,-62},{
              42,-62},{42,-10},{32,-10}},
                                    color={0,0,127}));
      connect(conTesChiDisLim.y, C1Coo.uTesLim) annotation (Line(points={{53,48},{
              30,48},{30,82},{-12,82}}, color={0,0,127}));
      connect(onPlaChi.y, C1Coo.enaASHP) annotation (Line(points={{73,72},{30,72},{
              30,70},{-12,70}}, color={255,0,255}));
      connect(intRea.u, uSch) annotation (Line(points={{86,-42},{102,-42},{102,
              -79},{223,-79}}, color={0,0,127}));
      connect(swiTes.u1, gaiCha.y) annotation (Line(points={{-50,18},{-38,18},{
              -38,-61},{-36.5,-61}}, color={0,0,127}));
      connect(uChaCon, gaiCha.u) annotation (Line(points={{13,-115},{13,-87.5},
              {-25,-87.5},{-25,-61}}, color={0,0,127}));
      connect(C4Coo.enaCha, yenaCha) annotation (Line(points={{9,-6},{0,-6},{0,
              110},{-10,110}}, color={255,0,255}));
      connect(swiTes.u2, or2.u[1]) annotation (Line(points={{-50,10},{48,10},{
              48,30.1},{34,30.1}}, color={255,0,255}));
      connect(enaChi, or2.u[2]) annotation (Line(points={{-13,-115},{-13,-45.5},
              {34,-45.5},{34,25.9}}, color={255,0,255}));
      connect(C1Coo.enaCoo, or2.y) annotation (Line(points={{-12,58},{6,58},{6,
              28},{21.1,28}}, color={255,0,255}));
      connect(or2.y, yPum) annotation (Line(points={{21.1,28},{21.1,94},{-28,94},
              {-28,110}}, color={255,0,255}));
      connect(C4Coo.enaDis, C1Coo.enaTesDis) annotation (Line(points={{9,-14},{
              -2,-14},{-2,78},{-12,78}}, color={255,0,255}));
      connect(add.u2, uTSet) annotation (Line(points={{118,12},{120,12},{120,
              -115},{97,-115}}, color={0,0,127}));
      connect(conTesChaTemp.y, add.u1) annotation (Line(points={{85,12},{106,12}},
                                      color={0,0,127}));
      connect(add.y, swiTes1.u1) annotation (Line(points={{112,35},{192,35},{
              192,46},{310,46},{310,72},{252,72}},
                        color={0,0,127}));
      connect(C4Coo.enaCha, swiTes1.u2) annotation (Line(points={{9,-6},{102,-6},
              {102,-4},{196,-4},{196,26},{252,26},{252,64}}, color={255,0,255}));
      connect(swiTes1.u3, uTSet) annotation (Line(points={{252,56},{276,56},{
              276,-115},{97,-115}}, color={0,0,127}));
      connect(C4Coo.enaDis, swiTes2.u2) annotation (Line(points={{9,-14},{210,
              -14},{210,88},{144,88}}, color={255,0,255}));
      connect(swiTes1.y, swiTes2.u3) annotation (Line(points={{229,64},{182,64},
              {182,80},{144,80}}, color={0,0,127}));
      connect(conTesDisTemp.y, add1.u2) annotation (Line(points={{165,-40},{156,
              -40},{156,-44},{146,-44}}, color={0,0,127}));
      connect(uTSet, add1.u1) annotation (Line(points={{97,-115},{97,-81.5},{
              134,-81.5},{134,-44}}, color={0,0,127}));
      connect(add1.y, swiTes2.u1) annotation (Line(points={{140,-21},{170,-21},
              {170,96},{144,96}},
                         color={0,0,127}));
      connect(swiTes2.y, C1Coo.TSet)
        annotation (Line(points={{121,88},{-12,88}}, color={0,0,127}));
      connect(swiTes2.y, yTSet) annotation (Line(points={{121,88},{27.5,88},{
              27.5,110},{-66,110}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{220,100}})),                             Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                220,100}})));
    end Plant_Controller_3SP;

    model Tes_weiping_062822 "Tes storage implementation"
      replaceable package Medium = Buildings.Media.Water "Medium for water flow";
      parameter Modelica.SIunits.MassFlowRate mTes_flow_nominal = 1e-15 "Nominal mass flow rate through TES device";
      parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
      parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
      parameter Modelica.SIunits.Density d(displayUnit="kg/m3") = 1500 "Mass density of PCM";
      parameter Modelica.SIunits.Temperature TSol=273.15+29.5 "Solidus temperature of PCM.";
      parameter Modelica.SIunits.Temperature TLiq=273.15+29.66 "Liquidus temperature of PCM";
      parameter Modelica.SIunits.Temperature T_start=TSol - 2 "start temperature of PCM";

      parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";
      parameter Modelica.SIunits.Energy Tes_nominal=Tes_nominal "Design capacity (factor * 1kWh)";
      parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0)
        "Pressure drop of pipe and other resistances that are in series";
      parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0)
        "Nominal pressure drop of fully open valve";
      parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")
        "Nominal pressure raise, used for default pressure curve if not specified in record per";

      Buildings.Fluid.Movers.FlowControlled_m_flow pumTes(
        redeclare package Medium = Medium,
        m_flow_nominal=mTes_flow_nominal,
        addPowerToMedium=false,
        nominalValuesDefineDefaultPressureCurve=true,
        riseTime=180,
        dp_nominal=dp_nominal) "TES pump" annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={0,20})));
      Buildings.Fluid.Sensors.TemperatureTwoPort senTemTes(
        redeclare package Medium = Medium,
        m_flow_nominal=mTes_flow_nominal)
               "Temperature for leaving water of TES" annotation (Placement(
            transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-60,20})));
      Modelica.Blocks.Math.Gain gai(k=mTes_flow_nominal)
        "Gain for control signal controlling tes pumps"
        annotation (Placement(transformation(extent={{-84,96},{-76,104}})));
      Modelica.Blocks.Interfaces.RealInput uTes
        "Control signal for tes charging [-1-0] and discharging [0-1]"
        annotation (Placement(transformation(extent={{-140,80},{-100,120}})));

      Buildings.Fluid.Actuators.Valves.TwoWayEqualPercentage valCha(
        redeclare package Medium = Medium,
        m_flow_nominal=mTes_flow_nominal,
        dpValve_nominal=dpValve_nominal,
        dpFixed_nominal=dpFixed_nominal) "Valve for charging" annotation (Placement(
            transformation(
            extent={{-10,10},{10,-10}},
            rotation=-90,
            origin={60,50})));
      Buildings.Fluid.Actuators.Valves.TwoWayEqualPercentage valDis(
        redeclare package Medium = Medium,
        m_flow_nominal=mTes_flow_nominal,
        dpValve_nominal=dpValve_nominal,
        dpFixed_nominal=dpFixed_nominal) "Valve for discharge" annotation (Placement(
            transformation(
            extent={{10,10},{-10,-10}},
            rotation=-90,
            origin={60,-10})));
      Buildings.Fluid.FixedResistances.Junction splTes(
        redeclare package Medium = Medium,
        m_flow_nominal=mTes_flow_nominal*{-1,1,1},
        dp_nominal={0,0,0}) "Flow splitter for tes" annotation (Placement(
            transformation(
            extent={{10,10},{-10,-10}},
            rotation=90,
            origin={60,20})));
      Modelica.Blocks.Logical.GreaterThreshold gre "Greater than zero"
        annotation (Placement(transformation(extent={{-20,90},{0,110}})));
      Modelica.Blocks.Logical.Not not1 "Not" annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=0,
            origin={28,50})));
      Modelica.Blocks.Math.BooleanToReal booRea
        annotation (Placement(transformation(extent={{36,46},{44,54}})));
      Modelica.Blocks.Math.BooleanToReal booRea3
        annotation (Placement(transformation(extent={{36,-14},{44,-6}})));
      Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium =
            Medium)
        "Fluid connector for charging supply water (typically from supply side of plant)"
        annotation (Placement(transformation(extent={{90,70},{110,90}})));
      Modelica.Fluid.Interfaces.FluidPort_a port_a2(redeclare package Medium =
            Medium)
        "Fluid connector for discharging supply water (typically from return side of plant)"
        annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
      Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
            Medium)
        "Fluid connector for return water (typically to return side of plant)"
        annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
      Buildings.Fluid.Sensors.TemperatureTwoPort senTemSupCha(
        redeclare package Medium = Medium,
        m_flow_nominal=mTes_flow_nominal)
               "Temperature for supply water to TES from supply port" annotation (
          Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={80,80})));
      Buildings.Fluid.Sensors.TemperatureTwoPort senTemSupDis(
        redeclare package Medium = Medium,
        m_flow_nominal=mTes_flow_nominal)
               "Temperature for supply water to TES from return port" annotation (
          Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={80,-40})));
      Modelica.Blocks.Math.Abs absFlo "Absolute value of flow" annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={0,70})));
      Modelica.Blocks.Interfaces.RealOutput TTes "Outlet fluid temperature of TES"
        annotation (Placement(transformation(extent={{100,90},{120,110}})));
      hil_flexlab_model.Plants.BaseClasses.CoilRegisterFourPort coilRegisterFourPort(
        m1_flow_nominal=mTes_flow_nominal/2,
        m2_flow_nominal=mTes_flow_nominal/2,
        TStart_pcm=T_start,
        Design(Tes_nominal=Tes_nominal, PCM(
            k=k,
            c=c,
            d=d,
            TSol=TSol,
            TLiq=TLiq,
            LHea=LHea)),
        redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
      Modelica.Blocks.Interfaces.RealOutput SOC "state of charge of PCM"
        annotation (Placement(transformation(extent={{100,-110},{120,-90}})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMax=mTes_flow_nominal, uMin=1e-4*
            mTes_flow_nominal) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=-90,
            origin={0,46})));
      Modelica.Blocks.Interfaces.RealOutput uPCM "input for state of charge of PCM"
        annotation (Placement(transformation(extent={{-100,-68},{-120,-48}})));
      Modelica.Blocks.Interfaces.RealOutput mPCM "mPCM"
        annotation (Placement(transformation(extent={{-100,-90},{-120,-70}})));
    equation
      connect(valCha.port_b, splTes.port_1)
        annotation (Line(points={{60,40},{60,30}}, color={0,127,255}));
      connect(uTes, gai.u)
        annotation (Line(points={{-120,100},{-84.8,100}}, color={0,0,127}));
      connect(gai.y, gre.u)
        annotation (Line(points={{-75.6,100},{-22,100}}, color={0,0,127}));
      connect(valCha.y, booRea.y)
        annotation (Line(points={{48,50},{44.4,50}}, color={0,0,127}));
      connect(valDis.y, booRea3.y)
        annotation (Line(points={{48,-10},{44.4,-10}}, color={0,0,127}));
      connect(valDis.port_b, splTes.port_2)
        annotation (Line(points={{60,0},{60,10}},    color={0,127,255}));
      connect(pumTes.port_a, splTes.port_3)
        annotation (Line(points={{10,20},{50,20}},
                                                 color={0,127,255}));
      connect(senTemTes.port_b, port_b) annotation (Line(points={{-70,20},{-80,20},
              {-80,-80},{100,-80}},
                                 color={0,127,255}));
      connect(valCha.port_a, senTemSupCha.port_b)
        annotation (Line(points={{60,60},{60,80},{70,80}}, color={0,127,255}));
      connect(senTemSupCha.port_a, port_a1)
        annotation (Line(points={{90,80},{100,80}}, color={0,127,255}));
      connect(valDis.port_a, senTemSupDis.port_b)
        annotation (Line(points={{60,-20},{60,-40},{70,-40}}, color={0,127,255}));
      connect(senTemSupDis.port_a, port_a2)
        annotation (Line(points={{90,-40},{100,-40}}, color={0,127,255}));
      connect(gai.y, absFlo.u) annotation (Line(points={{-75.6,100},{-40,100},{-40,
              80},{2.22045e-15,80},{2.22045e-15,82}},
                                            color={0,0,127}));
      connect(gre.y, not1.u) annotation (Line(points={{1,100},{20,100},{20,50},{
              23.2,50}}, color={255,0,255}));
      connect(not1.y, booRea.u)
        annotation (Line(points={{32.4,50},{35.2,50}}, color={255,0,255}));
      connect(gre.y, booRea3.u) annotation (Line(points={{1,100},{20,100},{20,-10},
              {35.2,-10}}, color={255,0,255}));
      connect(senTemTes.T, TTes) annotation (Line(points={{-60,31},{-60,70},{40,70},
              {40,100},{110,100}}, color={0,0,127}));
      connect(pumTes.port_b, coilRegisterFourPort.port_a1) annotation (Line(points={{-10,20},
              {-16,20},{-16,34},{-40,34},{-40,24.2}},         color={0,127,255}));
      connect(pumTes.port_b, coilRegisterFourPort.port_a2) annotation (Line(points={{-10,20},
              {-16,20},{-16,15.8},{-20,15.8}},       color={0,127,255}));
      connect(senTemTes.port_a, coilRegisterFourPort.port_b1) annotation (Line(
            points={{-50,20},{-44,20},{-44,6},{-14,6},{-14,24.2},{-20,24.2}},
                                                                          color={0,
              127,255}));
      connect(coilRegisterFourPort.port_b2, coilRegisterFourPort.port_b1)
        annotation (Line(points={{-40,16.2},{-42,16.2},{-42,16},{-44,16},{-44,6},{-14,
              6},{-14,24.2},{-20,24.2}},
                                  color={0,127,255}));
      connect(coilRegisterFourPort.SOC, SOC) annotation (Line(points={{-19,11},{-16,
              11},{-16,-100},{110,-100}}, color={0,0,127}));
      connect(absFlo.y, limiter.u) annotation (Line(points={{-2.22045e-15,59},{
              -2.22045e-15,56.1},{1.33227e-15,56.1},{1.33227e-15,53.2}}, color={0,0,
              127}));
      connect(limiter.y, pumTes.m_flow_in) annotation (Line(points={{-1.22125e-15,
              39.4},{-2.22045e-15,35.5},{0,35.5},{0,32}}, color={0,0,127}));
      connect(coilRegisterFourPort.uPCM, uPCM) annotation (Line(points={{-41,14.2},{
              -41,-58.9},{-110,-58.9},{-110,-58}}, color={0,0,127}));
      connect(coilRegisterFourPort.mPCM, mPCM) annotation (Line(points={{-41,12.4},{
              -41,-80},{-110,-80}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}})),                                  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}})),
        experiment(
          StartTime=24192000,
          StopTime=24537600,
          Interval=59.9999616,
          Tolerance=1e-06,
          __Dymola_Algorithm="Dassl"));
    end Tes_weiping_062822;

    partial model partialSourceCoo_weiping_062822
      "Base primary system with single source for cooling"
      replaceable package Medium = Buildings.Media.Water "Water media model";
      parameter Modelica.SIunits.MassFlowRate mSou_flow_nominal = 1e-15 "Nominal mass flow rate through source";
      parameter Modelica.SIunits.Power Q_flow_nominal "Nominal thermal power of source";
      parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")
        "Nominal pressure raise, used for default pressure curve if not specified in record per";

      Buildings.Fluid.Movers.FlowControlled_m_flow pumSou(
        redeclare package Medium = Medium,
        m_flow_nominal=mSou_flow_nominal,
        addPowerToMedium=false,
        nominalValuesDefineDefaultPressureCurve=true,
        dp_nominal=dp_nominal) "Pump serving source" annotation (Placement(transformation(
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
      HeatPumps.BlackBox_Generic_TSetpoint blackBox_Generic_TSetpoint(QNom=
            Q_flow_nominal, m_flow_nominal=mSou_flow_nominal)
        annotation (Placement(transformation(
            extent={{11,-13},{-11,13}},
            rotation=180,
            origin={-45,-7})));
      Modelica.Blocks.Interfaces.RealInput TSetSou
        "Set point temperature of the fluid that leaves the heatpump"
        annotation (Placement(transformation(extent={{-140,-52},{-100,-12}})));
      Modelica.Blocks.Interfaces.RealInput TDryBul(unit="K")
        "Dry bulb temperature of source air"
        annotation (Placement(transformation(extent={{-140,-22},{-100,18}})));
      Buildings.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-68,22})));
    equation
      connect(senTemSouRet.port_a, pumSou.port_a)
        annotation (Line(points={{20,60},{10,60}}, color={0,127,255}));
      connect(gai.y, pumSou.m_flow_in) annotation (Line(points={{-59,60},{-50,60},{
              -50,80},{0,80},{0,72},{8.88178e-16,72}},
                                                 color={0,0,127}));
      connect(port_a, senTemSouRet.port_b)
        annotation (Line(points={{100,60},{40,60}}, color={0,127,255}));
      connect(gai.u, limiter.y)
        annotation (Line(points={{-82,60},{-85.6,60}}, color={0,0,127}));
      connect(limiter.u, uPum)
        annotation (Line(points={{-94.8,60},{-120,60}}, color={0,0,127}));
      connect(blackBox_Generic_TSetpoint.TSet, TSetSou) annotation (Line(points={{-51.6,
              -22.6},{-77.8,-22.6},{-77.8,-32},{-120,-32}},     color={0,0,127}));
      connect(blackBox_Generic_TSetpoint.TSource, TDryBul) annotation (Line(points={{-65.46,
              -5.96},{-65.46,-1.98},{-120,-1.98},{-120,-2}},          color={0,0,
              127}));
      connect(senTemSouSup.port_a, blackBox_Generic_TSetpoint.port_b) annotation (
         Line(points={{20,-60},{-34,-60},{-34,-14.8}}, color={0,127,255}));
      connect(blackBox_Generic_TSetpoint.port_a, pumSou.port_b) annotation (Line(
            points={{-34,0.8},{-22,0.8},{-22,60},{-10,60}}, color={0,127,255}));
      connect(TSup, senTemSouSup.T) annotation (Line(points={{110,-20},{70,-20},{
              70,-49},{30,-49}}, color={0,0,127}));
      connect(port_b, senTemSouSup.port_b)
        annotation (Line(points={{100,-60},{40,-60}}, color={0,127,255}));
      connect(prescribedTemperature.port, blackBox_Generic_TSetpoint.heatPort)
        annotation (Line(points={{-58,22},{-52,22},{-52,6},{-45,6}}, color={191,
              0,0}));
      connect(TDryBul, prescribedTemperature.T) annotation (Line(points={{-120,
              -2},{-98,-2},{-98,24},{-80,24},{-80,22}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end partialSourceCoo_weiping_062822;

    model ASHPCoolingBlackBox_weiping_062822
      "Heat pump for cooling with variable COP"
      extends
        hil_flexlab_model.Plants.Baseclasses_WH.partialSourceCoo_weiping_062822;
      Modelica.Blocks.Interfaces.RealOutput PEle(unit="W")
        "Electrical power consumption"
        annotation (Placement(transformation(extent={{100,90},{120,110}})));
      Modelica.Blocks.Interfaces.RealOutput yCOP "Electrical power consumption"
        annotation (Placement(transformation(extent={{100,72},{120,92}})));
      Modelica.Blocks.Interfaces.RealOutput ySpd "Electrical power consumption"
        annotation (Placement(transformation(extent={{100,34},{120,54}})));
      Modelica.Blocks.Math.RealToBoolean booToInt(threshold=0.001)
                                  "Boolean to integer conversion"
        annotation (Placement(transformation(extent={{-78,-56},{-68,-46}})));
    equation
      connect(blackBox_Generic_TSetpoint.PEl, PEle) annotation (Line(points={{-51.6,6},
              {58,6},{58,100},{110,100}},          color={0,0,127}));
      connect(blackBox_Generic_TSetpoint.COP_HP, yCOP) annotation (Line(points={{-54.9,6},
              {22,6},{22,82},{110,82}},          color={0,0,127}));
      connect(blackBox_Generic_TSetpoint.Mod, ySpd) annotation (Line(points={{-48.3,6},
              {26,6},{26,44},{110,44}},    color={0,0,127}));
      connect(booToInt.y, blackBox_Generic_TSetpoint.HP_On) annotation (Line(
            points={{-67.5,-51},{-67.5,-36.5},{-65.24,-36.5},{-65.24,-16.88}},
            color={255,0,255}));
      connect(limiter.u, booToInt.u) annotation (Line(points={{-94.8,60},{-86,
              60},{-86,-51},{-79,-51}}, color={0,0,127}));
      annotation (experiment(
          StartTime=21600000,
          StopTime=23328000,
          Interval=900.00288,
          Tolerance=1e-06,
          __Dymola_Algorithm="Radau"));
    end ASHPCoolingBlackBox_weiping_062822;

    model BaseCoolingVarCOP_weiping_062822
      "Basic cooling plant with variable COP components"
      extends hil_flexlab_model.Plants.BaseClasses.partialPlant_glycol(m_flow_nominal=
            mAWHP_flow_nominal + mTes_flow_nominal, senTemRet);
      parameter Modelica.SIunits.MassFlowRate mAWHP_flow_nominal = 1e-15 "Nominal mass flowrate of air-to-water heat pump";
      parameter Modelica.SIunits.MassFlowRate mTes_flow_nominal = 1e-15 "Nominal mass flowrate of tes";
      parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
      parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
      parameter Modelica.SIunits.Density d=1500 "Mass density of PCM";
      parameter Modelica.SIunits.Temperature TSol=273.15 + 29.5 "Solidus temperature of PCM.";
      parameter Modelica.SIunits.Temperature TLiq=273.15 + 29.66 "Liquidus temperature of PCM";
      parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";
      parameter Modelica.SIunits.DimensionlessRatio COPCoo_ASHP=3
        "Cooling COP of ASHP";
      parameter Modelica.SIunits.DimensionlessRatio COPCoo_SWEC=3
        "Cooling COP of SWEC";
      parameter Modelica.SIunits.Power Q_flow_nominal;
      parameter Modelica.SIunits.Energy Tes_nominal = 25200000
        "Design TES capacity";
      parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")
        "Nominal pressure raise, used for default pressure curve if not specified in record per";
      parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0)
        "Pressure drop of pipe and other resistances that are in series";
      parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0)
        "Nominal pressure drop of fully open valve";

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
        m_flow_nominal=m_flow_nominal,
        T_start=278.15)
               "Temperature sensor for supply water after AWHP" annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=-90,
            origin={20,100})));
      Baseclasses_WH.Tes_weiping_062822 TES(
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
        annotation (Placement(transformation(extent={{-38,-2},{-18,20}})));
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

      hil_flexlab_model.Plants.BaseClasses.ASHPCoolingVarCOP
        AWHP(
        mSou_flow_nominal=mAWHP_flow_nominal,
        Q_flow_nominal=Q_flow_nominal)
         annotation (Placement(transformation(extent={{-52,140},{-32,160}})));

      Modelica.Blocks.Interfaces.RealOutput COP_HP(unit="-") "COP of HP"
        annotation (Placement(transformation(extent={{100,224},{120,244}})));
    equation
      connect(spl2.port_2, senTemSupAWHP.port_a)
        annotation (Line(points={{20,116},{20,110}}, color={0,127,255}));
      connect(senTemSupAWHP.port_b, spl3.port_1)
        annotation (Line(points={{20,90},{20,80}}, color={0,127,255}));
      connect(spl3.port_3, TES.port_a1) annotation (Line(points={{10,70},{0,70},
              {0,17.8},{-18,17.8}},
                           color={0,127,255}));
      connect(spl4.port_3, TES.port_a2) annotation (Line(points={{10,-70},{0,
              -70},{0,4.6},{-18,4.6}},
                               color={0,127,255}));
      connect(TES.port_b, spl5.port_3) annotation (Line(points={{-18,0.2},{-10,
              0.2},{-10,-120},{10,-120}},
                                     color={0,127,255}));
      connect(senTemRetSwe.port_b, spl1.port_1) annotation (Line(points={{20,-258},
              {20,-260},{60,-260},{60,200},{20,200},{20,184}},color={0,127,255}));
      connect(ref.ports[1], spl1.port_1) annotation (Line(points={{60,220},{60,200},
              {20,200},{20,184}}, color={0,127,255}));
      connect(senTemRet.port_b, spl4.port_1)
        annotation (Line(points={{30,-30},{20,-30},{20,-60}}, color={0,127,255}));
      connect(TES.uTes, uTes) annotation (Line(points={{-40,20},{-72,20},{-72,0},
              {-120,0}},
                   color={0,0,127}));
      connect(TES.TTes, TTes) annotation (Line(points={{-17,20},{-10,20},{-10,
              86},{80,86},{80,100},{110,100}},
                                          color={0,0,127}));
      connect(spl1.port_2, spl2.port_1)
        annotation (Line(points={{20,164},{20,136}}, color={0,127,255}));
      connect(spl4.port_2, spl5.port_1)
        annotation (Line(points={{20,-80},{20,-110}}, color={0,127,255}));
      connect(senTemSupAWHP.T, TSup) annotation (Line(points={{9,100},{0,100},{0,
              122},{110,122}},
                          color={0,0,127}));
      connect(spl3.port_2, senMasFloSup.port_a) annotation (Line(points={{20,60},{
              20,4},{78,4},{78,10}},color={0,127,255}));
      connect(TES.SOC, SOC) annotation (Line(points={{-17,-2},{20,-2},{20,0},{
              110,0}},
            color={0,0,127}));
      connect(senTemRetSwe.T, TRetASHP) annotation (Line(points={{9,-248},{0,-248},
              {0,-240},{80,-240},{80,-220},{110,-220}}, color={0,0,127}));
      connect(senTemRetSwe.port_a, spl5.port_2)
        annotation (Line(points={{20,-238},{20,-130}}, color={0,127,255}));
      connect(AWHP.TSetSou, TSetASHP) annotation (Line(points={{-54,153},{-70,153},{
              -70,140},{-120,140}}, color={0,0,127}));
      connect(AWHP.TDryBul, uTDryBul) annotation (Line(points={{-54,158.8},{-70,158.8},
              {-70,240},{-120,240},{-120,238}},
                           color={0,0,127}));
      connect(AWHP.uPum, uASHP) annotation (Line(points={{-54,156},{-64,156},{-64,200},
              {-120,200}},
                     color={0,0,127}));
      connect(AWHP.port_a, spl1.port_3) annotation (Line(points={{-32,156},{0,156},{
              0,174},{10,174}}, color={0,127,255}));
      connect(AWHP.port_b, spl2.port_3) annotation (Line(points={{-32,144},{-14,144},
              {-14,126},{10,126}}, color={0,127,255}));
      connect(AWHP.TSup, TASHP)
        annotation (Line(points={{-31,148},{110,148}}, color={0,0,127}));
      connect(PEle, AWHP.PEle) annotation (Line(points={{110,260},{42,260},{42,160},
              {-31,160}}, color={0,0,127}));
      connect(AWHP.COP, COP_HP) annotation (Line(points={{-31,158.4},{36.5,
              158.4},{36.5,234},{110,234}}, color={0,0,127}));
    end BaseCoolingVarCOP_weiping_062822;

    package Examples

      model Cool_HP_test

        package MediumW = Buildings.Media.Water "Medium model for water";

        Modelica.Blocks.Sources.Sine OAT(
          amplitude=10,
          freqHz=0.0000115,
          offset=273 + 23) "Outdoor Air Temperature"
                      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-90,36})));
        Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
          "Set point for chiller temperature"
          annotation (Placement(transformation(extent={{-102,-10},{-80,12}})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
          "Case study data"
          annotation (Placement(transformation(extent={{-86,-68},{-62,-92}})));
        Modelica.Blocks.Sources.Ramp T_in(
          height=15,
          duration=86400/2,
          offset=273 + 10)
          annotation (Placement(transformation(extent={{-4,76},{16,96}})));
        Modelica.Blocks.Sources.Constant conTesCha1(k=0.5)
          "Control signal for TES charging"
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=180,
              origin={-78,74})));
        RTUPCM.HVAC.Plants.BaseClasses.ASHPCoolingVarCOPEvaPreCoo
                                      AWHP(
          redeclare package Medium = MediumW,
          mSou_flow_nominal=casDat.mAWHP_flow_nominal,
          Q_flow_nominal=casDat.QCoo_flow_nominal)
                         "Air-to-water heat pump"
          annotation (Placement(transformation(extent={{-32,-8},{26,40}})));
        Modelica.Blocks.Sources.BooleanConstant onPlaChi(k=true) "On signal"
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=180,
              origin={-84,-36})));
        Buildings.Fluid.Sources.Boundary_pT sinSupCoo(redeclare package Medium =
              MediumW, nPorts=1)
                             annotation (Placement(transformation(extent={{10,-10},{-10,
                  10}}, origin={142,4})));
        Buildings.Fluid.Sources.PropertySource_T souRetCoo(redeclare package
            Medium =
              MediumW, use_T_in=true)
                                    annotation (Placement(transformation(extent={{108,-48},
                  {128,-28}})));
        Modelica.Blocks.Sources.Constant
                                     TRetCoo(k=11 + 273.15)
          "Chilled water return temperature"
          annotation (Placement(transformation(extent={{182,-34},{162,-14}})));
        Buildings.Fluid.Sources.Boundary_pT souRet(redeclare package Medium = MediumW,
            nPorts=1) annotation (Placement(transformation(extent={{10,-10},{-10,10}},
                origin={152,-54})));
      equation
        connect(conTesCha1.y, AWHP.uPum) annotation (Line(points={{-67,74},{-50,74},{-50,
                30.4},{-37.8,30.4}}, color={0,0,127}));
        connect(AWHP.TSetSou, TSetSupChiConst.y) annotation (Line(points={{-37.8,23.2},
                {-59.9,23.2},{-59.9,1},{-78.9,1}}, color={0,0,127}));
        connect(AWHP.TDryBul, OAT.y) annotation (Line(points={{-37.8,37.6},{-79,
                37.6},{-79,36}},
                           color={0,0,127}));
        connect(onPlaChi.y, AWHP.enaPreCoo) annotation (Line(points={{-73,-36},{-44,-36},
                {-44,11.2},{-37.8,11.2}}, color={255,0,255}));
        connect(OAT.y, AWHP.TWetBul) annotation (Line(points={{-79,36},{-58.5,36},{-58.5,
                1.6},{-37.8,1.6}}, color={0,0,127}));
        connect(TRetCoo.y,souRetCoo. T_in) annotation (Line(
            points={{161,-24},{138,-24},{138,-26},{114,-26}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(souRetCoo.port_b,souRet. ports[1]) annotation (Line(points={{128,-38},
                {136,-38},{136,-54},{142,-54}},
                                       color={0,127,255}));
        connect(AWHP.port_a, souRetCoo.port_a) annotation (Line(points={{26,30.4},{68,
                30.4},{68,-38},{108,-38}}, color={0,127,255}));
        connect(sinSupCoo.ports[1], AWHP.port_b) annotation (Line(points={{132,4},{80,
                4},{80,1.6},{26,1.6}}, color={0,127,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(
            StopTime=3600,
            Interval=60,
            __Dymola_Algorithm="Dassl"));
      end Cool_HP_test;

      model Cool_Plant_test

        package MediumW = Buildings.Media.Water "Medium model for water";

        parameter Modelica.SIunits.Temperature TSet_nominal=273.15+6  "Nominal Water temperature supply setpoint of system";

        BaseCoolingVarCOP_weiping_062822 coo(m_flow_nominal=casDat.mAWHP_flow_nominal+
         casDat.mTes_flow_nominal, k=casDat.kPCMCoo, c=casDat.cPCMCoo, d=casDat.dPCMCoo, TSol=casDat.TSolCoo, TLiq=casDat.TLiqCoo, LHea=casDat.LHeaCoo,
         Q_flow_nominal=casDat.QCoo_flow_nominal, mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,mTes_flow_nominal=casDat.mTes_flow_nominal,
         Tes_nominal=casDat.LTes_nominal, dp_nominal=casDat.dp_nominal, dpFixed_nominal=
         casDat.dpFixed_nominal, dpValve_nominal=casDat.dpValve_nominal)
          annotation (Placement(transformation(extent={{-10,-42},{24,58}})));
        Modelica.Blocks.Sources.Sine OAT(
          amplitude=10,
          freqHz=0.0000115,
          offset=273 + 23) "Outdoor Air Temperature"
                      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-78,74})));
        Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
          "Set point for chiller temperature"
          annotation (Placement(transformation(extent={{-84,4},{-72,16}})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
          "Case study data"
          annotation (Placement(transformation(extent={{-86,-68},{-62,-92}})));
        Modelica.Blocks.Sources.Constant conTesCha(k=0.5)
          "Control signal for TES charging"
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-66,-36})));
        Modelica.Blocks.Sources.Constant conTesCha1(k=0.5)
          "Control signal for TES charging"
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-70,40})));
        replaceable Buildings.Fluid.HeatExchangers.Heater_T
                                                      loa(
          redeclare package Medium = MediumW,
          m_flow_nominal=casDat.mAWHP_flow_nominal+
         casDat.mTes_flow_nominal,
          show_T=true,
          dp_nominal=0) constrainedby Buildings.Fluid.HeatExchangers.Heater_T(
          redeclare package Medium = MediumW,
          m_flow_nominal=casDat.mAWHP_flow_nominal+
         casDat.mTes_flow_nominal,
          show_T=true,
          dp_nominal=0) "Load"
          annotation (Placement(transformation(extent={{172,18},{192,38}})));
        Buildings.Fluid.Movers.FlowControlled_m_flow pumSec(
          redeclare package Medium = MediumW,
          m_flow_nominal=casDat.mAWHP_flow_nominal+
         casDat.mTes_flow_nominal,
          addPowerToMedium=false,
          nominalValuesDefineDefaultPressureCurve=true) "Secondary system pump"
          annotation (Placement(transformation(extent={{132,18},{152,38}})));
        Modelica.Blocks.Math.Gain gain(k=casDat.mAWHP_flow_nominal+
         casDat.mTes_flow_nominal)
          annotation (Placement(transformation(extent={{82,38},{102,58}})));
        Modelica.Blocks.Sources.Ramp ramFlo(
          startTime=10640000,
          duration=3*3600,
          offset=0)
          "Ramp for flow"
          annotation (Placement(transformation(extent={{42,38},{62,58}})));
        Modelica.Blocks.Sources.Ramp ramLoa(
          startTime=10640000,
          height=10,
          duration=3*3600,
          offset=TSet_nominal)
                            "Ramp for load"
          annotation (Placement(transformation(extent={{42,68},{62,88}})));
      equation
        connect(coo.uTDryBul, OAT.y) annotation (Line(points={{-13.4,53.7692},{
                -39.7,53.7692},{-39.7,74},{-67,74}},
                                      color={0,0,127}));
        connect(TSetSupChiConst.y, coo.TSetASHP) annotation (Line(points={{-71.4,
                10},{-40,10},{-40,34.9231},{-13.4,34.9231}},
                                                        color={0,0,127}));
        connect(conTesCha.y, coo.uTes) annotation (Line(points={{-77,-36},{-46.5,-36},
                {-46.5,8},{-13.4,8}}, color={0,0,127}));
        connect(conTesCha1.y, coo.uASHP) annotation (Line(points={{-81,40},{-46,
                40},{-46,46.4615},{-13.4,46.4615}},
                                           color={0,0,127}));
        connect(ramLoa.y,loa. TSet) annotation (Line(points={{63,78},{162,78},{162,36},
                {170,36}},color={0,0,127}));
        connect(pumSec.port_b,loa. port_a)
          annotation (Line(points={{152,28},{172,28}},
                                                     color={0,127,255}));
        connect(gain.y,pumSec. m_flow_in)
          annotation (Line(points={{103,48},{142,48},{142,40}},
                                                            color={0,0,127}));
        connect(loa.port_b, coo.port_a) annotation (Line(points={{192,28},{216,28},{216,
                -3.53846},{24,-3.53846}}, color={0,127,255}));
        connect(coo.port_b, pumSec.port_a) annotation (Line(points={{24,14.9231},
                {80,14.9231},{80,28},{132,28}},
                                   color={0,127,255}));
        connect(ramFlo.y, gain.u)
          annotation (Line(points={{63,48},{80,48}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {200,100}})),                                        Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{200,100}})),
          experiment(
            StopTime=3600,
            Interval=60,
            __Dymola_Algorithm="Dassl"));
      end Cool_Plant_test;

      model Cool_plaCon_test

        package MediumW = Buildings.Media.Water "Medium model for water";

        parameter Modelica.SIunits.Temperature TSet_nominal=273.15+6  "Nominal Water temperature supply setpoint of system";

        Modelica.Blocks.Sources.Sine OAT(
          amplitude=10,
          freqHz=0.0000115,
          offset=273 + 23) "Outdoor Air Temperature"
                      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-78,74})));
        Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
          "Set point for chiller temperature"
          annotation (Placement(transformation(extent={{-84,4},{-72,16}})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
          "Case study data"
          annotation (Placement(transformation(extent={{-86,-68},{-62,-92}})));
        Modelica.Blocks.Sources.Constant conTesCha(k=0.5)
          "Control signal for TES charging"
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-66,-36})));
        Plant_Controller_weiping_062822 plaCon(TSolCoo=casDat.TSolCoo,TLiqCoo=casDat.TLiqCoo)
          annotation (Placement(transformation(extent={{-2,-32},{54,-8}})));
        Modelica.Blocks.Sources.BooleanConstant onPlaChi(k=true) "On signal"
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=180,
              origin={-24,-104})));
         parameter Real table[:, :] = [casDat.chargeStartMorn_CTes,0;
          casDat.chargeEndMorn_CTes,2;
          casDat.dischargeStart_CTes,1;
          casDat.dischargeEnd_CTes,2;
          casDat.chargeStartNight_CTes,0;
          casDat.chargeEndNight_CTes,0]
          "Table matrix (time = first column; e.g., table=[0, 0; 1, 1; 2, 4])";
        RTUPCM.HVAC.Plants.BaseClasses.ChargeControlSOC
                                            chaConCoo(
          QTes=casDat.CTes_nominal,
          m_flow_nominal=casDat.mTes_flow_nominal,
          TSup=casDat.TSolCoo - 4,
          TTes=casDat.TSolCoo,
          dt=(casDat.chargeEndNight_CTes - casDat.chargeStartNight_CTes) + (casDat.chargeEndMorn_CTes
               - casDat.chargeStartMorn_CTes)) "Charge controller for cooling"
          annotation (Placement(transformation(extent={{164,-184},{144,-164}})));
          Modelica.Blocks.Sources.CombiTimeTable SchTes(
          table=[casDat.chargeStartMorn_CTes,0; casDat.chargeEndMorn_CTes,2; casDat.dischargeStart_CTes,
              1; casDat.dischargeEnd_CTes,2; casDat.chargeStartNight_CTes,0; casDat.chargeEndNight_CTes,
              0],
          smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
          extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
          "TES charging and discharging schedule"
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=0,
              origin={186,-120})));
      equation
        connect(onPlaChi.y, plaCon.enaChi) annotation (
            Line(points={{-13,-104},{16,-104},{16,-33.92},{15.92,-33.92}},
              color={255,0,255}));
        connect(TSetSupChiConst.y, plaCon.uTSet)
          annotation (Line(points={{-71.4,10},{-20,10},{-20,-33.92},{52.88,
                -33.92}},
              color={0,0,127}));
        connect(SchTes.y[1], plaCon.uSch) annotation (Line(points={{175,-120},{
                168,-120},{168,-29.12},{58.48,-29.12}},
                                               color={0,0,127}));
        connect(plaCon.uChaCon, chaConCoo.y) annotation (Line(points={{25.44,
                -33.92},{25.44,-174},{143,-174}},
                                         color={0,0,127}));
        connect(plaCon.yenaCha, chaConCoo.enaCha) annotation (Line(points={{23.2,
                -6.8},{216.6,-6.8},{216.6,-166},{166,-166}},
                                                      color={255,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {200,100}})),                                        Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{200,100}})),
          experiment(
            StopTime=86400,
            Interval=60,
            __Dymola_Algorithm="Dassl"));
      end Cool_plaCon_test;

      model Cool_Plant_plaCon_test

        package MediumW = Buildings.Media.Water "Medium model for water";

        parameter Modelica.SIunits.Temperature TSet_nominal=273.15+6  "Nominal Water temperature supply setpoint of system";

        BaseCoolingVarCOP_weiping_062822 coo(m_flow_nominal=casDat.mAWHP_flow_nominal+
         casDat.mTes_flow_nominal, k=casDat.kPCMCoo, c=casDat.cPCMCoo, d=casDat.dPCMCoo, TSol=casDat.TSolCoo, TLiq=casDat.TLiqCoo, LHea=casDat.LHeaCoo,
         Q_flow_nominal=casDat.QCoo_flow_nominal, mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,mTes_flow_nominal=casDat.mTes_flow_nominal,
         Tes_nominal=casDat.LTes_nominal, dp_nominal=casDat.dp_nominal, dpFixed_nominal=
         casDat.dpFixed_nominal, dpValve_nominal=casDat.dpValve_nominal)
          annotation (Placement(transformation(extent={{-10,-42},{24,58}})));
        Modelica.Blocks.Sources.Sine OAT(
          amplitude=10,
          freqHz=0.0000115,
          offset=273 + 23) "Outdoor Air Temperature"
                      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-78,74})));
        Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
          "Set point for chiller temperature"
          annotation (Placement(transformation(extent={{-84,4},{-72,16}})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
          "Case study data"
          annotation (Placement(transformation(extent={{-86,-68},{-62,-92}})));
        Modelica.Blocks.Sources.Constant conTesCha(k=0.5)
          "Control signal for TES charging"
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-66,-36})));
        replaceable Buildings.Fluid.HeatExchangers.Heater_T
                                                      loa(
          redeclare package Medium = MediumW,
          m_flow_nominal=casDat.mAWHP_flow_nominal+
         casDat.mTes_flow_nominal,
          show_T=true,
          dp_nominal=0) constrainedby Buildings.Fluid.HeatExchangers.Heater_T(
          redeclare package Medium = MediumW,
          m_flow_nominal=casDat.mAWHP_flow_nominal+
         casDat.mTes_flow_nominal,
          show_T=true,
          dp_nominal=0) "Load"
          annotation (Placement(transformation(extent={{172,18},{192,38}})));
        Buildings.Fluid.Movers.FlowControlled_m_flow pumSec(
          redeclare package Medium = MediumW,
          m_flow_nominal=casDat.mAWHP_flow_nominal+
         casDat.mTes_flow_nominal,
          addPowerToMedium=false,
          nominalValuesDefineDefaultPressureCurve=true) "Secondary system pump"
          annotation (Placement(transformation(extent={{132,18},{152,38}})));
        Modelica.Blocks.Math.Gain gain(k=casDat.mAWHP_flow_nominal+
         casDat.mTes_flow_nominal)
          annotation (Placement(transformation(extent={{82,38},{102,58}})));
        Modelica.Blocks.Sources.Ramp ramFlo(
          startTime=10640000,
          duration=3*3600,
          offset=0)
          "Ramp for flow"
          annotation (Placement(transformation(extent={{42,38},{62,58}})));
        Modelica.Blocks.Sources.Ramp ramLoa(
          startTime=10640000,
          height=10,
          duration=3*3600,
          offset=TSet_nominal)
                            "Ramp for load"
          annotation (Placement(transformation(extent={{38,74},{58,94}})));
        Plant_Controller_weiping_062822 plaCon(TSolCoo=casDat.TSolCoo,TLiqCoo=casDat.TLiqCoo)
          annotation (Placement(transformation(extent={{-28,-80},{28,-56}})));
        Modelica.Blocks.Sources.BooleanConstant onPlaChi(k=true) "On signal"
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=180,
              origin={-24,-104})));
         parameter Real table[:, :] = [casDat.chargeStartMorn_CTes,0;
          casDat.chargeEndMorn_CTes,2;
          casDat.dischargeStart_CTes,1;
          casDat.dischargeEnd_CTes,2;
          casDat.chargeStartNight_CTes,0;
          casDat.chargeEndNight_CTes,0]
          "Table matrix (time = first column; e.g., table=[0, 0; 1, 1; 2, 4])";
        RTUPCM.HVAC.Plants.BaseClasses.ChargeControlSOC
                                            chaConCoo(
          QTes=casDat.CTes_nominal,
          m_flow_nominal=casDat.mTes_flow_nominal,
          TSup=casDat.TSolCoo - 4,
          TTes=casDat.TSolCoo,
          dt=(casDat.chargeEndNight_CTes - casDat.chargeStartNight_CTes) + (casDat.chargeEndMorn_CTes
               - casDat.chargeStartMorn_CTes)) "Charge controller for cooling"
          annotation (Placement(transformation(extent={{164,-184},{144,-164}})));
          Modelica.Blocks.Sources.CombiTimeTable SchTes(
          table=[casDat.chargeStartMorn_CTes,0; casDat.chargeEndMorn_CTes,2; casDat.dischargeStart_CTes,
              1; casDat.dischargeEnd_CTes,2; casDat.chargeStartNight_CTes,0; casDat.chargeEndNight_CTes,
              0],
          smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
          extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
          "TES charging and discharging schedule"
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=0,
              origin={186,-120})));
      equation
        connect(coo.uTDryBul, OAT.y) annotation (Line(points={{-13.4,53.7692},{
                -39.7,53.7692},{-39.7,74},{-67,74}},
                                      color={0,0,127}));
        connect(TSetSupChiConst.y, coo.TSetASHP) annotation (Line(points={{-71.4,
                10},{-40,10},{-40,34.9231},{-13.4,34.9231}},
                                                        color={0,0,127}));
        connect(ramLoa.y,loa. TSet) annotation (Line(points={{59,84},{162,84},{
                162,36},{170,36}},
                          color={0,0,127}));
        connect(pumSec.port_b,loa. port_a)
          annotation (Line(points={{152,28},{172,28}},
                                                     color={0,127,255}));
        connect(gain.y,pumSec. m_flow_in)
          annotation (Line(points={{103,48},{142,48},{142,40}},
                                                            color={0,0,127}));
        connect(loa.port_b, coo.port_a) annotation (Line(points={{192,28},{216,28},{216,
                -3.53846},{24,-3.53846}}, color={0,127,255}));
        connect(coo.port_b, pumSec.port_a) annotation (Line(points={{24,14.9231},
                {78,14.9231},{78,28},{132,28}},
                                   color={0,127,255}));
        connect(ramFlo.y, gain.u)
          annotation (Line(points={{63,48},{80,48}}, color={0,0,127}));
        connect(coo.uTes, plaCon.yTES) annotation (Line(
              points={{-13.4,8},{-20,8},{-20,-54.8},{-25.2,-54.8}}, color={0,0,127}));
        connect(plaCon.yASHP, coo.uASHP) annotation (Line(
              points={{-13.44,-54.8},{-13.44,-3.4},{-13.4,-3.4},{-13.4,46.4615}},
              color={0,0,127}));
        connect(onPlaChi.y, plaCon.enaChi) annotation (
            Line(points={{-13,-104},{-10,-104},{-10,-81.92},{-10.08,-81.92}},
              color={255,0,255}));
        connect(coo.TSup, plaCon.uTMea) annotation (Line(
              points={{25.7,31.4615},{25.7,-26.2692},{8.96,-26.2692},{8.96,
                -81.92}},
              color={0,0,127}));
        connect(coo.TTes, plaCon.uTTes) annotation (Line(
              points={{25.7,27.2308},{25.7,-31.3846},{17.92,-31.3846},{17.92,
                -81.92}},
              color={0,0,127}));
        connect(TSetSupChiConst.y, plaCon.uTSet)
          annotation (Line(points={{-71.4,10},{-20,10},{-20,-81.92},{26.88,-81.92}},
              color={0,0,127}));
        connect(SchTes.y[1], plaCon.uSch) annotation (Line(points={{175,-120},{168,-120},
                {168,-77.12},{32.48,-77.12}},  color={0,0,127}));
        connect(plaCon.uChaCon, chaConCoo.y) annotation (Line(points={{-0.56,-81.92},{
                -0.56,-174},{143,-174}}, color={0,0,127}));
        connect(coo.SOC, chaConCoo.SOC) annotation (Line(points={{25.7,8},{25.7,-62},{
                200,-62},{200,-174},{166,-174}}, color={0,0,127}));
        connect(coo.TRet, plaCon.uTRet) annotation (Line(points={{25.7,20.3077},{25.7,
                -32.8462},{17.92,-32.8462},{17.92,-81.92}}, color={0,0,127}));
        connect(plaCon.yenaCha, chaConCoo.enaCha) annotation (Line(points={{-2.8,-54.8},
                {82.6,-54.8},{82.6,-166},{166,-166}}, color={255,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {200,100}})),                                        Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{200,100}})),
          experiment(
            StopTime=86400,
            Interval=60,
            __Dymola_Algorithm="Dassl"));
      end Cool_Plant_plaCon_test;

      model AC_AWHP_TES_test_prim_pump

        package MediumW = Buildings.Media.Water "Medium model for water";
        package MediumA = Buildings.Media.Air "Medium model for air";

        constant Modelica.SIunits.MassFlowRate m_flow=0.4
          "Nominal mass flow rate";

        parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
        parameter Modelica.SIunits.Temperature TSetSupAir=286.15;

        parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
          "Design mass flow rate of secondary loop";
        parameter Modelica.SIunits.Temperature TSet_nominal=273.15+6  "Nominal Water temperature supply setpoint of system";
        parameter Modelica.SIunits.Temperature T_a1_nominal=5 + 273.15;
        parameter Modelica.SIunits.Temperature T_b1_nominal=10 + 273.15;
        parameter Modelica.SIunits.Temperature T_a2_nominal=30 + 273.15;
        parameter Modelica.SIunits.Temperature T_b2_nominal=15 + 273.15;
        parameter Modelica.SIunits.MassFlowRate m1_flow_nominal=0.1
          "Nominal mass flow rate medium 1";
        parameter Modelica.SIunits.MassFlowRate m2_flow_nominal=m1_flow_nominal*4200/
            1000*(T_a1_nominal - T_b1_nominal)/(T_b2_nominal - T_a2_nominal)
          "Nominal mass flow rate medium 2";
        Modelica.Blocks.Sources.Sine OAT(
          amplitude=10,
          freqHz=0.0000115,
          offset=273 + 23) "Outdoor Air Temperature"
                      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={212,-292})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
          "Case study data"
          annotation (Placement(transformation(extent={{-86,-68},{-62,-92}})));

        Modelica.Blocks.Sources.Ramp dynamic_on_signal(
          height=-1,
          duration=86400,
          offset=1) annotation (Placement(transformation(extent={{-48,-86},{-28,-66}})));
        Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.5)
          annotation (Placement(transformation(extent={{2,-82},{22,-62}})));
        Plant_Controller_weiping_062822  plaCon(
          chargeStartMorn_CTes=casDat.chargeStartMorn_CTes,
          chargeEndMorn_CTes=casDat.chargeEndMorn_CTes,
          dischargeStart_CTes=casDat.dischargeStart_CTes,
          dischargeEnd_CTes=casDat.dischargeEnd_CTes,
          chargeStartNight_CTes=casDat.chargeStartNight_CTes,
          chargeEndNight_CTes=casDat.chargeEndNight_CTes,
          TSolCoo=casDat.TSolCoo,
          TLiqCoo=casDat.TLiqCoo)
          annotation (Placement(transformation(extent={{126,-322},{178,-296}})));
        Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
          "Set point for chiller temperature"
          annotation (Placement(transformation(extent={{40,-336},{52,-324}})));
        BaseCoolingVarCOP_weiping_062822 coo(
          m_flow_nominal=casDat.mAWHP_flow_nominal + casDat.mTes_flow_nominal,
          k=casDat.kPCMCoo,
          c=casDat.cPCMCoo,
          d=casDat.dPCMCoo,
          TSol=casDat.TSolCoo,
          TLiq=casDat.TLiqCoo,
          LHea=casDat.LHeaCoo,
          Q_flow_nominal=casDat.QCoo_flow_nominal,
          mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,
          mTes_flow_nominal=casDat.mTes_flow_nominal,
          Tes_nominal=casDat.LTes_nominal,
          dp_nominal=casDat.dp_nominal,
          dpFixed_nominal=casDat.dpFixed_nominal,
          dpValve_nominal=casDat.dpValve_nominal)                        annotation (Placement(transformation(
              extent={{-16,49},{16,-49}},
              rotation=90,
              origin={99,-246})));
        Modelica.Blocks.Sources.Constant TSetSupChiConst1(final k=casDat.TSetSupCW)
          "Set point for chiller temperature"
          annotation (Placement(transformation(extent={{104,-362},{116,-350}})));
        Modelica.Blocks.Math.Gain gain(k=casDat.mAWHP_flow_nominal + casDat.mTes_flow_nominal)
          annotation (Placement(transformation(extent={{268,-118},{246,-96}})));
        Modelica.Blocks.Sources.Ramp ramFlo(
          startTime=10640000,
          duration=3*3600,
          offset=0)
          "Ramp for flow"
          annotation (Placement(transformation(extent={{362,-118},{338,-94}})));
        Buildings.Fluid.HeatExchangers.WetCoilCounterFlow cooCoi(
          redeclare package Medium1 = MediumW,
          redeclare package Medium2 = MediumA,
         m1_flow_nominal=m1_flow_nominal,
          m2_flow_nominal=m2_flow_nominal,
          dp2_nominal(displayUnit="Pa") = 200,
          allowFlowReversal1=true,
          allowFlowReversal2=true,
          dp1_nominal(displayUnit="Pa") = 3000,
          UA_nominal=2*m1_flow_nominal*4200*(T_a1_nominal - T_b1_nominal)/
            Buildings.Fluid.HeatExchangers.BaseClasses.lmtd(
              T_a1_nominal,
              T_b1_nominal,
              T_a2_nominal,
              T_b2_nominal),
          show_T=true,
          energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
          annotation (Placement(transformation(extent={{116,-22},{96,-42}})));
        Modelica.Blocks.Sources.TimeTable mAirGai(table=[0,1; 0.5,1; 0.6,-1; 0.7,0; 1,
              0], timeScale=3600)
          "Gain for air mass flow rate"
          annotation (Placement(transformation(extent={{-36,54},{-16,74}})));
        Modelica.Blocks.Math.Gain mAir_flow(k=-m2_flow_nominal) "Air mass flow rate"
          annotation (Placement(transformation(extent={{4,54},{24,74}})));
        Buildings.Fluid.Sources.MassFlowSource_T sin_2(
          redeclare package Medium = MediumA,
          T=T_a2_nominal,
          use_m_flow_in=true,
          nPorts=1)           "Sink for air"
          annotation (Placement(transformation(extent={{44,46},{64,66}})));
        Buildings.Fluid.Sources.Boundary_pT sou_2(
          nPorts=1,
          redeclare package Medium = MediumA,
          T=T_a2_nominal,
          X={0.02,1 - 0.02},
          use_T_in=true,
          use_X_in=true) "Source for air"
          annotation (Placement(transformation(extent={{182,46},{162,66}})));
        Buildings.Utilities.Psychrometrics.X_pTphi x_pTphi(use_p_in=false)
          annotation (Placement(transformation(extent={{264,-6},{284,14}})));
        Modelica.Blocks.Sources.Constant temSou_2(k=T_a2_nominal)
          "Temperature boundary condition"
          annotation (Placement(transformation(extent={{302,40},{282,60}})));
        Modelica.Blocks.Sources.Constant relHum(k=0.8) "Relative humidity"
          annotation (Placement(transformation(extent={{272,-56},{292,-36}})));
        Buildings.Fluid.FixedResistances.Junction chw_ret(
          redeclare package Medium = MediumW,
          m_flow_nominal={mSec_flow_nominal,-(m_flow + mSec_flow_nominal),m_flow},
          from_dp=true,
          linearized=true,
          energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
          dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={72,-128})));
        Buildings.Fluid.FixedResistances.Junction chw_sup(
          redeclare package Medium = MediumW,
          m_flow_nominal={m_flow + mSec_flow_nominal,-mSec_flow_nominal,m_flow},
          from_dp=true,
          linearized=true,
          energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
          dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={128,-126})));
        Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
            Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
          annotation (Placement(transformation(extent={{-11,13},{11,-13}},
              rotation=270,
              origin={71,-161})));
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
              origin={177,-185})));
      equation
        connect(dynamic_on_signal.y, greaterThreshold.u) annotation (Line(points={{-27,
                -76},{-6,-76},{-6,-72},{0,-72}}, color={0,0,127}));
        connect(coo.TSetASHP,TSetSupChiConst. y) annotation (Line(points={{125.385,
                -265.2},{125.385,-330},{52.6,-330}},
                                              color={0,0,127}));
        connect(coo.uASHP,plaCon. yASHP) annotation (Line(points={{136.692,-265.2},
                {136.692,-294.7},{139.52,-294.7}},
                                          color={0,0,127}));
        connect(plaCon.uTTes,coo. TTes) annotation (Line(points={{168.64,-324.08},
                {168,-324.08},{168,-334},{238,-334},{238,-228.4},{117.846,-228.4}},
                                                               color={0,0,127}));
        connect(plaCon.uTSet,TSetSupChiConst1. y) annotation (Line(points={{176.96,
                -324.08},{176.96,-336.04},{116.6,-336.04},{116.6,-356}}, color={0,0,
                127}));
        connect(coo.TSup,plaCon. uTMea) annotation (Line(points={{121.992,-228.4},
                {256,-228.4},{256,-350},{212,-350},{212,-346},{160,-346},{160,
                -324.08},{160.32,-324.08}},            color={0,0,127}));
        connect(plaCon.yTES,coo. uTes) annotation (Line(points={{128.6,-294.7},{
                102.3,-294.7},{102.3,-265.2},{99,-265.2}},
                                                  color={0,0,127}));
        connect(plaCon.enaChi, greaterThreshold.y) annotation (Line(points={{152,
                -324.08},{152,-69.04},{23,-69.04},{23,-72}},
                                                      color={255,0,255}));
        connect(OAT.y, coo.uTDryBul) annotation (Line(points={{201,-292},{224,
                -292},{224,-265.2},{143.854,-265.2}},
                                           color={0,0,127}));
        connect(ramFlo.y,gain. u)
          annotation (Line(points={{336.8,-106},{354,-106},{354,-107},{270.2,-107}},
                                                     color={0,0,127}));
        connect(x_pTphi.X,sou_2. X_in) annotation (Line(
            points={{285,4},{232,4},{232,18},{240,18},{240,52},{184,52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temSou_2.y,sou_2. T_in) annotation (Line(
            points={{281,50},{230,50},{230,60},{184,60}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mAirGai.y, mAir_flow.u)
          annotation (Line(points={{-15,64},{2,64}}, color={0,0,127}));
        connect(mAir_flow.y, sin_2.m_flow_in)
          annotation (Line(points={{25,64},{42,64}}, color={0,0,127}));
        connect(cooCoi.port_b2, sou_2.ports[1]) annotation (Line(points={{116,-26},{140,
                -26},{140,56},{162,56}}, color={0,127,255}));
        connect(temSou_2.y, x_pTphi.T) annotation (Line(points={{281,50},{254,50},
                {254,4},{262,4}},
                          color={0,0,127}));
        connect(x_pTphi.phi, relHum.y) annotation (Line(points={{262,-2},{306,-2},
                {306,-46},{293,-46}},
                                 color={0,0,127}));
        connect(cooCoi.port_a2, sin_2.ports[1]) annotation (Line(points={{96,-26},{84,
                -26},{84,56},{64,56}}, color={0,127,255}));
        connect(sen_retTem.port_a, chw_ret.port_1) annotation (Line(points={{71,-150},
                {71,-147},{72,-147},{72,-138}},    color={0,127,255}));
        connect(chw_sup.port_3, chw_ret.port_3)
          annotation (Line(points={{118,-126},{130,-126},{130,-128},{82,-128}},
                                                           color={0,127,255}));
        connect(sen_retTem.port_b, coo.port_a) annotation (Line(points={{71,-172},
                {74,-172},{74,-230},{87.6923,-230}},
                                                  color={0,127,255}));
        connect(chw_ret.port_2, cooCoi.port_b1) annotation (Line(points={{72,-118},
                {76,-118},{76,-38},{96,-38}},
                                          color={0,127,255}));
        connect(chw_sup.port_1, cooCoi.port_a1) annotation (Line(points={{128,
                -116},{152,-116},{152,-38},{116,-38}}, color={0,127,255}));
        connect(coo.port_b, pumChiWat.port_a) annotation (Line(points={{105.785,
                -230},{148,-230},{148,-194},{177,-194}}, color={0,127,255}));
        connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{177,
                -176},{128,-176},{128,-136}}, color={0,127,255}));
        connect(gain.y, pumChiWat.m_flow_in) annotation (Line(points={{244.9,-107},
                {244.9,-151.5},{166.2,-151.5},{166.2,-185}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-420},
                  {480,100}})),                                        Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-420},{480,100}}),
              graphics={
              Text(
                textString="Edit Here",
                extent={{52,-242},{120,-264}},
                lineColor={28,108,200})}),
          experiment(
            StopTime=3600,
            Interval=60,
            __Dymola_Algorithm="Dassl"));
      end AC_AWHP_TES_test_prim_pump;

      model AC_AWHP_TES_test_sec_pump

        package MediumW = Buildings.Media.Water "Medium model for water";
        package MediumA = Buildings.Media.Air "Medium model for air";

        constant Modelica.SIunits.MassFlowRate m_flow=0.4
          "Nominal mass flow rate";

        parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
        parameter Modelica.SIunits.Temperature TSetSupAir=286.15;

        parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
          "Design mass flow rate of secondary loop";
        parameter Modelica.SIunits.Temperature TSet_nominal=273.15+6  "Nominal Water temperature supply setpoint of system";
        parameter Modelica.SIunits.Temperature T_a1_nominal=5 + 273.15;
        parameter Modelica.SIunits.Temperature T_b1_nominal=10 + 273.15;
        parameter Modelica.SIunits.Temperature T_a2_nominal=30 + 273.15;
        parameter Modelica.SIunits.Temperature T_b2_nominal=15 + 273.15;
        parameter Modelica.SIunits.MassFlowRate m1_flow_nominal=0.1
          "Nominal mass flow rate medium 1";
        parameter Modelica.SIunits.MassFlowRate m2_flow_nominal=m1_flow_nominal*4200/
            1000*(T_a1_nominal - T_b1_nominal)/(T_b2_nominal - T_a2_nominal)
          "Nominal mass flow rate medium 2";
        Modelica.Blocks.Sources.Sine OAT(
          amplitude=10,
          freqHz=0.0000115,
          offset=273 + 23) "Outdoor Air Temperature"
                      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={212,-292})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
          "Case study data"
          annotation (Placement(transformation(extent={{-86,-68},{-62,-92}})));

        Modelica.Blocks.Sources.Ramp dynamic_on_signal(
          height=-1,
          duration=86400,
          offset=1) annotation (Placement(transformation(extent={{-48,-86},{-28,-66}})));
        Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.5)
          annotation (Placement(transformation(extent={{2,-82},{22,-62}})));
        Plant_Controller_weiping_062822  plaCon(
          TSolCoo=casDat.TSolCoo,
          TLiqCoo=casDat.TLiqCoo)
          annotation (Placement(transformation(extent={{126,-322},{178,-296}})));
        Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
          "Set point for chiller temperature"
          annotation (Placement(transformation(extent={{40,-336},{52,-324}})));
        BaseCoolingVarCOP_weiping_062822 coo(
          m_flow_nominal=casDat.mAWHP_flow_nominal + casDat.mTes_flow_nominal,
          k=casDat.kPCMCoo,
          c=casDat.cPCMCoo,
          d=casDat.dPCMCoo,
          TSol=casDat.TSolCoo,
          TLiq=casDat.TLiqCoo,
          LHea=casDat.LHeaCoo,
          Q_flow_nominal=casDat.QCoo_flow_nominal,
          mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,
          mTes_flow_nominal=casDat.mTes_flow_nominal,
          Tes_nominal=casDat.LTes_nominal,
          dp_nominal=casDat.dp_nominal,
          dpFixed_nominal=casDat.dpFixed_nominal,
          dpValve_nominal=casDat.dpValve_nominal)                        annotation (Placement(transformation(
              extent={{-16,49},{16,-49}},
              rotation=90,
              origin={99,-246})));
        Modelica.Blocks.Sources.Constant TSetSupChiConst1(final k=casDat.TSetSupCW)
          "Set point for chiller temperature"
          annotation (Placement(transformation(extent={{104,-362},{116,-350}})));
        Modelica.Blocks.Math.Gain gain(k=mSec_flow_nominal)
          annotation (Placement(transformation(extent={{268,-118},{246,-96}})));
        Modelica.Blocks.Sources.Ramp ramFlo(
          startTime=10640000,
          duration=3*3600,
          offset=0)
          "Ramp for flow"
          annotation (Placement(transformation(extent={{362,-118},{338,-94}})));
        Buildings.Fluid.HeatExchangers.WetCoilCounterFlow cooCoi(
          redeclare package Medium1 = MediumW,
          redeclare package Medium2 = MediumA,
         m1_flow_nominal=m1_flow_nominal,
          m2_flow_nominal=m2_flow_nominal,
          dp2_nominal(displayUnit="Pa") = 200,
          allowFlowReversal1=true,
          allowFlowReversal2=true,
          dp1_nominal(displayUnit="Pa") = 3000,
          UA_nominal=2*m1_flow_nominal*4200*(T_a1_nominal - T_b1_nominal)/
            Buildings.Fluid.HeatExchangers.BaseClasses.lmtd(
              T_a1_nominal,
              T_b1_nominal,
              T_a2_nominal,
              T_b2_nominal),
          show_T=true,
          energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
          annotation (Placement(transformation(extent={{116,-22},{96,-42}})));
        Modelica.Blocks.Sources.TimeTable mAirGai(table=[0,1; 0.5,1; 0.6,-1; 0.7,0; 1,
              0], timeScale=3600)
          "Gain for air mass flow rate"
          annotation (Placement(transformation(extent={{-36,54},{-16,74}})));
        Modelica.Blocks.Math.Gain mAir_flow(k=-m2_flow_nominal) "Air mass flow rate"
          annotation (Placement(transformation(extent={{4,54},{24,74}})));
        Buildings.Fluid.Sources.MassFlowSource_T sin_2(
          redeclare package Medium = MediumA,
          T=T_a2_nominal,
          use_m_flow_in=true,
          nPorts=1)           "Sink for air"
          annotation (Placement(transformation(extent={{44,46},{64,66}})));
        Buildings.Fluid.Sources.Boundary_pT sou_2(
          nPorts=1,
          redeclare package Medium = MediumA,
          T=T_a2_nominal,
          X={0.02,1 - 0.02},
          use_T_in=true,
          use_X_in=true) "Source for air"
          annotation (Placement(transformation(extent={{182,46},{162,66}})));
        Buildings.Utilities.Psychrometrics.X_pTphi x_pTphi(use_p_in=false)
          annotation (Placement(transformation(extent={{264,-6},{284,14}})));
        Modelica.Blocks.Sources.Constant temSou_2(k=T_a2_nominal)
          "Temperature boundary condition"
          annotation (Placement(transformation(extent={{302,40},{282,60}})));
        Modelica.Blocks.Sources.Constant relHum(k=0.8) "Relative humidity"
          annotation (Placement(transformation(extent={{272,-56},{292,-36}})));
        Buildings.Fluid.FixedResistances.Junction chw_ret(
          redeclare package Medium = MediumW,
          m_flow_nominal={mSec_flow_nominal,-(m_flow + mSec_flow_nominal),m_flow},
          from_dp=true,
          linearized=true,
          energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
          dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={72,-128})));
        Buildings.Fluid.FixedResistances.Junction chw_sup(
          redeclare package Medium = MediumW,
          m_flow_nominal={m_flow + mSec_flow_nominal,-mSec_flow_nominal,m_flow},
          from_dp=true,
          linearized=true,
          energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
          dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={188,-128})));
        Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
            Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
          annotation (Placement(transformation(extent={{-11,13},{11,-13}},
              rotation=270,
              origin={71,-161})));
        Buildings.Fluid.Movers.FlowControlled_m_flow pumChiWat1(
          use_inputFilter=false,
          allowFlowReversal=false,
          redeclare package Medium = MediumW,
          energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
          m_flow_nominal=mSec_flow_nominal,
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
              origin={187,-79})));
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
              origin={189,-181})));
          Modelica.Blocks.Sources.CombiTimeTable SchTes(
          table=[casDat.chargeStartMorn_CTes,0; casDat.chargeEndMorn_CTes,2; casDat.dischargeStart_CTes,
              1; casDat.dischargeEnd_CTes,2; casDat.chargeStartNight_CTes,0; casDat.chargeEndNight_CTes,
              0],
          smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
          extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
          "TES charging and discharging schedule"
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=0,
              origin={306,-338})));
      equation
        connect(dynamic_on_signal.y, greaterThreshold.u) annotation (Line(points={{-27,
                -76},{-6,-76},{-6,-72},{0,-72}}, color={0,0,127}));
        connect(coo.TSetASHP,TSetSupChiConst. y) annotation (Line(points={{125.385,
                -265.2},{125.385,-330},{52.6,-330}},
                                              color={0,0,127}));
        connect(coo.uASHP,plaCon. yASHP) annotation (Line(points={{136.692,
                -265.2},{136.692,-294.7},{139.52,-294.7}},
                                          color={0,0,127}));
        connect(plaCon.uTTes,coo. TTes) annotation (Line(points={{168.64,
                -324.08},{168,-324.08},{168,-334},{238,-334},{238,-228.4},{
                117.846,-228.4}},                              color={0,0,127}));
        connect(plaCon.uTSet,TSetSupChiConst1. y) annotation (Line(points={{176.96,
                -324.08},{176.96,-336.04},{116.6,-336.04},{116.6,-356}}, color={0,0,
                127}));
        connect(coo.TSup,plaCon. uTMea) annotation (Line(points={{121.992,
                -228.4},{256,-228.4},{256,-350},{212,-350},{212,-346},{160,-346},
                {160,-324.08},{160.32,-324.08}},       color={0,0,127}));
        connect(plaCon.yTES,coo. uTes) annotation (Line(points={{128.6,-294.7},{
                102.3,-294.7},{102.3,-265.2},{99,-265.2}},
                                                  color={0,0,127}));
        connect(plaCon.enaChi, greaterThreshold.y) annotation (Line(points={{142.64,
                -324.08},{142.64,-69.04},{23,-69.04},{23,-72}},
                                                      color={255,0,255}));
        connect(OAT.y, coo.uTDryBul) annotation (Line(points={{201,-292},{224,
                -292},{224,-265.2},{143.854,-265.2}},
                                           color={0,0,127}));
        connect(ramFlo.y,gain. u)
          annotation (Line(points={{336.8,-106},{354,-106},{354,-107},{270.2,-107}},
                                                     color={0,0,127}));
        connect(x_pTphi.X,sou_2. X_in) annotation (Line(
            points={{285,4},{232,4},{232,18},{240,18},{240,52},{184,52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temSou_2.y,sou_2. T_in) annotation (Line(
            points={{281,50},{230,50},{230,60},{184,60}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mAirGai.y, mAir_flow.u)
          annotation (Line(points={{-15,64},{2,64}}, color={0,0,127}));
        connect(mAir_flow.y, sin_2.m_flow_in)
          annotation (Line(points={{25,64},{42,64}}, color={0,0,127}));
        connect(cooCoi.port_b2, sou_2.ports[1]) annotation (Line(points={{116,-26},{140,
                -26},{140,56},{162,56}}, color={0,127,255}));
        connect(temSou_2.y, x_pTphi.T) annotation (Line(points={{281,50},{254,50},
                {254,4},{262,4}},
                          color={0,0,127}));
        connect(x_pTphi.phi, relHum.y) annotation (Line(points={{262,-2},{306,-2},
                {306,-46},{293,-46}},
                                 color={0,0,127}));
        connect(cooCoi.port_a2, sin_2.ports[1]) annotation (Line(points={{96,-26},{84,
                -26},{84,56},{64,56}}, color={0,127,255}));
        connect(sen_retTem.port_a, chw_ret.port_1) annotation (Line(points={{71,-150},
                {71,-147},{72,-147},{72,-138}},    color={0,127,255}));
        connect(chw_sup.port_3, chw_ret.port_3)
          annotation (Line(points={{178,-128},{82,-128}},  color={0,127,255}));
        connect(sen_retTem.port_b, coo.port_a) annotation (Line(points={{71,-172},
                {74,-172},{74,-230},{87.6923,-230}},
                                                  color={0,127,255}));
        connect(chw_ret.port_2, cooCoi.port_b1) annotation (Line(points={{72,-118},
                {76,-118},{76,-38},{96,-38}},
                                          color={0,127,255}));
        connect(pumChiWat1.port_a, chw_sup.port_1) annotation (Line(points={{187,
                -88},{188,-88},{188,-118}}, color={0,127,255}));
        connect(gain.y, pumChiWat1.m_flow_in) annotation (Line(points={{244.9,
                -107},{244.9,-106},{176.2,-106},{176.2,-79}}, color={0,0,127}));
        connect(pumChiWat1.port_b, cooCoi.port_a1) annotation (Line(points={{187,
                -70},{186.5,-70},{186.5,-38},{116,-38}}, color={0,127,255}));
        connect(coo.port_b, pumChiWat.port_a) annotation (Line(points={{105.785,
                -230},{189,-230},{189,-190}}, color={0,127,255}));
        connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{189,
                -172},{188.892,-138},{188,-138}}, color={0,127,255}));
        connect(gain.y, pumChiWat.m_flow_in) annotation (Line(points={{244.9,-107},
                {244.9,-144.5},{178.2,-144.5},{178.2,-181}}, color={0,0,127}));
        connect(SchTes.y[1], plaCon.uSch) annotation (Line(points={{295,-338},{240,-338},
                {240,-318.88},{182.16,-318.88}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-420},
                  {480,100}})),                                        Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-420},{480,100}}),
              graphics={
              Text(
                textString="Edit Here",
                extent={{52,-242},{120,-264}},
                lineColor={28,108,200})}),
          experiment(
            StopTime=3600,
            Interval=60,
            __Dymola_Algorithm="Dassl"));
      end AC_AWHP_TES_test_sec_pump;

      model AC_full_model_port_test

        package MediumW = Buildings.Media.Water "Medium model for water";
        package MediumA = Buildings.Media.Air "Medium model for air";

        constant Modelica.SIunits.MassFlowRate m_flow=0.4
          "Nominal mass flow rate";

        parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
        parameter Modelica.SIunits.Temperature TSetSupAir=286.15;

        parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
          "Design mass flow rate of secondary loop";
        parameter Modelica.SIunits.Temperature TSet_nominal=273.15+6  "Nominal Water temperature supply setpoint of system";
        parameter Modelica.SIunits.Temperature T_a1_nominal=5 + 273.15;
        parameter Modelica.SIunits.Temperature T_b1_nominal=10 + 273.15;
        parameter Modelica.SIunits.Temperature T_a2_nominal=30 + 273.15;
        parameter Modelica.SIunits.Temperature T_b2_nominal=15 + 273.15;
        parameter Modelica.SIunits.MassFlowRate m1_flow_nominal=0.1
          "Nominal mass flow rate medium 1";
        parameter Modelica.SIunits.MassFlowRate m2_flow_nominal=m1_flow_nominal*4200/
            1000*(T_a1_nominal - T_b1_nominal)/(T_b2_nominal - T_a2_nominal)
          "Nominal mass flow rate medium 2";
        Modelica.Blocks.Sources.Sine OAT(
          amplitude=10,
          freqHz=0.0000115,
          offset=273 + 23) "Outdoor Air Temperature"
                      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={368,-340})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
          "Case study data"
          annotation (Placement(transformation(extent={{-86,-68},{-62,-92}})));

        Modelica.Blocks.Sources.Ramp dynamic_on_signal(
          height=-1,
          duration=86400,
          offset=1) annotation (Placement(transformation(extent={{-50,-304},{-30,
                  -284}})));
        Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.5)
          annotation (Placement(transformation(extent={{20,-234},{40,-214}})));
        Buildings.Fluid.HeatExchangers.WetCoilCounterFlow cooCoi(
          redeclare package Medium1 = MediumW,
          redeclare package Medium2 = MediumA,
         m1_flow_nominal=m1_flow_nominal,
          m2_flow_nominal=m2_flow_nominal,
          dp2_nominal(displayUnit="Pa") = 200,
          allowFlowReversal1=true,
          allowFlowReversal2=true,
          dp1_nominal(displayUnit="Pa") = 3000,
          UA_nominal=2*m1_flow_nominal*4200*(T_a1_nominal - T_b1_nominal)/
            Buildings.Fluid.HeatExchangers.BaseClasses.lmtd(
              T_a1_nominal,
              T_b1_nominal,
              T_a2_nominal,
              T_b2_nominal),
          show_T=true,
          energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
          annotation (Placement(transformation(extent={{116,-22},{96,-42}})));
        Modelica.Blocks.Sources.TimeTable mAirGai(table=[0,1; 0.5,1; 0.6,-1; 0.7,0; 1,
              0], timeScale=3600)
          "Gain for air mass flow rate"
          annotation (Placement(transformation(extent={{-36,54},{-16,74}})));
        Modelica.Blocks.Math.Gain mAir_flow(k=-m2_flow_nominal) "Air mass flow rate"
          annotation (Placement(transformation(extent={{4,54},{24,74}})));
        Buildings.Fluid.Sources.MassFlowSource_T sin_2(
          redeclare package Medium = MediumA,
          T=T_a2_nominal,
          use_m_flow_in=true,
          nPorts=1)           "Sink for air"
          annotation (Placement(transformation(extent={{44,46},{64,66}})));
        Buildings.Fluid.Sources.Boundary_pT sou_2(
          nPorts=1,
          redeclare package Medium = MediumA,
          T=T_a2_nominal,
          X={0.02,1 - 0.02},
          use_T_in=true,
          use_X_in=true) "Source for air"
          annotation (Placement(transformation(extent={{182,46},{162,66}})));
        Buildings.Utilities.Psychrometrics.X_pTphi x_pTphi(use_p_in=false)
          annotation (Placement(transformation(extent={{264,-6},{284,14}})));
        Modelica.Blocks.Sources.Constant temSou_2(k=T_a2_nominal)
          "Temperature boundary condition"
          annotation (Placement(transformation(extent={{302,40},{282,60}})));
        Modelica.Blocks.Sources.Constant relHum(k=0.8) "Relative humidity"
          annotation (Placement(transformation(extent={{272,-56},{292,-36}})));
        Modelica.Blocks.Math.Gain gain1(k=casDat.mAWHP_flow_nominal + casDat.mTes_flow_nominal)
          annotation (Placement(transformation(extent={{310,-198},{288,-176}})));
        Modelica.Blocks.Sources.Ramp ramFlo1(
          startTime=10640000,
          duration=3*3600,
          offset=0)
          "Ramp for flow"
          annotation (Placement(transformation(extent={{384,-256},{360,-232}})));
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
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={194,-94})));
        AC_AWHP_wTES_debug_ports aC_AWHP_wTES_debug_ports
          annotation (Placement(transformation(extent={{88,-254},{134,-224}})));
      equation
        connect(dynamic_on_signal.y, greaterThreshold.u) annotation (Line(points={{-29,
                -294},{-6,-294},{-6,-224},{18,-224}},
                                                 color={0,0,127}));
        connect(x_pTphi.X,sou_2. X_in) annotation (Line(
            points={{285,4},{232,4},{232,18},{240,18},{240,52},{184,52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temSou_2.y,sou_2. T_in) annotation (Line(
            points={{281,50},{230,50},{230,60},{184,60}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mAirGai.y, mAir_flow.u)
          annotation (Line(points={{-15,64},{2,64}}, color={0,0,127}));
        connect(mAir_flow.y, sin_2.m_flow_in)
          annotation (Line(points={{25,64},{42,64}}, color={0,0,127}));
        connect(cooCoi.port_b2, sou_2.ports[1]) annotation (Line(points={{116,-26},{140,
                -26},{140,56},{162,56}}, color={0,127,255}));
        connect(temSou_2.y, x_pTphi.T) annotation (Line(points={{281,50},{254,50},
                {254,4},{262,4}},
                          color={0,0,127}));
        connect(x_pTphi.phi, relHum.y) annotation (Line(points={{262,-2},{306,-2},
                {306,-46},{293,-46}},
                                 color={0,0,127}));
        connect(cooCoi.port_a2, sin_2.ports[1]) annotation (Line(points={{96,-26},{84,
                -26},{84,56},{64,56}}, color={0,127,255}));
        connect(cooCoi.port_a1, pumChiWat.port_b) annotation (Line(points={{116,
                -38},{194,-38},{194,-84}}, color={0,127,255}));
        connect(gain1.y, pumChiWat.m_flow_in) annotation (Line(points={{286.9,
                -187},{235.45,-187},{235.45,-94},{206,-94}}, color={0,0,127}));
        connect(ramFlo1.y, gain1.u) annotation (Line(points={{358.8,-244},{332.4,
                -244},{332.4,-187},{312.2,-187}}, color={0,0,127}));
        connect(aC_AWHP_wTES_debug_ports.port_a, cooCoi.port_b1) annotation (Line(
              points={{102.4,-226.5},{102.4,-160},{38,-160},{38,-36},{50,-36},{50,
                -38},{96,-38}}, color={0,127,255}));
        connect(aC_AWHP_wTES_debug_ports.port_b, pumChiWat.port_a) annotation (
            Line(points={{117.1,-226.5},{168,-226.5},{168,-156},{194,-156},{194,
                -104}}, color={0,127,255}));
        connect(greaterThreshold.y, aC_AWHP_wTES_debug_ports.chiOn) annotation (
            Line(points={{41,-224},{54,-224},{54,-247.4},{85.6,-247.4}}, color={
                255,0,255}));
        connect(aC_AWHP_wTES_debug_ports.T_air_in, OAT.y) annotation (Line(points=
               {{136,-257.4},{246,-257.4},{246,-340},{357,-340}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-420},
                  {480,100}})),                                        Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-420},{480,100}})),
          experiment(
            StopTime=3600,
            Interval=60,
            __Dymola_Algorithm="Dassl"));
      end AC_full_model_port_test;

      model AC_full_model_flotemsou_test

        package MediumW = Buildings.Media.Water "Medium model for water";
        package MediumA = Buildings.Media.Air "Medium model for air";

        constant Modelica.SIunits.MassFlowRate m_flow=0.4
          "Nominal mass flow rate";

        parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
        parameter Modelica.SIunits.Temperature TSetSupAir=286.15;

        parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
          "Design mass flow rate of secondary loop";
        parameter Modelica.SIunits.Temperature TSet_nominal=273.15+6  "Nominal Water temperature supply setpoint of system";
        parameter Modelica.SIunits.Temperature T_a1_nominal=5 + 273.15;
        parameter Modelica.SIunits.Temperature T_b1_nominal=10 + 273.15;
        parameter Modelica.SIunits.Temperature T_a2_nominal=30 + 273.15;
        parameter Modelica.SIunits.Temperature T_b2_nominal=15 + 273.15;
        parameter Modelica.SIunits.MassFlowRate m1_flow_nominal=0.1
          "Nominal mass flow rate medium 1";
        parameter Modelica.SIunits.MassFlowRate m2_flow_nominal=m1_flow_nominal*4200/
            1000*(T_a1_nominal - T_b1_nominal)/(T_b2_nominal - T_a2_nominal)
          "Nominal mass flow rate medium 2";
        Modelica.Blocks.Sources.Sine OAT(
          amplitude=10,
          freqHz=0.0000115,
          offset=273 + 23) "Outdoor Air Temperature"
                      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={368,-340})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
          "Case study data"
          annotation (Placement(transformation(extent={{-86,-68},{-62,-92}})));

        Modelica.Blocks.Sources.Ramp dynamic_on_signal(
          height=-1,
          duration=86400,
          offset=1) annotation (Placement(transformation(extent={{-50,-304},{-30,-284}})));
        Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.5)
          annotation (Placement(transformation(extent={{20,-234},{40,-214}})));
        Buildings.Fluid.HeatExchangers.WetCoilCounterFlow cooCoi(
          redeclare package Medium1 = MediumW,
          redeclare package Medium2 = MediumA,
         m1_flow_nominal=m1_flow_nominal,
          m2_flow_nominal=m2_flow_nominal,
          dp2_nominal(displayUnit="Pa") = 200,
          allowFlowReversal1=true,
          allowFlowReversal2=true,
          dp1_nominal(displayUnit="Pa") = 3000,
          UA_nominal=2*m1_flow_nominal*4200*(T_a1_nominal - T_b1_nominal)/
            Buildings.Fluid.HeatExchangers.BaseClasses.lmtd(
              T_a1_nominal,
              T_b1_nominal,
              T_a2_nominal,
              T_b2_nominal),
          show_T=true,
          energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
          annotation (Placement(transformation(extent={{116,-22},{96,-42}})));
        Modelica.Blocks.Sources.TimeTable mAirGai(table=[0,1; 0.5,1; 0.6,-1; 0.7,0; 1,
              0], timeScale=3600)
          "Gain for air mass flow rate"
          annotation (Placement(transformation(extent={{-36,54},{-16,74}})));
        Modelica.Blocks.Math.Gain mAir_flow(k=-m2_flow_nominal) "Air mass flow rate"
          annotation (Placement(transformation(extent={{4,54},{24,74}})));
        Buildings.Fluid.Sources.MassFlowSource_T sin_2(
          redeclare package Medium = MediumA,
          T=T_a2_nominal,
          use_m_flow_in=true,
          nPorts=1)           "Sink for air"
          annotation (Placement(transformation(extent={{44,46},{64,66}})));
        Buildings.Fluid.Sources.Boundary_pT sou_2(
          nPorts=1,
          redeclare package Medium = MediumA,
          T=T_a2_nominal,
          X={0.02,1 - 0.02},
          use_T_in=true,
          use_X_in=true) "Source for air"
          annotation (Placement(transformation(extent={{182,46},{162,66}})));
        Buildings.Utilities.Psychrometrics.X_pTphi x_pTphi(use_p_in=false)
          annotation (Placement(transformation(extent={{264,-6},{284,14}})));
        Modelica.Blocks.Sources.Constant temSou_2(k=T_a2_nominal)
          "Temperature boundary condition"
          annotation (Placement(transformation(extent={{302,40},{282,60}})));
        Modelica.Blocks.Sources.Constant relHum(k=0.8) "Relative humidity"
          annotation (Placement(transformation(extent={{272,-56},{292,-36}})));
        Modelica.Blocks.Math.Gain gain1(k=casDat.mAWHP_flow_nominal + casDat.mTes_flow_nominal)
          annotation (Placement(transformation(extent={{310,-198},{288,-176}})));
        Modelica.Blocks.Sources.Ramp ramFlo1(
          startTime=10640000,
          duration=3*3600,
          offset=0)
          "Ramp for flow"
          annotation (Placement(transformation(extent={{384,-256},{360,-232}})));
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
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={180,-84})));
        AC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug
          aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug
          annotation (Placement(transformation(extent={{100,-190},{146,-154}})));
        Buildings.Fluid.Sensors.TemperatureTwoPort TRet_chw(
          redeclare package Medium = Buildings.Media.Water,
          m_flow_nominal= mSec_flow_nominal,
          allowFlowReversal=true) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={50,-74})));
        Buildings.Fluid.Sensors.MassFlowRate   senRetMFlo(redeclare package
            Medium =
              Buildings.Media.Water) "Sensor for cooling coil return flow rate"
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={50,-110})));
        Buildings.Fluid.Sources.Boundary_pT sinCoo(
          redeclare package Medium = MediumW,
          p=300000,
          T=285.15,
          nPorts=1) "Sink for cooling coil" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={50,-142})));
        Buildings.Fluid.Sources.MassFlowSource_T sin_1(
          redeclare package Medium = MediumW,
          use_T_in=true,
          use_m_flow_in=false,
          nPorts=1) "Source for water"
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=90,
              origin={162,-126})));
      equation
        connect(dynamic_on_signal.y, greaterThreshold.u) annotation (Line(points={{-29,
                -294},{-6,-294},{-6,-224},{18,-224}},
                                                 color={0,0,127}));
        connect(x_pTphi.X,sou_2. X_in) annotation (Line(
            points={{285,4},{232,4},{232,18},{240,18},{240,52},{184,52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(temSou_2.y,sou_2. T_in) annotation (Line(
            points={{281,50},{230,50},{230,60},{184,60}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(mAirGai.y, mAir_flow.u)
          annotation (Line(points={{-15,64},{2,64}}, color={0,0,127}));
        connect(mAir_flow.y, sin_2.m_flow_in)
          annotation (Line(points={{25,64},{42,64}}, color={0,0,127}));
        connect(cooCoi.port_b2, sou_2.ports[1]) annotation (Line(points={{116,-26},{140,
                -26},{140,56},{162,56}}, color={0,127,255}));
        connect(temSou_2.y, x_pTphi.T) annotation (Line(points={{281,50},{254,50},{254,
                4},{262,4}},
                          color={0,0,127}));
        connect(x_pTphi.phi, relHum.y) annotation (Line(points={{262,-2},{306,-2},{306,
                -46},{293,-46}}, color={0,0,127}));
        connect(cooCoi.port_a2, sin_2.ports[1]) annotation (Line(points={{96,-26},{84,
                -26},{84,56},{64,56}}, color={0,127,255}));
        connect(cooCoi.port_a1, pumChiWat.port_b) annotation (Line(points={{116,-38},{
                180,-38},{180,-74}}, color={0,127,255}));
        connect(gain1.y, pumChiWat.m_flow_in) annotation (Line(points={{286.9,-187},{235.45,
                -187},{235.45,-84},{192,-84}}, color={0,0,127}));
        connect(ramFlo1.y, gain1.u) annotation (Line(points={{358.8,-244},{332.4,-244},
                {332.4,-187},{312.2,-187}}, color={0,0,127}));
        connect(cooCoi.port_b1, TRet_chw.port_a) annotation (Line(points={{96,-38},{52,
                -38},{52,-64},{50,-64}}, color={0,127,255}));
        connect(TRet_chw.port_b, senRetMFlo.port_a)
          annotation (Line(points={{50,-84},{50,-100}}, color={0,127,255}));
        connect(senRetMFlo.port_b, sinCoo.ports[1])
          annotation (Line(points={{50,-120},{50,-132}}, color={0,127,255}));
        connect(senRetMFlo.m_flow, aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug.m_flow_sec)
          annotation (Line(points={{61,-110},{84,-110},{84,-152},{105.2,-152}}, color=
               {0,0,127}));
        connect(TRet_chw.T, aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug.T_chw_in)
          annotation (Line(points={{61,-74},{88,-74},{88,-152},{112.8,-152}}, color={0,
                0,127}));
        connect(sin_1.ports[1], pumChiWat.port_a) annotation (Line(points={{162,-116},
                {180,-116},{180,-94}}, color={0,127,255}));
        connect(aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug.T_chw_out, sin_1.T_in)
          annotation (Line(points={{129,-152},{144.5,-152},{144.5,-138},{158,-138}},
              color={0,0,127}));
        connect(OAT.y, aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug.T_air_in)
          annotation (Line(points={{357,-340},{252,-340},{252,-187.4},{148,-187.4}},
              color={0,0,127}));
        connect(greaterThreshold.y, aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug.chiOn)
          annotation (Line(points={{41,-224},{74,-224},{74,-186},{98,-186},{98,-185.2}},
              color={255,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-420},
                  {480,100}})),                                        Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-420},{480,100}})),
          experiment(
            StopTime=3600,
            Interval=60,
            __Dymola_Algorithm="Dassl"));
      end AC_full_model_flotemsou_test;

      model AC_full_model_basic_u_test

        package MediumW = Buildings.Media.Water "Medium model for water";
        package MediumA = Buildings.Media.Air "Medium model for air";

        constant Modelica.SIunits.MassFlowRate m_flow=0.4
          "Nominal mass flow rate";

        parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
        parameter Modelica.SIunits.Temperature TSetSupAir=286.15;

        parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
          "Design mass flow rate of secondary loop";
        parameter Modelica.SIunits.Temperature TSet_nominal=273.15+6  "Nominal Water temperature supply setpoint of system";
        parameter Modelica.SIunits.Temperature T_a1_nominal=5 + 273.15;
        parameter Modelica.SIunits.Temperature T_b1_nominal=10 + 273.15;
        parameter Modelica.SIunits.Temperature T_a2_nominal=30 + 273.15;
        parameter Modelica.SIunits.Temperature T_b2_nominal=15 + 273.15;
        parameter Modelica.SIunits.MassFlowRate m1_flow_nominal=0.1
          "Nominal mass flow rate medium 1";
        parameter Modelica.SIunits.MassFlowRate m2_flow_nominal=m1_flow_nominal*4200/
            1000*(T_a1_nominal - T_b1_nominal)/(T_b2_nominal - T_a2_nominal)
          "Nominal mass flow rate medium 2";
        Modelica.Blocks.Sources.Sine OAT(
          amplitude=10,
          freqHz=0.0000115,
          offset=273 + 23) "Outdoor Air Temperature"
                      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={368,-340})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
          "Case study data"
          annotation (Placement(transformation(extent={{-86,-68},{-62,-92}})));

        Modelica.Blocks.Sources.Ramp dynamic_on_signal(
          height=-1,
          duration=86400,
          offset=1) annotation (Placement(transformation(extent={{-50,-304},{-30,-284}})));
        Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.5)
          annotation (Placement(transformation(extent={{20,-234},{40,-214}})));
        hil_flexlab_model.Plants.AC_AWHP_PrimaryLoop_addpts_wTES_3SP_noprim
          aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug
          annotation (Placement(transformation(extent={{100,-190},{146,-154}})));
        Modelica.Blocks.Sources.Ramp T_in(
          height=5,
          duration=86400/2,
          offset=273 + 10) "return water temperature from the cooling coil"
          annotation (Placement(transformation(extent={{68,-72},{88,-52}})));
        Modelica.Blocks.Sources.Constant m_in(k=0.16)
          annotation (Placement(transformation(extent={{32,-116},{52,-96}})));
        Modelica.Blocks.Sources.Constant ChaMode(k=2) annotation (Placement(
              transformation(extent={{164,-158},{184,-138}})));
      equation
        connect(dynamic_on_signal.y, greaterThreshold.u) annotation (Line(points={{-29,
                -294},{-6,-294},{-6,-224},{18,-224}},
                                                 color={0,0,127}));
        connect(OAT.y, aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug.T_air_in)
          annotation (Line(points={{357,-340},{252,-340},{252,-187.545},{
                148.108,-187.545}},
              color={0,0,127}));
        connect(greaterThreshold.y, aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug.chiOn)
          annotation (Line(points={{41,-224},{74,-224},{74,-186},{98.0833,-186},
                {98.0833,-179.527}},
              color={255,0,255}));
        connect(m_in.y, aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug.m_flow_sec)
          annotation (Line(points={{53,-106},{106,-106},{106,-152.364},{104.983,
                -152.364}},
              color={0,0,127}));
        connect(T_in.y, aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug.T_chw_in)
          annotation (Line(points={{89,-62},{112,-62},{112,-152.364},{112.267,
                -152.364}},
              color={0,0,127}));
        connect(ChaMode.y, aC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug.TES_Mode)
          annotation (Line(points={{185,-148},{168,-148},{168,-182.964},{148.3,
                -182.964}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-420},
                  {480,100}})),                                        Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-420},{480,100}})),
          experiment(
            StopTime=86400,
            Interval=60,
            __Dymola_Algorithm="Dassl"));
      end AC_full_model_basic_u_test;
      annotation (Icon(graphics={
            Rectangle(
              lineColor={200,200,200},
              fillColor={248,248,248},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-100,-100},{100,100}},
              radius=25.0),
            Polygon(
              origin={18,16},
              lineColor={78,138,73},
              fillColor={78,138,73},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}));
    end Examples;

    model AC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug
      "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

      package MediumA = Buildings.Media.Air "Medium model for air";
      package MediumW = Buildings.Media.Water "Medium model for water";

      parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
      parameter Modelica.SIunits.Temperature TSetSupAir=286.15;
      constant Modelica.SIunits.MassFlowRate m_flow=0.4
        "Nominal mass flow rate";
      parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
        "Design mass flow rate of secondary loop";

      parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
      parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
      parameter Modelica.SIunits.Density d=1500 "Mass density of PCM";
      parameter Modelica.SIunits.Temperature TSol=273.15 + 29.5 "Solidus temperature of PCM.";
      parameter Modelica.SIunits.Temperature TLiq=273.15 + 29.66 "Liquidus temperature of PCM";
      parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";

      parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")=0
        "Nominal pressure raise, used for default pressure curve if not specified in record per";
      parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0) = 1000
        "Pressure drop of pipe and other resistances that are in series";
      parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0) = 1000
        "Nominal pressure drop of fully open valve";

      Buildings.Fluid.Sources.MassFlowSource_T sec_ret(
        redeclare package Medium = MediumW,
        use_m_flow_in=true,
        use_T_in=true,
        nPorts=1) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={158,-92})));
      Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = MediumW,
          nPorts=1)                                                                                    annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={458,-138})));
      Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package
          Medium =
            Buildings.Media.Water, m_flow_nominal=mSec_flow_nominal)
        annotation (Placement(transformation(extent={{350,-106},{370,-86}})));
      Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={246,36}),   iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={80,-292})));
      Modelica.Blocks.Interfaces.RealInput T_chw_in annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={194,36}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={228,40})));
      Modelica.Blocks.Interfaces.RealInput m_flow_sec annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={120,38}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={152,40})));
      Modelica.Blocks.Interfaces.RealOutput T_chw_out annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={360,40}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={390,40})));
      Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={576,-322}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={580,-314})));
      Plant_Controller_weiping_062822  plaCon(
        chargeStartMorn_CTes=casDat.chargeStartMorn_CTes,
        chargeEndMorn_CTes=casDat.chargeEndMorn_CTes,
        dischargeStart_CTes=casDat.dischargeStart_CTes,
        dischargeEnd_CTes=casDat.dischargeEnd_CTes,
        chargeStartNight_CTes=casDat.chargeStartNight_CTes,
        chargeEndNight_CTes=casDat.chargeEndNight_CTes,  TSolCoo=casDat.TSolCoo,TLiqCoo=casDat.TLiqCoo)
        annotation (Placement(transformation(extent={{266,-306},{318,-280}})));
      Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
        "Set point for chiller temperature"
        annotation (Placement(transformation(extent={{180,-320},{192,-308}})));
      hil_flexlab_model.Plants.Baseclasses_WH.BaseCoolingVarCOP_noref coo(
        m_flow_nominal=casDat.mAWHP_flow_nominal + casDat.mTes_flow_nominal,
        k=casDat.kPCMCoo,
        c=casDat.cPCMCoo,
        d=casDat.dPCMCoo,
        TSol=casDat.TSolCoo,
        TLiq=casDat.TLiqCoo,
        LHea=casDat.LHeaCoo,
        Q_flow_nominal=casDat.QCoo_flow_nominal,
        mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,
        mTes_flow_nominal=casDat.mTes_flow_nominal,
        Tes_nominal=casDat.LTes_nominal,
        dp_nominal=casDat.dp_nominal,
        dpFixed_nominal=casDat.dpFixed_nominal,
        dpValve_nominal=casDat.dpValve_nominal) annotation (Placement(
            transformation(
            extent={{-16,49},{16,-49}},
            rotation=90,
            origin={237,-244})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
        "Case study data"
        annotation (Placement(transformation(extent={{-8,-92},{52,-152}})));

      Modelica.Blocks.Sources.Constant TSetSupChiConst1(final k=casDat.TSetSupCW)
        "Set point for chiller temperature"
        annotation (Placement(transformation(extent={{244,-346},{256,-334}})));
      Buildings.Fluid.FixedResistances.Junction chw_ret(
        redeclare package Medium = MediumW,
        m_flow_nominal={mSec_flow_nominal,-(m_flow + mSec_flow_nominal),m_flow},
        from_dp=true,
        linearized=true,
        energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
        dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={156,-140})));
      Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
          Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
        annotation (Placement(transformation(extent={{-11,13},{11,-13}},
            rotation=270,
            origin={155,-189})));
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
            origin={315,-209})));
      Modelica.Blocks.Math.BooleanToReal booToInt(final realTrue=m_flow)
                                  "Boolean to integer conversion"
        annotation (Placement(transformation(extent={{278,-208},{288,-198}})));
      Buildings.Fluid.FixedResistances.Junction chw_sup(
        redeclare package Medium = MediumW,
        m_flow_nominal={m_flow + mSec_flow_nominal,-mSec_flow_nominal,m_flow},
        from_dp=true,
        linearized=true,
        energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
        dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={344,-138})));
        Modelica.Blocks.Sources.CombiTimeTable SchTes(
        table=[casDat.chargeStartMorn_CTes,0; casDat.chargeEndMorn_CTes,2;
            casDat.dischargeStart_CTes,1; casDat.dischargeEnd_CTes,2; casDat.chargeStartNight_CTes,
            0; casDat.chargeEndNight_CTes,0],
        smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
        extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
        "TES charging and discharging schedule"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={420,-290})));
    equation

      connect(senTem.port_b,bou. ports[1]) annotation (Line(points={{370,-96},{384,-96},
              {384,-138},{448,-138}},       color={0,127,255}));
      connect(T_chw_out, T_chw_out) annotation (Line(points={{360,40},{360,40}},
                                   color={0,0,127}));
      connect(coo.TSetASHP, TSetSupChiConst.y) annotation (Line(points={{263.385,
              -263.2},{263.385,-314},{192.6,-314}},
                                            color={0,0,127}));
      connect(coo.uASHP, plaCon.yASHP) annotation (Line(points={{274.692,-263.2},
              {274.692,-278.7},{279.52,-278.7}},
                                        color={0,0,127}));
      connect(plaCon.uTTes, coo.TTes) annotation (Line(points={{308.64,-308.08},
              {308,-308.08},{308,-318},{378,-318},{378,-226.4},{255.846,-226.4}},
                                                             color={0,0,127}));
      connect(plaCon.uTSet, TSetSupChiConst1.y) annotation (Line(points={{316.96,-308.08},
              {316.96,-320.04},{256.6,-320.04},{256.6,-340}},          color={0,0,
              127}));
      connect(coo.TSup, plaCon.uTMea) annotation (Line(points={{259.992,-226.4},
              {396,-226.4},{396,-334},{352,-334},{352,-330},{300,-330},{300,
              -308.08},{300.32,-308.08}},            color={0,0,127}));
      connect(T_air_in, coo.uTDryBul) annotation (Line(points={{576,-322},{374,
              -322},{374,-263.2},{281.854,-263.2}},
                                          color={0,0,127}));
      connect(plaCon.yTES, coo.uTes) annotation (Line(points={{268.6,-278.7},{242.3,
              -278.7},{242.3,-263.2},{237,-263.2}},
                                                color={0,0,127}));
      connect(sec_ret.T_in, T_chw_in) annotation (Line(points={{162,-80},{184,-80},{
              184,36},{194,36}}, color={0,0,127}));
      connect(m_flow_sec, sec_ret.m_flow_in) annotation (Line(points={{120,38},{148,
              38},{148,-80},{166,-80}}, color={0,0,127}));
      connect(plaCon.enaChi, chiOn) annotation (Line(points={{282.64,-308.08},{
              268,-308.08},{268,36},{246,36}},
                                  color={255,0,255}));
      connect(senTem.T, T_chw_out)
        annotation (Line(points={{360,-85},{360,-85},{360,40}}, color={0,0,127}));
      connect(coo.port_b, pumChiWat.port_a) annotation (Line(points={{243.785,
              -228},{282,-228},{282,-220},{315,-220},{315,-218}},
                                                            color={0,127,255}));
      connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{315,-200},
              {344.5,-200},{344.5,-148},{344,-148}}, color={0,127,255}));
      connect(booToInt.y, pumChiWat.m_flow_in) annotation (Line(points={{288.5,-203},
              {291.25,-203},{291.25,-209},{304.2,-209}}, color={0,0,127}));
      connect(coo.port_a, sen_retTem.port_b) annotation (Line(points={{225.692,
              -228},{182,-228},{182,-200},{155,-200}},
                                                 color={0,127,255}));
      connect(sen_retTem.port_a, chw_ret.port_1) annotation (Line(points={{155,-178},
              {155,-170},{156,-170},{156,-150}}, color={0,127,255}));
      connect(chw_ret.port_2, sec_ret.ports[1]) annotation (Line(points={{156,-130},
              {156,-102},{158,-102}}, color={0,127,255}));
      connect(chw_ret.port_3, chw_sup.port_3)
        annotation (Line(points={{166,-140},{260,-140},{260,-138},{334,-138}},
                                                         color={0,127,255}));
      connect(booToInt.u, chiOn) annotation (Line(points={{277,-203},{268,-203},{268,
              36},{246,36}}, color={255,0,255}));
      connect(senTem.port_a, chw_sup.port_1) annotation (Line(points={{350,-96},{348,
              -96},{348,-128},{344,-128}}, color={0,127,255}));
      connect(SchTes.y[1], plaCon.uSch) annotation (Line(points={{409,-290},{
              364,-290},{364,-302.88},{322.16,-302.88}}, color={0,0,127}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,
                -340},{560,20}}),   graphics={Line(points={{310,404}}, color={28,
                  108,200}), Line(
              points={{34,406}},
              color={0,127,255},
              smooth=Smooth.Bezier),
            Text(
              textString="Edit Here",
              extent={{192,-226},{260,-248}},
              lineColor={28,108,200})}),
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
</html>",     revisions="<html>
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
        Icon(coordinateSystem(extent={{100,-340},{560,20}}),  graphics={
            Rectangle(
              extent={{-70,80},{70,-80}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              origin={208,-152},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={209.5,-93},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={209.5,-213},
              rotation=360),
            Rectangle(
              extent={{-57,9},{57,-9}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={209,-93},
              rotation=360),
            Rectangle(
              extent={{-57,9},{57,-9}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={209,-213},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              origin={203.5,-93},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              origin={209.5,-211},
              rotation=360),
            Rectangle(
              extent={{-50,-5},{50,5}},
              lineColor={0,0,127},
              pattern=LinePattern.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              origin={264,-95},
              rotation=360),
            Polygon(
              points={{0,6},{-10,-6},{10,-6},{0,6}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-154},
              rotation=360),
            Polygon(
              points={{0,-5},{-10,5},{10,5},{0,-5}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-141},
              rotation=360),
            Rectangle(
              extent={{-2,20},{2,-20}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-122},
              rotation=360),
            Rectangle(
              extent={{-2,20},{2,-20}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-184},
              rotation=360),
            Rectangle(
              extent={{-2,51},{2,-51}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-153},
              rotation=360),
            Ellipse(
              extent={{-16,16},{16,-16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-152},
              rotation=180),
            Polygon(
              points={{0,8},{-16,-8},{16,-8},{0,8}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={166,-152},
              rotation=180),
            Rectangle(
              extent={{-50,-5},{50,5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              origin={166,-213},
              rotation=360),
            Rectangle(
              extent={{318,-136},{328,-178}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{302,-152},{344,-160}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{386,-76},{526,-236}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{356,-151},{557,-161}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{492,-72},{496,-232}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{416,-72},{420,-232}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{454,-76},{458,-236}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{386,-152},{526,-158}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(extent={{100,20},{558,-338}}, lineColor={135,135,135})}));
    end AC_AWHP_PrimaryLoop_addpts_wTES_no_y_debug;

    model AC_AWHP_wTES_debug_ports
      "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

      package MediumA = Buildings.Media.Air "Medium model for air";
      package MediumW = Buildings.Media.Water "Medium model for water";

      parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
      parameter Modelica.SIunits.Temperature TSetSupAir=286.15;
      constant Modelica.SIunits.MassFlowRate m_flow=0.4
        "Nominal mass flow rate";
      parameter Modelica.SIunits.MassFlowRate mSec_flow_nominal=0.33
        "Design mass flow rate of secondary loop";

      parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
      parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
      parameter Modelica.SIunits.Density d=1500 "Mass density of PCM";
      parameter Modelica.SIunits.Temperature TSol=273.15 + 29.5 "Solidus temperature of PCM.";
      parameter Modelica.SIunits.Temperature TLiq=273.15 + 29.66 " Liquidus temperature of PCM";
      parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";

      parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")=0
        "Nominal pressure raise, used for default pressure curve if not specified in record per";
      parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0) = 1000
        "Pressure drop of pipe and other resistances that are in series";
      parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0) = 1000
        "Nominal pressure drop of fully open valve";

      Modelica.Blocks.Interfaces.RealInput T_air_in annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={576,-274}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={580,-314})));
      Plant_Controller_weiping_062822  plaCon(TSolCoo=casDat.TSolCoo,TLiqCoo=casDat.TLiqCoo)
        annotation (Placement(transformation(extent={{270,-222},{322,-192}})));
      Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
        "Set point for chiller temperature"
        annotation (Placement(transformation(extent={{184,-236},{196,-224}})));
      BaseCoolingVarCOP_weiping_062822 coo(m_flow_nominal=casDat.mAWHP_flow_nominal+
       casDat.mTes_flow_nominal, k=casDat.kPCMCoo, c=casDat.cPCMCoo, d=casDat.dPCMCoo, TSol=casDat.TSolCoo, TLiq=casDat.TLiqCoo, LHea=casDat.LHeaCoo,
       Q_flow_nominal=casDat.QCoo_flow_nominal, mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,mTes_flow_nominal=casDat.mTes_flow_nominal,
       Tes_nominal=casDat.LTes_nominal, dp_nominal=casDat.dp_nominal, dpFixed_nominal=
       casDat.dpFixed_nominal, dpValve_nominal=casDat.dpValve_nominal) annotation (Placement(transformation(
            extent={{-16,49},{16,-49}},
            rotation=90,
            origin={241,-160})));

       hil_flexlab_model.Data.BBR_3C_Med casDat
        "Case study data"
        annotation (Placement(transformation(extent={{-8,-92},{52,-152}})));

      Modelica.Blocks.Sources.Constant TSetSupChiConst1(final k=casDat.TSetSupCW)
        "Set point for chiller temperature"
        annotation (Placement(transformation(extent={{248,-262},{260,-250}})));
      Buildings.Fluid.FixedResistances.Junction chw_ret(
        redeclare package Medium = MediumW,
        m_flow_nominal={mSec_flow_nominal,-(m_flow + mSec_flow_nominal),m_flow},
        from_dp=true,
        linearized=true,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={166,-50})));
      Buildings.Fluid.FixedResistances.Junction chw_sup(
        redeclare package Medium = MediumW,
        m_flow_nominal={m_flow + mSec_flow_nominal,-mSec_flow_nominal,m_flow},
        from_dp=true,
        linearized=true,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={396,-46})));
      Buildings.Fluid.Sensors.TemperatureTwoPort sen_retTem(redeclare package
          Medium = Buildings.Media.Water, m_flow_nominal=m_flow)
        annotation (Placement(transformation(extent={{-11,13},{11,-13}},
            rotation=270,
            origin={167,-99})));
      Modelica.Blocks.Interfaces.BooleanInput chiOn "On signal for chiller plant"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={278,38}),   iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={76,-214})));
      Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
            MediumW) "Fluid connector b (supply from source)"
        annotation (Placement(transformation(extent={{366,-30},{416,20}}),
            iconTransformation(extent={{366,-30},{416,20}})));
      Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
            MediumW) "Fluid connector a (return to source)"
        annotation (Placement(transformation(extent={{146,4},{196,50}}),
            iconTransformation(extent={{218,-30},{270,20}})));
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
            origin={339,-115})));
      Modelica.Blocks.Math.BooleanToReal booToInt(final realTrue=m_flow)
                                  "Boolean to integer conversion"
        annotation (Placement(transformation(extent={{294,-114},{304,-104}})));
        Modelica.Blocks.Sources.CombiTimeTable SchTes(
        table=[casDat.chargeStartMorn_CTes,0; casDat.chargeEndMorn_CTes,2; casDat.dischargeStart_CTes,1;
            casDat.dischargeEnd_CTes,2; casDat.chargeStartNight_CTes,0; casDat.chargeEndNight_CTes,0],
        smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
        extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
        "TES charging and discharging schedule"
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=0,
            origin={356,-204})));

    equation

      connect(coo.TSetASHP, TSetSupChiConst.y) annotation (Line(points={{267.385,
              -179.2},{267.385,-230},{196.6,-230}},
                                            color={0,0,127}));
      connect(coo.uASHP, plaCon.yASHP) annotation (Line(points={{278.692,-179.2},
              {278.692,-190.5},{283.52,-190.5}},
                                        color={0,0,127}));
      connect(plaCon.uTTes, coo.TTes) annotation (Line(points={{312.64,-224.4},
              {312,-224.4},{312,-234},{382,-234},{382,-142.4},{259.846,-142.4}},
                                                             color={0,0,127}));
      connect(plaCon.uTSet, TSetSupChiConst1.y) annotation (Line(points={{320.96,-224.4},
              {320.96,-236.04},{260.6,-236.04},{260.6,-256}},          color={0,0,
              127}));
      connect(T_air_in, coo.uTDryBul) annotation (Line(points={{576,-274},{378,
              -274},{378,-179.2},{285.854,-179.2}},
                                          color={0,0,127}));
      connect(plaCon.yTES, coo.uTes) annotation (Line(points={{272.6,-190.5},{246.3,
              -190.5},{246.3,-179.2},{241,-179.2}},
                                                color={0,0,127}));
      connect(sen_retTem.port_a,chw_ret. port_1) annotation (Line(points={{167,-88},
              {167,-67},{166,-67},{166,-60}},    color={0,127,255}));
      connect(chw_sup.port_3,chw_ret. port_3)
        annotation (Line(points={{386,-46},{352,-46},{352,-50},{176,-50}},
                                                         color={0,127,255}));
      connect(sen_retTem.port_b, coo.port_a) annotation (Line(points={{167,-110},
              {168,-110},{168,-144},{229.692,-144}},
                                                color={0,127,255}));
      connect(chw_sup.port_1, port_b) annotation (Line(points={{396,-36},{396,9.5},{
              391,9.5},{391,-5}},
                              color={0,127,255}));
      connect(chw_ret.port_2, port_a) annotation (Line(points={{166,-40},{166,7.5},{
              171,7.5},{171,27}},
                              color={0,127,255}));
      connect(port_b, port_b) annotation (Line(points={{391,-5},{392,-5},{392,-6},{389,
              -6},{391,-6},{391,-5}}, color={0,127,255}));
      connect(pumChiWat.port_b, chw_sup.port_2) annotation (Line(points={{339,-106},
              {367.5,-106},{367.5,-56},{396,-56}}, color={0,127,255}));
      connect(pumChiWat.port_a, coo.port_b) annotation (Line(points={{339,-124},
              {294,-124},{294,-144},{247.785,-144}},
                                                color={0,127,255}));
      connect(booToInt.y, pumChiWat.m_flow_in) annotation (Line(points={{304.5,-109},
              {317.25,-109},{317.25,-115},{328.2,-115}}, color={0,0,127}));
      connect(SchTes.y[1], plaCon.uSch) annotation (Line(points={{345,-204},{338,-204},
              {338,-218.4},{326.16,-218.4}}, color={0,0,127}));
      connect(coo.TSup, plaCon.uTMea) annotation (Line(points={{263.992,-142.4},
              {263.992,-184.2},{304.32,-184.2},{304.32,-224.4}}, color={0,0,127}));
      connect(chiOn, plaCon.enaChi) annotation (Line(points={{278,38},{290,38},
              {290,-224.4},{286.64,-224.4}},
                                          color={255,0,255}));
      connect(plaCon.yPum, booToInt.u) annotation (Line(points={{288.72,-190.5},
              {288.72,-150.25},{293,-150.25},{293,-109}}, color={255,0,255}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{100,-280},
                {560,20}}),         graphics={Line(points={{310,404}}, color={28,
                  108,200}), Line(
              points={{34,406}},
              color={0,127,255},
              smooth=Smooth.Bezier),
            Text(
              textString="Edit Here",
              extent={{196,-142},{264,-164}},
              lineColor={28,108,200})}),
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
</html>",     revisions="<html>
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
        Icon(coordinateSystem(extent={{100,-280},{560,20}}),  graphics={
            Rectangle(
              extent={{-70,80},{70,-80}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              origin={208,-152},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={209.5,-93},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={209.5,-213},
              rotation=360),
            Rectangle(
              extent={{-57,9},{57,-9}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={209,-93},
              rotation=360),
            Rectangle(
              extent={{-57,9},{57,-9}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={209,-213},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              origin={203.5,-93},
              rotation=360),
            Rectangle(
              extent={{-100.5,5},{100.5,-5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              origin={209.5,-211},
              rotation=360),
            Rectangle(
              extent={{-50,-5},{50,5}},
              lineColor={0,0,127},
              pattern=LinePattern.None,
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid,
              origin={264,-95},
              rotation=360),
            Polygon(
              points={{0,6},{-10,-6},{10,-6},{0,6}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-154},
              rotation=360),
            Polygon(
              points={{0,-5},{-10,5},{10,5},{0,-5}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-141},
              rotation=360),
            Rectangle(
              extent={{-2,20},{2,-20}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-122},
              rotation=360),
            Rectangle(
              extent={{-2,20},{2,-20}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-184},
              rotation=360),
            Rectangle(
              extent={{-2,51},{2,-51}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={248,-153},
              rotation=360),
            Ellipse(
              extent={{-16,16},{16,-16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              origin={166,-152},
              rotation=180),
            Polygon(
              points={{0,8},{-16,-8},{16,-8},{0,8}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              origin={166,-152},
              rotation=180),
            Rectangle(
              extent={{-50,-5},{50,5}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              origin={166,-213},
              rotation=360),
            Rectangle(
              extent={{318,-136},{328,-178}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{302,-152},{344,-160}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{386,-76},{526,-236}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{356,-151},{557,-161}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{492,-72},{496,-232}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{416,-72},{420,-232}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{454,-76},{458,-236}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{386,-152},{526,-158}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Rectangle(extent={{100,20},{558,-338}}, lineColor={135,135,135})}));
    end AC_AWHP_wTES_debug_ports;

    model BaseCoolingVarCOP_noref
      "Basic cooling plant with variable COP components"
      extends hil_flexlab_model.Plants.BaseClasses.partialPlant(m_flow_nominal=
            mAWHP_flow_nominal + mTes_flow_nominal, senTemRet);
      parameter Modelica.SIunits.MassFlowRate mAWHP_flow_nominal = 1e-15 "Nominal mass flowrate of air-to-water heat pump";
      parameter Modelica.SIunits.MassFlowRate mTes_flow_nominal = 1e-15 "Nominal mass flowrate of tes";
      parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
      parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
      parameter Modelica.SIunits.Density d=1500 "Mass density of PCM";
      parameter Modelica.SIunits.Temperature TSol=273.15 + 29.5 "Solidus temperature of PCM.";
      parameter Modelica.SIunits.Temperature TLiq=273.15 + 29.66 "Liquidus temperature of PCM";
      parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";
      parameter Modelica.SIunits.DimensionlessRatio COPCoo_ASHP=3
        "Cooling COP of ASHP";
      parameter Modelica.SIunits.DimensionlessRatio COPCoo_SWEC=3
        "Cooling COP of SWEC";
      parameter Modelica.SIunits.Power Q_flow_nominal;
      parameter Modelica.SIunits.Energy Tes_nominal = 25200000
        "Design TES capacity";
      parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")
        "Nominal pressure raise, used for default pressure curve if not specified in record per";
      parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0)
        "Pressure drop of pipe and other resistances that are in series";
      parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0)
        "Nominal pressure drop of fully open valve";

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
      Baseclasses_WH.Tes_weiping_062822 TES(
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

      RTUPCM.HVAC.Plants.BaseClasses.ASHPCoolingVarCOP AWHP(mSou_flow_nominal=mAWHP_flow_nominal,
      Q_flow_nominal=Q_flow_nominal)
                                    "dp_nominal=dp_nominal)"
        annotation (Placement(transformation(extent={{-52,140},{-32,160}})));

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
      connect(spl3.port_2, senMasFloSup.port_a) annotation (Line(points={{20,60},{
              20,4},{78,4},{78,10}},color={0,127,255}));
      connect(TES.SOC, SOC) annotation (Line(points={{-19,-2},{20,-2},{20,0},{110,0}},
            color={0,0,127}));
      connect(senTemRetSwe.T, TRetASHP) annotation (Line(points={{9,-248},{0,-248},
              {0,-240},{80,-240},{80,-220},{110,-220}}, color={0,0,127}));
      connect(senTemRetSwe.port_a, spl5.port_2)
        annotation (Line(points={{20,-238},{20,-130}}, color={0,127,255}));
      connect(AWHP.TSetSou, TSetASHP) annotation (Line(points={{-54,153},{-70,153},{
              -70,140},{-120,140}}, color={0,0,127}));
      connect(AWHP.TDryBul, uTDryBul) annotation (Line(points={{-54,158.8},{-70,158.8},
              {-70,240},{-120,240},{-120,238}},
                           color={0,0,127}));
      connect(AWHP.uPum, uASHP) annotation (Line(points={{-54,156},{-64,156},{-64,200},
              {-120,200}},
                     color={0,0,127}));
      connect(AWHP.port_a, spl1.port_3) annotation (Line(points={{-32,156},{0,156},{
              0,174},{10,174}}, color={0,127,255}));
      connect(AWHP.port_b, spl2.port_3) annotation (Line(points={{-32,144},{-14,144},
              {-14,126},{10,126}}, color={0,127,255}));
      connect(AWHP.TSup, TASHP)
        annotation (Line(points={{-31,148},{110,148}}, color={0,0,127}));
      connect(PEle, AWHP.PEle) annotation (Line(points={{110,260},{42,260},{42,160},
              {-31,160}}, color={0,0,127}));
    end BaseCoolingVarCOP_noref;

    model BaseCoolingVarCOP_3SP
      "Basic cooling plant with variable COP components"
      extends hil_flexlab_model.Plants.BaseClasses.partialPlant_glycol(m_flow_nominal=
            mAWHP_flow_nominal + mTes_flow_nominal, senTemRet);
      parameter Modelica.SIunits.MassFlowRate mAWHP_flow_nominal = 1e-15 "Nominal mass flowrate of air-to-water heat pump";
      parameter Modelica.SIunits.MassFlowRate mTes_flow_nominal = 1e-15 "Nominal mass flowrate of tes";
      parameter Modelica.SIunits.ThermalConductivity k=0.584 "Thermal conductivity of PCM";
      parameter Modelica.SIunits.SpecificHeatCapacity c=2910 "Specific heat capacity of PCM";
      parameter Modelica.SIunits.Density d=1500 "Mass density of PCM";
      parameter Modelica.SIunits.Temperature TSol=273.15 + 29.5 "Solidus temperature of PCM.";
      parameter Modelica.SIunits.Temperature TLiq=273.15 + 29.66 "Liquidus temperature of PCM";
      parameter Modelica.SIunits.Temperature T_start=TSol - 2 "start temperature of PCM";
      parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";
      parameter Modelica.SIunits.DimensionlessRatio COPCoo_ASHP=3
        "Cooling COP of ASHP";
      parameter Modelica.SIunits.DimensionlessRatio COPCoo_SWEC=3
        "Cooling COP of SWEC";
      parameter Modelica.SIunits.Power Q_flow_nominal;
      parameter Modelica.SIunits.Energy Tes_nominal = 25200000
        "Design TES capacity";
      parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")
        "Nominal pressure raise, used for default pressure curve if not specified in record per";
      parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0)
        "Pressure drop of pipe and other resistances that are in series";
      parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0)
        "Nominal pressure drop of fully open valve";

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
        m_flow_nominal=m_flow_nominal,
        T_start=278.15)
               "Temperature sensor for supply water after AWHP" annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=-90,
            origin={20,100})));
      Baseclasses_WH.Tes_weiping_062822 TES(
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
        dpValve_nominal=dpValve_nominal,
        T_start=T_start)
        annotation (Placement(transformation(extent={{-38,-2},{-18,20}})));
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

      hil_flexlab_model.Plants.BaseClasses.ASHPCoolingVarCOP
        AWHP(
        mSou_flow_nominal=mAWHP_flow_nominal,
        Q_flow_nominal=Q_flow_nominal)
         annotation (Placement(transformation(extent={{-50,140},{-30,160}})));

      Modelica.Blocks.Interfaces.RealOutput COP_HP(unit="-") "COP of HP"
        annotation (Placement(transformation(extent={{100,224},{120,244}})));
      Modelica.Blocks.Interfaces.RealOutput out_uPCM "output for uPCM"
        annotation (Placement(transformation(extent={{100,-24},{120,-4}})));
      Modelica.Blocks.Interfaces.RealOutput out_mPCM "state of charge of PCM"
        annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
    equation
      connect(spl2.port_2, senTemSupAWHP.port_a)
        annotation (Line(points={{20,116},{20,110}}, color={0,127,255}));
      connect(senTemSupAWHP.port_b, spl3.port_1)
        annotation (Line(points={{20,90},{20,80}}, color={0,127,255}));
      connect(spl3.port_3, TES.port_a1) annotation (Line(points={{10,70},{0,70},
              {0,17.8},{-18,17.8}},
                           color={0,127,255}));
      connect(spl4.port_3, TES.port_a2) annotation (Line(points={{10,-70},{0,
              -70},{0,4.6},{-18,4.6}},
                               color={0,127,255}));
      connect(TES.port_b, spl5.port_3) annotation (Line(points={{-18,0.2},{-10,
              0.2},{-10,-120},{10,-120}},
                                     color={0,127,255}));
      connect(senTemRetSwe.port_b, spl1.port_1) annotation (Line(points={{20,-258},
              {20,-260},{60,-260},{60,200},{20,200},{20,184}},color={0,127,255}));
      connect(senTemRet.port_b, spl4.port_1)
        annotation (Line(points={{30,-30},{20,-30},{20,-60}}, color={0,127,255}));
      connect(TES.uTes, uTes) annotation (Line(points={{-40,20},{-72,20},{-72,0},
              {-120,0}},
                   color={0,0,127}));
      connect(TES.TTes, TTes) annotation (Line(points={{-17,20},{-10,20},{-10,
              86},{80,86},{80,100},{110,100}},
                                          color={0,0,127}));
      connect(spl1.port_2, spl2.port_1)
        annotation (Line(points={{20,164},{20,136}}, color={0,127,255}));
      connect(spl4.port_2, spl5.port_1)
        annotation (Line(points={{20,-80},{20,-110}}, color={0,127,255}));
      connect(senTemSupAWHP.T, TSup) annotation (Line(points={{9,100},{0,100},{0,
              122},{110,122}},
                          color={0,0,127}));
      connect(spl3.port_2, senMasFloSup.port_a) annotation (Line(points={{20,60},{
              20,4},{78,4},{78,10}},color={0,127,255}));
      connect(TES.SOC, SOC) annotation (Line(points={{-17,-2},{20,-2},{20,0},{
              110,0}},
            color={0,0,127}));
      connect(senTemRetSwe.T, TRetASHP) annotation (Line(points={{9,-248},{0,-248},
              {0,-240},{80,-240},{80,-220},{110,-220}}, color={0,0,127}));
      connect(senTemRetSwe.port_a, spl5.port_2)
        annotation (Line(points={{20,-238},{20,-130}}, color={0,127,255}));
      connect(AWHP.TSetSou, TSetASHP) annotation (Line(points={{-52,153},{-70,
              153},{-70,140},{-120,140}},
                                    color={0,0,127}));
      connect(AWHP.TDryBul, uTDryBul) annotation (Line(points={{-52,158.8},{-70,
              158.8},{-70,240},{-120,240},{-120,238}},
                           color={0,0,127}));
      connect(AWHP.uPum, uASHP) annotation (Line(points={{-52,156},{-64,156},{
              -64,200},{-120,200}},
                     color={0,0,127}));
      connect(AWHP.port_a, spl1.port_3) annotation (Line(points={{-30,156},{0,
              156},{0,174},{10,174}},
                                color={0,127,255}));
      connect(AWHP.port_b, spl2.port_3) annotation (Line(points={{-30,144},{-14,
              144},{-14,126},{10,126}},
                                   color={0,127,255}));
      connect(AWHP.TSup, TASHP)
        annotation (Line(points={{-29,148},{110,148}}, color={0,0,127}));
      connect(PEle, AWHP.PEle) annotation (Line(points={{110,260},{42,260},{42,
              160},{-29,160}},
                          color={0,0,127}));
      connect(AWHP.COP, COP_HP) annotation (Line(points={{-29,158.4},{36.5,
              158.4},{36.5,234},{110,234}}, color={0,0,127}));
      connect(out_uPCM, out_uPCM)
        annotation (Line(points={{110,-14},{110,-14}}, color={0,0,127}));
      connect(TES.mPCM, out_mPCM) annotation (Line(points={{-39,0.2},{33.5,0.2},{33.5,
              -30},{110,-30}}, color={0,0,127}));
      connect(TES.uPCM, out_uPCM) annotation (Line(points={{-39,2.62},{32.5,2.62},{32.5,
              -14},{110,-14}}, color={0,0,127}));
    end BaseCoolingVarCOP_3SP;
  end Baseclasses_WH;
end Plants;
