within hil_flexlab_model.Examples;
model XRA_Baseline_AE_201
  "Variable air volume flow system with terminal reheat - flexlab baseline, no leakage"
  extends Modelica.Icons.Example;

  hil_flexlab_model.Fluid.HeatHeatpumpCoolHeatpumpAuxHea_noIEC_2stage rtu(
    mAir_flow_nominal=casDat.mAir_flow_nominal,
    mAir_flow_minOA=casDat.minOAFlo,
    QHea_flow_nominal=casDat.QHea_flow_nominal,
    QCoo_flow_nominal=casDat.QCoo_flow_nominal,
    dp_nominal=casDat.dp_nominal,
    hydraulicEfficiency=casDat.hydraulicEfficiency,
    motorEfficiency=casDat.motorEfficiency,
    COP_heating=casDat.COP_heating,
    COP_cooling=casDat.COP_cooling) "Unit supplying conditioned air to space"
    annotation (Placement(transformation(extent={{254,-208},{430,24}})));
  hil_flexlab_model.BaseClasses.Controls.RTU rTU(
    mAir_flow_nominal=casDat.mAir_flow_nominal,
    mAir_flow_minOA=casDat.minOAFlo,
    mAir_flow_hea=casDat.mAir_flow_nominal,
    mAir_flow_coo=casDat.mAir_flow_nominal)
    annotation (Placement(transformation(extent={{-28,-220},{80,-6}})));
   Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=casDat.weaDatImport)
    annotation (Placement(transformation(extent={{-274,394},{-254,414}})));

  replaceable hil_flexlab_model.Data.PSP_4B_Med
                          casDat(weaDatImport=
        ModelicaServices.ExternalReferences.loadResource(
        "modelica://hil_flexlab_model/Resources/weatherdata/US_Berkeley_20210101.mos"))
    "Case study data"
    annotation (Placement(transformation(extent={{-180,82},{-160,102}})));

  Buildings.BoundaryConditions.WeatherData.Bus
                                     weaBus "Weather data bus"
    annotation (Placement(transformation(extent={{-194,280},{-174,300}})));
  ThermalZones.FlexlabXRA flexlabXRA(lat=weaDat.lat)
    annotation (Placement(transformation(extent={{736,-334},{1376,352}})));
  Modelica.Blocks.Sources.CombiTimeTable TSetRooHea(table=[0*3600,15.6 + 273.15;
        5*3600,15.6 + 273.15; 5*3600,17.8 + 273.15; 6*3600,17.8 + 273.15; 6*
        3600,19.4 + 273.15; 7*3600,19.4 + 273.15; 7*3600,21.1 + 273.15; 22*3600,
        21.1 + 273.15; 22*3600,15.6 + 273.15; 24*3600,15.6 + 273.15],
                                         extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "Heating setpoint for room temperature"
    annotation (Placement(transformation(extent={{-312,-82},{-242,-12}})));
  Modelica.Blocks.Sources.CombiTimeTable TSetRooCoo(table=[0*3600,273.15 + 26.7;
        5*3600,273.15 + 26.7; 5*3600,273.15 + 32.2; 6*3600,273.15 + 32.2; 6*
        3600,273.15 + 32.2; 7*3600,273.15 + 32.2; 7*3600,273.15 + 32.2; 22*3600,
        273.15 + 32.2; 22*3600,273.15 + 26.7; 24*3600,273.15 + 26.7],
                                         extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "Cooling setpoint for room temperature"
    annotation (Placement(transformation(extent={{-306,-190},{-234,-118}})));
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoid(rising=300)
    annotation (Placement(transformation(extent={{-78,-310},{-52,-284}})));
  Modelica.Blocks.Logical.Greater greater
    annotation (Placement(transformation(extent={{-14,-342},{6,-322}})));
  Modelica.Blocks.Sources.Constant const(k=0.66) annotation (Placement(
        transformation(
        extent={{13,-13},{-13,13}},
        rotation=180,
        origin={-65,-363})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{120,-342},{140,-322}})));
  Modelica.Blocks.Math.RealToInteger realToInteger
    annotation (Placement(transformation(extent={{188,-290},{208,-270}})));
  Modelica.Blocks.Sources.Constant const1(k=2) annotation (Placement(
        transformation(
        extent={{13,-13},{-13,13}},
        rotation=180,
        origin={101,-309})));
  Modelica.Blocks.Sources.Constant const2(k=1) annotation (Placement(
        transformation(
        extent={{13,-13},{-13,13}},
        rotation=180,
        origin={57,-385})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{128,-258},{148,-238}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=0.001)
    annotation (Placement(transformation(extent={{-36,-284},{-16,-264}})));
  Modelica.Blocks.Sources.Constant const3(k=0) annotation (Placement(
        transformation(
        extent={{13,-13},{-13,13}},
        rotation=180,
        origin={93,-265})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean1(threshold=0.001)
    annotation (Placement(transformation(extent={{382,-266},{402,-246}})));
  Modelica.Blocks.Logical.Greater greater1
    annotation (Placement(transformation(extent={{396,-314},{416,-294}})));
  Modelica.Blocks.Sources.Constant const4(k=0.66)
                                                 annotation (Placement(
        transformation(
        extent={{13,-13},{-13,13}},
        rotation=180,
        origin={333,-349})));
  Modelica.Blocks.Sources.Constant const5(k=0.66)
                                               annotation (Placement(
        transformation(
        extent={{13,-13},{-13,13}},
        rotation=180,
        origin={409,-347})));
  Modelica.Blocks.Logical.Switch switch3
    annotation (Placement(transformation(extent={{590,-336},{610,-316}})));
  Modelica.Blocks.Sources.Constant const6(k=1) annotation (Placement(
        transformation(
        extent={{13,-13},{-13,13}},
        rotation=180,
        origin={541,-387})));
  Modelica.Blocks.Logical.Switch switch4
    annotation (Placement(transformation(extent={{566,-266},{586,-246}})));
  Modelica.Blocks.Sources.Constant const7(k=0) annotation (Placement(
        transformation(
        extent={{13,-13},{-13,13}},
        rotation=180,
        origin={451,-281})));
equation

  connect(rTU.yFan, rtu.uFan) annotation (Line(
        points={{85.4,-16.7},{167.15,-16.7},{167.15,12.4},{245.2,12.4}},
        color={0,0,127}));
  connect(rTU.yCoo, rtu.uCoo) annotation (Line(
        points={{85.4,-84.7909},{164.15,-84.7909},{164.15,-57.2},{245.2,-57.2}},
        color={0,0,127}));
  connect(rTU.yOutAirFra, rtu.uEco) annotation (Line(
        points={{85.4,-123.7},{166.15,-123.7},{166.15,-92},{245.2,-92}},
        color={0,0,127}));
  connect(rtu.TMixAir, rTU.TMix) annotation (Line(
        points={{434.4,-161.6},{488,-161.6},{488,-378},{224,-378},{224,-191.791},
          {-38.8,-191.791}},
                      color={0,0,127}));
  connect(rTU.TSup, rtu.TSup) annotation (Line(
        points={{-38.8,-220.973},{498.6,-220.973},{498.6,-173.2},{434.4,-173.2}},
        color={0,0,127}));
  connect(rTU.TRet, rtu.phiRetAir) annotation (Line(
        points={{-38.8,-162.609},{-78,-162.609},{-78,-228},{-120,-228},{-120,
          -402},{480,-402},{480,-208},{434.4,-208}},
                                               color={0,0,127}));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-254,404},{-76,404},{-76,290},{-184,290}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(weaBus, rtu.weaBus) annotation (Line(
      points={{-184,290},{126,290},{126,11.24},{271.6,11.24}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(weaBus.TDryBul, rTU.TEco) annotation (Line(
      points={{-184,290},{-106,290},{-106,-132.455},{-38.8,-132.455}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(flexlabXRA.TRooAir, rTU.TRoo) annotation (Line(points={{1364.57,
          -29.8733},{1396,-29.8733},{1396,366},{-90,366},{-90,-104.245},{-38.8,
          -104.245}},
        color={0,0,127}));
  connect(flexlabXRA.weaBus, weaDat.weaBus) annotation (Line(
      points={{1158.86,47.8733},{445.43,47.8733},{445.43,404},{-254,404}},
      color={255,204,51},
      thickness=0.5));
  connect(TSetRooHea.y[1], rTU.TSetRooHea) annotation (Line(points={{-238.5,-47},
          {-117.5,-47},{-117.5,-45.8818},{-38.8,-45.8818}},  color={0,0,127}));
  connect(TSetRooCoo.y[1], rTU.TSetRooCoo) annotation (Line(points={{-230.4,
          -154},{-114,-154},{-114,-75.0636},{-38.8,-75.0636}},
                                                         color={0,0,127}));
  connect(flexlabXRA.portsCell[2], rtu.returnAir) annotation (Line(points={{996.571,
          -43.5933},{702.572,-43.5933},{702.572,-92},{430,-92}},         color=
          {0,127,255}));
  connect(flexlabXRA.portsCell[1], rtu.supplyAir) annotation (Line(points={{973.714,
          -43.5933},{705.572,-43.5933},{705.572,-45.6},{430,-45.6}},
        color={0,127,255}));
  connect(flexlabXRA.occ, rTU.occSta) annotation (Line(points={{1385.14,100.467},
          {665.57,100.467},{665.57,-16.7},{-38.8,-16.7}}, color={255,0,255}));
  connect(const.y, greater.u2) annotation (Line(points={{-50.7,-363},{104.65,
          -363},{104.65,-340},{-16,-340}},
                                    color={0,0,127}));
  connect(greater.y, switch1.u2)
    annotation (Line(points={{7,-332},{118,-332}},   color={255,0,255}));
  connect(switch1.u3, const2.y) annotation (Line(points={{118,-340},{118,-385},
          {71.3,-385}},            color={0,0,127}));
  connect(switch1.u1, const1.y) annotation (Line(points={{118,-324},{156,-324},
          {156,-309},{115.3,-309}},color={0,0,127}));
  connect(rTU.cooSta, triggeredTrapezoid.u) annotation (Line(points={{85.4,
          -172.336},{85.4,-249.168},{-80.6,-249.168},{-80.6,-297}},
                                                          color={255,0,255}));
  connect(triggeredTrapezoid.y, greater.u1) annotation (Line(points={{-50.7,
          -297},{70,-297},{70,-332},{-16,-332}},
                                          color={0,0,127}));
  connect(triggeredTrapezoid.y, realToBoolean.u) annotation (Line(points={{-50.7,
          -297},{86.6,-297},{86.6,-274},{-38,-274}}, color={0,0,127}));
  connect(realToBoolean.y, switch2.u2) annotation (Line(points={{-15,-274},{
          157.5,-274},{157.5,-248},{126,-248}},
                                          color={255,0,255}));
  connect(switch2.y, realToInteger.u) annotation (Line(points={{149,-248},{178,
          -248},{178,-282},{182,-282},{182,-280},{186,-280}},
                                  color={0,0,127}));
  connect(switch2.u3, const3.y) annotation (Line(points={{126,-256},{114,-256},
          {114,-265},{107.3,-265}},color={0,0,127}));
  connect(switch2.u1, switch1.y) annotation (Line(points={{126,-240},{180,-240},
          {180,-332},{141,-332}}, color={0,0,127}));
  connect(realToInteger.y, rtu.n_Sta) annotation (Line(points={{209,-280},{209,
          -192},{245.2,-192},{245.2,-115.2}}, color={255,127,0}));
  connect(const4.y, greater1.u2) annotation (Line(points={{347.3,-349},{373.65,
          -349},{373.65,-312},{394,-312}}, color={0,0,127}));
  connect(realToBoolean1.y, switch4.u2)
    annotation (Line(points={{403,-256},{564,-256}}, color={255,0,255}));
  connect(const7.y, switch4.u3) annotation (Line(points={{465.3,-281},{500.65,
          -281},{500.65,-264},{564,-264}}, color={0,0,127}));
  connect(greater1.y, switch3.u2) annotation (Line(points={{417,-304},{482,-304},
          {482,-326},{588,-326}}, color={255,0,255}));
  connect(switch3.y, switch4.u1) annotation (Line(points={{611,-326},{636,-326},
          {636,-248},{564,-248}}, color={0,0,127}));
  connect(const5.y, switch3.u3) annotation (Line(points={{423.3,-347},{484.65,
          -347},{484.65,-334},{588,-334}}, color={0,0,127}));
  connect(rTU.yHea, greater1.u1) annotation (Line(points={{85.4,-55.6091},{
          126.7,-55.6091},{126.7,-304},{394,-304}}, color={0,0,127}));
  connect(rTU.yHea, realToBoolean1.u) annotation (Line(points={{85.4,-55.6091},
          {100,-55.6091},{100,-76},{110,-76},{110,-256},{380,-256}},
                                                     color={0,0,127}));
  connect(const6.y, switch3.u1) annotation (Line(points={{555.3,-387},{555.3,
          -352.5},{588,-352.5},{588,-318}}, color={0,0,127}));
  connect(switch4.y, rtu.uHea) annotation (Line(points={{587,-256},{118,-256},{
          118,-22.4},{245.2,-22.4}}, color={0,0,127}));
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
      StartTime=3801600,
      StopTime=6220800,
      Interval=299.999808,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end XRA_Baseline_AE_201;
