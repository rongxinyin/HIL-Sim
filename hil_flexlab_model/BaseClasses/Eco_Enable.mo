within hil_flexlab_model.BaseClasses;
block Eco_Enable "Multi zone VAV AHU economizer enable/disable switch"

  parameter Boolean use_enthalpy = true
    "Set to true to evaluate outdoor air enthalpy in addition to temperature"
    annotation(Dialog(group="Conditional"));
  parameter Real delTOutHis(
    final unit="K",
    final displayUnit="K",
    final quantity="TemperatureDifference")=1
    "Delta between the temperature hysteresis high and low limit"
    annotation(Dialog(tab="Advanced", group="Hysteresis"));
  parameter Real delEntHis(
    final unit="J/kg",
    final quantity="SpecificEnergy")=1000
    "Delta between the enthalpy hysteresis high and low limits"
    annotation(Dialog(tab="Advanced", group="Hysteresis", enable = use_enthalpy));
  parameter Real retDamFulOpeTim(
    final unit="s",
    final quantity="Time")=180
    "Time period to keep RA damper fully open before releasing it for minimum outdoor airflow control
    at disable to avoid pressure fluctuations"
    annotation(Dialog(tab="Advanced", group="Delays at disable"));
  parameter Real disDel(
    final unit="s",
    final quantity="Time")=15
    "Short time delay before closing the OA damper at disable to avoid pressure fluctuations"
    annotation(Dialog(tab="Advanced", group="Delays at disable"));

  Buildings.Controls.OBC.CDL.Interfaces.RealInput TOut(
    final unit="K",
    final displayUnit="degC",
    final quantity = "ThermodynamicTemperature")
    "Outdoor air temperature"
    annotation (Placement(transformation(extent={{-320,250},{-280,290}}),
        iconTransformation(extent={{-140,80},{-100,120}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TOutCut(
    final unit="K",
    final displayUnit="degC",
    final quantity = "ThermodynamicTemperature")
    "OA temperature high limit cutoff. For differential dry bulb temeprature condition use return air temperature measurement"
    annotation (Placement(transformation(extent={{-320,210},{-280,250}}),
        iconTransformation(extent={{-140,60},{-100,100}})));

  Buildings.Controls.OBC.CDL.Interfaces.RealInput uOutDamPosMin(
    final unit="1",
    final min=0,
    final max=1)
    "Minimum outdoor air damper position, output from damper position limits sequence"
    annotation (Placement(transformation(extent={{-320,-80},{-280,-40}}),
        iconTransformation(extent={{-140,-60},{-100,-20}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput uOutDamPosMax(
    final unit="1",
    final min=0,
    final max=1)
    "Maximum outdoor air damper position, output from damper position limits sequence"
    annotation (Placement(transformation(extent={{-320,-40},{-280,0}}),
        iconTransformation(extent={{-140,-40},{-100,0}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput uRetDamPosMax(
    final unit="1",
    final min=0,
    final max=1)
    "Maximum return air damper position, output from damper position limits sequence"
    annotation (Placement(transformation(extent={{-320,-160},{-280,-120}}),
        iconTransformation(extent={{-140,-100},{-100,-60}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput uRetDamPosMin(
    final unit="1",
    final min=0,
    final max=1)
    "Minimum return air damper position, output from damper position limits sequence"
    annotation (Placement(transformation(extent={{-320,-200},{-280,-160}}),
        iconTransformation(extent={{-140,-120},{-100,-80}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanInput uSupFan
    "Supply fan on/off status signal"
    annotation (Placement(transformation(extent={{-320,80},{-280,120}}),
        iconTransformation(extent={{-140,0},{-100,40}})));

  Buildings.Controls.OBC.CDL.Interfaces.RealOutput yOutDamPosMax(
    final unit="1",
    final min=0,
    final max=1) "Maximum outdoor air damper position"
    annotation (Placement(transformation(extent={{220,40},{260,80}}),
        iconTransformation(extent={{100,40},{140,80}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealOutput yRetDamPosMin(
    final unit="1",
    final min=0,
    final max=1) "Minimum return air damper position"
    annotation (Placement(transformation(extent={{220,-80},{260,-40}}),
        iconTransformation(extent={{100,-80},{140,-40}})));

  Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol(
    trueHoldDuration=600) "10 min on/off delay"
    annotation (Placement(transformation(extent={{0,200},{20,220}})));

protected
  final parameter Real TOutHigLimCutHig(
    final unit="K",
    final displayUnit="K",
    final quantity="TemperatureDifference")= 0
    "Hysteresis high limit cutoff";
  final parameter Real TOutHigLimCutLow = TOutHigLimCutHig - delTOutHis
    "Hysteresis low limit cutoff";
  final parameter Real hOutHigLimCutHig(
    final unit="J/kg",
    final quantity="SpecificEnergy")= 0
    "Hysteresis block high limit cutoff";
  final parameter Real hOutHigLimCutLow = hOutHigLimCutHig - delEntHis
    "Hysteresis block low limit cutoff";

  Buildings.Controls.OBC.CDL.Continuous.Add add1(
    final k2=-1) "Add block determines difference between TOut and TOutCut"
    annotation (Placement(transformation(extent={{-140,240},{-120,260}})));
  Buildings.Controls.OBC.CDL.Continuous.Hysteresis hysOutTem(
    final uLow=TOutHigLimCutLow,
    final uHigh=TOutHigLimCutHig)
    "Outdoor air temperature hysteresis for both fixed and differential dry bulb temperature cutoff conditions"
    annotation (Placement(transformation(extent={{-98,240},{-78,260}})));
  Buildings.Controls.OBC.CDL.Logical.Switch outDamSwitch
    "Set maximum OA damper position to minimum at disable (after a given time delay)"
    annotation (Placement(transformation(extent={{62,-60},{82,-40}})));
  Buildings.Controls.OBC.CDL.Logical.Switch retDamSwitch "Set minimum RA damper position to maximum at disable"
    annotation (Placement(transformation(extent={{-40,-162},{-20,-142}})));
  Buildings.Controls.OBC.CDL.Logical.Switch minRetDamSwitch
    "Keep minimum RA damper position at physical maximum for a short time period after disable"
    annotation (Placement(transformation(extent={{40,-160},{60,-140}})));
  Buildings.Controls.OBC.CDL.Logical.Not not2 "Logical not that starts the timer at disable signal "
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Buildings.Controls.OBC.CDL.Logical.And  and2 "Logical and"
    annotation (Placement(transformation(extent={{140,-80},{160,-60}})));
  Buildings.Controls.OBC.CDL.Logical.And and1 "Logical and checks supply fan status"
    annotation (Placement(transformation(extent={{0,100},{20,120}})));
  Buildings.Controls.OBC.CDL.Logical.And and3 "Logical and which checks supply fan status"
    annotation (Placement(transformation(extent={{20,-36},{40,-16}})));

  Buildings.Controls.OBC.CDL.Logical.TrueDelay delOutDamOsc(
    final delayTime=disDel)
    "Small delay before closing the outdoor air damper to avoid pressure fluctuations"
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Buildings.Controls.OBC.CDL.Logical.TrueDelay delRetDam(
    final delayTime=retDamFulOpeTim)
    "Keep return damper open to its physical maximum for a short period of time before closing the outdoor air damper and resuming the maximum return air damper position, per G36 Part N7"
    annotation (Placement(transformation(extent={{-40,-90},{-20,-70}})));
  Buildings.Controls.OBC.CDL.Logical.Not not1 "Logical not"
    annotation (Placement(transformation(extent={{0,-90},{20,-70}})));

equation
  connect(TOut, add1.u1)
    annotation (Line(points={{-300,270},{-270,270},{-270,256},{-142,256}},color={0,0,127}));
  connect(TOutCut, add1.u2)
    annotation (Line(points={{-300,230},{-252,230},{-252,244},{-142,244}},color={0,0,127}));
  connect(add1.y, hysOutTem.u)
    annotation (Line(points={{-118,250},{-100,250}}, color={0,0,127}));
  connect(uOutDamPosMin, outDamSwitch.u1)
    annotation (Line(points={{-300,-60},{-10,-60},{-10,-42},{60,-42}},color={0,0,127}));
  connect(uOutDamPosMax, outDamSwitch.u3)
    annotation (Line(points={{-300,-20},{-240,-20},{-240,-58},{60,-58}},color={0,0,127}));
  connect(and2.y, minRetDamSwitch.u2)
    annotation (Line(points={{162,-70},{170,-70},{170,-130},{20,-130},{20,-150},
      {38,-150}}, color={255,0,255}));
  connect(not2.y, retDamSwitch.u2)
    annotation (Line(points={{-58,-30},{-50,-30},{-50,-152},{-42,-152}},color={255,0,255}));
  connect(uRetDamPosMax, retDamSwitch.u1)
    annotation (Line(points={{-300,-140},{-240,-140},{-240,-144},{-42,-144}},color={0,0,127}));
  connect(uRetDamPosMin, retDamSwitch.u3)
    annotation (Line(points={{-300,-180},{-172,-180},{-172,-160},{-42,-160}},color={0,0,127}));
  connect(retDamSwitch.y, minRetDamSwitch.u3)
    annotation (Line(points={{-18,-152},{0,-152},{0,-158},{38,-158}},color={0,0,127}));
  connect(truFalHol.y, and1.u1)
    annotation (Line(points={{22,210},{30,210},{30,130},{-10,130},{-10,110},
      {-2,110}}, color={255,0,255}));
  connect(uSupFan, and1.u2)
    annotation (Line(points={{-300,100},{-152,100},{-152,102},{-2,102}},color={255,0,255}));
  connect(outDamSwitch.u2, and3.y)
    annotation (Line(points={{60,-50},{50,-50},{50,-26},{42,-26}},color={255,0,255}));
  connect(not2.y, and3.u1)
    annotation (Line(points={{-58,-30},{-50,-30},{-50,-4},{8,-4},{8,-26},{18,-26}},
    color={255,0,255}));
  connect(and2.u1, not2.y)
    annotation (Line(points={{138,-70},{104,-70},{104,-4},{-52,-4},{-52,-30},{
          -58,-30}},
                  color={255,0,255}));
  connect(and3.u2, delOutDamOsc.y)
    annotation (Line(points={{18,-34},{0,-34},{0,-30},{-18,-30}},color={255,0,255}));
  connect(delOutDamOsc.u, not2.y)
    annotation (Line(points={{-42,-30},{-46,-30},{-46,-30},{-50,-30},{-50,-30},
      {-58,-30}}, color={255,0,255}));
  connect(not2.y, delRetDam.u)
    annotation (Line(points={{-58,-30},{-50,-30},{-50,-80},{-42,-80}},color={255,0,255}));
  connect(delRetDam.y, not1.u)
    annotation (Line(points={{-18,-80},{-14,-80},{-14,-80},{-10,-80},{-10,-80},
      {-2,-80}}, color={255,0,255}));
  connect(not1.y, and2.u2)
    annotation (Line(points={{22,-80},{78,-80},{78,-78},{138,-78}},color={255,0,255}));
  connect(outDamSwitch.y, yOutDamPosMax)
    annotation (Line(points={{84,-50},{170,-50},{170,60},{240,60}}, color={0,0,127}));
  connect(minRetDamSwitch.y, yRetDamPosMin)
    annotation (Line(points={{62,-150},{190,-150},{190,-60},{240,-60}}, color={0,0,127}));

  connect(hysOutTem.y, truFalHol.u) annotation (Line(points={{-76,250},{-38,250},
          {-38,210},{-2,210}}, color={255,0,255}));
  connect(not2.u, and1.y) annotation (Line(points={{-82,-30},{46,-30},{46,110},
          {22,110}}, color={255,0,255}));
  connect(minRetDamSwitch.u1, retDamSwitch.y) annotation (Line(points={{38,-142},
          {8,-142},{8,-152},{-18,-152}}, color={0,0,127}));
annotation (
    defaultComponentName = "enaDis",
    Icon(graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-174,142},{154,104}},
          lineColor={0,0,127},
          textString="%name"),
        Line(
          points={{0,60},{80,60}},
          color={0,0,127},
          thickness=0.5),
        Line(
          points={{-80,-60},{0,-60},{0,60}},
          color={0,0,127},
          thickness=0.5)}),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-280,-240},{220,280}},
        initialScale=0.05),              graphics={
        Rectangle(
          extent={{-256,24},{204,-224}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-260,136},{200,84}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-260,272},{200,144}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
                                     Text(
          extent={{102,168},{184,156}},
          lineColor={0,0,0},
          horizontalAlignment=TextAlignment.Left,
          textString="Outdoor air
conditions"),                        Text(
          extent={{100,-180},{268,-228}},
          lineColor={0,0,0},
          horizontalAlignment=TextAlignment.Left,
          textString="Damper position
limit assignments
with delays"),                   Text(
          extent={{100,102},{194,92}},
          lineColor={0,0,0},
          horizontalAlignment=TextAlignment.Left,
          textString="Supply fan status")}),
Documentation(info="<html>
<p>
This is a multi zone VAV AHU economizer enable/disable sequence
based on ASHRAE G36 PART 5.N.7 and PART 5.A.17. Additional
conditions included in the sequence are: freeze protection (freeze protection
stage 0-3, see PART 5.N.12), supply fan status (on or off, see PART 5.N.5).
</p>
<p>
The economizer is disabled whenever the outdoor air conditions
exceed the economizer high limit setpoint.
This sequence allows for all device types listed in
ASHRAE 90.1-2013 and Title 24-2013.
</p>
<p>
In addition, the economizer gets disabled without a delay whenever any of the
following is <code>true</code>:
</p>
<ul>
<li>
The supply fan is off (<code>uSupFan = false</code>),
</li>
<li>
the freeze protection stage
<a href=\"modelica://Buildings.Controls.OBC.ASHRAE.G36_PR1.Types.FreezeProtectionStages\">
Buildings.Controls.OBC.ASHRAE.G36_PR1.Types.FreezeProtectionStages</a>
is not <code>stage0</code>.
</li>
</ul>
<p>
The following state machine chart illustrates the transitions between enabling and disabling:
</p>
<p align=\"center\">
<img alt=\"Image of economizer enable-disable state machine chart\"
src=\"modelica://Buildings/Resources/Images/Controls/OBC/ASHRAE/G36_PR1/AHUs/MultiZone/EconEnableDisableStateMachineChart.png\"/>
</p>
<p>
After the disable signal is activated, the following procedure is applied, per PART 5.N.7.d, in order to
prevent pressure fluctuations in the HVAC system:
</p>
<ul>
<li>
The return damper gets fully opened (<code>yRetDamPosMax = uRetDamPhyPosMax</code> and
<code>yRetDamPosMin = uRetDamPhyPosMax</code>) for <code>retDamFulOpeTim</code>
time period, after which the return damper gets released to its minimum outdoor airflow control position
(<code>yRetDamPosMax = uRetDamPosMax</code> and <code>yRetDamPosMin = uRetDamPosMax</code>).
</li>
<li>
The outdoor air damper is closed to its minimum outoor airflow control limit (<code>yOutDamPosMax = uOutDamPosMin</code>)
after a <code>disDel</code> time delay.
</li>
</ul>
<p>
This sequence also has an overwrite of the damper positions to track
a minimum mixed air temperature of <code>TFreSet</code>, which is
by default set to <i>4</i>&deg;C (<i>39.2</i> F).
This is implemented using a proportional controller with a default deadband of
<i>1</i> K, which can be adjusted using the parameter <code>kPFrePro</code>.
</p>
</html>", revisions="<html>
<ul>
<li>
October 13, 2017, by Michael Wetter:<br/>
Added freeze protection that tracks mixed air temperature.
</li>
<li>
August 3, 2017, by Michael Wetter:<br/>
Removed unrequired input into block <code>and2</code> as this input
was always <code>true</code> if <code>and2.u2 = true</code>.
</li>
<li>
June 27, 2017, by Milica Grahovac:<br/>
First implementation.
</li>
</ul>
</html>"));
end Eco_Enable;
