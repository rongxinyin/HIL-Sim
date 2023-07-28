within hil_flexlab_model.BaseClasses;
model PartialTestVesselPorts
  package Medium = Buildings.Media.Air "Medium model for air";
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsNor[2](redeclare
      package Medium = Medium)           "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{-46,-8},{-6,8}}),
        iconTransformation(extent={{78,116},{118,132}})));
  Buildings.Fluid.Sources.MassFlowSource_T sinCoo1(
    redeclare package Medium = Medium,
    m_flow=0.5,
    T=293.15,
    nPorts=1) "Sink for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-56,-56})));
  Buildings.Fluid.Sources.MassFlowSource_T
                                      sinCoo2(
    redeclare package Medium = Medium,
    m_flow=0.5,
    T=313.15,
    nPorts=1) "Sink for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-56})));
  Buildings.Fluid.Sensors.TemperatureTwoPort T1(redeclare package Medium =
        Medium, m_flow_nominal=0.5)
    annotation (Placement(transformation(extent={{-58,36},{-38,56}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort T2(redeclare package Medium =
        Medium, m_flow_nominal=0.5)
    annotation (Placement(transformation(extent={{22,-30},{42,-10}})));
equation
  connect(sinCoo1.ports[1], T1.port_a) annotation (Line(points={{-56,-46},{-62,
          -46},{-62,46},{-58,46}}, color={0,127,255}));
  connect(sinCoo2.ports[1], T2.port_a) annotation (Line(points={{10,-46},{10,
          -32},{22,-32},{22,-20}}, color={0,127,255}));
  connect(T2.port_b, portsNor[2]) annotation (Line(points={{42,-20},{46,-20},{
          46,8},{-16,8},{-16,0}}, color={0,127,255}));
  connect(T1.port_b, portsNor[1])
    annotation (Line(points={{-38,46},{-36,46},{-36,0}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PartialTestVesselPorts;
