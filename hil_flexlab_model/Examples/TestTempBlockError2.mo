within hil_flexlab_model.Examples;
model TestTempBlockError2
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

  Buildings.Controls.OBC.UnitConversions.From_degF from_degF
    annotation (Placement(transformation(extent={{-40,38},{-20,58}})));
  Modelica.Blocks.Sources.CombiTimeTable tempSup(table=[21427200,63.42; 21428100,
        64.96; 21429000,65.15; 21429900,65.41; 21430800,65.96; 21431700,66.69; 21432600,
        67.41; 21433500,67.08; 21434400,65.61; 21435300,65.84; 21436200,65.29; 21437100,
        65.15; 21438000,65.45; 21438900,64.73; 21439800,65.34; 21440700,65.2; 21441600,
        64.68; 21442500,64.8; 21443400,65.21; 21444300,64.62; 21445200,65.46; 21446100,
        64.35; 21447000,63.61; 21447900,59.04; 21448800,57.28; 21449700,55.97; 21450600,
        55.14; 21451500,54.6; 21452400,54.01; 21453300,52.96; 21454200,52.34; 21455100,
        52.08; 21456000,51.99; 21456900,51.98; 21457800,51.92; 21458700,52.02; 21459600,
        52.34; 21460500,52.51; 21461400,52.47; 21462300,52.18; 21463200,52.11; 21464100,
        51.73; 21465000,51.38; 21465900,50.97; 21466800,50.98; 21467700,50.99; 21468600,
        51.12; 21469500,51.26; 21470400,51.3; 21471300,51.46; 21472200,51.7; 21473100,
        52.01; 21474000,52.43; 21474900,52.77; 21475800,53.1; 21476700,53.22; 21477600,
        53.28; 21478500,53.28; 21479400,52.8; 21480300,52.58; 21481200,52.44; 21482100,
        52.44; 21483000,52.49; 21483900,52.44; 21484800,52.39; 21485700,52.48; 21486600,
        52.53; 21487500,52.58; 21488400,52.69; 21489300,52.72; 21490200,52.79; 21491100,
        52.97; 21492000,53.02; 21492900,53.77; 21493800,53.87; 21494700,53.24; 21495600,
        53.08; 21496500,53.21; 21497400,53.33; 21498300,53.3; 21499200,53.15; 21500100,
        53.28; 21501000,53.2; 21501900,53.09; 21502800,53.14; 21503700,53.24; 21504600,
        53; 21505500,53.05; 21506400,53.16; 21507300,55.61; 21508200,59.86; 21509100,
        61.78; 21510000,63.57; 21510900,64.21; 21511800,64.87; 21512700,65.72])
    annotation (Placement(transformation(extent={{-86,40},{-66,60}})));
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = MediumA,
      nPorts=1)
    annotation (Placement(transformation(extent={{46,-62},{66,-42}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{52,-18},{72,2}})));
  Modelica.Blocks.Sources.Constant const(k=0.3)
    annotation (Placement(transformation(extent={{44,56},{64,76}})));
  Buildings.Fluid.Sources.Boundary_pT bou1(
    redeclare package Medium = MediumA,
    T=296.15,
    nPorts=1) annotation (Placement(transformation(extent={{-18,-30},{2,-10}})));
equation
  connect(tempSup.y[1], from_degF.u) annotation (Line(points={{-65,50},{-52,50},
          {-52,48},{-42,48}}, color={0,0,127}));
  connect(fan.port_b, bou.ports[1]) annotation (Line(points={{72,-8},{82,-8},{
          82,-52},{66,-52}}, color={0,127,255}));
  connect(const.y, fan.m_flow_in)
    annotation (Line(points={{65,66},{74,66},{74,4},{62,4}}, color={0,0,127}));
  connect(bou1.ports[1], fan.port_a) annotation (Line(points={{2,-20},{28,-20},
          {28,-8},{52,-8}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=21427200,
      StopTime=21513600,
      Interval=299.999808,
      __Dymola_Algorithm="Dassl"));
end TestTempBlockError2;
