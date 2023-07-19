within hil_flexlab_model.Examples;
model TemperatureChangeBlock
  package MediumA = Buildings.Media.Air "Medium model for air";

      parameter Modelica.SIunits.MassFlowRate mCor_flow_nominal=0.130*1.2 "*1.2Design mass flow rate core";
  parameter Modelica.SIunits.MassFlowRate mSou_flow_nominal=0.2313*1.2
                                                                 "*1.2Design mass flow rate perimeter 1";
  parameter Modelica.SIunits.MassFlowRate mPle_flow_nominal=0.03*1.2
    "Design mass flow rate perimeter 2";
  parameter Modelica.SIunits.MassFlowRate mNor_flow_nominal=0.130*1.2 "*1.2Design mass flow rate perimeter 3";
 // parameter Modelica.SIunits.MassFlowRate mCor_flow_nominal=6*VRooCor*conv
 //   "Design mass flow rate core";
 // parameter Modelica.SIunits.MassFlowRate mSou_flow_nominal=6*VRooSou*conv
 //   "Design mass flow rate perimeter 1";
 // parameter Modelica.SIunits.MassFlowRate mPle_flow_nominal=9*VRooPle*conv
 //   "Design mass flow rate perimeter 2";
 // parameter Modelica.SIunits.MassFlowRate mNor_flow_nominal=6*VRooNor*conv
 //   "Design mass flow rate perimeter 3";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=1.0*(mCor_flow_nominal
       + mSou_flow_nominal + mNor_flow_nominal+mPle_flow_nominal) "Nominal mass flow rate";

  Buildings.Fluid.Sensors.TemperatureTwoPort TSup(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{36,0},{56,20}})));
  Buildings.Fluid.Sources.Boundary_pT sinCoo1(redeclare package Medium =
        MediumA, nPorts=1)
              "Sink for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-74,-52})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo(redeclare package Medium =
        MediumA)
    annotation (Placement(transformation(extent={{2,-6},{22,14}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        MediumA)
    annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        MediumA)
    annotation (Placement(transformation(extent={{92,-10},{112,10}})));
  Modelica.Blocks.Interfaces.RealInput T_in
    annotation (Placement(transformation(extent={{-102,90},{-62,130}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-74,-6},{-54,14}})));
  Buildings.Fluid.Sources.Boundary_pT sinCoo2(
    redeclare package Medium = MediumA,
    use_T_in=true,
    nPorts=1) "Sink for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-14,-38})));
equation
  connect(senMasFlo.port_b, TSup.port_a) annotation (Line(points={{22,4},{30,4},
          {30,10},{36,10}}, color={0,127,255}));
  connect(TSup.port_b, port_b) annotation (Line(points={{56,10},{80,10},{80,0},
          {102,0}}, color={0,127,255}));
  connect(port_a, fan.port_a) annotation (Line(points={{-102,0},{-88,0},{-88,4},
          {-74,4}}, color={0,127,255}));
  connect(fan.port_b, sinCoo1.ports[1])
    annotation (Line(points={{-54,4},{-54,-42},{-74,-42}}, color={0,127,255}));
  connect(senMasFlo.m_flow, fan.m_flow_in) annotation (Line(points={{12,15},{12,
          30},{-64,30},{-64,16}}, color={0,0,127}));
  connect(sinCoo2.ports[1], senMasFlo.port_a) annotation (Line(points={{-14,-28},
          {-8,-28},{-8,4},{2,4}}, color={0,127,255}));
  connect(T_in, sinCoo2.T_in) annotation (Line(points={{-82,110},{-62,110},{-62,
          112},{-34,112},{-34,-50},{-18,-50}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=60,
      Interval=1,
      __Dymola_Algorithm="Dassl"));
end TemperatureChangeBlock;
