within hil_flexlab_model.Examples;
model TestZoneModel
  replaceable package Medium=Buildings.Media.Air "Air medium";
  Buildings.Occupants.ThermalZones.Detailed.MixedAir mixedAir(
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=3,
    nSurBou=1,
    redeclare package Medium = Medium,
    lat=0.69813170079773,
    AFlo=6.49*3.05,
    hRoo=3.6576)
    annotation (Placement(transformation(extent={{-62,-68},{-22,-28}})));
  Modelica.Blocks.Sources.CombiTimeTable ligSch(
    table=[0,0; 7,0; 7,0.5; 8,0.5; 8,0.9; 17,0.9; 17,0.5; 21,0.5; 21,0; 24,0],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from lights"
    annotation (Placement(transformation(extent={{-64,74},{-44,94}})));
  Modelica.Blocks.Sources.CombiTimeTable pluSch(
    table=[0,0.4; 9,0.4; 9,0.9; 13,0.9; 13,0.8; 14,0.8; 14,0.9; 18,0.9; 18,0.5;
        19,0.5; 19,0.4; 24,0.4],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from plug"
    annotation (Placement(transformation(extent={{-64,36},{-44,56}})));
  Modelica.Blocks.Sources.CombiTimeTable occSch(
    table=[0,0; 8,0; 8,0.5; 9,0.5; 9,1; 13,1; 13,0.5; 14,0.5; 14,1; 18,1; 18,
        0.5; 19,0.5; 19,0.0; 24,0.0],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from occupant"
    annotation (Placement(transformation(extent={{-64,4},{-44,24}})));
  Modelica.Blocks.Math.MatrixGain ligGai(K=10*[0.5; 0.5; 0.0])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-26,74},{-6,94}})));
  Modelica.Blocks.Math.MatrixGain plgGai(K=10*[0.5; 0.5; 0.0])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-26,36},{-6,56}})));
  Modelica.Blocks.Math.MatrixGain occGai(K=14*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-26,4},{-6,24}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{22,74},{42,94}})));
  Modelica.Blocks.Math.Add3 add3_2
    annotation (Placement(transformation(extent={{22,36},{42,56}})));
  Modelica.Blocks.Math.Add3 add3_3
    annotation (Placement(transformation(extent={{22,2},{42,22}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_1
    annotation (Placement(transformation(extent={{60,36},{80,56}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
        Modelica.Utilities.Files.loadResource(
        "Resources/weatherdata/US_Berkeley_2021_0822.mos"))
    annotation (Placement(transformation(extent={{14,-50},{34,-30}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uLow=0, uHigh=1)
    annotation (Placement(transformation(extent={{-16,-74},{4,-54}})));
equation
  connect(ligSch.y,ligGai. u)
    annotation (Line(points={{-43,84},{-28,84}},   color={0,0,127}));
  connect(pluSch.y,plgGai. u)
    annotation (Line(points={{-43,46},{-28,46}},   color={0,0,127}));
  connect(occSch.y,occGai. u)
    annotation (Line(points={{-43,14},{-28,14}},   color={0,0,127}));
  connect(ligGai.y[1],add3_1. u1) annotation (Line(points={{-5,84},{10,84},{10,
          92},{20,92}},        color={0,0,127}));
  connect(plgGai.y[1],add3_1. u2) annotation (Line(points={{-5,46},{10,46},{10,
          84},{20,84}},        color={0,0,127}));
  connect(occGai.y[1],add3_1. u3) annotation (Line(points={{-5,14},{10,14},{10,
          76},{20,76}},        color={0,0,127}));
  connect(ligGai.y[2],add3_2. u1) annotation (Line(points={{-5,84},{10,84},{10,
          54},{20,54}},        color={0,0,127}));
  connect(plgGai.y[2],add3_2. u2)
    annotation (Line(points={{-5,46},{20,46}},     color={0,0,127}));
  connect(occGai.y[2],add3_2. u3) annotation (Line(points={{-5,14},{10,14},{10,
          38},{20,38}},        color={0,0,127}));
  connect(ligGai.y[3],add3_3. u1) annotation (Line(points={{-5,84},{10,84},{10,
          20},{20,20}},        color={0,0,127}));
  connect(plgGai.y[3],add3_3. u2) annotation (Line(points={{-5,46},{10,46},{10,
          12},{20,12}},        color={0,0,127}));
  connect(occGai.y[3],add3_3. u3) annotation (Line(points={{-5,14},{10,14},{10,
          4},{20,4}},          color={0,0,127}));
  connect(add3_1.y,multiplex3_1. u1[1]) annotation (Line(points={{43,84},{50,84},
          {50,53},{58,53}},          color={0,0,127}));
  connect(add3_2.y,multiplex3_1. u2[1])
    annotation (Line(points={{43,46},{58,46}},     color={0,0,127}));
  connect(add3_3.y,multiplex3_1. u3[1]) annotation (Line(points={{43,12},{50,12},
          {50,39},{58,39}},          color={0,0,127}));
  connect(multiplex3_1.y, mixedAir.qGai_flow) annotation (Line(points={{81,46},
          {86,46},{86,-14},{-84,-14},{-84,-40},{-63.6,-40}}, color={0,0,127}));
  connect(weaDat.weaBus, mixedAir.weaBus) annotation (Line(
      points={{34,-40},{42,-40},{42,-20},{-24.1,-20},{-24.1,-30.1}},
      color={255,204,51},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=21427200,
      StopTime=21513600,
      Interval=300));
end TestZoneModel;
