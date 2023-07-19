within hil_flexlab_model.Examples;
model TestTempBlockError
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
  Buildings.Fluid.Sensors.VolumeFlowRate senSupFlo(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    "Sensor for supply fan flow rate"
    annotation (Placement(transformation(extent={{60,-24},{80,-4}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TSup(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{32,-24},{52,-4}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fanSup(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-54,-24},{-34,-4}})));

  Modelica.Blocks.Sources.CombiTimeTable floSupTable(table=[21427200,0.2461; 21428100,
        0.2475; 21429000,0.2467; 21429900,0.2473; 21430800,0.2475; 21431700,0.2489;
        21432600,0.2494; 21433500,0.2495; 21434400,0.2477; 21435300,0.2479; 21436200,
        0.248; 21437100,0.2473; 21438000,0.2481; 21438900,0.2475; 21439800,0.2474;
        21440700,0.2483; 21441600,0.2472; 21442500,0.2474; 21443400,0.2486; 21444300,
        0.2474; 21445200,0.2486; 21446100,0.2478; 21447000,0.2477; 21447900,0.2454;
        21448800,0.2416; 21449700,0.2403; 21450600,0.2393; 21451500,0.2215; 21452400,
        0.2219; 21453300,0.3759; 21454200,0.4431; 21455100,0.441; 21456000,0.4401;
        21456900,0.4415; 21457800,0.4557; 21458700,0.3345; 21459600,0.2357; 21460500,
        0.2286; 21461400,0.2395; 21462300,0.2403; 21463200,0.24; 21464100,0.2753;
        21465000,0.2957; 21465900,0.3146; 21466800,0.329; 21467700,0.3478; 21468600,
        0.3766; 21469500,0.4055; 21470400,0.4172; 21471300,0.4534; 21472200,0.4547;
        21473100,0.4998; 21474000,0.5187; 21474900,0.5194; 21475800,0.5121; 21476700,
        0.5044; 21477600,0.5002; 21478500,0.2872; 21479400,0.2397; 21480300,0.2403;
        21481200,0.3079; 21482100,0.3586; 21483000,0.3549; 21483900,0.3514; 21484800,
        0.3435; 21485700,0.319; 21486600,0.3121; 21487500,0.3062; 21488400,0.296;
        21489300,0.2866; 21490200,0.2746; 21491100,0.2647; 21492000,0.2618; 21492900,
        0.4627; 21493800,0.3388; 21494700,0.2814; 21495600,0.2638; 21496500,0.2511;
        21497400,0.2411; 21498300,0.2414; 21499200,0.2409; 21500100,0.2416; 21501000,
        0.241; 21501900,0.2411; 21502800,0.2414; 21503700,0.2417; 21504600,0.2365;
        21505500,0.2236; 21506400,0.2238; 21507300,0.2387; 21508200,0.2445; 21509100,
        0.2457; 21510000,0.2467; 21510900,0.2454; 21511800,0.2455; 21512700,0.2462])
    annotation (Placement(transformation(extent={{-46,-72},{-26,-52}})));
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
  Buildings.Fluid.Sources.Boundary_pT bou(
    redeclare package Medium = MediumA,
    T=294.15,
    nPorts=1)
    annotation (Placement(transformation(extent={{-100,-52},{-80,-32}})));
  Buildings.Fluid.Sources.Boundary_pT bou1(redeclare package Medium = MediumA,
                                           nPorts=1)
    annotation (Placement(transformation(extent={{52,-86},{72,-66}})));
  Buildings.Fluid.Sources.PropertySource_T proSou(use_T_in=true, redeclare
      package Medium = MediumA)
    annotation (Placement(transformation(extent={{0,-24},{20,-4}})));
equation
  connect(tempSup.y[1], from_degF.u) annotation (Line(points={{-65,50},{-52,50},
          {-52,48},{-42,48}}, color={0,0,127}));
  connect(floSupTable.y[1], fanSup.m_flow_in) annotation (Line(points={{-25,-62},
          {-12,-62},{-12,-2},{-44,-2}},
                                      color={0,0,127}));
  connect(TSup.port_b, senSupFlo.port_a)
    annotation (Line(points={{52,-14},{60,-14}}, color={0,127,255}));
  connect(senSupFlo.port_b, bou1.ports[1]) annotation (Line(points={{80,-14},{78,
          -14},{78,-76},{72,-76}}, color={0,127,255}));
  connect(bou.ports[1], fanSup.port_a) annotation (Line(points={{-80,-42},{-68,
          -42},{-68,-14},{-54,-14}}, color={0,127,255}));
  connect(from_degF.y, proSou.T_in) annotation (Line(points={{-18,48},{-6,48},{
          -6,44},{6,44},{6,-2}}, color={0,0,127}));
  connect(fanSup.port_b, proSou.port_a)
    annotation (Line(points={{-34,-14},{0,-14}}, color={0,127,255}));
  connect(proSou.port_b, TSup.port_a)
    annotation (Line(points={{20,-14},{32,-14}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=21427200,
      StopTime=21513600,
      Interval=299.999808,
      __Dymola_Algorithm="Dassl"));
end TestTempBlockError;
