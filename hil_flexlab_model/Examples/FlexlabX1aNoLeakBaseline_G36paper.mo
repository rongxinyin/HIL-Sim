within hil_flexlab_model.Examples;
model FlexlabX1aNoLeakBaseline_G36paper
  "Variable air volume flow system with terminal reheat - flexlab baseline, no leakage"
  extends Modelica.Icons.Example;
  extends BaseClasses.PartialOpenLoopX1aV020123(occSch(
      occupancy={0,86399},
      firstEntryOccupied=true,
      period=86400), fanSup(per(use_powerCharacteristic=true, power(V_flow={
              0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4}, P={367,396,425,454,483,512,
              541,570}))));

  Modelica.Blocks.Sources.Constant TSupSetHea(y(
      final quantity="ThermodynamicTemperature",
      final unit="K",
      displayUnit="degC",
      min=0), k=273.15 + 10) "Supply air temperature setpoint for heating"
    annotation (Placement(transformation(extent={{-232,-170},{-212,-150}})));
  Buildings.Examples.VAVReheat.Controls.FanVFD conFanSup(xSet_nominal(
        displayUnit="Pa") = 410, r_N_min=yFanMin) "Controller for fan"
    annotation (Placement(transformation(extent={{240,-10},{260,10}})));
  Buildings.Examples.VAVReheat.Controls.ModeSelector modeSelector
    annotation (Placement(transformation(extent={{-200,-320},{-180,-300}})));
  Buildings.Examples.VAVReheat.Controls.ControlBus controlBus
    annotation (Placement(transformation(extent={{-250,-352},{-230,-332}})));

  Buildings.Examples.VAVReheat.Controls.RoomTemperatureSetpoint TSetRoo(
    final THeaOn=THeaOn,
    final THeaOff=THeaOff,
    final TCooOn=273.15 + 23.3,
    final TCooOff=TCooOff)
    annotation (Placement(transformation(extent={{-320,-358},{-300,-338}})));
  Buildings.Examples.VAVReheat.Controls.DuctStaticPressureSetpoint pSetDuc(
    nin=3,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    pMin=50) "Duct static pressure setpoint"
    annotation (Placement(transformation(extent={{160,-16},{180,4}})));
  Buildings.Examples.VAVReheat.Controls.CoolingCoilTemperatureSetpoint TSetCoo
    "Setpoint for cooling coil"
    annotation (Placement(transformation(extent={{-230,-212},{-210,-192}})));
  Buildings.Examples.VAVReheat.Controls.RoomVAV conVAVSou
    "Controller for terminal unit south"
    annotation (Placement(transformation(extent={{994,20},{1014,40}})));
  Buildings.Examples.VAVReheat.Controls.RoomVAV conVAVCor
    "Controller for terminal unit core zone"
    annotation (Placement(transformation(extent={{782,32},{802,52}})));
  Buildings.Examples.VAVReheat.Controls.RoomVAV conVAVNor
    "Controller for terminal unit north"
    annotation (Placement(transformation(extent={{640,30},{660,50}})));
  Buildings.Controls.Continuous.LimPID heaCoiCon(
    yMax=1,
    yMin=0,
    Td=60,
    initType=Modelica.Blocks.Types.Init.InitialState,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=0.02,
    Ti=300) "Controller for heating coil"
    annotation (Placement(transformation(extent={{-174,-212},{-154,-192}})));
  Buildings.Controls.Continuous.LimPID cooCoiCon(
    reverseAction=true,
    Td=60,
    initType=Modelica.Blocks.Types.Init.InitialState,
    yMax=1,
    yMin=0,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=600,
    k=0.1) "Controller for cooling coil"
    annotation (Placement(transformation(extent={{-174,-250},{-154,-230}})));
  Buildings.Controls.OBC.CDL.Logical.Switch swiHeaCoi
    "Switch to switch off heating coil"
    annotation (Placement(transformation(extent={{-134,-220},{-114,-200}})));
  Buildings.Controls.OBC.CDL.Logical.Switch swiCooCoi
    "Switch to switch off cooling coil"
    annotation (Placement(transformation(extent={{-116,-258},{-96,-238}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant coiOff(k=0)
    "Signal to switch water flow through coils off"
    annotation (Placement(transformation(extent={{-154,-172},{-134,-152}})));

  Buildings.Controls.OBC.CDL.Logical.Or or2
    annotation (Placement(transformation(extent={{-98,-178},{-78,-158}})));
  Modelica.Blocks.Sources.Constant CooTSet(k=273.15)
    "Zone air temperature set point"
    annotation (Placement(transformation(extent={{840,-176},{820,-156}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{784,-146},{764,-126}})));
  Modelica.Blocks.Sources.Constant HeaTSet(k=273.15)
    "Zone air temperature set point"
    annotation (Placement(transformation(extent={{840,-140},{820,-120}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{784,-182},{764,-162}})));
  Modelica.Blocks.Sources.CombiTimeTable heaSetDR(
    table=[0,15.5556; 5,15.5556; 5,17.7778; 6,17.7778; 6,19.4444; 7,19.4444; 7,
        21.1111; 22,21.1111; 22,15.5556; 24,15.5556],
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    timeScale=3600) "heating schedule for demand response"
    annotation (Placement(transformation(extent={{674,-224},{694,-204}})));
  Modelica.Blocks.Sources.CombiTimeTable cooSetDR(
    table=[0,26.6667; 5,26.6667; 5,25.5556; 6,25.5556; 6,25; 7,25; 7,23.3333;
        22,23.3333; 22,26.6667; 24,26.6667],
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    timeScale=3600) "cooling schedule for demand response"
    annotation (Placement(transformation(extent={{674,-272},{694,-252}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yCoo_log(final k=0)
    "Flow rate signal for heating coil when freeze stat is on"
    annotation (Placement(transformation(extent={{-206,-394},{-186,-374}})));
  Modelica.Blocks.Sources.CombiTimeTable yCoo_Sch(
    table=[0,1; 5,1; 5,0; 6,0; 22,0; 22,1; 24,1],
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    timeScale=3600) "schedule for coil control"
    annotation (Placement(transformation(extent={{-176,-378},{-156,-358}})));
  Buildings.Controls.OBC.CDL.Continuous.Greater gre1
    "coil signal setpoint yCoo is less than 1 allows controller signal to come in, otherwise it is 0"
    annotation (Placement(transformation(extent={{-124,-374},{-104,-354}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yCoo_Set_Off(final k=
        273.15 + 18.3)
    "Flow rate signal for heating coil when freeze stat is on"
    annotation (Placement(transformation(extent={{-110,-332},{-90,-312}})));
  Buildings.Controls.OBC.CDL.Logical.Switch swiCooCoi1
    "Switch to switch off cooling coil"
    annotation (Placement(transformation(extent={{-214,-292},{-194,-272}})));
  BaseClasses.Eco_Enable_weiping
                         enaDis(use_enthalpy=false, delTOutHis=0.1)
    annotation (Placement(transformation(extent={{232,200},{316,284}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant ecoHigCut(k=273.15 +
        18) "economizer high cut off temp"
    annotation (Placement(transformation(extent={{-220,236},{-200,256}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant ecoOutMax(k=1)
    "economizer max OA damper position"
    annotation (Placement(transformation(extent={{102,224},{122,244}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant ecoOutMin1(k=0.3)
    "economizer min OA damper position"
    annotation (Placement(transformation(extent={{108,186},{128,206}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant ecoOutMin2(k=0)
    "economizer min RA damper position"
    annotation (Placement(transformation(extent={{120,112},{140,132}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant ecoRetMax1(k=0.70)
    "economizer max RA damper position"
    annotation (Placement(transformation(extent={{120,150},{140,170}})));
equation
  connect(TSupSetHea.y, heaCoiCon.u_s) annotation (Line(
      points={{-211,-160},{-190,-160},{-190,-202},{-176,-202}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(fanSup.port_b, dpDisSupFan.port_a) annotation (Line(
      points={{320,-40},{320,0},{320,-10},{320,-10}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
  connect(controlBus, modeSelector.cb) annotation (Line(
      points={{-240,-342},{-152,-342},{-152,-303.182},{-196.818,-303.182}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      textString="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(min.y, controlBus.TRooMin) annotation (Line(
      points={{1221,450},{1400,450},{1400,-342},{-240,-342}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(ave.y, controlBus.TRooAve) annotation (Line(
      points={{1221,420},{1400,420},{1400,-342},{-240,-342}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TSetRoo.controlBus, controlBus) annotation (Line(
      points={{-308,-342},{-240,-342}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(dpDisSupFan.p_rel, conFanSup.u_m) annotation (Line(
      points={{311,4.44089e-16},{304,4.44089e-16},{304,-16},{250,-16},{250,-12}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));

  connect(pSetDuc.y, conFanSup.u) annotation (Line(
      points={{181,-6},{210,-6},{210,0},{238,0}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(TSupSetHea.y, TSetCoo.TSetHea) annotation (Line(
      points={{-211,-160},{-140,-160},{-140,-202},{-232,-202}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(modeSelector.cb, TSetCoo.controlBus) annotation (Line(
      points={{-196.818,-303.182},{-246,-303.182},{-246,-210},{-221.8,-210}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));

  connect(conVAVSou.TRoo, TRooAir.y1[1]) annotation (Line(
      points={{993,23},{984,23},{984,176},{708,176},{708,177},{511,177}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TRooAir.y2[1],conVAVCor. TRoo) annotation (Line(
      points={{511,170},{764,170},{764,35},{781,35}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(TRooAir.y3[1], conVAVNor.TRoo) annotation (Line(
      points={{511,163},{570,163},{570,154},{628,154},{628,33},{639,33}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(conVAVSou.yDam, sou.yVAV) annotation (Line(points={{1015,34.8},{1044,34.8},
          {1044,44},{1066,44}},     color={0,0,127}));
  connect(conVAVSou.yVal, sou.yVal) annotation (Line(points={{1015,25},{1024,25},
          {1024,28},{1066,28}}, color={0,0,127}));

  connect(occSch.tNexOcc, controlBus.dTNexOcc) annotation (Line(
      points={{-297,-204},{-240,-204},{-240,-342}},
      color={0,0,127},
      smooth=Smooth.None), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(occSch.occupied, controlBus.occupied) annotation (Line(
      points={{-297,-216},{-240,-216},{-240,-342}},
      color={255,0,255},
      smooth=Smooth.None), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(pSetDuc.TOut, TOut.y) annotation (Line(points={{158,2},{32,2},{32,130},
          {-160,130},{-160,180},{-279,180}}, color={0,0,127}));
  connect(TOut.y, controlBus.TOut) annotation (Line(points={{-279,180},{-240,180},
          {-240,-342}},                            color={0,0,127}), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(modeSelector.yFan, conFanSup.uFan) annotation (Line(points={{-179.545,
          -310},{260,-310},{260,-30},{226,-30},{226,6},{238,6}}, color={255,0,
          255}));
  connect(conFanSup.y, fanSup.y) annotation (Line(points={{261,0},{280,0},{280,
          -20},{310,-20},{310,-28}}, color={0,0,127}));
  connect(modeSelector.yFan, swiCooCoi.u2) annotation (Line(points={{-179.545,
          -310},{-20,-310},{-20,-248},{-118,-248}},
                                              color={255,0,255}));
  connect(swiCooCoi.u1, cooCoiCon.y) annotation (Line(points={{-118,-240},{-153,
          -240}},                 color={0,0,127}));
  connect(swiHeaCoi.u1, heaCoiCon.y)
    annotation (Line(points={{-136,-202},{-153,-202}},
                                                    color={0,0,127}));
  connect(coiOff.y, swiCooCoi.u3) annotation (Line(points={{-132,-162},{-28,
          -162},{-28,-256},{-118,-256}},
                              color={0,0,127}));
  connect(coiOff.y, swiHeaCoi.u3) annotation (Line(points={{-132,-162},{-28,
          -162},{-28,-218},{-136,-218}},
                              color={0,0,127}));
  connect(TSup.T, cooCoiCon.u_m) annotation (Line(points={{340,-29},{340,-12},{
          278,-12},{278,-268},{-164,-268},{-164,-252}},
                                                      color={0,0,127}));
  connect(TSup.T, heaCoiCon.u_m) annotation (Line(points={{340,-29},{340,-12},{
          278,-12},{278,-268},{-182,-268},{-182,-222},{-164,-222},{-164,-214}},
        color={0,0,127}));
  connect(gaiHeaCoi.u, swiHeaCoi.y)
    annotation (Line(points={{98,-210},{-112,-210}},         color={0,0,127}));
  connect(freSta.y, or2.u1) annotation (Line(points={{22,-92},{40,-92},{40,-150},
          {-20,-150},{-20,-168},{-100,-168}},                color={255,0,255}));
  connect(or2.u2, modeSelector.yFan) annotation (Line(points={{-100,-176},{-20,
          -176},{-20,-310},{-179.545,-310}},
                                     color={255,0,255}));
  connect(or2.y, swiHeaCoi.u2) annotation (Line(points={{-76,-168},{40,-168},{
          40,-210},{-136,-210}},                color={255,0,255}));
  connect(cor.y_actual, pSetDuc.u[2]) annotation (Line(points={{866,60},{884,60},
          {884,74},{140,74},{140,-6},{158,-6}},     color={0,0,127}));
  connect(sou.y_actual, pSetDuc.u[3]) annotation (Line(points={{1112,52},{1128,
          52},{1128,74},{140,74},{140,-4.66667},{158,-4.66667}},
                                                    color={0,0,127}));
  connect(nor.y_actual, pSetDuc.u[1]) annotation (Line(points={{738,56},{758,56},
          {758,74},{140,74},{140,-7.33333},{158,-7.33333}},
                                                         color={0,0,127}));
  connect(conVAVNor.yDam, nor.yVAV) annotation (Line(points={{661,44.8},{675.5,
          44.8},{675.5,48},{692,48}},
                                color={0,0,127}));
  connect(conVAVNor.yVal, nor.yVal) annotation (Line(points={{661,35},{675.5,35},
          {675.5,32},{692,32}}, color={0,0,127}));
  connect(conVAVCor.yDam, cor.yVAV) annotation (Line(points={{803,46.8},{811.5,
          46.8},{811.5,52},{820,52}},
                                color={0,0,127}));
  connect(conVAVCor.yVal, cor.yVal) annotation (Line(points={{803,37},{812.5,37},
          {812.5,36},{820,36}}, color={0,0,127}));
  connect(add1.y, conVAVCor.TRooCooSet) annotation (Line(points={{763,-172},{
          752,-172},{752,42},{780,42}},
                                    color={0,0,127}));
  connect(CooTSet.y, add1.u1)
    annotation (Line(points={{819,-166},{786,-166}}, color={0,0,127}));
  connect(HeaTSet.y, add.u1)
    annotation (Line(points={{819,-130},{786,-130}}, color={0,0,127}));
  connect(heaSetDR.y[1], add.u2) annotation (Line(points={{695,-214},{804,-214},
          {804,-142},{786,-142}}, color={0,0,127}));
  connect(add.y, conVAVCor.TRooHeaSet) annotation (Line(points={{763,-136},{740,
          -136},{740,50},{780,50},{780,49}}, color={0,0,127}));
  connect(cooSetDR.y[1], add1.u2) annotation (Line(points={{695,-262},{802,-262},
          {802,-178},{786,-178}}, color={0,0,127}));
  connect(add.y, conVAVSou.TRooHeaSet) annotation (Line(points={{763,-136},{740,
          -136},{740,-68},{912,-68},{912,37},{992,37}}, color={0,0,127}));
  connect(add1.y, conVAVSou.TRooCooSet) annotation (Line(points={{763,-172},{
          752,-172},{752,-28},{900,-28},{900,30},{992,30}}, color={0,0,127}));
  connect(add.y, conVAVNor.TRooHeaSet) annotation (Line(points={{763,-136},{592,
          -136},{592,47},{638,47}}, color={0,0,127}));
  connect(add1.y, conVAVNor.TRooCooSet) annotation (Line(points={{763,-172},{
          602,-172},{602,40},{638,40}}, color={0,0,127}));
  connect(yCoo_Sch.y[1], gre1.u1) annotation (Line(points={{-155,-368},{-126,
          -368},{-126,-364}}, color={0,0,127}));
  connect(yCoo_log.y, gre1.u2) annotation (Line(points={{-184,-384},{-14,-384},
          {-14,-372},{-126,-372}}, color={0,0,127}));
  connect(yCoo_Set_Off.y, swiCooCoi1.u1) annotation (Line(points={{-88,-322},{
          34,-322},{34,-274},{-216,-274}}, color={0,0,127}));
  connect(gre1.y, swiCooCoi1.u2) annotation (Line(points={{-102,-364},{30,-364},
          {30,-282},{-216,-282}}, color={255,0,255}));
  connect(swiCooCoi.y, gaiCooCoi.u)
    annotation (Line(points={{-94,-248},{98,-248}}, color={0,0,127}));
  connect(TSetCoo.TSet, swiCooCoi1.u3) annotation (Line(points={{-209,-202},{
          -82,-202},{-82,-290},{-216,-290}}, color={0,0,127}));
  connect(swiCooCoi1.y, cooCoiCon.u_s) annotation (Line(points={{-192,-282},{
          -441,-282},{-441,-240},{-176,-240}}, color={0,0,127}));
  connect(enaDis.TOut, TOut.y) annotation (Line(points={{223.6,284},{-117.2,284},
          {-117.2,180},{-279,180}}, color={0,0,127}));
  connect(ecoHigCut.y, enaDis.TOutCut) annotation (Line(points={{-198,246},{-84,
          246},{-84,275.6},{223.6,275.6}}, color={0,0,127}));
  connect(modeSelector.yFan, enaDis.uSupFan) annotation (Line(points={{-179.545,
          -310},{-179.545,-29},{223.6,-29},{223.6,250.4}}, color={255,0,255}));
  connect(eco.yRet, enaDis.yRetDamPosMin) annotation (Line(points={{-16.8,-34},
          {81.6,-34},{81.6,216.8},{324.4,216.8}},   color={0,0,127}));
  connect(enaDis.yOutDamPosMax, eco.yOut) annotation (Line(points={{324.4,267.2},
          {50.2,267.2},{50.2,-34},{-10,-34}},   color={0,0,127}));
  connect(eco.yExh, enaDis.yOutDamPosMax) annotation (Line(points={{-3,-34},{
          160.5,-34},{160.5,267.2},{324.4,267.2}}, color={0,0,127}));
  connect(ecoOutMax.y, enaDis.uOutDamPosMax) annotation (Line(points={{124,234},
          {174,234},{174,233.6},{223.6,233.6}}, color={0,0,127}));
  connect(ecoOutMin1.y, enaDis.uOutDamPosMin) annotation (Line(points={{130,196},
          {178,196},{178,225.2},{223.6,225.2}}, color={0,0,127}));
  connect(ecoRetMax1.y, enaDis.uRetDamPosMax) annotation (Line(points={{142,160},
          {184,160},{184,208.4},{223.6,208.4}}, color={0,0,127}));
  connect(ecoOutMin2.y, enaDis.uRetDamPosMin) annotation (Line(points={{142,122},
          {202,122},{202,200},{223.6,200}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-380,-400},{1440,
            580}})),
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
See the model
<a href=\"modelica://Buildings.Examples.VAVReheat.BaseClasses.PartialOpenLoop\">
Buildings.Examples.VAVReheat.BaseClasses.PartialOpenLoop</a>
for a description of the HVAC system and the building envelope.
</p>
<p>
The control is an implementation of the control sequence
<i>VAV 2A2-21232</i> of the Sequences of Operation for
Common HVAC Systems (ASHRAE, 2006). In this control sequence, the
supply fan speed is regulated based on the duct static pressure.
The return fan controller tracks the supply fan air flow rate.
The duct static pressure is adjusted
so that at least one VAV damper is 90% open. The economizer dampers
are modulated to track the setpoint for the mixed air dry bulb temperature.
Priority is given to maintain a minimum outside air volume flow rate.
In each zone, the VAV damper is adjusted to meet the room temperature
setpoint for cooling, or fully opened during heating.
The room temperature setpoint for heating is tracked by varying
the water flow rate through the reheat coil. There is also a
finite state machine that transitions the mode of operation of
the HVAC system between the modes
<i>occupied</i>, <i>unoccupied off</i>, <i>unoccupied night set back</i>,
<i>unoccupied warm-up</i> and <i>unoccupied pre-cool</i>.
In the VAV model, all air flows are computed based on the
duct static pressure distribution and the performance curves of the fans.
Local loop control is implemented using proportional and proportional-integral
controllers, while the supervisory control is implemented
using a finite state machine.
</p>
<p>
A similar model but with a different control sequence can be found in
<a href=\"modelica://Buildings.Examples.VAVReheat.Guideline36\">
Buildings.Examples.VAVReheat.Guideline36</a>.
</p>
<h4>References</h4>
<p>
ASHRAE.
<i>Sequences of Operation for Common HVAC Systems</i>.
ASHRAE, Atlanta, GA, 2006.
</p>
</html>", revisions="<html>
<ul>
<li>
April 20, 2020, by Jianjun Hu:<br/>
Exported actual VAV damper position as the measured input data for
defining duct static pressure setpoint.<br/>
This is
for <a href=\"https://github.com/lbl-srg/modelica-buildings/issues/1873\">issue #1873</a>
</li>
<li>
May 19, 2016, by Michael Wetter:<br/>
Changed chilled water supply temperature to <i>6&deg;C</i>.
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
          "modelica://Buildings/Resources/Scripts/Dymola/Examples/VAVReheat/ASHRAE2006.mos"
        "Simulate and plot"),
    experiment(
      StartTime=21081600,
      StopTime=21600000,
      Interval=299.999808,
      __Dymola_Algorithm="Dassl"));
end FlexlabX1aNoLeakBaseline_G36paper;
