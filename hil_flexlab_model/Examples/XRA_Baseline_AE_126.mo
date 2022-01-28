within hil_flexlab_model.Examples;
model XRA_Baseline_AE_126
  "Variable air volume flow system with terminal reheat - flexlab baseline, no leakage"
  extends Modelica.Icons.Example;
    extends hil_flexlab_model.BaseClasses.partialInterface_noPV(totPowHVAC(nu=1),
      roo(nPorts=4));

  hil_flexlab_model.HeatHeatpumpCoolHeatpumpAuxHea_noIEC rtu(
    mAir_flow_nominal=casDat.mAir_flow_nominal,
    mAir_flow_minOA=casDat.minOAFlo,
    QHea_flow_nominal=casDat.QHea_flow_nominal,
    QCoo_flow_nominal=casDat.QCoo_flow_nominal,
    dp_nominal=casDat.dp_nominal,
    hydraulicEfficiency=casDat.hydraulicEfficiency,
    motorEfficiency=casDat.motorEfficiency,
    COP_heating=casDat.COP_heating,
    COP_cooling=casDat.COP_cooling) "Unit supplying conditioned air to space"
    annotation (Placement(transformation(extent={{-44,-22},{-12,28}})));



equation

  connect(con.yFan, rtu.uFan) annotation (Line(points={{-59,14.2},{-50.5,14.2},
          {-50.5,25.5},{-45.6,25.5}}, color={0,0,127}));
  connect(con.yHea, rtu.uHea) annotation (Line(points={{-59,7.65455},{-50.5,
          7.65455},{-50.5,18},{-45.6,18}}, color={0,0,127}));
  connect(con.yCoo, rtu.uCoo) annotation (Line(points={{-59,2.74545},{-59,
          -7.62728},{-45.6,-7.62728},{-45.6,10.5}}, color={0,0,127}));
  connect(rtu.supplyAir, roo.ports[3]) annotation (Line(points={{-12,13},{14,13},
          {14,-4.6},{26,-4.6}}, color={0,127,255}));
  connect(rtu.returnAir, roo.ports[4]) annotation (Line(points={{-12,3},{12,3},
          {12,-4.6},{26,-4.6}}, color={0,127,255}));
  connect(weaDat.weaBus, inf.weaBus) annotation (Line(
      points={{-100,90},{2,90},{2,-41},{99,-41}},
      color={255,204,51},
      thickness=0.5));
  connect(weaDat.weaBus, rtu.weaBus) annotation (Line(
      points={{-100,90},{-68,90},{-68,25.25},{-40.8,25.25}},
      color={255,204,51},
      thickness=0.5));
  connect(rtu.TRet, con.TRet) annotation (Line(points={{-11.2,-19.5},{-92,-19.5},
          {-92,-10.3455},{-82,-10.3455}},          color={0,0,127}));
  connect(con.TSup, rtu.TSup) annotation (Line(points={{-82,-20.1636},{-86,
          -20.1636},{-86,-20},{-90,-20},{-90,-34},{-4,-34},{-4,-14.5},{-11.2,
          -14.5}},                              color={0,0,127}));
  connect(rtu.TMixAir, con.TMix) annotation (Line(points={{-11.2,-12},{2,-12},{
          2,-46},{-94,-46},{-94,-15.2545},{-82,-15.2545}},
                                                 color={0,0,127}));
  connect(weaBus.TDryBul, con.TEco) annotation (Line(
      points={{-88,90},{-86,90},{-86,-5.27273},{-82,-5.27273}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(rtu.PFan, totPowHVAC.u[1]) annotation (Line(points={{-11.2,25.5},{-11.2,
          -29.55},{80,-29.55},{80,100}},     color={0,0,127}));
  connect(totPowHVAC.u[1], rtu.PFan) annotation (Line(points={{80,100},{40,100},
          {40,25.5},{-11.2,25.5}}, color={0,0,127}));
  connect(con.yOutAirFra, rtu.uEco) annotation (Line(points={{-59,-3.8},{-52.5,-3.8},
          {-52.5,3},{-45.6,3}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{120,
            100}})),
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
      StopTime=31536000,
      Interval=180,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Icon(coordinateSystem(extent={{-100,-100},{120,100}})));
end XRA_Baseline_AE_126;
