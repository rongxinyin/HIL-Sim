within hil_flexlab_model.Examples;
model TestTemperatureChange
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


  Buildings.Fluid.Sensors.TemperatureTwoPort TSup2(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{16,0},{36,20}})));
  Buildings.Fluid.Sources.Boundary_pT sinCoo(redeclare package Medium = MediumA,
      nPorts=1)
              "Sink for cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={84,-6})));
  Modelica.Blocks.Sources.Constant const(k=1500)
    annotation (Placement(transformation(extent={{-66,-64},{-46,-44}})));
  Buildings.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = MediumA,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1)
    annotation (Placement(transformation(extent={{-82,-12},{-62,8}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TSup1(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-46,-12},{-26,8}})));
  Modelica.Blocks.Sources.Constant const1(k=0.2)
    annotation (Placement(transformation(extent={{-82,36},{-62,56}})));
  Buildings.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
    annotation (Placement(transformation(extent={{-6,-58},{14,-38}})));
  Modelica.Blocks.Sources.Constant const2(k=273.15 + 20)
    annotation (Placement(transformation(extent={{-96,-40},{-76,-20}})));
equation
  connect(TSup2.port_b, sinCoo.ports[1]) annotation (Line(points={{36,10},{60,
          10},{60,4},{84,4}}, color={0,127,255}));
  connect(boundary1.ports[1], TSup1.port_a)
    annotation (Line(points={{-62,-2},{-46,-2}}, color={0,127,255}));
  connect(TSup1.port_b, TSup2.port_a) annotation (Line(points={{-26,-2},{0,-2},
          {0,10},{16,10}}, color={0,127,255}));
  connect(const1.y, boundary1.m_flow_in) annotation (Line(points={{-61,46},{-58,
          46},{-58,6},{-84,6}}, color={0,0,127}));
  connect(const.y, prescribedHeatFlow.Q_flow) annotation (Line(points={{-45,-54},
          {-26,-54},{-26,-48},{-6,-48}}, color={0,0,127}));
  connect(const2.y, boundary1.T_in) annotation (Line(points={{-75,-30},{-80,-30},
          {-80,2},{-84,2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=60,
      Interval=1,
      __Dymola_Algorithm="Dassl"));
end TestTemperatureChange;
