within hil_flexlab_model;
package HeatPumps "Contains heat pump models"
  model BlackBox_Generic_TSetpoint
    "Blackbox heat pump model for cooling or heating with outlet load side temperature setpoint as input"

    extends IDEAS.Fluid.HeatPumps.Interfaces.PartialDynamicHeaterWithLosses(
      final allowFlowReversal=false,
      final cDry = 10000,
      final mWater = 4);
      // rename
      // SC: Gives the structure of the heat pump connections and provides the parameter structure for user inputs

    //outer IDEAS.BoundaryConditions.SimInfoManager sim
   // Commenting it out to have an input value for evap temp on higher level
    Modelica.Blocks.Interfaces.RealInput TSource
      "Evaporator temperature input in K" annotation (Placement(transformation(
            extent={{-126,-60},{-86,-20}}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-186,-8})));

   /* SC: Commenting out the Q_design as it does not seem required 
 parameter Modelica.SIunits.Power QDesign=0
    "Overrules QNom if different from 0";
  parameter Real fraLosDesNom=0.68
    "Ratio of power at design conditions over power at 6/35degC";
  parameter Real betaFactor=0.8 "Relative sizing compared to design heat load";
  final parameter Modelica.SIunits.Power QNomFinal=if QDesign == 0 then QNom
       else QDesign/fraLosDesNom*betaFactor
       "Used nominal power in the energyPump model, comes from extended class"; */
    parameter Real modulation_min=20 "Min modulation percentage for heat pump to shut down";
    parameter Real modulation_start=40
      "Min modulation percentage required for starting the heat pump";
    Real COP "Instanteanous COP";

    Real modulation(max=100) = IDEAS.Utilities.Math.Functions.smoothMax(0, energyPump.modulation, 1)
      "Current modulation percentage - an output of the heatpump model below";
    //Modelica.Media.Water.ConstantPropertyLiquidWater mediumLoadHX

    replaceable Data.BlackBox_Generic_TSetpoint.Aermec_ANKI045_60HZ_Cooling
      energyPump(
      final QNomLoad=QNom "SC: Changed nomenclature",
      final TEnvironment=heatPort.T "comes from extended class",
      final UALoss=UALoss "comes from extended class",
      final modulation_min=modulation_min,
      final modulation_start=modulation_start,
      final hIn=inStream(port_a.h_outflow),
      redeclare package Medium = Medium)
      "Data file for heating or cooling application"
      annotation (Placement(transformation(extent={{-60,-16},{-40,4}})));
      //final TEvaporator=TEvap "Do not need it as the input is now connected",

    Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor
      annotation (Placement(transformation(extent={{-32,-2},{-6,24}})));
    Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=true)
      annotation (Placement(transformation(extent={{-40,20},{-60,40}})));
    Modelica.Blocks.Interfaces.BooleanInput HP_On "On signal for chiller plant"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-106,28}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-184,76})));
  equation
    PEl = energyPump.PEl;
    COP =if noEvent(PEl > 0) then vol.heatPort.Q_flow/PEl else 0;

    connect(heatFlowSensor.port_b, vol.heatPort) annotation (Line(
        points={{-6,11},{16,11},{16,-20},{10,-20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(TSet, energyPump.TSetpoint) annotation (Line(points={{-106,0},{-82,0},
            {-82,-6},{-60,-6}}, color={0,0,127}));
    connect(Tin.T, energyPump.TLoadHX_in) annotation (Line(points={{70,-49},{70,-34},
            {-8,-34},{-8,-32},{-44,-32},{-44,-15.8},{-43.6,-15.8}}, color={0,0,127}));
    connect(energyPump.m_flowLoadHX, senMasFlo.m_flow) annotation (Line(points={{-56.2,
            -16},{-56,-16},{-56,-49},{40,-49}}, color={0,0,127}));
    connect(energyPump.loadPort, heatFlowSensor.port_a) annotation (Line(points={{
            -40,-6},{-36,-6},{-36,11},{-32,11}}, color={191,0,0}));
    connect(energyPump.on, HP_On) annotation (Line(points={{-60.2,1.4},{-60.2,
            14.7},{-106,14.7},{-106,28}}, color={255,0,255}));
    connect(TSource, energyPump.TSourceHX) annotation (Line(points={{-106,-40},
            {-84,-40},{-84,-11.4},{-60.4,-11.4}}, color={0,0,127}));
      annotation (Placement(transformation(extent={{-82,66},{-62,86}})),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}})),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
           graphics={
          Polygon(
            points={{-52,100},{-32,100},{-32,80},{28,80},{28,-80},{-2,-80},{-2,
                -72},{-12,-80},{-22,-72},{-22,-80},{-52,-80},{-52,100}},
            smooth=Smooth.None,
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(
            points={{78,70},{78,50}},
            color={0,0,127},
            smooth=Smooth.None),
          Line(
            points={{96,60},{80,60}},
            color={0,0,127},
            smooth=Smooth.None),
          Line(
            points={{96,-60},{80,-60}},
            color={0,0,127},
            smooth=Smooth.None),
          Line(
            points={{78,-50},{78,-70}},
            color={0,0,127},
            smooth=Smooth.None),
          Ellipse(extent={{-82,50},{-22,-10}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-100,20},{-70,20},{-42,32},{-62,8},{-34,20},{-22,20}},
            color={0,127,255},
            smooth=Smooth.None),
          Ellipse(extent={{-2,-10},{58,-70}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-2,-40},{10,-40},{38,-28},{18,-52},{40,-44},{40,-60}},
            color={0,0,127},
            smooth=Smooth.None),
          Line(
            points={{80,-50},{80,-70}},
            color={0,0,127},
            smooth=Smooth.None),
          Line(
            points={{80,70},{80,50}},
            color={0,0,127},
            smooth=Smooth.None),
          Line(
            points={{-22,20},{-12,20},{-32,-40},{-100,-40}},
            color={0,127,255},
            smooth=Smooth.None),
          Line(
            points={{-2,-40},{-12,-40},{20,60},{78,60}},
            color={0,0,127},
            smooth=Smooth.None),
          Line(
            points={{-22,-72},{-22,-88},{-2,-72},{-2,-88},{-22,-72}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            points={{-52,-10},{-52,-80},{-22,-80}},
            smooth=Smooth.None,
            color={0,0,0}),
          Line(
            points={{-2,-80},{28,-80},{28,-70}},
            smooth=Smooth.None,
            color={0,0,0}),
          Line(
            points={{-52,50},{-52,100},{-32,100}},
            smooth=Smooth.None,
            color={0,0,0}),
          Line(
            points={{28,-10},{28,80},{8,80}},
            smooth=Smooth.None,
            color={0,0,0}),
          Polygon(
            points={{-22,120},{-2,120},{6,118},{8,110},{8,70},{6,62},{-2,60},{-22,
                60},{-30,62},{-32,70},{-32,110},{-30,118},{-22,120}},
            smooth=Smooth.None,
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{12,100},{8,110}},
            lineColor={95,95,95},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Line(
            points={{40,-60},{78,-60}},
            color={0,0,127},
            smooth=Smooth.None),
          Line(
            points={{-80,20},{-160,20},{-160,0},{-100,0},{-100,-20},{-160,-20},{
                -160,-40},{-80,-40}},
            color={0,127,255},
            smooth=Smooth.None),
          Line(
            points={{-152,30},{-152,-52}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            points={{-142,30},{-142,-52}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            points={{-132,30},{-132,-52}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            points={{-122,30},{-122,-52}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            points={{-112,30},{-112,-52}},
            color={0,0,0},
            smooth=Smooth.None)}),
      Documentation(info="<html>
<h4>Description </h4>
<p>Dynamic heat pump model, based on interpolation in performance tables for a Daikin Altherma heat pump. These tables are encoded in the <a href=\"modelica://IDEAS.Thermal.Components.Production.BaseClasses.HeatSource_HP_AW\">energyPump</a> model. If a different heat pump is to be simulated, create a different energyPump model with adapted interpolation tables.</p>
<p>The nominal power of the heat pump can be adapted, this will NOT influence the efficiency as a function of ambient air temperature, condenser temperature and modulation level. </p>
<p>The heat pump has thermal losses to the environment which are often not mentioned in the performance tables. Therefore, the additional environmental heat losses are added to the heat production in order to ensure the same performance as in the manufacturers data, while still obtaining a dynamic model with heat losses (also when heat pump is off). The energyPump will compute the required power and the environmental heat losses, and try to reach the set point. </p>
<p>See<a href=\"modelica://IDEAS.Thermal.Components.Production.Interfaces.PartialDynamicHeaterWithLosses\"> IDEAS.Thermal.Components.Production.Interfaces.PartialDynamicHeaterWithLosses</a> for more details about the heat losses and dynamics. </p>
<h4>Assumptions and limitations </h4>
<ol>
<li>Dynamic model based on water content and lumped dry capacity</li>
<li>Inverter controlled heat pump with limited power (based on QNom and interpolation tables in energyPump) </li>
<li>Heat losses to environment which are compensated &apos;artifically&apos; to meet the manufacturers data in steady state conditions</li>
<li>No defrosting taken into account</li>
<li>No enforced min on or min off time; Hysteresis on start/stop thanks to different parameters for minimum modulation to start and stop the heat pump</li>
</ol>
<h4>Model use</h4>
<p>This model is based on performance tables of a specific heat pump, as specified by the <a href=\"modelica://IDEAS.Thermal.Components.Production.BaseClasses.HeatSource_HP_AW\">energyPump</a> model. If a different heat pump is to be simulated, create a different energyPump model with adapted interpolation tables.</p>
<ol>
<li>Specify medium and initial temperature (of the water + dry mass)</li>
<li>Specify the nominal power QNom. There are two options: (1) specify QNom and put QDesign = 0 or (2) specify QDesign greater than 0 and QNom wil be calculated from QDesign as follows:</li>
<li>QNom = QDesign * betaFactor / fraLosDesNom</li>
<li>Connect TSet, the flowPorts and the heatPort to environment. </li>
<li>Specify the minimum required modulation level for the boiler to start (modulation_start) and the minimum modulation level when the boiler is operating (modulation_min). The difference between both will ensure some off-time in case of low heat demands</li>
</ol>
<p>See also<a href=\"modelica://IDEAS.Thermal.Components.Production.Interfaces.PartialDynamicHeaterWithLosses\"> IDEAS.Thermal.Components.Production.Interfaces.PartialDynamicHeaterWithLosses</a> for more details about the heat losses and dynamics. </p>
<h4>Validation </h4>
<p>The model has been verified in order to check if the &apos;artificial&apos; heat loss compensation still leads to correct steady state efficiencies according to the manufacturer data. This verification is integrated in the example model <a href=\"modelica://IDEAS.Thermal.Components.Examples.Boiler_validation\">IDEAS.Thermal.Components.Examples.Boiler_validation</a>.</p>
<h4>Example</h4>
<p>A specific heat pump example is given in <a href=\"modelica://IDEAS.Thermal.Components.Examples.HeatPump_AirWater\">IDEAS.Thermal.Components.Examples.HeatPump_AirWater</a>.</p>
</html>",   revisions="<html>
<ul>
<li>
June 5, 2018 by Filip Jorissen:<br/>
Cleaned up implementation for
<a href=\"https://github.com/open-ideas/IDEAS/issues/821\">#821</a>.
</li>
<li>2014 March, Filip Jorissen, Annex60 compatibility</li>
<li>2013 May, Roel De Coninck: propagation of energyPump parameters and better definition of QNom used.  Documentation and example added</li>
<li>2011 Roel De Coninck: first version</li>
</ul>
</html>"));
  end BlackBox_Generic_TSetpoint;

  package Data "Contains data for heat pump models"
    package BlackBox_Generic_TSetpoint "Contains data for the BlackBox_Generic_TSetpoint heat pump model"
      model Aermec_ANKI045_60HZ_Cooling
        "Aermec ANKI045 60HZ Cooling data provided by Aermec"
        /*
  This model is based on data we received from AERMEC ANKI045H heat pump.
  The nominal power of the original heat pump is PNom_data 3.4133kW at 6/35degC
  The nominal heat duty of the ANKI045H heat pump is 10.5kW at 6/35degC
   
  First, the thermal power and electricity consumption are interpolated for the 
  evaporator and condensing temperature at 6 different modulation levels.  The results
  are rescaled to the nominal power of the modelled heatpump (with QNom/QNom_data) and
  stored in 2 different vectors, Q_vector and P_vector.
  
  Finally, the modulation is calculated based on the asked Q_load and the Q_max at 
  operating conditions: 
  - if modulation_init < modulation_min, the heat pump is OFF, modulation = 0.  
  - if modulation_init > 100%, the modulation is 100%
  - if modulation_init between modulation_min and modulation_start: hysteresis for on/off cycling.
  
  If the heat pump is on another modulation, interpolation is made to get P and Q at the real modulation.
  
  ATTENTION
  This model takes into account environmental heat losses of the heat pump (at condensor side).
  In order to keep the same nominal COP's during operation of the heat pump, these heat losses are added
  to the Q_load.  
  
  The COP is calculated as the Q_load divided by the electrical consumption (P). 
  
  */
        //protected
        replaceable package Medium =
            Modelica.Media.Interfaces.PartialMedium "Medium in the component";
        final parameter Modelica.SIunits.Power QNomRef=10590
          "SC: Nominal Q_load of the ANKI045 in cooling mode at 36degC/7degC.  See datafile";
        final parameter Real[6] mod_vector={0,15.7,23.8,36.3,64.6,100} " SC:  modulation steps in AERMEC ANKI045 cooling mode, %";
        Real[6] Q_vector "Heat duty for 5 modulation steps, in kW";
        Real[6] P_vector "Electrical power for 5 modulation steps, in kW";
        Modelica.SIunits.Power QMax
          "Maximum heat duty at specified evap and condr temperatures, in W";
        Modelica.SIunits.Power QAsked(start=0);
        parameter Modelica.SIunits.ThermalConductance UALoss
          "UA of heat losses of HP to environment, SC: future_edit: Check the amount of losses and edit later";
        parameter Modelica.SIunits.Power QNomLoad
          "The power of another heat pump at nominal conditions (36/7) to scale the curent results";
      public
        parameter Real modulation_min(max=29) = 16 "Minimal modulation percentage u_low, that the heat pump can really perform";
        // dont' set this to 0 or very low values, you might get negative P at very low modulations because of wrong extrapolation
        // Included approximation of running the HP at lower than minimum load.
        parameter Real modulation_start(min=min(30, modulation_min + 5)) = 25
          "Min estimated modulation level required for start of HP- U_high";
        // This refers to actual minimum of the compressor speed for startup
        Real modulationInit "SC: the initial % modulation required to change the temperature of water";
        Real modulation(min=0, max=100) "Current modulation percentage , decides on start/stop of the HP, controls the heat pump to 100%";
        Modelica.SIunits.Power PEl "Resulting electrical power";
        //SC: Made T_source an input with modelica block
        input Modelica.SIunits.Temperature TEnvironment
          "Temperature of environment for heat losses coming from heat port at the higher level";
        input Modelica.SIunits.SpecificEnthalpy hIn "Specific enthalpy at the inlet";
        // SC: future_edit: have to change it calculate the specific enthalpy at the the inlet with T at the inlet
        Modelica.Blocks.Tables.CombiTable2D P100(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
              28,30,32,34,36,38,40; 2,0.996,1.101,1.207,1.312,1.418,1.523,1.628,1.734,
              1.839,1.945,2.05,2.156,2.261,2.366,2.472,2.577,2.683,2.788,2.894,2.999,3.104,
              3.21,3.315,3.421,3.526,3.632,3.737,3.842,3.948,4.053,4.159; 5,1.027,1.136,
              1.244,1.353,1.462,1.57,1.679,1.788,1.896,2.005,2.113,2.222,2.331,2.439,2.548,
              2.657,2.765,2.874,2.983,3.091,3.2,3.309,3.417,3.526,3.635,3.743,3.852,3.961,
              4.069,4.178,4.287; 7,1.048,1.158,1.269,1.38,1.491,1.602,1.712,1.823,1.934,
              2.045,2.156,2.267,2.377,2.488,2.599,2.71,2.821,2.931,3.042,3.153,3.264,3.375,
              3.486,3.596,3.707,3.818,3.929,4.04,4.15,4.261,4.372; 10,1.079,1.193,1.307,
              1.421,1.535,1.649,1.763,1.877,1.991,2.105,2.219,2.333,2.447,2.561,2.675,
              2.789,2.903,3.017,3.131,3.246,3.36,3.474,3.588,3.702,3.816,3.93,4.044,4.158,
              4.272,4.386,4.5; 15,1.13,1.25,1.369,1.488,1.608,1.727,1.847,1.966,2.086,
              2.205,2.325,2.444,2.563,2.683,2.802,2.922,3.041,3.161,3.28,3.4,3.519,3.638,
              3.758,3.877,3.997,4.116,4.236,4.355,4.475,4.594,4.713; 35,1.337,1.478,1.619,
              1.76,1.901,2.042,2.183,2.324,2.465,2.606,2.747,2.888,3.029,3.17,3.311,3.452,
              3.593,3.734,3.875,4.016,4.157,4.298,4.439,4.58,4.721,4.862,5.003,5.144,5.285,
              5.426,5.567])
          annotation (Placement(transformation(extent={{8,6},{28,26}})));
        Modelica.Blocks.Tables.CombiTable2D P65(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
              28,30,32,34,36,38,40; 2,0.587,0.649,0.711,0.774,0.836,0.898,0.96,1.022,1.084,
              1.147,1.209,1.271,1.333,1.395,1.457,1.519,1.582,1.644,1.706,1.768,1.83,1.892,
              1.955,2.017,2.079,2.141,2.203,2.265,2.327,2.39,2.452; 5,0.605,0.669,0.734,
              0.798,0.862,0.926,0.99,1.054,1.118,1.182,1.246,1.31,1.374,1.438,1.502,1.566,
              1.63,1.694,1.759,1.823,1.887,1.951,2.015,2.079,2.143,2.207,2.271,2.335,2.399,
              2.463,2.527; 7,0.618,0.683,0.748,0.814,0.879,0.944,1.01,1.075,1.14,1.206,
              1.271,1.336,1.402,1.467,1.532,1.598,1.663,1.728,1.794,1.859,1.924,1.99,2.055,
              2.12,2.186,2.251,2.316,2.382,2.447,2.512,2.578; 10,0.636,0.703,0.77,0.838,
              0.905,0.972,1.039,1.107,1.174,1.241,1.308,1.375,1.443,1.51,1.577,1.644,1.712,
              1.779,1.846,1.913,1.981,2.048,2.115,2.182,2.25,2.317,2.384,2.451,2.519,2.586,
              2.653; 15,0.666,0.737,0.807,0.878,0.948,1.018,1.089,1.159,1.23,1.3,1.37,
              1.441,1.511,1.582,1.652,1.723,1.793,1.863,1.934,2.004,2.075,2.145,2.216,
              2.286,2.356,2.427,2.497,2.568,2.638,2.708,2.779; 35,0.788,0.871,0.954,1.038,
              1.121,1.204,1.287,1.37,1.453,1.536,1.62,1.703,1.786,1.869,1.952,2.035,2.118,
              2.202,2.285,2.368,2.451,2.534,2.617,2.7,2.783,2.867,2.95,3.033,3.116,3.199,
              3.282])
          annotation (Placement(transformation(extent={{8,-20},{28,0}})));
        Modelica.Blocks.Tables.CombiTable2D P36(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
              28,30,32,34,36,38,40; 2,0.312,0.344,0.377,0.41,0.443,0.476,0.509,0.542,0.575,
              0.608,0.641,0.674,0.707,0.74,0.773,0.806,0.839,0.872,0.905,0.938,0.971,1.004,
              1.037,1.07,1.103,1.136,1.169,1.202,1.235,1.268,1.301; 5,0.321,0.355,0.389,
              0.423,0.457,0.491,0.525,0.559,0.593,0.627,0.661,0.695,0.729,0.763,0.797,
              0.831,0.865,0.899,0.933,0.967,1.001,1.035,1.069,1.103,1.137,1.171,1.205,
              1.239,1.273,1.307,1.341; 7,0.328,0.362,0.397,0.432,0.466,0.501,0.536,0.57,
              0.605,0.64,0.674,0.709,0.744,0.778,0.813,0.848,0.882,0.917,0.952,0.986,1.021,
              1.056,1.09,1.125,1.16,1.194,1.229,1.264,1.298,1.333,1.368; 10,0.337,0.373,
              0.409,0.444,0.48,0.516,0.551,0.587,0.623,0.658,0.694,0.73,0.765,0.801,0.837,
              0.872,0.908,0.944,0.979,1.015,1.051,1.087,1.122,1.158,1.194,1.229,1.265,
              1.301,1.336,1.372,1.408; 15,0.354,0.391,0.428,0.466,0.503,0.54,0.578,0.615,
              0.652,0.69,0.727,0.764,0.802,0.839,0.877,0.914,0.951,0.989,1.026,1.063,1.101,
              1.138,1.175,1.213,1.25,1.288,1.325,1.362,1.4,1.437,1.474; 35,0.418,0.462,
              0.506,0.551,0.595,0.639,0.683,0.727,0.771,0.815,0.859,0.903,0.947,0.992,
              1.036,1.08,1.124,1.168,1.212,1.256,1.3,1.344,1.389,1.433,1.477,1.521,1.565,
              1.609,1.653,1.697,1.741])
          annotation (Placement(transformation(extent={{8,-46},{28,-26}})));
        Modelica.Blocks.Tables.CombiTable2D P24(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
              28,30,32,34,36,38,40; 2,0.202,0.224,0.245,0.267,0.288,0.31,0.331,0.352,0.374,
              0.395,0.417,0.438,0.46,0.481,0.502,0.524,0.545,0.567,0.588,0.61,0.631,0.653,
              0.674,0.695,0.717,0.738,0.76,0.781,0.803,0.824,0.845; 5,0.209,0.231,0.253,
              0.275,0.297,0.319,0.341,0.363,0.385,0.408,0.43,0.452,0.474,0.496,0.518,0.54,
              0.562,0.584,0.606,0.628,0.651,0.673,0.695,0.717,0.739,0.761,0.783,0.805,
              0.827,0.849,0.871; 7,0.213,0.235,0.258,0.281,0.303,0.326,0.348,0.371,0.393,
              0.416,0.438,0.461,0.483,0.506,0.528,0.551,0.573,0.596,0.618,0.641,0.663,
              0.686,0.709,0.731,0.754,0.776,0.799,0.821,0.844,0.866,0.889; 10,0.219,0.242,
              0.266,0.289,0.312,0.335,0.358,0.382,0.405,0.428,0.451,0.474,0.497,0.521,
              0.544,0.567,0.59,0.613,0.637,0.66,0.683,0.706,0.729,0.752,0.776,0.799,0.822,
              0.845,0.868,0.892,0.915; 15,0.23,0.254,0.278,0.303,0.327,0.351,0.375,0.4,
              0.424,0.448,0.473,0.497,0.521,0.545,0.57,0.594,0.618,0.643,0.667,0.691,0.715,
              0.74,0.764,0.788,0.812,0.837,0.861,0.885,0.91,0.934,0.958; 35,0.272,0.3,
              0.329,0.358,0.386,0.415,0.444,0.472,0.501,0.53,0.558,0.587,0.616,0.644,0.673,
              0.702,0.73,0.759,0.788,0.816,0.845,0.874,0.902,0.931,0.96,0.988,1.017,1.046,
              1.074,1.103,1.132]) "Lowest compressor speed"
          annotation (Placement(transformation(extent={{8,-72},{28,-52}})));
        Modelica.Blocks.Tables.CombiTable2D Q100(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
              28,30,32,34,36,38,40; 2,19.135,18.763,18.39,18.018,17.645,17.273,16.901,
              16.528,16.156,15.783,15.411,15.038,14.666,14.294,13.921,13.549,13.176,12.804,
              12.431,12.059,11.687,11.314,10.942,10.569,10.197,9.824,9.452,9.08,8.707,
              8.335,7.962; 5,21.623,21.202,20.781,20.36,19.939,19.518,19.097,18.677,18.256,
              17.835,17.414,16.993,16.572,16.151,15.73,15.309,14.888,14.467,14.046,13.625,
              13.204,12.784,12.363,11.942,11.521,11.1,10.679,10.258,9.837,9.416,8.995;
              7,23.282,22.828,22.375,21.922,21.469,21.015,20.562,20.109,19.656,19.202,
              18.749,18.296,17.843,17.389,16.936,16.483,16.029,15.576,15.123,14.67,14.216,
              13.763,13.31,12.857,12.403,11.95,11.497,11.044,10.59,10.137,9.684; 10,25.77,
              25.268,24.766,24.264,23.763,23.261,22.759,22.257,21.755,21.254,20.752,20.25,
              19.748,19.247,18.745,18.243,17.741,17.24,16.738,16.236,15.734,15.233,14.731,
              14.229,13.727,13.226,12.724,12.222,11.72,11.219,10.717; 15,29.916,29.333,
              28.751,28.168,27.586,27.003,26.42,25.838,25.255,24.673,24.09,23.508,22.925,
              22.342,21.76,21.177,20.595,20.012,19.429,18.847,18.264,17.682,17.099,16.516,
              15.934,15.351,14.769,14.186,13.604,13.021,12.438; 35,46.502,45.596,44.69,
              43.784,42.878,41.972,41.066,40.16,39.254,38.348,37.443,36.537,35.631,34.725,
              33.819,32.913,32.007,31.101,30.195,29.289,28.383,27.478,26.572,25.666,24.76,
              23.854,22.948,22.042,21.136,20.23,19.324])
          annotation (Placement(transformation(extent={{46,6},{66,26}})));
        Modelica.Blocks.Tables.CombiTable2D Q65(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
              28,30,32,34,36,38,40; 2,12.353,12.113,11.872,11.632,11.391,11.151,10.91,
              10.67,10.43,10.189,9.949,9.708,9.468,9.227,8.987,8.747,8.506,8.266,8.025,
              7.785,7.544,7.304,7.064,6.823,6.583,6.342,6.102,5.861,5.621,5.381,5.14;
              5,13.959,13.687,13.416,13.144,12.872,12.6,12.329,12.057,11.785,11.513,11.242,
              10.97,10.698,10.427,10.155,9.883,9.611,9.34,9.068,8.796,8.524,8.253,7.981,
              7.709,7.437,7.166,6.894,6.622,6.35,6.079,5.807; 7,15.03,14.737,14.445,14.152,
              13.859,13.567,13.274,12.982,12.689,12.396,12.104,11.811,11.519,11.226,10.933,
              10.641,10.348,10.055,9.763,9.47,9.178,8.885,8.592,8.3,8.007,7.715,7.422,
              7.129,6.837,6.544,6.252; 10,16.636,16.312,15.988,15.664,15.34,15.016,14.692,
              14.369,14.045,13.721,13.397,13.073,12.749,12.425,12.101,11.777,11.453,11.129,
              10.805,10.482,10.158,9.834,9.51,9.186,8.862,8.538,8.214,7.89,7.566,7.242,
              6.918; 15,19.313,18.937,18.561,18.184,17.808,17.432,17.056,16.68,16.304,
              15.928,15.552,15.176,14.8,14.423,14.047,13.671,13.295,12.919,12.543,12.167,
              11.791,11.415,11.039,10.662,10.286,9.91,9.534,9.158,8.782,8.406,8.03; 35,
              30.02,29.435,28.85,28.265,27.681,27.096,26.511,25.926,25.341,24.756,24.172,
              23.587,23.002,22.417,21.832,21.248,20.663,20.078,19.493,18.908,18.323,17.739,
              17.154,16.569,15.984,15.399,14.814,14.23,13.645,13.06,12.475])
          annotation (Placement(transformation(extent={{46,-20},{66,0}})));
        Modelica.Blocks.Tables.CombiTable2D Q36(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
              28,30,32,34,36,38,40; 2,6.947,6.811,6.676,6.541,6.406,6.271,6.135,6,5.865,
              5.73,5.595,5.459,5.324,5.189,5.054,4.919,4.783,4.648,4.513,4.378,4.243,4.107,
              3.972,3.837,3.702,3.567,3.431,3.296,3.161,3.026,2.891; 5,7.85,7.697,7.544,
              7.391,7.239,7.086,6.933,6.78,6.627,6.475,6.322,6.169,6.016,5.863,5.711,5.558,
              5.405,5.252,5.099,4.946,4.794,4.641,4.488,4.335,4.182,4.03,3.877,3.724,3.571,
              3.418,3.266; 7,8.452,8.287,8.123,7.958,7.794,7.629,7.465,7.3,7.136,6.971,
              6.806,6.642,6.477,6.313,6.148,5.984,5.819,5.655,5.49,5.326,5.161,4.996,4.832,
              4.667,4.503,4.338,4.174,4.009,3.845,3.68,3.516; 10,9.355,9.173,8.991,8.809,
              8.627,8.444,8.262,8.08,7.898,7.716,7.534,7.351,7.169,6.987,6.805,6.623,6.441,
              6.259,6.076,5.894,5.712,5.53,5.348,5.166,4.983,4.801,4.619,4.437,4.255,4.073,
              3.891; 15,10.86,10.649,10.437,10.226,10.014,9.803,9.591,9.38,9.168,8.957,
              8.745,8.534,8.322,8.111,7.899,7.688,7.476,7.265,7.053,6.842,6.63,6.419,6.207,
              5.996,5.785,5.573,5.362,5.15,4.939,4.727,4.516; 35,16.882,16.553,16.224,
              15.895,15.566,15.237,14.908,14.579,14.251,13.922,13.593,13.264,12.935,12.606,
              12.277,11.948,11.62,11.291,10.962,10.633,10.304,9.975,9.646,9.317,8.989,
              8.66,8.331,8.002,7.673,7.344,7.015])
          annotation (Placement(transformation(extent={{46,-46},{66,-26}})));
        Modelica.Blocks.Tables.CombiTable2D Q24(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
              28,30,32,34,36,38,40; 2,4.563,4.474,4.385,4.297,4.208,4.119,4.03,3.941,3.852,
              3.764,3.675,3.586,3.497,3.408,3.32,3.231,3.142,3.053,2.964,2.876,2.787,2.698,
              2.609,2.52,2.432,2.343,2.254,2.165,2.076,1.987,1.899; 5,5.156,5.056,4.955,
              4.855,4.755,4.654,4.554,4.454,4.353,4.253,4.152,4.052,3.952,3.851,3.751,
              3.651,3.55,3.45,3.349,3.249,3.149,3.048,2.948,2.848,2.747,2.647,2.546,2.446,
              2.346,2.245,2.145; 7,5.552,5.444,5.336,5.227,5.119,5.011,4.903,4.795,4.687,
              4.579,4.471,4.363,4.255,4.147,4.039,3.93,3.822,3.714,3.606,3.498,3.39,3.282,
              3.174,3.066,2.958,2.85,2.742,2.633,2.525,2.417,2.309; 10,6.145,6.025,5.906,
              5.786,5.666,5.547,5.427,5.307,5.188,5.068,4.949,4.829,4.709,4.59,4.47,4.35,
              4.231,4.111,3.991,3.872,3.752,3.632,3.513,3.393,3.273,3.154,3.034,2.914,
              2.795,2.675,2.556; 15,7.134,6.995,6.856,6.717,6.578,6.439,6.3,6.161,6.022,
              5.883,5.745,5.606,5.467,5.328,5.189,5.05,4.911,4.772,4.633,4.494,4.355,4.216,
              4.077,3.939,3.8,3.661,3.522,3.383,3.244,3.105,2.966; 35,11.089,10.873,10.657,
              10.441,10.225,10.009,9.793,9.577,9.361,9.145,8.929,8.713,8.497,8.28,8.064,
              7.848,7.632,7.416,7.2,6.984,6.768,6.552,6.336,6.12,5.904,5.688,5.472,5.256,
              5.04,4.824,4.608]) "lowest compressor speed"
          annotation (Placement(transformation(extent={{46,-72},{66,-52}})));

        Modelica.SIunits.HeatFlowRate QLossesToCompensate "Environment losses";
        Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a loadPort
          "heatPort connection to water in load side HX"
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        IDEAS.Controls.Discrete.HysteresisRelease_boolean onOff(
          enableRelease=true,
          y(start=0),
          release(start=false))
          annotation (Placement(transformation(extent={{10,70},{30,90}})));
        Modelica.Blocks.Sources.RealExpression realExpression(y=modulationInit)
          annotation (Placement(transformation(extent={{-86,78},{-8,98}})));
        Modelica.Blocks.Sources.RealExpression realExpression1(y=modulation_start)
          annotation (Placement(transformation(extent={{-96,68},{-48,88}})));
        Modelica.Blocks.Sources.RealExpression realExpression2(y=modulation_min)
          annotation (Placement(transformation(extent={{-116,52},{-66,70}})));
        Modelica.Blocks.Interfaces.RealInput TSetpoint annotation (Placement(
              transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-110,
                  -10},{-90,10}})));
        Modelica.Blocks.Interfaces.BooleanInput on annotation (Placement(
              transformation(extent={{-120,20},{-80,60}}), iconTransformation(extent={{-112,64},
                  {-92,84}})));
        Modelica.Blocks.Interfaces.RealInput TLoadHX_in
          "Inlet temperature of the load Heat exchanger" annotation (Placement(transformation(
                extent={{-120,-60},{-80,-20}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={64,-98})));
              //SC: Future_edit: not getting used now, have to use to calculate the enthalpy
        Modelica.Blocks.Interfaces.RealInput m_flowLoadHX
          "mass-flow rate of water on the load side of the airwater heat-pump" annotation (Placement(transformation(
                extent={{-120,-100},{-80,-60}}),iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-62,-100})));
        Modelica.Blocks.Interfaces.RealInput TSourceHX annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-34,-78}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-104,-54})));

        Modelica.Blocks.Tables.CombiTable2D P16(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
            table=[0,-20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,
              24,26,28,30,32,34,36,38,40; 2,0.141,0.155,0.17,0.185,0.2,0.215,0.23,0.245,
              0.259,0.274,0.289,0.304,0.319,0.334,0.349,0.364,0.378,0.393,0.408,0.423,
              0.438,0.453,0.468,0.483,0.497,0.512,0.527,0.542,0.557,0.572,0.587; 5,0.145,
              0.16,0.176,0.191,0.206,0.222,0.237,0.252,0.268,0.283,0.298,0.313,0.329,0.344,
              0.359,0.375,0.39,0.405,0.421,0.436,0.451,0.467,0.482,0.497,0.513,0.528,0.543,
              0.559,0.574,0.589,0.605; 7,0.148,0.163,0.179,0.195,0.21,0.226,0.242,0.257,
              0.273,0.288,0.304,0.32,0.335,0.351,0.367,0.382,0.398,0.414,0.429,0.445,0.46,
              0.476,0.492,0.507,0.523,0.539,0.554,0.57,0.586,0.601,0.617; 10,0.152,0.168,
              0.184,0.2,0.217,0.233,0.249,0.265,0.281,0.297,0.313,0.329,0.345,0.361,0.377,
              0.394,0.41,0.426,0.442,0.458,0.474,0.49,0.506,0.522,0.538,0.554,0.571,0.587,
              0.603,0.619,0.635; 15,0.159,0.176,0.193,0.21,0.227,0.244,0.261,0.277,0.294,
              0.311,0.328,0.345,0.362,0.379,0.395,0.412,0.429,0.446,0.463,0.48,0.496,0.513,
              0.53,0.547,0.564,0.581,0.598,0.614,0.631,0.648,0.665; 35,0.189,0.209,0.228,
              0.248,0.268,0.288,0.308,0.328,0.348,0.368,0.388,0.407,0.427,0.447,0.467,
              0.487,0.507,0.527,0.547,0.567,0.586,0.606,0.626,0.646,0.666,0.686,0.706,
              0.726,0.746,0.766,0.785])
          "Approximating lower than minimum load cycling"
          annotation (Placement(transformation(extent={{10,-98},{30,-78}})));
        Modelica.Blocks.Tables.CombiTable2D Q16(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
            table=[0,-20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,
              24,26,28,30,32,34,36,38,40; 2,4.563,4.474,4.385,4.297,4.208,4.119,4.03,3.941,
              3.852,3.764,3.675,3.586,3.497,3.408,3.32,3.231,3.142,3.053,2.964,2.876,2.787,
              2.698,2.609,2.52,2.432,2.343,2.254,2.165,2.076,1.987,1.899; 5,5.156,5.056,
              4.955,4.855,4.755,4.654,4.554,4.454,4.353,4.253,4.152,4.052,3.952,3.851,
              3.751,3.651,3.55,3.45,3.349,3.249,3.149,3.048,2.948,2.848,2.747,2.647,2.546,
              2.446,2.346,2.245,2.145; 7,5.552,5.444,5.336,5.227,5.119,5.011,4.903,4.795,
              4.687,4.579,4.471,4.363,4.255,4.147,4.039,3.93,3.822,3.714,3.606,3.498,3.39,
              3.282,3.174,3.066,2.958,2.85,2.742,2.633,2.525,2.417,2.309; 10,6.145,6.025,
              5.906,5.786,5.666,5.547,5.427,5.307,5.188,5.068,4.949,4.829,4.709,4.59,4.47,
              4.35,4.231,4.111,3.991,3.872,3.752,3.632,3.513,3.393,3.273,3.154,3.034,2.914,
              2.795,2.675,2.556; 15,7.134,6.995,6.856,6.717,6.578,6.439,6.3,6.161,6.022,
              5.883,5.745,5.606,5.467,5.328,5.189,5.05,4.911,4.772,4.633,4.494,4.355,4.216,
              4.077,3.939,3.8,3.661,3.522,3.383,3.244,3.105,2.966; 35,11.089,10.873,10.657,
              10.441,10.225,10.009,9.793,9.577,9.361,9.145,8.929,8.713,8.497,8.28,8.064,
              7.848,7.632,7.416,7.2,6.984,6.768,6.552,6.336,6.12,5.904,5.688,5.472,5.256,
              5.04,4.824,4.608]) "Approximating lower than minimum load cycling"
          annotation (Placement(transformation(extent={{44,-98},{64,-78}})));
      equation
        QAsked = IDEAS.Utilities.Math.Functions.smoothMax(
        0, m_flowLoadHX*(hIn-Medium.specificEnthalpy(Medium.setState_pTX(Medium.p_default,TSetpoint, Medium.X_default))), 10)
        " heat required to bring the inlet mass of water to T_set point";

        P100.u1 = loadPort.T - 273.15;
        P100.u2 = TSourceHX - 273.15;
        P65.u1 = loadPort.T - 273.15;
        P65.u2 = TSourceHX - 273.15;
        P36.u1 = loadPort.T - 273.15;
        P36.u2 = TSourceHX - 273.15;
        P24.u1 = loadPort.T - 273.15;
        P24.u2 = TSourceHX - 273.15;
        P16.u1 = loadPort.T - 273.15;//quantifying lower load cycling
        P16.u2 = TSourceHX - 273.15;//quantifying lower load cycling

        Q100.u1 = loadPort.T - 273.15;
        Q100.u2 = TSourceHX - 273.15;
        Q65.u1 = loadPort.T - 273.15;
        Q65.u2 = TSourceHX - 273.15;
        Q36.u1 = loadPort.T - 273.15;
        Q36.u2 = TSourceHX - 273.15;
        Q24.u1 = loadPort.T - 273.15;
        Q24.u2 = TSourceHX - 273.15;
        Q16.u1 = loadPort.T - 273.15;//quantifying lower load cycling
        Q16.u2 = TSourceHX - 273.15;//quantifying lower load cycling

        // all these are in kW
        Q_vector[1] = 0;
        Q_vector[2] =Q16.y *QNomLoad/QNomRef; //quantifying lower load cycling
        Q_vector[3] =Q24.y *QNomLoad/QNomRef;
        Q_vector[4] =Q36.y *QNomLoad/QNomRef;
        Q_vector[5] =Q65.y *QNomLoad/QNomRef;
        Q_vector[6] =Q100.y*QNomLoad/QNomRef;

        P_vector[1] = 0;
        P_vector[2] =P16.y *QNomLoad/QNomRef; //quantifying lower load cycling
        P_vector[3] =P24.y *QNomLoad/QNomRef;
        P_vector[4] =P36.y *QNomLoad/QNomRef;
        P_vector[5] =P65.y *QNomLoad/QNomRef;
        P_vector[6] = P100.y*QNomLoad/QNomRef;
        QMax = 1000*Q100.y*QNomLoad/QNomRef "coverted to W";
        modulationInit = QAsked/QMax*100;
        modulation = onOff.y*IDEAS.Utilities.Math.Functions.smoothMin(modulationInit, 100,1);
        // compensation of heat losses (only when the hp is operating)
        QLossesToCompensate = if noEvent(modulation > 0) then UALoss*(loadPort.T -
          TEnvironment) else 0;
        loadPort.Q_flow = 1000*Modelica.Math.Vectors.interpolate(
          mod_vector,
          Q_vector,
          modulation) - QLossesToCompensate;
        PEl = 1000*Modelica.Math.Vectors.interpolate(
          mod_vector,
          P_vector,
          modulation);
        connect(realExpression.y, onOff.u) annotation (Line(
            points={{-4.1,88},{4,88},{4,80},{8,80}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(realExpression1.y, onOff.uHigh) annotation (Line(
            points={{-45.6,78},{0,78},{0,76},{8,76}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(realExpression2.y, onOff.uLow) annotation (Line(
            points={{-63.5,61},{-24,61},{-24,64},{0,64},{0,72},{8,72}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(on, onOff.release) annotation (Line(
            points={{-100,40},{20,40},{20,68}},
            color={255,0,255},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}})),  Documentation(info="<html>
<p><b>Description</b> </p>
<p>This&nbsp;model&nbsp;is&nbsp;based&nbsp;on&nbsp;data&nbsp;received&nbsp;from&nbsp;Daikin&nbsp;from&nbsp;an&nbsp;Altherma&nbsp;heat&nbsp;pump, and the full heat pump is implemented as <a href=\"modelica://IDEAS.Thermal.Components.Production.HP_AWMod_Losses\">IDEAS.Thermal.Components.Production.HP_AWMod_Losses</a>. (vermoedelijk <a href=\"Modelica://IDEAS.Thermal.Components.Production.HP_AirWater\">IDEAS.Thermal.Components.Production.HP_AirWater</a></p>
<p>The&nbsp;nominal&nbsp;power&nbsp;of&nbsp;the&nbsp;original&nbsp;heat&nbsp;pump&nbsp;is&nbsp;7177 W&nbsp;at&nbsp;2/35 degC.</p>
<p>First,&nbsp;the&nbsp;thermal&nbsp;power&nbsp;and&nbsp;electricity&nbsp;consumption&nbsp;are&nbsp;interpolated&nbsp;for&nbsp;the&nbsp;evaporator&nbsp;and&nbsp;condensing&nbsp;temperature&nbsp;at&nbsp;4&nbsp;different&nbsp;modulation&nbsp;levels.&nbsp;&nbsp;The&nbsp;results&nbsp;are&nbsp;rescaled&nbsp;to&nbsp;the&nbsp;nominal&nbsp;power&nbsp;of&nbsp;the&nbsp;modelled&nbsp;heatpump&nbsp;(with&nbsp;QNomLoad/QNom_data)&nbsp;and&nbsp;stored&nbsp;in&nbsp;2&nbsp;different&nbsp;vectors,&nbsp;Q_vector&nbsp;and&nbsp;P_vector.</p>
<p>Finally,&nbsp;the&nbsp;modulation&nbsp;is&nbsp;calculated&nbsp;based&nbsp;on&nbsp;the&nbsp;asked&nbsp;power&nbsp;and&nbsp;the&nbsp;max&nbsp;power&nbsp;at&nbsp;operating&nbsp;conditions:&nbsp;</p>
<ul>
<li>if&nbsp;modulation_init&nbsp;&lt;&nbsp;modulation_min,&nbsp;the&nbsp;heat&nbsp;pump&nbsp;is&nbsp;OFF,&nbsp;modulation&nbsp;=&nbsp;0.&nbsp;&nbsp;</li>
<li>if&nbsp;modulation_init&nbsp;&gt;&nbsp;100%,&nbsp;the&nbsp;modulation&nbsp;is&nbsp;100%</li>
<li>if&nbsp;modulation_init&nbsp;between&nbsp;modulation_min&nbsp;and&nbsp;modulation_start:&nbsp;hysteresis&nbsp;for&nbsp;on/off&nbsp;cycling.</li>
</ul>
<p>If&nbsp;the&nbsp;heat&nbsp;pump&nbsp;is&nbsp;on&nbsp;another&nbsp;modulation level, interpolation&nbsp;is&nbsp;made&nbsp;to&nbsp;get&nbsp;P&nbsp;and&nbsp;Q&nbsp;at&nbsp;the&nbsp;real&nbsp;modulation.</p>
<h4>ATTENTION</h4>
<p>This&nbsp;model&nbsp;takes&nbsp;into&nbsp;account&nbsp;environmental&nbsp;heat&nbsp;losses&nbsp;of&nbsp;the&nbsp;heat pump.&nbsp;&nbsp;In&nbsp;order&nbsp;to&nbsp;keep&nbsp;the&nbsp;same&nbsp;nominal&nbsp;efficiency&nbsp;during&nbsp;operation,&nbsp;these&nbsp;heat&nbsp;losses&nbsp;are&nbsp;added&nbsp;to&nbsp;the&nbsp;computed&nbsp;power.&nbsp;&nbsp;Therefore,&nbsp;the&nbsp;heat&nbsp;losses&nbsp;are&nbsp;only&nbsp;really&nbsp;&apos;losses&apos;&nbsp;when&nbsp;the&nbsp;heat pump&nbsp;is&nbsp;NOT&nbsp;operating.&nbsp;</p>
<p>The&nbsp;COP&nbsp;is&nbsp;calculated&nbsp;as&nbsp;the&nbsp;heat&nbsp;delivered&nbsp;to&nbsp;the&nbsp;condensor&nbsp;divided&nbsp;by&nbsp;the&nbsp;electrical&nbsp;consumption&nbsp;(P).</p>
<h4>Assumptions and limitations </h4>
<ol>
<li>Based on interpolation in manufacturer data for Daikin Altherma heat pump</li>
<li>Ensure not to operate the heat pump outside of the manufacturer data. No check is made if this happens, and this can lead to strange and wrong results.</li>
</ol>
<h4>Model use</h4>
<p>This model is used in the <a href=\"Modelica://IDEAS.Thermal.Components.Production.HP_AirWater\">HP_AirWater</a> model. If a different heat pump is to be simulated, copy this model and adapt the interpolation tables.</p>
<h4>Validation </h4>
<p>See the air-water heat pmp model. </p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
              graphics={
              Line(
                points={{-70,-20},{30,-20}},
                color={191,0,0},
                thickness=0.5),
              Line(
                points={{-70,20},{30,20}},
                color={191,0,0},
                thickness=0.5),
              Line(
                points={{-90,0},{-70,-20}},
                color={191,0,0},
                thickness=0.5),
              Line(
                points={{-90,0},{-70,20}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{30,0},{30,40},{60,20},{30,0}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{30,-40},{30,0},{60,-20},{30,-40}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{60,40},{80,-40}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-70,-40},{30,60}},
                color={0,0,0},
                smooth=Smooth.None),
              Polygon(
                points={{24,74},{44,54},{40,50},{20,70},{24,74}},
                lineColor={0,0,0},
                smooth=Smooth.None,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(extent={{-100,100},{100,-100}}, lineColor={135,135,135})}));
      end Aermec_ANKI045_60HZ_Cooling;

      model Aermec_ANKI045_60HZ_Heating
        "Aermec ANKI045 60HZ heating data provided by Aermec"
        /*
  This model is based on data we received from AERMEC ANKI045H heat pump.
  The nominal power of the original heat pump is PNom_data 3.4133kW at 6/35degC
  The nominal heat duty of the ANKI045H heat pump is 10.5kW at 6/35degC
   
  First, the thermal power and electricity consumption are interpolated for the 
  evaporator and condensing temperature at 6 different modulation levels.  The results
  are rescaled to the nominal power of the modelled heatpump (with QNom/QNom_data) and
  stored in 2 different vectors, Q_vector and P_vector.
  
  Finally, the modulation is calculated based on the asked Q_load and the Q_max at 
  operating conditions: 
  - if modulation_init < modulation_min, the heat pump is OFF, modulation = 0.  
  - if modulation_init > 100%, the modulation is 100%
  - if modulation_init between modulation_min and modulation_start: hysteresis for on/off cycling.
  
  If the heat pump is on another modulation, interpolation is made to get P and Q at the real modulation.
  
  ATTENTION
  This model takes into account environmental heat losses of the heat pump (at condensor side).
  In order to keep the same nominal COP's during operation of the heat pump, these heat losses are added
  to the Q_load.  
  
  The COP is calculated as the Q_load divided by the electrical consumption (P). 
  
  */
        //protected
        replaceable package Medium =
            Modelica.Media.Interfaces.PartialMedium "Medium in the component";
        final parameter Modelica.SIunits.Power QNomRef=10528
          "SC: Nominal Q_load of the ANKI045 in heating mode 6/35.  See datafile";
        final parameter Real[7] mod_vector={0,20.3,40.7,54.4,66.6,75.9,100} " SC: 7 modulation steps in AERMEC ANKI045 heating mode, %";
        //SC_future_edit: can make the mod_vector higher resolution
        Real[7] Q_vector "Heat duty for 7 modulation steps, in kW";
        Real[7] P_vector "Electrical power for 7 modulation steps, in kW";
        Modelica.SIunits.Power QMax
          "Maximum heat duty at specified evap and condr temperatures, in W";
        Modelica.SIunits.Power QAsked(start=0);
        parameter Modelica.SIunits.ThermalConductance UALoss
          "UA of heat losses of HP to environment, SC: future_edit: Check the amount of losses and edit later";
        parameter Modelica.SIunits.Power QNomLoad
          "The power of another heat pump at nominal conditions (6/35) to scale the curent results";
      public
        parameter Real modulation_min(max=30) = 20 "Minimal modulation percentage u_low, that the heat pump can really perform";
        // dont' set this to 0 or very low values, you might get negative P at very low modulations because of wrong extrapolation
        // Included approximation of running the HP at lower than minimum load.
        parameter Real modulation_start(min=min(30, modulation_min + 5)) = 40
          "Min estimated modulation level required for start of HP- U_high";
        // This refers to actual minimum of the compressor speed for startup
        Real modulationInit "SC: the initial % modulation required to change the temperature of water";
        Real modulation(min=0, max=100) "Current modulation percentage , decides on start/stop of the HP, controls the heat pump to 100%";
        Modelica.SIunits.Power PEl "Resulting electrical power";
        //SC: going to make T_source an input with modelica block
        input Modelica.SIunits.Temperature TEnvironment
          "Temperature of environment for heat losses";
        input Modelica.SIunits.SpecificEnthalpy hIn "Specific enthalpy at the inlet";
        // SC: future_edit: have to change it calculate the specific enthalpy at the the inlet with T at the inlet
        Modelica.Blocks.Tables.CombiTable2D P100(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,
              26,28,30,32,34,36,38,40; 35,2.718,2.793,2.86,2.923,2.983,3.043,3.105,
              3.166,3.21,3.24,3.266,3.298,3.344,3.413,3.49,3.554,3.61,3.657,3.697,
              3.731,3.758,3.78,3.797,3.81,3.819,3.826,3.831,3.834,3.836,3.838,3.84;
              40,2.961,3.042,3.116,3.185,3.251,3.316,3.384,3.449,3.496,3.529,3.559,
              3.595,3.645,3.72,3.803,3.872,3.931,3.982,4.026,4.062,4.092,4.117,
              4.136,4.151,4.162,4.17,4.176,4.18,4.182,4.184,4.186; 45,3.204,3.291,
              3.37,3.445,3.516,3.588,3.661,3.73,3.78,3.816,3.85,3.89,3.945,4.025,
              4.115,4.187,4.251,4.305,4.352,4.392,4.425,4.452,4.473,4.49,4.503,
              4.512,4.519,4.523,4.526,4.528,4.53; 50,3.438,3.531,3.617,3.697,3.774,
              3.85,3.928,4.003,4.055,4.094,4.132,4.175,4.235,4.32,4.416,4.493,4.56,
              4.619,4.669,4.711,4.747,4.776,4.8,4.818,4.833,4.843,4.851,4.856,4.859,
              4.861,4.863; 55,0,0,0,3.934,4.016,4.097,4.18,4.26,4.314,4.356,4.397,
              4.444,4.508,4.598,4.7,4.781,4.852,4.914,4.967,5.012,5.05,5.082,5.108,
              5.128,5.144,5.155,5.164,5.169,5.173,5.175,5.176; 60,0,0,0,0,0,4.323,
              4.411,4.493,4.549,4.595,4.638,4.689,4.757,4.851,4.957,5.042,5.117,
              5.182,5.238,5.287,5.327,5.361,5.389,5.411,5.428,5.44,5.449,5.455,
              5.459,5.461,5.462])
          annotation (Placement(transformation(extent={{26,28},{46,48}})));
        Modelica.Blocks.Tables.CombiTable2D P76(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,
              26,28,30,32,34,36,38,40; 35,2.028,2.084,2.135,2.181,2.226,2.27,2.315,
              2.362,2.394,2.417,2.436,2.46,2.494,2.546,2.62,2.686,2.739,2.782,2.815,
              2.839,2.856,2.866,2.87,2.871,2.868,2.864,2.859,2.853,2.85,2.848,2.851;
              40,2.212,2.272,2.328,2.379,2.429,2.478,2.528,2.577,2.612,2.637,2.659,
              2.686,2.724,2.78,2.855,2.924,2.981,3.027,3.063,3.089,3.108,3.12,3.127,
              3.129,3.128,3.124,3.119,3.114,3.11,3.109,3.11; 45,2.391,2.456,2.516,
              2.572,2.626,2.68,2.734,2.786,2.822,2.85,2.875,2.905,2.946,3.006,3.088,
              3.161,3.221,3.27,3.309,3.338,3.359,3.373,3.382,3.385,3.385,3.382,
              3.377,3.373,3.369,3.367,3.367; 50,2.565,2.634,2.698,2.758,2.816,2.873,
              2.932,2.986,3.025,3.055,3.082,3.115,3.16,3.223,3.314,3.39,3.454,3.506,
              3.548,3.579,3.603,3.619,3.628,3.633,3.634,3.631,3.627,3.623,3.619,
              3.616,3.616; 55,0,0,0,2.934,2.996,3.057,3.119,3.177,3.217,3.249,3.279,
              3.315,3.362,3.429,3.526,3.606,3.674,3.729,3.773,3.807,3.832,3.85,
              3.861,3.867,3.869,3.867,3.864,3.859,3.855,3.851,3.851; 60,0,0,0,0,0,
              3.228,3.294,3.355,3.397,3.431,3.464,3.502,3.553,3.623,3.719,3.803,
              3.874,3.932,3.978,4.015,4.042,4.062,4.075,4.082,4.084,4.083,4.08,
              4.075,4.07,4.066,4.065])
          annotation (Placement(transformation(extent={{26,2},{46,22}})));
        Modelica.Blocks.Tables.CombiTable2D P66(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,
              26,28,30,32,34,36,38,40; 35,1.761,1.809,1.853,1.894,1.933,1.971,2.01,
              2.05,2.078,2.098,2.115,2.135,2.165,2.21,2.275,2.332,2.378,2.415,2.444,
              2.465,2.479,2.488,2.492,2.493,2.49,2.486,2.482,2.477,2.474,2.473,
              2.475; 40,1.92,1.973,2.021,2.066,2.108,2.151,2.194,2.237,2.267,2.289,
              2.309,2.332,2.365,2.413,2.478,2.539,2.588,2.628,2.659,2.682,2.699,
              2.709,2.715,2.717,2.715,2.712,2.708,2.703,2.7,2.699,2.7; 45,2.076,
              2.133,2.184,2.233,2.28,2.326,2.373,2.418,2.45,2.474,2.496,2.522,2.558,
              2.61,2.681,2.744,2.797,2.839,2.873,2.898,2.917,2.929,2.936,2.939,
              2.938,2.936,2.932,2.928,2.924,2.923,2.923; 50,2.227,2.287,2.342,2.394,
              2.445,2.495,2.546,2.592,2.625,2.651,2.676,2.704,2.743,2.798,2.877,
              2.943,2.999,3.044,3.08,3.108,3.128,3.142,3.15,3.154,3.155,3.153,3.149,
              3.145,3.142,3.139,3.139; 55,0,0,0,2.547,2.601,2.654,2.708,2.757,2.792,
              2.82,2.846,2.877,2.919,2.977,3.061,3.131,3.189,3.237,3.275,3.305,
              3.327,3.343,3.352,3.357,3.359,3.357,3.354,3.35,3.346,3.344,3.343; 60,
              0,0,0,0,0,2.803,2.86,2.913,2.949,2.979,3.007,3.041,3.085,3.145,3.229,
              3.302,3.363,3.413,3.454,3.486,3.51,3.527,3.538,3.544,3.546,3.545,
              3.542,3.538,3.534,3.53,3.529])
          annotation (Placement(transformation(extent={{26,-24},{46,-4}})));
        Modelica.Blocks.Tables.CombiTable2D P55(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,
              26,28,30,32,34,36,38,40; 35,1.489,1.53,1.567,1.602,1.634,1.667,1.7,
              1.733,1.757,1.774,1.788,1.806,1.831,1.869,1.924,1.972,2.011,2.043,
              2.067,2.085,2.097,2.104,2.108,2.108,2.106,2.103,2.099,2.095,2.092,
              2.091,2.093; 40,1.624,1.668,1.709,1.747,1.783,1.819,1.855,1.892,1.917,
              1.936,1.952,1.972,2,2.041,2.096,2.147,2.189,2.223,2.249,2.268,2.282,
              2.291,2.296,2.297,2.296,2.293,2.29,2.286,2.283,2.282,2.283; 45,1.756,
              1.803,1.847,1.888,1.928,1.967,2.007,2.045,2.072,2.092,2.111,2.133,
              2.163,2.207,2.267,2.321,2.365,2.401,2.43,2.451,2.467,2.477,2.483,
              2.485,2.485,2.483,2.479,2.476,2.473,2.471,2.472; 50,1.883,1.934,1.981,
              2.025,2.067,2.11,2.153,2.191,2.22,2.242,2.262,2.287,2.319,2.366,2.433,
              2.489,2.536,2.574,2.605,2.628,2.645,2.657,2.664,2.667,2.668,2.666,
              2.663,2.66,2.657,2.655,2.655; 55,0,0,0,2.154,2.2,2.245,2.291,2.331,
              2.361,2.384,2.407,2.433,2.468,2.517,2.589,2.648,2.697,2.738,2.77,
              2.795,2.814,2.827,2.835,2.839,2.84,2.839,2.836,2.833,2.83,2.827,2.827;
              60,0,0,0,0,0,2.37,2.419,2.463,2.494,2.519,2.543,2.571,2.609,2.66,
              2.731,2.792,2.844,2.887,2.921,2.948,2.968,2.982,2.992,2.997,2.998,
              2.998,2.995,2.992,2.988,2.985,2.984])
          annotation (Placement(transformation(extent={{26,-50},{46,-30}})));
        Modelica.Blocks.Tables.CombiTable2D Q100(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,
              26,28,30,32,34,36,38,40; 35,3.968,4.468,5.014,5.575,6.119,6.615,7.029,
              7.44,7.69,7.792,7.935,8.311,9.112,10.529,11.988,12.779,13.47,14.067,
              14.577,15.007,15.365,15.658,15.892,16.076,16.215,16.318,16.392,16.443,
              16.478,16.506,16.532; 40,3.894,4.381,4.916,5.466,6,6.485,6.889,7.301,
              7.549,7.645,7.778,8.14,8.923,10.318,11.766,12.541,13.217,13.801,
              14.299,14.719,15.068,15.354,15.582,15.761,15.898,16,16.073,16.126,
              16.165,16.197,16.23; 45,3.813,4.289,4.813,5.353,5.877,6.352,6.748,
              7.152,7.4,7.49,7.615,7.964,8.73,10.104,11.527,12.284,12.944,13.512,
              13.997,14.405,14.744,15.02,15.241,15.414,15.547,15.645,15.717,15.77,
              15.811,15.846,15.883; 50,3.735,4.201,4.716,5.246,5.761,6.228,6.615,
              7.01,7.258,7.344,7.46,7.798,8.548,9.902,11.29,12.027,12.669,13.22,
              13.69,14.084,14.411,14.677,14.889,15.054,15.18,15.274,15.343,15.394,
              15.435,15.472,15.512; 55,0,0,0,5.155,5.662,6.121,6.501,6.89,7.138,
              7.221,7.331,7.658,8.393,9.728,11.074,11.79,12.411,12.945,13.398,
              13.777,14.089,14.343,14.544,14.7,14.818,14.906,14.97,15.018,15.057,
              15.093,15.135; 60,0,0,0,0,0,6.042,6.416,6.807,7.057,7.138,7.242,7.558,
              8.28,9.597,10.898,11.592,12.191,12.705,13.139,13.501,13.798,14.037,
              14.226,14.371,14.48,14.56,14.618,14.66,14.696,14.73,14.771])
          annotation (Placement(transformation(extent={{64,28},{84,48}})));
        Modelica.Blocks.Tables.CombiTable2D Q76(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,
              26,28,30,32,34,36,38,40; 35,3.013,3.392,3.806,4.232,4.646,5.024,5.34,
              5.645,5.835,5.912,6.021,6.307,6.915,7.991,9.072,9.68,10.21,10.668,
              11.059,11.389,11.663,11.887,12.066,12.206,12.312,12.39,12.445,12.483,
              12.509,12.529,12.547; 40,2.958,3.327,3.733,4.151,4.557,4.925,5.233,
              5.547,5.736,5.809,5.91,6.186,6.781,7.84,8.925,9.519,10.037,10.483,
              10.865,11.186,11.453,11.671,11.845,11.982,12.086,12.163,12.218,12.257,
              12.286,12.31,12.334; 45,2.896,3.257,3.655,4.065,4.463,4.825,5.125,
              5.433,5.621,5.69,5.785,6.051,6.633,7.677,8.745,9.324,9.828,10.262,
              10.632,10.943,11.202,11.412,11.58,11.712,11.812,11.887,11.941,11.981,
              12.011,12.038,12.066; 50,2.836,3.19,3.581,3.984,4.375,4.729,5.023,
              5.32,5.509,5.575,5.664,5.92,6.491,7.519,8.561,9.123,9.612,10.032,
              10.39,10.69,10.938,11.14,11.3,11.426,11.521,11.592,11.644,11.683,
              11.713,11.741,11.772; 55,0,0,0,3.914,4.299,4.647,4.934,5.227,5.416,
              5.48,5.563,5.812,6.37,7.385,8.401,8.945,9.418,9.823,10.166,10.453,
              10.69,10.882,11.034,11.152,11.241,11.307,11.355,11.391,11.42,11.448,
              11.481; 60,0,0,0,0,0,4.587,4.869,5.17,5.36,5.422,5.501,5.742,6.29,
              7.291,8.294,8.819,9.273,9.662,9.99,10.263,10.487,10.667,10.809,10.918,
              11,11.059,11.102,11.135,11.161,11.188,11.22])
          annotation (Placement(transformation(extent={{64,2},{84,22}})));
        Modelica.Blocks.Tables.CombiTable2D Q66(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,
              26,28,30,32,34,36,38,40; 35,2.643,2.974,3.338,3.712,4.075,4.406,4.683,
              4.951,5.118,5.185,5.281,5.532,6.065,7.009,7.957,8.49,8.955,9.357,9.7,
              9.989,10.23,10.427,10.584,10.707,10.8,10.868,10.916,10.949,10.972,
              10.989,11.005; 40,2.594,2.918,3.274,3.64,3.996,4.32,4.59,4.864,5.03,
              5.094,5.183,5.424,5.946,6.875,7.827,8.348,8.802,9.194,9.528,9.81,
              10.044,10.236,10.389,10.508,10.6,10.667,10.716,10.75,10.776,10.796,
              10.817; 45,2.54,2.857,3.206,3.565,3.914,4.231,4.495,4.764,4.929,4.989,
              5.073,5.306,5.816,6.732,7.669,8.176,8.618,8.999,9.324,9.597,9.824,
              10.009,10.156,10.272,10.36,10.425,10.473,10.508,10.535,10.558,10.583;
              50,2.487,2.798,3.14,3.494,3.837,4.147,4.405,4.665,4.83,4.888,4.966,
              5.191,5.691,6.593,7.507,8.001,8.429,8.798,9.112,9.375,9.593,9.77,
              9.911,10.021,10.105,10.167,10.213,10.247,10.274,10.298,10.325; 55,0,0,
              0,3.433,3.77,4.076,4.328,4.583,4.748,4.804,4.877,5.095,5.585,6.475,
              7.367,7.845,8.259,8.614,8.916,9.168,9.376,9.544,9.677,9.781,9.859,
              9.917,9.959,9.991,10.017,10.042,10.07; 60,0,0,0,0,0,4.023,4.27,4.532,
              4.699,4.753,4.822,5.034,5.514,6.392,7.273,7.734,8.132,8.473,8.761,
              9.001,9.197,9.355,9.48,9.576,9.647,9.7,9.737,9.766,9.789,9.813,9.841])
          annotation (Placement(transformation(extent={{64,-24},{84,-4}})));
        Modelica.Blocks.Tables.CombiTable2D Q55(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,
              26,28,30,32,34,36,38,40; 35,2.16,2.431,2.728,3.033,3.33,3.6,3.827,
              4.046,4.182,4.237,4.315,4.52,4.956,5.727,6.503,6.939,7.319,7.647,
              7.927,8.164,8.361,8.521,8.65,8.75,8.826,8.882,8.922,8.949,8.967,8.981,
              8.994; 40,2.12,2.384,2.675,2.975,3.266,3.53,3.751,3.975,4.11,4.162,
              4.234,4.432,4.858,5.617,6.395,6.821,7.192,7.512,7.786,8.016,8.208,
              8.364,8.489,8.587,8.662,8.717,8.757,8.785,8.806,8.823,8.84; 45,2.075,
              2.334,2.62,2.914,3.199,3.458,3.673,3.892,4.027,4.076,4.144,4.335,
              4.752,5.5,6.266,6.681,7.042,7.353,7.619,7.842,8.027,8.178,8.299,8.394,
              8.466,8.52,8.559,8.587,8.609,8.628,8.648; 50,2.032,2.286,2.566,2.855,
              3.135,3.389,3.6,3.811,3.946,3.993,4.057,4.241,4.649,5.386,6.134,6.537,
              6.888,7.189,7.445,7.661,7.839,7.984,8.099,8.189,8.258,8.309,8.346,
              8.374,8.396,8.416,8.438; 55,0,0,0,2.805,3.081,3.33,3.536,3.744,3.879,
              3.925,3.984,4.162,4.562,5.289,6.02,6.41,6.749,7.039,7.286,7.492,7.662,
              7.799,7.908,7.993,8.057,8.105,8.14,8.166,8.187,8.207,8.23; 60,0,0,0,0,
              0,3.287,3.489,3.702,3.838,3.883,3.939,4.111,4.504,5.221,5.942,6.319,
              6.644,6.923,7.158,7.355,7.515,7.645,7.746,7.825,7.883,7.926,7.958,
              7.981,8,8.02,8.043])
          annotation (Placement(transformation(extent={{64,-50},{84,-30}})));
      Modelica.Blocks.Tables.CombiTable2D P41(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,
              26,28,30,32,34,36,38,40; 35,1.179,1.212,1.241,1.268,1.294,1.32,1.346,
              1.372,1.391,1.404,1.416,1.429,1.449,1.479,1.52,1.554,1.582,1.605,
              1.624,1.638,1.648,1.656,1.66,1.663,1.664,1.663,1.662,1.661,1.66,1.66,
              1.661; 40,1.285,1.321,1.353,1.382,1.411,1.44,1.469,1.496,1.516,1.531,
              1.544,1.56,1.582,1.614,1.657,1.693,1.723,1.747,1.767,1.783,1.795,
              1.803,1.809,1.812,1.813,1.814,1.813,1.812,1.811,1.811,1.812; 45,1.39,
              1.428,1.462,1.494,1.526,1.557,1.588,1.618,1.639,1.655,1.67,1.688,
              1.712,1.746,1.791,1.829,1.861,1.888,1.909,1.926,1.939,1.949,1.955,
              1.959,1.961,1.962,1.962,1.961,1.96,1.959,1.96; 50,1.491,1.531,1.568,
              1.603,1.636,1.67,1.704,1.736,1.758,1.776,1.792,1.811,1.837,1.874,
              1.921,1.961,1.995,2.023,2.046,2.065,2.079,2.09,2.097,2.102,2.105,
              2.106,2.106,2.105,2.104,2.104,2.104; 55,0,0,0,1.705,1.741,1.777,1.813,
              1.847,1.87,1.889,1.907,1.927,1.955,1.994,2.044,2.086,2.122,2.152,
              2.176,2.196,2.212,2.223,2.232,2.237,2.241,2.242,2.242,2.242,2.241,
              2.24,2.24; 60,0,0,0,0,0,1.876,1.914,1.948,1.973,1.993,2.012,2.034,
              2.064,2.104,2.157,2.201,2.239,2.27,2.297,2.318,2.334,2.347,2.356,
              2.363,2.366,2.368,2.369,2.368,2.367,2.366,2.366])
          "Lowest compressor speed"
          annotation (Placement(transformation(extent={{26,-78},{46,-58}})));
        Modelica.Blocks.Tables.CombiTable2D Q41(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
              -20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,24,
              26,28,30,32,34,36,38,40; 35,1.616,1.819,2.041,2.27,2.492,2.694,2.863,
              3.027,3.13,3.171,3.229,3.382,3.708,4.285,4.87,5.196,5.48,5.725,5.935,
              6.112,6.259,6.379,6.475,6.55,6.607,6.648,6.678,6.698,6.712,6.722,
              6.732; 40,1.586,1.784,2.002,2.226,2.444,2.642,2.806,2.972,3.073,3.112,
              3.167,3.314,3.633,4.201,4.787,5.105,5.383,5.622,5.827,5.999,6.142,
              6.259,6.352,6.426,6.481,6.523,6.552,6.573,6.589,6.602,6.614; 45,1.553,
              1.747,1.96,2.18,2.394,2.587,2.748,2.912,3.013,3.05,3.1,3.243,3.555,
              4.114,4.689,4.999,5.27,5.502,5.701,5.868,6.006,6.119,6.21,6.28,6.334,
              6.374,6.403,6.425,6.441,6.455,6.47; 50,1.521,1.711,1.92,2.136,2.346,
              2.536,2.694,2.854,2.955,2.99,3.037,3.175,3.48,4.032,4.59,4.892,5.154,
              5.38,5.572,5.733,5.866,5.974,6.06,6.128,6.179,6.217,6.245,6.266,6.282,
              6.297,6.314; 55,0,0,0,2.099,2.305,2.492,2.646,2.804,2.905,2.939,2.984,
              3.117,3.416,3.96,4.505,4.798,5.051,5.268,5.452,5.607,5.734,5.837,
              5.918,5.981,6.029,6.065,6.091,6.11,6.126,6.141,6.158; 60,0,0,0,0,0,
              2.46,2.611,2.77,2.872,2.905,2.947,3.076,3.37,3.906,4.447,4.729,4.973,
              5.181,5.357,5.504,5.624,5.721,5.797,5.856,5.899,5.931,5.955,5.972,
              5.986,6.001,6.018]) "Lowest compressor speed"
          annotation (Placement(transformation(extent={{64,-78},{84,-58}})));

        Modelica.SIunits.HeatFlowRate QLossesToCompensate "Environment losses";
        Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a loadPort
          "heatPort connection to water in load side HX"
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        IDEAS.Controls.Discrete.HysteresisRelease_boolean onOff(
          enableRelease=true,
          y(start=0),
          release(start=false))
          annotation (Placement(transformation(extent={{10,70},{30,90}})));
        Modelica.Blocks.Sources.RealExpression realExpression(y=modulationInit)
          annotation (Placement(transformation(extent={{-86,78},{-8,98}})));
        Modelica.Blocks.Sources.RealExpression realExpression1(y=modulation_start)
          annotation (Placement(transformation(extent={{-96,68},{-48,88}})));
        Modelica.Blocks.Sources.RealExpression realExpression2(y=modulation_min)
          annotation (Placement(transformation(extent={{-116,52},{-66,70}})));
        Modelica.Blocks.Interfaces.RealInput TSetpoint annotation (Placement(
              transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-110,
                  -10},{-90,10}})));
        Modelica.Blocks.Interfaces.BooleanInput on annotation (Placement(
              transformation(extent={{-120,20},{-80,60}}), iconTransformation(extent={{-112,64},
                  {-92,84}})));
        Modelica.Blocks.Interfaces.RealInput TLoadHX_in
          "Inlet temperature of the load Heat exchanger" annotation (Placement(transformation(
                extent={{-120,-60},{-80,-20}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={64,-98})));
              //SC: Future_edit: not getting used now, have to use to calculate the enthalpy
        Modelica.Blocks.Interfaces.RealInput m_flowLoadHX
          "mass-flow rate of water on the load side of the airwater heat-pump" annotation (Placement(transformation(
                extent={{-120,-100},{-80,-60}}),iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-62,-100})));
        Modelica.Blocks.Interfaces.RealInput TSourceHX annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-34,-78}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-104,-54})));

      Modelica.Blocks.Tables.CombiTable2D P20(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
            table=[0,-20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,
              24,26,28,30,32,34,36,38,40; 35,0.649,0.666,0.683,0.698,0.712,0.726,0.74,
              0.755,0.765,0.772,0.779,0.786,0.797,0.814,0.836,0.855,0.87,0.883,0.893,0.901,
              0.907,0.911,0.913,0.915,0.915,0.915,0.914,0.913,0.913,0.913,0.914; 40,0.707,
              0.726,0.744,0.76,0.776,0.792,0.808,0.823,0.834,0.842,0.849,0.858,0.87,0.888,
              0.911,0.931,0.947,0.961,0.972,0.981,0.987,0.992,0.995,0.997,0.997,0.997,
              0.997,0.996,0.996,0.996,0.996; 45,0.764,0.785,0.804,0.822,0.839,0.856,0.874,
              0.89,0.902,0.911,0.919,0.928,0.941,0.96,0.985,1.006,1.024,1.038,1.05,1.059,
              1.067,1.072,1.075,1.078,1.079,1.079,1.079,1.078,1.078,1.078,1.078; 50,0.82,
              0.842,0.862,0.881,0.9,0.918,0.937,0.955,0.967,0.977,0.986,0.996,1.01,1.03,
              1.057,1.079,1.097,1.113,1.126,1.136,1.144,1.149,1.153,1.156,1.158,1.158,
              1.158,1.158,1.157,1.157,1.157; 55,0,0,0,0.938,0.958,0.977,0.997,1.016,1.029,
              1.039,1.049,1.06,1.075,1.097,1.124,1.147,1.167,1.184,1.197,1.208,1.216,1.223,
              1.227,1.231,1.232,1.233,1.233,1.233,1.232,1.232,1.232; 60,0,0,0,0,0,1.032,
              1.053,1.072,1.085,1.096,1.107,1.119,1.135,1.157,1.187,1.211,1.231,1.249,
              1.263,1.275,1.284,1.291,1.296,1.299,1.302,1.303,1.303,1.303,1.302,1.301,
              1.301]) "Approximating cycling below lowest load"
          annotation (Placement(transformation(extent={{26,-106},{46,-86}})));
        Modelica.Blocks.Tables.CombiTable2D Q20(smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
            table=[0,-20,-18,-16,-14,-12,-10,-8,-6,-4,-2,0,2,4,6,8,10,12,14,16,18,20,22,
              24,26,28,30,32,34,36,38,40; 35,0.808,0.91,1.021,1.135,1.246,1.347,1.432,
              1.514,1.565,1.585,1.615,1.691,1.854,2.143,2.435,2.598,2.74,2.863,2.968,3.056,
              3.129,3.189,3.237,3.275,3.303,3.324,3.339,3.349,3.356,3.361,3.366; 40,0.793,
              0.892,1.001,1.113,1.222,1.321,1.403,1.486,1.537,1.556,1.583,1.657,1.817,
              2.101,2.393,2.553,2.691,2.811,2.913,2.999,3.071,3.129,3.176,3.213,3.241,
              3.261,3.276,3.287,3.294,3.301,3.307; 45,0.776,0.873,0.98,1.09,1.197,1.294,
              1.374,1.456,1.506,1.525,1.55,1.621,1.777,2.057,2.344,2.5,2.635,2.751,2.85,
              2.934,3.003,3.06,3.105,3.14,3.167,3.187,3.202,3.212,3.221,3.228,3.235; 50,
              0.76,0.855,0.96,1.068,1.173,1.268,1.347,1.427,1.477,1.495,1.519,1.587,1.74,
              2.016,2.295,2.446,2.577,2.69,2.786,2.866,2.933,2.987,3.03,3.064,3.089,3.109,
              3.122,3.133,3.141,3.149,3.157; 55,0,0,0,1.05,1.153,1.246,1.323,1.402,1.453,
              1.47,1.492,1.558,1.708,1.98,2.253,2.399,2.525,2.634,2.726,2.803,2.867,2.918,
              2.959,2.991,3.015,3.032,3.045,3.055,3.063,3.07,3.079; 60,0,0,0,0,0,1.23,
              1.305,1.385,1.436,1.452,1.473,1.538,1.685,1.953,2.224,2.365,2.486,2.591,
              2.679,2.752,2.812,2.86,2.899,2.928,2.95,2.966,2.977,2.986,2.993,3,3.009])
          "Approximating cycling below lowest load"
          annotation (Placement(transformation(extent={{62,-104},{82,-84}})));
      equation
        QAsked = IDEAS.Utilities.Math.Functions.smoothMax(
        0, m_flowLoadHX*(Medium.specificEnthalpy(Medium.setState_pTX(Medium.p_default,TSetpoint, Medium.X_default)) -hIn), 10)
        " heat required to bring the inlet mass of water to T_set point, the smoothening is done ";

        // all these are in kW
        P100.u1 = loadPort.T - 273.15;
        P100.u2 = TSourceHX - 273.15;
        P76.u1 = loadPort.T - 273.15;
        P76.u2 = TSourceHX - 273.15;
        P66.u1 = loadPort.T - 273.15;
        P66.u2 = TSourceHX - 273.15;
        P55.u1 = loadPort.T - 273.15;
        P55.u2 = TSourceHX - 273.15;
        P41.u1 = loadPort.T - 273.15 "SC: Added";
        P41.u2 = TSourceHX - 273.15 "SC: Added";
        P20.u1 = loadPort.T - 273.15 "SC: Added for approximating lower load cycling ";
        P20.u2 = TSourceHX - 273.15 "SC: Added for approximating lower load cycling";

        Q100.u1 = loadPort.T - 273.15;
        Q100.u2 = TSourceHX - 273.15;
        Q76.u1 = loadPort.T - 273.15;
        Q76.u2 = TSourceHX - 273.15;
        Q66.u1 = loadPort.T - 273.15;
        Q66.u2 = TSourceHX - 273.15;
        Q55.u1 = loadPort.T - 273.15;
        Q55.u2 = TSourceHX - 273.15;
        Q41.u1 = loadPort.T - 273.15 "SC: Added";
        Q41.u2 = TSourceHX - 273.15 "SC: Added";
        Q20.u1 = loadPort.T - 273.15 "SC: Added for approximating lower load cycling ";
        Q20.u2 = TSourceHX - 273.15 "SC: Added for approximating lower load cycling";

        Q_vector[1] = 0;
        Q_vector[2] =Q20.y*QNomLoad/QNomRef "SC: Added";
        Q_vector[3] =Q41.y*QNomLoad/QNomRef "SC: Added";
        Q_vector[4] =Q55.y *QNomLoad/QNomRef;
        Q_vector[5] =Q66.y *QNomLoad/QNomRef;
        Q_vector[6] =Q76.y *QNomLoad/QNomRef;
        Q_vector[7] =Q100.y*QNomLoad/QNomRef;

        P_vector[1] = 0;
        P_vector[2] =P20.y *QNomLoad/QNomRef "SC: Added";
        P_vector[3] =P41.y *QNomLoad/QNomRef "SC: Added";
        P_vector[4] =P55.y *QNomLoad/QNomRef;
        P_vector[5] =P66.y *QNomLoad/QNomRef;
        P_vector[6] =P76.y *QNomLoad/QNomRef;
        P_vector[7] = P100.y*QNomLoad/QNomRef;

        QMax = 1000*Q100.y*QNomLoad/QNomRef "coverted to W";
        modulationInit = QAsked/QMax*100;
        modulation = onOff.y*IDEAS.Utilities.Math.Functions.smoothMin(modulationInit, 100,1);
        // compensation of heat losses (only when the hp is operating)
        QLossesToCompensate = if noEvent(modulation > 0) then UALoss*(loadPort.T -
          TEnvironment) else 0;
        loadPort.Q_flow = -1000*Modelica.Math.Vectors.interpolate(
          mod_vector,
          Q_vector,
          modulation) - QLossesToCompensate "Heat energy leaving the port Watts";
        PEl = 1000*Modelica.Math.Vectors.interpolate(
          mod_vector,
          P_vector,
          modulation) "power consumed in Watts";
        connect(realExpression.y, onOff.u) annotation (Line(
            points={{-4.1,88},{4,88},{4,80},{8,80}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(realExpression1.y, onOff.uHigh) annotation (Line(
            points={{-45.6,78},{0,78},{0,76},{8,76}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(realExpression2.y, onOff.uLow) annotation (Line(
            points={{-63.5,61},{-24,61},{-24,64},{0,64},{0,72},{8,72}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(on, onOff.release) annotation (Line(
            points={{-100,40},{20,40},{20,68}},
            color={255,0,255},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}})),  Documentation(info="<html>
<p><b>Description</b> </p>
<p>This&nbsp;model&nbsp;is&nbsp;based&nbsp;on&nbsp;data&nbsp;received&nbsp;from&nbsp;Daikin&nbsp;from&nbsp;an&nbsp;Altherma&nbsp;heat&nbsp;pump, and the full heat pump is implemented as <a href=\"modelica://IDEAS.Thermal.Components.Production.HP_AWMod_Losses\">IDEAS.Thermal.Components.Production.HP_AWMod_Losses</a>. (vermoedelijk <a href=\"Modelica://IDEAS.Thermal.Components.Production.HP_AirWater\">IDEAS.Thermal.Components.Production.HP_AirWater</a></p>
<p>The&nbsp;nominal&nbsp;power&nbsp;of&nbsp;the&nbsp;original&nbsp;heat&nbsp;pump&nbsp;is&nbsp;7177 W&nbsp;at&nbsp;2/35 degC.</p>
<p>First,&nbsp;the&nbsp;thermal&nbsp;power&nbsp;and&nbsp;electricity&nbsp;consumption&nbsp;are&nbsp;interpolated&nbsp;for&nbsp;the&nbsp;evaporator&nbsp;and&nbsp;condensing&nbsp;temperature&nbsp;at&nbsp;4&nbsp;different&nbsp;modulation&nbsp;levels.&nbsp;&nbsp;The&nbsp;results&nbsp;are&nbsp;rescaled&nbsp;to&nbsp;the&nbsp;nominal&nbsp;power&nbsp;of&nbsp;the&nbsp;modelled&nbsp;heatpump&nbsp;(with&nbsp;QNomLoad/QNom_data)&nbsp;and&nbsp;stored&nbsp;in&nbsp;2&nbsp;different&nbsp;vectors,&nbsp;Q_vector&nbsp;and&nbsp;P_vector.</p>
<p>Finally,&nbsp;the&nbsp;modulation&nbsp;is&nbsp;calculated&nbsp;based&nbsp;on&nbsp;the&nbsp;asked&nbsp;power&nbsp;and&nbsp;the&nbsp;max&nbsp;power&nbsp;at&nbsp;operating&nbsp;conditions:&nbsp;</p>
<ul>
<li>if&nbsp;modulation_init&nbsp;&lt;&nbsp;modulation_min,&nbsp;the&nbsp;heat&nbsp;pump&nbsp;is&nbsp;OFF,&nbsp;modulation&nbsp;=&nbsp;0.&nbsp;&nbsp;</li>
<li>if&nbsp;modulation_init&nbsp;&gt;&nbsp;100%,&nbsp;the&nbsp;modulation&nbsp;is&nbsp;100%</li>
<li>if&nbsp;modulation_init&nbsp;between&nbsp;modulation_min&nbsp;and&nbsp;modulation_start:&nbsp;hysteresis&nbsp;for&nbsp;on/off&nbsp;cycling.</li>
</ul>
<p>If&nbsp;the&nbsp;heat&nbsp;pump&nbsp;is&nbsp;on&nbsp;another&nbsp;modulation level, interpolation&nbsp;is&nbsp;made&nbsp;to&nbsp;get&nbsp;P&nbsp;and&nbsp;Q&nbsp;at&nbsp;the&nbsp;real&nbsp;modulation.</p>
<h4>ATTENTION</h4>
<p>This&nbsp;model&nbsp;takes&nbsp;into&nbsp;account&nbsp;environmental&nbsp;heat&nbsp;losses&nbsp;of&nbsp;the&nbsp;heat pump.&nbsp;&nbsp;In&nbsp;order&nbsp;to&nbsp;keep&nbsp;the&nbsp;same&nbsp;nominal&nbsp;efficiency&nbsp;during&nbsp;operation,&nbsp;these&nbsp;heat&nbsp;losses&nbsp;are&nbsp;added&nbsp;to&nbsp;the&nbsp;computed&nbsp;power.&nbsp;&nbsp;Therefore,&nbsp;the&nbsp;heat&nbsp;losses&nbsp;are&nbsp;only&nbsp;really&nbsp;&apos;losses&apos;&nbsp;when&nbsp;the&nbsp;heat pump&nbsp;is&nbsp;NOT&nbsp;operating.&nbsp;</p>
<p>The&nbsp;COP&nbsp;is&nbsp;calculated&nbsp;as&nbsp;the&nbsp;heat&nbsp;delivered&nbsp;to&nbsp;the&nbsp;condensor&nbsp;divided&nbsp;by&nbsp;the&nbsp;electrical&nbsp;consumption&nbsp;(P).</p>
<h4>Assumptions and limitations </h4>
<ol>
<li>Based on interpolation in manufacturer data for Daikin Altherma heat pump</li>
<li>Ensure not to operate the heat pump outside of the manufacturer data. No check is made if this happens, and this can lead to strange and wrong results.</li>
</ol>
<h4>Model use</h4>
<p>This model is used in the <a href=\"Modelica://IDEAS.Thermal.Components.Production.HP_AirWater\">HP_AirWater</a> model. If a different heat pump is to be simulated, copy this model and adapt the interpolation tables.</p>
<h4>Validation </h4>
<p>See the air-water heat pmp model. </p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
              graphics={
              Line(
                points={{-70,-20},{30,-20}},
                color={191,0,0},
                thickness=0.5),
              Line(
                points={{-70,20},{30,20}},
                color={191,0,0},
                thickness=0.5),
              Line(
                points={{-90,0},{-70,-20}},
                color={191,0,0},
                thickness=0.5),
              Line(
                points={{-90,0},{-70,20}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{30,0},{30,40},{60,20},{30,0}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{30,-40},{30,0},{60,-20},{30,-40}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{60,40},{80,-40}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-70,-40},{30,60}},
                color={0,0,0},
                smooth=Smooth.None),
              Polygon(
                points={{24,74},{44,54},{40,50},{20,70},{24,74}},
                lineColor={0,0,0},
                smooth=Smooth.None,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(extent={{-100,100},{100,-100}}, lineColor={135,135,135})}));
      end Aermec_ANKI045_60HZ_Heating;
    end BlackBox_Generic_TSetpoint;
  end Data;

  package Examples "Contains example usage of heat pump models"
    extends Modelica.Icons.ExamplesPackage;

    model BlackBox_Generic_TSetpoint_Cooling
      "Example model to test BlackBox_Generic_TSetpoint for cooling mode"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater
        annotation (__Dymola_choicesAllMatching=true);

        IDEAS.Fluid.Movers.FlowControlled_m_flow pump(
        redeclare package Medium = Medium,
        tau=30,
        m_flow_nominal=m_flow,
        inputType=IDEAS.Fluid.Types.InputType.Constant,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        use_inputFilter=false)
        annotation (Placement(transformation(extent={{-14,-24},{-34,-4}})));
      hil_flexlab_model.HeatPumps.BlackBox_Generic_TSetpoint AirWaterHP(
        tauHeatLoss=3600,
        QNom=10590,
        redeclare package Medium = Medium,
        m_flow_nominal=m_flow,
        modulation_min=16,
        modulation_start=25)
        annotation (Placement(transformation(extent={{-74,16},{-56,36}})));
        //cDry=10000, this has been recorded as final parameter
        //mWater=4, this has been recorded as final parameter
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=
            293.15)
        annotation (Placement(transformation(extent={{-124,-20},{-110,-6}})));

      Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TReturn
        annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
      IDEAS.Fluid.Sources.Boundary_pT bou(
        redeclare package Medium = Medium,
        p=200000,
        T=298.15,
        nPorts=2) annotation (Placement(transformation(extent={{72,-10},{52,10}})));
      constant Modelica.SIunits.MassFlowRate m_flow=0.4
        "Nominal mass flow rate";
      Modelica.Blocks.Sources.Constant Tset_HP(k=273.15 + 7, y(unit="K"))
        "Temperature set point"
        annotation (Placement(transformation(extent={{-28,66},{-52,90}})));
      Modelica.Blocks.Sources.Ramp     Tambient_HX(
        height=50,
        duration=10000,                                           y(unit="K"),
        offset=273.15 - 10,
        startTime=2000) "Temperature sources of the heat pump"
        annotation (Placement(transformation(extent={{-158,10},{-136,32}})));
      IDEAS.Fluid.Sensors.TemperatureTwoPort HP_Tout(
        redeclare package Medium = Medium,
        m_flow_nominal=m_flow,
        tau=0,
        allowFlowReversal=false) "Outlet temperature of the heat pump"
        annotation (Placement(transformation(extent={{-24,18},{-4,38}})));
      Modelica.Blocks.Sources.Step     Temp_ReturnWater(
        height=4,                                                      y(unit="K"),
        offset=273.15 + 10,
        startTime=13000)
        "Temperature of the water returning to the HP"
        annotation (Placement(transformation(extent={{-100,-64},{-74,-38}})));
    equation

      connect(AirWaterHP.heatPort, fixedTemperature.port) annotation (Line(
          points={{-65,16},{-64,16},{-64,-12},{-70,-12},{-70,-13},{-110,-13}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(pump.port_b, AirWaterHP.port_a) annotation (Line(
          points={{-34,-14},{-56,-14},{-56,20}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Tset_HP.y, AirWaterHP.TSet) annotation (Line(points={{-53.2,78},{
              -70.4,78},{-70.4,38}},
                               color={0,0,127}));
      connect(bou.ports[1], pump.port_a) annotation (Line(points={{52,2},{4,2},{4,
              -14},{-14,-14}},    color={0,127,255}));
      connect(TReturn.port, pump.heatPort) annotation (Line(points={{-40,-50},{-24,
              -50},{-24,-20.8}}, color={191,0,0}));
      connect(Tambient_HX.y, AirWaterHP.TSource) annotation (Line(points={{-134.9,
              21},{-108,21},{-108,25.2},{-81.74,25.2}},
                                                    color={0,0,127}));
      connect(HP_Tout.port_a, AirWaterHP.port_b) annotation (Line(points={{-24,28},
              {-40,28},{-40,32},{-56,32}},color={0,127,255}));
      connect(HP_Tout.port_b, bou.ports[2]) annotation (Line(points={{-4,28},{24,
              28},{24,-2},{52,-2}}, color={0,127,255}));
      connect(Temp_ReturnWater.y, TReturn.T) annotation (Line(points={{-72.7,-51},{-67.35,
              -51},{-67.35,-50},{-62,-50}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}})),
        experiment(StopTime=15000, Tolerance=1e-06),
        __Dymola_experimentSetupOutput,
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}})),
        Commands(file=
              "modelica://RTUPCM/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/BlackBox_Generic_TSetpoint_Cooling.mos"
            "Simulate and plot"),
        Documentation(info="<html>
<p>This example shows the modulation behaviour of an inverter controlled air-to-water heat pump when the inlet water temperature is changed. </p>
<p>The modulation level can be seen from heater.heatSource.modulation.</p>
</html>",     revisions="<html>
<ul>
<li>
June 5, 2018 by Filip Jorissen:<br/>
Cleaned up implementation for
<a href=\"https://github.com/open-ideas/IDEAS/issues/821\">#821</a>.
</li>
<li>March 2014 by Filip Jorissen:<br/> 
Annex60 compatibility
</li>
</ul>
</html>"));
    end BlackBox_Generic_TSetpoint_Cooling;

    model BlackBox_Generic_TSetpoint_Heating
      "Example model to test BlackBox_Generic_TSetpoint for heating mode"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater
        annotation (__Dymola_choicesAllMatching=true);

        IDEAS.Fluid.Movers.FlowControlled_m_flow pump(
        redeclare package Medium = Medium,
        tau=30,
        m_flow_nominal=m_flow,
        inputType=IDEAS.Fluid.Types.InputType.Constant,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        use_inputFilter=false)
        annotation (Placement(transformation(extent={{-14,-24},{-34,-4}})));
      hil_flexlab_model.HeatPumps.BlackBox_Generic_TSetpoint AirWaterHP(
        tauHeatLoss=3600,
        QNom=10528,
        redeclare package Medium = Medium,
        m_flow_nominal=m_flow,
        modulation_min=20,
        redeclare Data.BlackBox_Generic_TSetpoint.Aermec_ANKI045_60HZ_Heating
          energyPump)
        annotation (Placement(transformation(extent={{-74,14},{-56,34}})));

        //cDry=10000, this has been recorded as final parameter
        //mWater=4, this has been recorded as final parameter
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=
            293.15)
        annotation (Placement(transformation(extent={{-124,-20},{-110,-6}})));

      Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TReturn
        annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
      IDEAS.Fluid.Sources.Boundary_pT bou(
        redeclare package Medium = Medium,
        p=200000,
        T=298.15,
        nPorts=2) annotation (Placement(transformation(extent={{72,-10},{52,10}})));
      constant Modelica.SIunits.MassFlowRate m_flow=0.25
        "Nominal mass flow rate";
      Modelica.Blocks.Sources.Constant Tset_HP(k=273.15 + 35,y(unit="K"))
        "Temperature set point"
        annotation (Placement(transformation(extent={{-28,66},{-52,90}})));
      Modelica.Blocks.Sources.Ramp     Tambient_HX(
        height=50,
        duration=10000,                                           y(unit="K"),
        offset=273.15 - 10,
        startTime=2000) "Temperature sources of the heat pump"
        annotation (Placement(transformation(extent={{-158,10},{-136,32}})));
      IDEAS.Fluid.Sensors.TemperatureTwoPort HP_Tout(
        redeclare package Medium = Medium,
        m_flow_nominal=m_flow,
        tau=0,
        allowFlowReversal=false) "Outlet temperature of the heat pump"
        annotation (Placement(transformation(extent={{-24,18},{-4,38}})));
      Modelica.Blocks.Sources.Step     Temp_ReturnWater(
        height=4,                                                      y(unit="K"),
        offset=273.15 + 28,
        startTime=13000)
        "Temperature of the water returning to the HP"
        annotation (Placement(transformation(extent={{-100,-64},{-74,-38}})));
    equation

      connect(AirWaterHP.heatPort, fixedTemperature.port) annotation (Line(
          points={{-65,14},{-64,14},{-64,-12},{-70,-12},{-70,-13},{-110,-13}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(pump.port_b, AirWaterHP.port_a) annotation (Line(
          points={{-34,-14},{-56,-14},{-56,18}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Tset_HP.y, AirWaterHP.TSet) annotation (Line(points={{-53.2,78},{-70.4,
              78},{-70.4,36}}, color={0,0,127}));
      connect(bou.ports[1], pump.port_a) annotation (Line(points={{52,2},{4,2},{4,
              -14},{-14,-14}},    color={0,127,255}));
      connect(TReturn.port, pump.heatPort) annotation (Line(points={{-40,-50},{-24,
              -50},{-24,-20.8}}, color={191,0,0}));
      connect(Tambient_HX.y, AirWaterHP.TSource) annotation (Line(points={{-134.9,21},
              {-108,21},{-108,23.2},{-81.74,23.2}}, color={0,0,127}));
      connect(HP_Tout.port_a, AirWaterHP.port_b) annotation (Line(points={{-24,28},{
              -40,28},{-40,30},{-56,30}}, color={0,127,255}));
      connect(HP_Tout.port_b, bou.ports[2]) annotation (Line(points={{-4,28},{24,
              28},{24,-2},{52,-2}}, color={0,127,255}));
      connect(Temp_ReturnWater.y, TReturn.T) annotation (Line(points={{-72.7,-51},{-67.35,
              -51},{-67.35,-50},{-62,-50}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}})),
        experiment(StopTime=15000, Tolerance=1e-06),
        __Dymola_experimentSetupOutput,
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}})),
        Commands(file=
              "modelica://RTUPCM/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/BlackBox_Generic_TSetpoint_Heating.mos"
            "Simulate and plot"),
        Documentation(info="<html>
<p>This example shows the modulation behaviour of an inverter controlled air-to-water heat pump when the inlet water temperature is changed. </p>
<p>The modulation level can be seen from heater.heatSource.modulation.</p>
</html>",     revisions="<html>
<ul>
<li>
June 5, 2018 by Filip Jorissen:<br/>
Cleaned up implementation for
<a href=\"https://github.com/open-ideas/IDEAS/issues/821\">#821</a>.
</li>
<li>March 2014 by Filip Jorissen:<br/> 
Annex60 compatibility
</li>
</ul>
</html>"));
    end BlackBox_Generic_TSetpoint_Heating;
    annotation ();
  end Examples;
end HeatPumps;
