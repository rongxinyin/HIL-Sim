within hil_flexlab_model.ThermalZones;
partial model PartialFloor "Interface for a model of a floor of a building"

  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium model for air" annotation (choicesAllMatching=true);

  parameter Boolean use_windPressure=true
    "Set to true to enable wind pressure";

  parameter Real kIntNor(min=0, max=1) = 1
    "Gain factor to scale internal heat gain in north zone";

  parameter Modelica.Units.SI.Volume VRooCor "Room volume corridor";
  parameter Modelica.Units.SI.Volume VRooSou "Room volume south";
  parameter Modelica.Units.SI.Volume VRooNor "Room volume north";

  parameter Modelica.Units.SI.Area AFloCor "Floor area corridor";
  parameter Modelica.Units.SI.Area AFloSou "Floor area south";
  parameter Modelica.Units.SI.Area AFloNor "Floor area north";

  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsSou[2](
      redeclare package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{70,-44},{110,-28}}),
        iconTransformation(extent={{78,-32},{118,-16}})));

  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsNor[2](
      redeclare package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{70,116},{110,132}}),
        iconTransformation(extent={{78,116},{118,132}})));

  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsCor[2](
      redeclare package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{70,38},{110,54}}),
        iconTransformation(extent={{78,48},{118,64}})));

  Modelica.Blocks.Interfaces.RealOutput TRooAir[3](
    each unit="K",
    each displayUnit="degC") "Room air temperatures"
    annotation (Placement(transformation(extent={{380,150},{400,170}}),
        iconTransformation(extent={{380,40},{400,60}})));

  Modelica.Blocks.Interfaces.RealOutput p_rel
    "Relative pressure signal of building static pressure" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-170,220}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-90,50})));

  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather bus" annotation (
     Placement(transformation(extent={{200,190},{220,210}}), iconTransformation(
          extent={{200,210},{220,230}})));

  Buildings.Examples.VAVReheat.BaseClasses.RoomLeakage leaSou(
    redeclare package Medium = Medium,
    VRoo=VRooSou,
    s=49.91/33.27,
    azi=Buildings.Types.Azimuth.S,
    final use_windPressure=use_windPressure)
    "Model for air infiltration through the envelope"
    annotation (Placement(transformation(extent={{-58,380},{-22,420}})));

  Buildings.Examples.VAVReheat.BaseClasses.RoomLeakage leaNor(
    redeclare package Medium = Medium,
    VRoo=VRooNor,
    s=49.91/33.27,
    azi=Buildings.Types.Azimuth.N,
    final use_windPressure=use_windPressure)
    "Model for air infiltration through the envelope"
    annotation (Placement(transformation(extent={{-56,300},{-20,340}})));

  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirSou
    "Air temperature sensor"
    annotation (Placement(transformation(extent={{290,340},{310,360}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirNor
    "Air temperature sensor"
    annotation (Placement(transformation(extent={{292,280},{312,300}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirCor
    "Air temperature sensor"
    annotation (Placement(transformation(extent={{294,218},{314,238}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_1
    annotation (Placement(transformation(extent={{340,280},{360,300}})));

  Buildings.Airflow.Multizone.DoorOpen opeSouCor(redeclare package Medium =
        Medium, wOpe=10) "Opening between perimeter1 and core"
    annotation (Placement(transformation(extent={{84,0},{104,20}})));
  Buildings.Airflow.Multizone.DoorOpen opeNorCor(redeclare package Medium =
        Medium, wOpe=10) "Opening between perimeter3 and core"
    annotation (Placement(transformation(extent={{80,74},{100,94}})));
  Buildings.Fluid.Sensors.RelativePressure senRelPre(redeclare package Medium = Medium)
    "Building pressure measurement"
    annotation (Placement(transformation(extent={{60,240},{40,260}})));
  Buildings.Fluid.Sources.Outside out(nPorts=1, redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-58,240},{-38,260}})));

equation
  connect(weaBus, leaSou.weaBus) annotation (Line(
      points={{210,200},{-80,200},{-80,400},{-58,400}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus, leaNor.weaBus) annotation (Line(
      points={{210,200},{-80,200},{-80,320},{-56,320}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(out.weaBus, weaBus) annotation (Line(
      points={{-58,250.2},{-70,250.2},{-70,250},{-80,250},{-80,200},{210,200}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(multiplex3_1.y, TRooAir) annotation (Line(
      points={{361,290},{372,290},{372,160},{390,160}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(temAirSou.T,multiplex3_1. u1[1]) annotation (Line(
      points={{311,350},{328,350},{328,297},{338,297}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(senRelPre.p_rel, p_rel) annotation (Line(
      points={{50,241},{50,220},{-170,220}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(out.ports[1], senRelPre.port_b) annotation (Line(
      points={{-38,250},{40,250}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(temAirCor.T, multiplex3_1.u3[1]) annotation (Line(points={{315,228},{
          322,228},{322,234},{338,234},{338,283}}, color={0,0,127}));
  connect(temAirNor.T, multiplex3_1.u2[1])
    annotation (Line(points={{313,290},{338,290}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true,
        extent={{-160,-100},{380,500}},
        initialScale=0.1)),   Icon(coordinateSystem(extent={{-80,-80},{380,160}},
        preserveAspectRatio=true),
         graphics={Rectangle(
          extent={{-80,160},{380,-80}},
          lineColor={95,95,95},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-118,94},{-96,60}},
          textColor={0,0,255},
          textString="dP")}),
    Documentation(info="<html>
<p>
This is a partial model for one floor of the DOE reference office building.
</p>
</html>",
revisions="<html>
<ul>
<li>
January 25, 2021, by Michael Wetter:<br/>
Replaced door model with the new model <a href=\"modelica://Buildings.Airflow.Multizone.DoorOpen\">
Buildings.Airflow.Multizone.DoorOpen</a>.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1353\">IBPSA, #1353</a>.
</li>
<li>
November 15, 2019, by Milica Grahovac:<br/>
First implementation.
</li>
</ul>
</html>"));
end PartialFloor;
