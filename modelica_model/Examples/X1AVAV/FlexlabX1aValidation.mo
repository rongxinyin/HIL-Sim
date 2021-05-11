within Buildings.Examples.VAVReheat;
model FlexlabX1aValidation
  "Variable air volume flow system with terminal reheat and five thermal zones at Flexlab X1 cell"
  extends Modelica.Icons.Example;
  extends Buildings.Examples.VAVReheat.BaseClasses.PartialOpenLoopX1aV1;

  parameter Modelica.SIunits.VolumeFlowRate VPriSysMax_flow=m_flow_nominal/1.2
    "Maximum expected system primary airflow rate at design stage";
  parameter Modelica.SIunits.VolumeFlowRate minZonPriFlo[numZon]={
      mCor_flow_nominal,mSou_flow_nominal,mPle_flow_nominal,mNor_flow_nominal}/1.2 "Minimum expected zone primary flow rate";
  parameter Modelica.SIunits.Time samplePeriod=120
    "Sample period of component, set to the same value as the trim and respond that process yPreSetReq";
  parameter Modelica.SIunits.PressureDifference dpDisRetMax=40
    "Maximum return fan discharge static pressure setpoint";

  Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Controller conVAVNor(
    V_flow_nominal=mNor_flow_nominal,
    AFlo=AFloNor,
    final samplePeriod=samplePeriod) "Controller for terminal unit north zone"
    annotation (Placement(transformation(extent={{602,54},{622,74}})));
  Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Controller conVAVCor(
    V_flow_nominal=mCor_flow_nominal/1.2,
    AFlo=AFloCor,
    final samplePeriod=samplePeriod) "Controller for terminal unit mid zone"
    annotation (Placement(transformation(extent={{880,58},{900,78}})));
  Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.Controller conVAVSou(
    V_flow_nominal=mSou_flow_nominal/1.2,
    AFlo=AFloSou,
    final samplePeriod=samplePeriod) "Controller for terminal unit south zone"
    annotation (Placement(transformation(extent={{1040,30},{1060,50}})));
  Buildings.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.Controller conAHU(
    numZon=numZon,
    VPriSysMax_flow=VPriSysMax_flow,
    minZonPriFlo=minZonPriFlo,
    AFlo=AFlo,
    yFanMin=yFanMin,
    pMaxSet=410) "AHU controller"
    annotation (Placement(transformation(extent={{384,362},{424,470}})));
  Buildings.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.ModeAndSetPoints TZonSet(
    TZonHeaOn=THeaOn,
    TZonHeaOff=THeaOff,
    TZonCooOff=TCooOff,
    numZon=numZon) "Zone temperature set points" annotation (Placement(
        transformation(rotation=0, extent={{60,300},{80,320}})));
  Modelica.Blocks.Routing.Multiplex4 TDis "Discharge air temperatures"
    annotation (Placement(transformation(extent={{220,280},{240,300}})));
  Modelica.Blocks.Routing.Multiplex4 VDis_flow
    "Air flow rate at the terminal boxes"
    annotation (Placement(transformation(extent={{220,240},{240,260}})));
  Buildings.Controls.OBC.CDL.Integers.MultiSum TZonResReq(nin=3)
    "Number of zone temperature requests"
    annotation (Placement(transformation(extent={{302,364},{322,384}})));
  Buildings.Controls.OBC.CDL.Integers.MultiSum PZonResReq(nin=3)
    "Number of zone pressure requests"
    annotation (Placement(transformation(extent={{300,320},{320,340}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yOutDam(k=1)
    "Outdoor air damper control signal"
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));

  Buildings.Controls.OBC.CDL.Logical.Switch swiFreSta "Switch for freeze stat"
    annotation (Placement(transformation(extent={{60,-202},{80,-182}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant freStaSetPoi1(k=273.15
         + 3) "Freeze stat for heating coil"
    annotation (Placement(transformation(extent={{-40,-96},{-20,-76}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yFreHeaCoi(final k=1)
    "Flow rate signal for heating coil when freeze stat is on"
    annotation (Placement(transformation(extent={{0,-192},{20,-172}})));
equation
  connect(fanSup.port_b, dpDisSupFan.port_a) annotation (Line(
      points={{320,-40},{320,0},{320,-10},{320,-10}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
  connect(conVAVNor.TZon, TRooAir.y1[1]) annotation (Line(
      points={{601,63},{690,63},{690,40},{632,40},{632,177},{511,177}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TRooAir.y2[1], conVAVCor.TZon) annotation (Line(
      points={{511,170},{868,170},{868,67},{879,67}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TRooAir.y3[1], conVAVSou.TZon) annotation (Line(
      points={{511,163},{1028,163},{1028,39},{1039,39}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TSupNor.T, conVAVNor.TDis) annotation (Line(points={{695,92},{724,92},
          {724,61},{601,61}}, color={0,0,127}));
  connect(TSupCor.T, conVAVCor.TDis) annotation (Line(points={{823,94},{872,94},
          {872,65},{879,65}}, color={0,0,127}));
  connect(TSupSou.T, conVAVSou.TDis) annotation (Line(points={{1069,90},{1032,
          90},{1032,37},{1039,37}}, color={0,0,127}));
  connect(conVAVNor.yDam,nor.yVAV)  annotation (Line(points={{623,70},{732,70},
          {732,48},{692,48}},color={0,0,127}));
  connect(conVAVNor.yVal,nor.yVal)  annotation (Line(points={{623,65},{732,65},
          {732,32},{692,32}},   color={0,0,127}));
  connect(conVAVCor.yVal, cor.yVal) annotation (Line(points={{901,69},{912.5,69},
          {912.5,36},{820,36}}, color={0,0,127}));
  connect(conVAVCor.yDam, cor.yVAV) annotation (Line(points={{901,74},{910,74},
          {910,52},{820,52}}, color={0,0,127}));
  connect(conVAVSou.yDam, sou.yVAV) annotation (Line(points={{1061,46},{1072.5,
          46},{1072.5,44},{1066,44}}, color={0,0,127}));
  connect(conVAVSou.yVal, sou.yVal) annotation (Line(points={{1061,41},{1072.5,
          41},{1072.5,28},{1066,28}}, color={0,0,127}));

  connect(conVAVNor.TZonHeaSet, TZonSet.TZonHeaSet[2]) annotation (Line(points={{601,69},
          {416,69},{416,312.75},{81,312.75}},     color={0,0,127}));
  connect(conVAVNor.TZonCooSet, TZonSet.TZonCooSet[2]) annotation (Line(points={{601,67},
          {416,67},{416,316.75},{81,316.75}},     color={0,0,127}));
  connect(conVAVCor.TZonHeaSet, TZonSet.TZonHeaSet[3]) annotation (Line(points=
          {{879,73},{850,73},{850,313.25},{81,313.25}}, color={0,0,127}));
  connect(conVAVCor.TZonCooSet, TZonSet.TZonCooSet[3]) annotation (Line(points=
          {{879,71},{850,71},{850,317.25},{81,317.25}}, color={0,0,127}));
  connect(conVAVSou.TZonHeaSet, TZonSet.TZonHeaSet[4]) annotation (Line(points=
          {{1039,45},{1020,45},{1020,313.75},{81,313.75}}, color={0,0,127}));
  connect(conVAVSou.TZonCooSet, TZonSet.TZonCooSet[4]) annotation (Line(points=
          {{1039,43},{1020,43},{1020,317.75},{81,317.75}}, color={0,0,127}));
  connect(TZonSet.uOcc, occSch.occupied) annotation (Line(points={{59,306.025},
          {-92,306.025},{-92,306},{-240,306},{-240,-216},{-297,-216}},color={
          255,0,255}));
  connect(occSch.tNexOcc, TZonSet.tNexOcc) annotation (Line(points={{-297,-204},
          {-254,-204},{-254,318},{59,318}}, color={0,0,127}));
  connect(TZonSet.TZon, flo.TRooAir) annotation (Line(points={{59,315},{46,315},
          {46,628},{1164,628},{1164,494.94},{1028.86,494.94}},            color=
         {0,0,127}));
  connect(conAHU.TZonHeaSet, TZonSet.TZonHeaSet[1]) annotation (Line(points={{383,468},
          {110,468},{110,312.25},{81,312.25}},    color={0,0,127}));
  connect(conAHU.TZonCooSet, TZonSet.TZonCooSet[1]) annotation (Line(points={{383,464},
          {120,464},{120,316.25},{81,316.25}},    color={0,0,127}));
  connect(conAHU.TZon, flo.TRooAir) annotation (Line(points={{383,452},{280,452},
          {280,622},{1164,622},{1164,494.94},{1028.86,494.94}},
        color={0,0,127}));
  connect(conAHU.TOut, TOut.y) annotation (Line(points={{383,456},{-266,456},{-266,
          180},{-279,180}},                color={0,0,127}));
  connect(TRet.T, conAHU.TOutCut) annotation (Line(points={{100,151},{100,436},{
          383,436}},                   color={0,0,127}));
  connect(conAHU.TSup, TSup.T) annotation (Line(points={{383,422},{152,422},{152,
          -20},{340,-20},{340,-29}},               color={0,0,127}));
  connect(dpDisSupFan.p_rel, conAHU.ducStaPre) annotation (Line(points={{311,0},
          {160,0},{160,406},{383,406}},             color={0,0,127}));
  connect(conAHU.uOpeMod, TZonSet.yOpeMod) annotation (Line(points={{383,388},{130,
          388},{130,307},{81,307}},                   color={255,127,0}));
  connect(conAHU.TDis, TDis.y) annotation (Line(points={{383,444},{252,444},{252,
          290},{241,290}},               color={0,0,127}));
  connect(conAHU.VDis_flow, VDis_flow.y) annotation (Line(points={{383,400},{260,
          400},{260,250},{241,250}},                   color={0,0,127}));
  connect(conVAVNor.uOpeMod, TZonSet.yOpeMod) annotation (Line(points={{601,57},
          {592,57},{592,16},{322,16},{322,307},{81,307}},
        color={255,127,0}));
  connect(conVAVCor.uOpeMod, TZonSet.yOpeMod) annotation (Line(points={{879,61},
          {868,61},{868,16},{420,16},{420,200},{130,200},{130,307},{81,307}},
        color={255,127,0}));
  connect(conVAVSou.uOpeMod, TZonSet.yOpeMod) annotation (Line(points={{1039,33},
          {1032,33},{1032,16},{420,16},{420,200},{130,200},{130,307},{81,307}},
        color={255,127,0}));
  connect(conAHU.uZonTemResReq, TZonResReq.y) annotation (Line(points={{383,378},
          {352,378},{352,374},{323.7,374}},              color={255,127,0}));
  connect(conVAVNor.yZonTemResReq, TZonResReq.u[1]) annotation (Line(points={{623,60},
          {726,60},{726,220},{536,220},{536,378.667},{300,378.667}},     color=
          {255,127,0}));
  connect(conVAVCor.yZonTemResReq, TZonResReq.u[2]) annotation (Line(points={{
          901,64},{904,64},{904,220},{280,220},{280,374},{300,374}}, color={255,
          127,0}));
  connect(conVAVSou.yZonTemResReq, TZonResReq.u[3]) annotation (Line(points={{1061,36},
          {1064,36},{1064,220},{280,220},{280,369.333},{300,369.333}},
        color={255,127,0}));
  connect(conVAVNor.yZonPreResReq, PZonResReq.u[1]) annotation (Line(points={{623,56},
          {734,56},{734,206},{542,206},{542,334.667},{298,334.667}},     color=
          {255,127,0}));
  connect(conVAVCor.yZonPreResReq, PZonResReq.u[2]) annotation (Line(points={{
          901,60},{906,60},{906,214},{288,214},{288,330},{298,330}}, color={255,
          127,0}));
  connect(conVAVSou.yZonPreResReq, PZonResReq.u[3]) annotation (Line(points={{1061,32},
          {1066,32},{1066,214},{288,214},{288,325.333},{298,325.333}},
        color={255,127,0}));
  connect(conAHU.uZonPreResReq, PZonResReq.y) annotation (Line(points={{383,372},
          {360,372},{360,330},{321.7,330}},              color={255,127,0}));
  connect(VSupCor_flow.V_flow, VDis_flow.u1[1]) annotation (Line(points={{823,132},
          {472,132},{472,206},{180,206},{180,259},{218,259}},      color={0,0,
          127}));
  connect(VSupNor_flow.V_flow, VDis_flow.u2[1]) annotation (Line(points={{695,130},
          {742,130},{742,206},{180,206},{180,253},{218,253}},      color={0,0,
          127}));
  connect(VSupCor_flow.V_flow, VDis_flow.u3[1]) annotation (Line(points={{823,132},
          {914,132},{914,206},{180,206},{180,247},{218,247}},      color={0,0,
          127}));
  connect(VSupSou_flow.V_flow, VDis_flow.u4[1]) annotation (Line(points={{1069,
          128},{1080,128},{1080,206},{180,206},{180,241},{218,241}}, color={0,0,
          127}));
  connect(TSupCor.T, TDis.u1[1]) annotation (Line(points={{823,94},{466,94},{
          466,210},{176,210},{176,299},{218,299}}, color={0,0,127}));
  connect(TSupNor.T, TDis.u2[1]) annotation (Line(points={{695,92},{720,92},{
          720,92},{688,92},{688,210},{176,210},{176,293},{218,293}}, color={0,0,
          127}));
  connect(TSupCor.T, TDis.u3[1]) annotation (Line(points={{823,94},{872,94},{
          872,210},{176,210},{176,287},{218,287}}, color={0,0,127}));
  connect(TSupSou.T, TDis.u4[1]) annotation (Line(points={{1069,90},{1032,90},{
          1032,210},{176,210},{176,281},{218,281}}, color={0,0,127}));
  connect(conAHU.yOutDamPos, eco.yOut) annotation (Line(points={{425,426},{450,426},
          {450,36},{-10,36},{-10,-34}},                        color={0,0,127}));
  connect(VSupNor_flow.V_flow,conVAVNor. VDis_flow) annotation (Line(points={{695,130},
          {724,130},{724,65},{601,65}},      color={0,0,127}));
  connect(VSupCor_flow.V_flow, conVAVCor.VDis_flow) annotation (Line(points={{
          823,132},{874,132},{874,69},{879,69}}, color={0,0,127}));
  connect(VSupSou_flow.V_flow, conVAVSou.VDis_flow) annotation (Line(points={{
          1069,128},{1034,128},{1034,41},{1039,41}}, color={0,0,127}));
  connect(TSup.T,conVAVNor. TSupAHU) annotation (Line(points={{340,-29},{340,
          -20},{546,-20},{546,59},{601,59}},
                                        color={0,0,127}));
  connect(TSup.T, conVAVCor.TSupAHU) annotation (Line(points={{340,-29},{340,
          -20},{864,-20},{864,63},{879,63}}, color={0,0,127}));
  connect(TSup.T, conVAVSou.TSupAHU) annotation (Line(points={{340,-29},{340,-20},
          {1028,-20},{1028,35},{1039,35}}, color={0,0,127}));
  connect(VOut1.V_flow, conAHU.VOut_flow) annotation (Line(points={{-61,-20.9},{
          -61,410},{383,410}},             color={0,0,127}));
  connect(fanSup.y, conAHU.ySupFanSpe) annotation (Line(points={{310,-28},{310,-14},
          {460,-14},{460,438.4},{425,438.4}},              color={0,0,127}));
  connect(conAHU.yCoo, gaiCooCoi.u) annotation (Line(points={{425,376},{446,376},
          {446,-274},{88,-274},{88,-248},{98,-248}},              color={0,0,
          127}));
  connect(conAHU.TMix, TMix.T) annotation (Line(points={{383,396},{40,396},{40,-29}},
                    color={0,0,127}));
  connect(conAHU.yRetDamPos, eco.yRet) annotation (Line(points={{425,414},{436,414},
          {436,40},{-16.8,40},{-16.8,-34}},                        color={0,0,
          127}));
  connect(yOutDam.y, eco.yExh)
    annotation (Line(points={{-19,-10},{-3,-10},{-3,-34}}, color={0,0,127}));
  connect(conAHU.yHea, swiFreSta.u3) annotation (Line(points={{425,388},{458,388},
          {458,-280},{48,-280},{48,-200},{58,-200}},               color={0,0,
          127}));
  connect(swiFreSta.y, gaiHeaCoi.u) annotation (Line(points={{81,-192},{88,-192},
          {88,-210},{98,-210}}, color={0,0,127}));
  connect(freSta.y, swiFreSta.u2) annotation (Line(points={{21,-92},{40,-92},{
          40,-192},{58,-192}}, color={255,0,255}));
  connect(yFreHeaCoi.y, swiFreSta.u1) annotation (Line(points={{21,-182},{40,-182},
          {40,-184},{58,-184}}, color={0,0,127}));
  connect(nor.yVAV, conVAVNor.yVal) annotation (Line(points={{692,48},{732,48},
          {732,65},{623,65}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-380,-320},{1400,
            640}}), graphics={Line(
          points={{508,144}},
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
</p>
<p>
See the model
<a href=\"modelica://Buildings.Examples.VAVReheat.BaseClasses.PartialOpenLoopFlexlabX1a\">
Buildings.Examples.VAVReheat.BaseClasses.PartialOpenLoopFlexlabX1a</a>
for a description of the HVAC system and the building envelope.
</p>
<p>
The control is based on ASHRAE Guideline 36, and implemented
using the sequences from the library
<a href=\"modelica://Buildings.Controls.OBC.ASHRAE.G36_PR1\">
Buildings.Controls.OBC.ASHRAE.G36_PR1</a> for
multi-zone VAV systems with economizer. The schematic diagram of the HVAC and control
sequence is shown in the figure below.
</p>
<p align=\"center\">
<img alt=\"image\" src=\"modelica://Buildings/Resources/Images/Examples/VAVReheat/vavControlSchematics.png\" border=\"1\"/>
</p>
<p>
A similar model but with a different control sequence can be found in
<a href=\"modelica://Buildings.Examples.VAVReheat.ASHRAE2006\">
Buildings.Examples.VAVReheat.ASHRAE2006</a>.
Note that this model, because of the frequent time sampling,
has longer computing time than
<a href=\"modelica://Buildings.Examples.VAVReheat.ASHRAE2006\">
Buildings.Examples.VAVReheat.ASHRAE2006</a>.
The reason is that the time integrator cannot make large steps
because it needs to set a time step each time the control samples
its input.
</p>
</html>", revisions="<html>
<ul>
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
    __Dymola_Commands(file=
          "modelica://Buildings/Resources/Scripts/Dymola/Examples/VAVReheat/Guideline36.mos"
        "Simulate and plot"),
    experiment(
      StopTime=86400,
      __Dymola_NumberOfIntervals=24,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FlexlabX1aValidation;
