within hil_flexlab_model.Examples;
model TestVesselPorts
  package Medium = Buildings.Media.Air "Medium model for air";
  BaseClasses.PartialTestVesselPorts partialTestVesselPorts
    annotation (Placement(transformation(extent={{-60,-26},{-40,-6}})));
  Buildings.Fluid.Sources.Boundary_pT sinCoo1(redeclare package Medium = Medium,
      nPorts=1)                                         "Sink for cooling coil"
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={54,4})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TSup1(redeclare package Medium =
        Medium, m_flow_nominal=1)
    annotation (Placement(transformation(extent={{-18,46},{2,66}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TSup2(redeclare package Medium =
        Medium, m_flow_nominal=1)
    annotation (Placement(transformation(extent={{-40,-76},{-20,-56}})));
  Buildings.Fluid.Sources.Boundary_pT sinCoo2(redeclare package Medium = Medium,
      nPorts=1)                                         "Sink for cooling coil"
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={34,-72})));
equation
  connect(partialTestVesselPorts.portsNor[1], TSup1.port_a) annotation (Line(
        points={{-41.2,-3.6},{-41.2,27.2},{-18,27.2},{-18,56}}, color={0,127,
          255}));
  connect(TSup1.port_b, sinCoo1.ports[1]) annotation (Line(points={{2,56},{12,
          56},{12,14},{54,14}}, color={0,127,255}));
  connect(TSup2.port_b, sinCoo2.ports[1]) annotation (Line(points={{-20,-66},{8,
          -66},{8,-62},{34,-62}}, color={0,127,255}));
  connect(TSup2.port_a, partialTestVesselPorts.portsNor[2]) annotation (Line(
        points={{-40,-66},{-40,-34},{-40,-3.6},{-39.2,-3.6}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end TestVesselPorts;
