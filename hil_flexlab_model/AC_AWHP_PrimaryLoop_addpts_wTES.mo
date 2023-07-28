within hil_flexlab_model;
model AC_AWHP_PrimaryLoop_addpts_wTES
  "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

  package MediumA = Buildings.Media.Air "Medium model for air";
  package MediumW = Buildings.Media.Water "Medium model for water";
  constant Modelica.Units.SI.MassFlowRate m_flow=0.4 "Nominal mass flow rate";

  parameter Modelica.Units.SI.Temperature TSupChi_nominal=281.15;
  parameter Modelica.Units.SI.Temperature TSetSupAir=286.15;

  parameter Modelica.Units.SI.MassFlowRate mSec_flow_nominal=0.33
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
  Plants.BaseCoolingVarCOP coo annotation (Placement(
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
  connect(senTem.port_b,bou. ports[1]) annotation (Line(points={{370,-96},{384,-96},
          {384,-136},{398,-136}},       color={0,127,255}));
  connect(senTem.T, T_chw_out) annotation (Line(points={{360,-85},{360,40}},
                                color={0,0,127}));
  connect(sec_ret.ports[1], chw_ret.port_2)
    annotation (Line(points={{168,-100},{168,-126}}, color={0,127,255}));
  connect(chw_sup.port_1, senTem.port_a) annotation (Line(points={{308,-126},{308,
          -96},{350,-96}},   color={0,127,255}));
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
  connect(sen_retTem.port_b, coo.port_b) annotation (Line(points={{169,-192},{
          208,-192},{208,-220},{214.246,-220}}, color={0,127,255}));
  connect(coo.port_a, chw_sup.port_2) annotation (Line(points={{234.923,-220},{
          234.923,-199},{308,-199},{308,-146}}, color={0,127,255}));
  connect(coo.uTDryBul, T_air_in) annotation (Line(points={{171.169,-264},{
          169.584,-264},{169.584,-322},{576,-322}}, color={0,0,127}));
  connect(plant_Controller.yTES, coo.uTes) annotation (Line(points={{259.28,-286.7},
          {253.64,-286.7},{253.64,-264},{222,-264}}, color={0,0,127}));
  connect(TSetSupChiConst.y, coo.TSetASHP) annotation (Line(points={{210.6,-306},
          {210.6,-282},{191.846,-282},{191.846,-264}}, color={0,0,127}));
  connect(plant_Controller.yASHP, coo.uASHP) annotation (Line(points={{265.52,-286.7},
          {177.76,-286.7},{177.76,-264},{178.923,-264}}, color={0,0,127}));
  connect(plant_Controller.enaChi, chiOn) annotation (Line(points={{284.24,
          -316.08},{284.24,-314},{354,-314},{354,-160},{246,-160},{246,36}},
                                                                     color={255,
          0,255}));
  connect(senTem.T, plant_Controller.uTMea) annotation (Line(points={{360,-85},
          {360,-204},{322,-204},{322,-262},{287.08,-262},{287.08,-320.08}},
                                                         color={0,0,127}));
  connect(TSetSupChiConst.y, plant_Controller.uTSet) annotation (Line(points={{210.6,
          -306},{262,-306},{262,-315.95},{301.66,-315.95}}, color={0,0,127}));
  connect(senTem.T, plaCon.uTMea) annotation (Line(points={{360,-85},{360,-204},
          {322,-204},{322,-262},{287.08,-262},{286.32,-318.08}}, color={0,0,127}));
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
