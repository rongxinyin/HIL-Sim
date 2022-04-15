within hil_flexlab_model.Examples;
model XRA_Baseline_AE_201
  "Variable air volume flow system with terminal reheat - flexlab baseline, no leakage"
  extends Modelica.Icons.Example;

  ThermalZones.FlexlabXRA flexlabXRA(lat=weaDat.lat)
    annotation (Placement(transformation(extent={{736,-334},{1376,352}})));
  Modelica.Blocks.Sources.CombiTimeTable TSetRooHea(table=[0*3600,15.6 + 273.15;
        5*3600,15.6 + 273.15; 5*3600,17.8 + 273.15; 6*3600,17.8 + 273.15; 6*
        3600,19.4 + 273.15; 7*3600,19.4 + 273.15; 7*3600,21.1 + 273.15; 22*3600,
        21.1 + 273.15; 22*3600,15.6 + 273.15; 24*3600,15.6 + 273.15],
                                         extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "Heating setpoint for room temperature"
    annotation (Placement(transformation(extent={{-184,-190},{-110,-116}})));
  Fluid.Aachen_HP_2stage_FMU_wTMixCalc aachen_HP_2stage_FMU_wTMixCalc
    annotation (Placement(transformation(extent={{138,-128},{266,6}})));
  Buildings.Fluid.Sources.MassFlowSource_T supFan(
    redeclare package Medium = Buildings.Media.Air,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(extent={{432,-134},{526,-40}})));
  Modelica.Blocks.Sources.Constant SAflo(final k=(950*1.189)/(35.31*60))
    "Fixed supply air flow rate" annotation (Placement(transformation(
        extent={{31,31},{-31,-31}},
        rotation=180,
        origin={39,79})));
  Buildings.Fluid.Sensors.Temperature        senTRA(
    redeclare final package Medium = Buildings.Media.Air)
                       "Return air temperature" annotation (Placement(
        transformation(
        extent={{38,-45},{-38,45}},
        rotation=0,
        origin={652,-289})));
   Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
        ModelicaServices.ExternalReferences.loadResource("modelica://hil_flexlab_model/Resources/weatherdata/Berkeley-Real-Weather-202201010323.mos"))
    annotation (Placement(transformation(extent={{-294,398},{-204,490}})));
  Buildings.BoundaryConditions.WeatherData.Bus
                                     weaBus "Weather data bus"
    annotation (Placement(transformation(extent={{-118,168},{-36,222}})));
equation

  connect(flexlabXRA.TRooAir, aachen_HP_2stage_FMU_wTMixCalc.u_TRoo)
    annotation (Line(points={{1364.57,-29.8733},{1406,-29.8733},{1406,-374},{36,
          -374},{36,-114.6},{125.2,-114.6}}, color={0,0,127}));
  connect(aachen_HP_2stage_FMU_wTMixCalc.y_TSup, supFan.T_in) annotation (Line(
        points={{272.4,-27.5},{344.2,-27.5},{344.2,-68.2},{422.6,-68.2}}, color=
         {0,0,127}));
  connect(SAflo.y, aachen_HP_2stage_FMU_wTMixCalc.u_m_flow) annotation (Line(
        points={{73.1,79},{86.95,79},{86.95,-7.4},{125.2,-7.4}}, color={0,0,127}));
  connect(SAflo.y, supFan.m_flow_in) annotation (Line(points={{73.1,79},{373.95,
          79},{373.95,-49.4},{422.6,-49.4}}, color={0,0,127}));
  connect(senTRA.T, aachen_HP_2stage_FMU_wTMixCalc.u_TRet) annotation (Line(
        points={{625.4,-289},{625.4,-200},{58,-200},{58,-34.2},{125.2,-34.2}},
        color={0,0,127}));
  connect(senTRA.port, flexlabXRA.portsCell[2]) annotation (Line(points={{652,
          -334},{652,-346},{994,-346},{994,-43.5933},{996.571,-43.5933}},
                                                         color={0,127,255}));
  connect(supFan.ports[1], flexlabXRA.portsCell[1]) annotation (Line(points={{526,-87},
          {694,-87},{694,0},{970,0},{970,-43.5933},{973.714,-43.5933}},
                                                                 color={0,127,255}));
  connect(TSetRooHea.y[1], aachen_HP_2stage_FMU_wTMixCalc.u_TRooSetPoi)
    annotation (Line(points={{-106.3,-153},{2.85,-153},{2.85,-87.8},{125.2,-87.8}},
        color={0,0,127}));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-204,444},{-170,444},{-170,195},{-77,195}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(aachen_HP_2stage_FMU_wTMixCalc.u_TDryBul, weaBus.TDryBul) annotation (
     Line(points={{125.2,-61},{125.2,-60.5},{-77,-60.5},{-77,195}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(weaDat.weaBus, flexlabXRA.weaBus) annotation (Line(
      points={{-204,444},{1160,444},{1160,47.8733},{1158.86,47.8733}},
      color={255,204,51},
      thickness=0.5));
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
