within hil_flexlab_model.BaseClasses;
partial model Chiller_Prim_Loop
  "Validated Partial model of variable air volume flow system with terminal reheat and 3 VAV zones at flexlab x1a"

  package MediumA = Buildings.Media.Air "Medium model for air";
  package MediumW = Buildings.Media.Water "Medium model for water";
   parameter
    hil_flexlab_model.Data.AirCooled.ElectricEIRChiller_York_YCAL0019EE_54_2kW_2_9COP_None
    per     "Chiller performance data"
    annotation (Placement(transformation(extent={{216,-320},{232,-304}})));

    constant Real QCoo_flow_nominal=-54160;
    constant Real COP_nominal=2.9;
    constant Real mChiEva_flow_nominal=1000*0.0095;
    constant Real mChiCon_flow_nominal=1.293*5.11;
    constant Real m_chw_in;

  parameter Modelica.SIunits.Temperature TSupChi_nominal=281.15;
  parameter Modelica.SIunits.Temperature TSetSupAir=286.15;






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

  Buildings.Fluid.FixedResistances.Junction jun(redeclare package Medium = MediumW, m_flow_nominal={mChiEva_flow_nominal+m_chw_in,-m_chw_in,mChiEva_flow_nominal},
        from_dp=true,
    linearized=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dp_nominal(each displayUnit="Pa") = {0,0,0})
                                                annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={308,-174})));
  Buildings.Fluid.FixedResistances.Junction jun1(redeclare package Medium = MediumW, m_flow_nominal={m_chw_in,-mChiEva_flow_nominal+m_chw_in,mChiEva_flow_nominal},
             from_dp=true,
    linearized=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dp_nominal(each displayUnit="Pa") = {0,0,0}) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={180,-176})));
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
  connect(pumChiWat.port_b, jun.port_2) annotation (Line(points={{309,-210},{
          308,-210},{308,-184}}, color={0,127,255}));
  connect(jun1.port_1, chi.port_a2) annotation (Line(points={{180,-186},{180,
          -280},{224,-280},{224,-275.2}}, color={0,127,255}));
  connect(chi.on, booToInt.u) annotation (Line(points={{241.6,-282.4},{257.8,-282.4},
          {257.8,-259},{275,-259}}, color={255,0,255}));
  connect(jun.port_3, jun1.port_3) annotation (Line(points={{298,-174},{244,-174},
          {244,-176},{190,-176}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-380,
            -460},{1420,600}}), graphics={Line(points={{310,404}}, color={28,
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
    Icon(coordinateSystem(extent={{-380,-460},{1420,600}})));
end Chiller_Prim_Loop;
