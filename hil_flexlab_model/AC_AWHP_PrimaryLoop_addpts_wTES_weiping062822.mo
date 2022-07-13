within hil_flexlab_model;
model AC_AWHP_PrimaryLoop_addpts_wTES_weiping062822
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
  parameter Modelica.SIunits.Temperature TSol=273.15 + 29.5 "Solidus temperature of PCM.";
  parameter Modelica.SIunits.Temperature TLiq=273.15 + 29.66 "Liquidus temperature of PCM";
  parameter Modelica.SIunits.SpecificInternalEnergy LHea=278140 "Latent heat of phase change";
  parameter Modelica.SIunits.Energy Tes_nominal
    "Design TES capacity";
  parameter Modelica.SIunits.PressureDifference dp_nominal(min=0, displayUnit="Pa")=0
    "Nominal pressure raise, used for default pressure curve if not specified in record per";
  parameter Modelica.SIunits.PressureDifference dpFixed_nominal(displayUnit="Pa", min=0) = 1000
    "Pressure drop of pipe and other resistances that are in series";
  parameter Modelica.SIunits.PressureDifference dpValve_nominal(displayUnit="Pa", min=0) = 1000
    "Nominal pressure drop of fully open valve";
  parameter Real table[:, :] = [casDat.chargeStartMorn_CTes,0;
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
  Plant_Controller_weiping_062822  plaCon(table=table,TSolCoo=TSol,TLiqCoo=TLiq)
    annotation (Placement(transformation(extent={{268,-304},{320,-278}})));
  Modelica.Blocks.Sources.Constant TSetSupChiConst(final k=casDat.TSetSupCW)
    "Set point for chiller temperature"
    annotation (Placement(transformation(extent={{180,-320},{192,-308}})));
  BaseCoolingVarCOP_weiping_062822 coo(m_flow_nominal=casDat.mAWHP_flow_nominal+
   casDat.mTes_flow_nominal, k=casDat.kPCMCoo, c=casDat.cPCMCoo, d=casDat.dPCMCoo, TSol=casDat.TSolCoo, TLiq=casDat.TLiqCoo, LHea=casDat.LHeaCoo,
   Q_flow_nominal=casDat.QCoo_flow_nominal, mAWHP_flow_nominal=casDat.mAWHP_flow_nominal,
   mSwec_flow_nominal=casDat.mSwec_flow_nominal,mTes_flow_nominal=casDat.mTes_flow_nominal,
   Tes_nominal=casDat.LTes_nominal, dp_nominal=casDat.dp_nominal, dpFixed_nominal=
   casDat.dpFixed_nominal, dpValve_nominal=casDat.dpValve_nominal) annotation (Placement(transformation(
        extent={{-20,-56},{20,56}},
        rotation=90,
        origin={224,-238})));

   hil_flexlab_model.Data.BBR_3C_Med casDat
    "Case study data"
    annotation (Placement(transformation(extent={{-6,-92},{54,-152}})));

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
  connect(plaCon.enaChi, chiOn) annotation (Line(points={{294,-306.08},{294,
          -314},{354,-314},{354,-160},{246,-160},{246,36}},          color={255,
          0,255}));
  connect(senTem.T, plaCon.uTMea) annotation (Line(points={{360,-85},{360,-204},
          {322,-204},{322,-262},{302.32,-262},{302.32,-306.08}}, color={0,0,127}));
  connect(coo.port_b, sen_retTem.port_b) annotation (Line(points={{216.246,-218},
          {210,-218},{210,-194},{169,-194},{169,-192}}, color={0,127,255}));
  connect(coo.port_a, chw_sup.port_2) annotation (Line(points={{236.923,-218},{
          430,-218},{430,-152},{308,-152},{308,-146}},
                                                   color={0,127,255}));
  connect(coo.TSetASHP, TSetSupChiConst.y) annotation (Line(points={{193.846,
          -262},{193.846,-314},{192.6,-314}},
                                        color={0,0,127}));
  connect(coo.uTes, plaCon.yTES) annotation (Line(points={{224,-262},{224,-288},
          {275.28,-288},{275.28,-276.7}}, color={0,0,127}));
  connect(coo.uASHP, plaCon.yASHP) annotation (Line(points={{180.923,-262},{
          180.923,-276.7},{281.52,-276.7}},
                                    color={0,0,127}));
  connect(coo.uTDryBul, T_air_in) annotation (Line(points={{172.738,-262},{
          172.738,-322},{576,-322}},
                             color={0,0,127}));
  connect(coo.COP_HP, chi_COP) annotation (Line(points={{172.738,-216},{138,
          -216},{138,-324},{78,-324}}, color={0,0,127}));
  connect(coo.HP_spd, chi_spd) annotation (Line(points={{177.046,-216},{138,
          -216},{138,-292},{78,-292}}, color={0,0,127}));
  connect(coo.PEle, chi_P) annotation (Line(points={{168,-216},{136,-216},{136,
          -264},{76,-264}}, color={0,0,127}));
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
end AC_AWHP_PrimaryLoop_addpts_wTES_weiping062822;
