within hil_flexlab_model.ThermalZones;
model FlexlabX1A "Model of a flexlab x1a"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium model for air" annotation (choicesAllMatching=true);

  parameter Boolean use_windPressure=true
    "Set to true to enable wind pressure";

  parameter Buildings.HeatTransfer.Types.InteriorConvection intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature
    "Convective heat transfer model for room-facing surfaces of opaque constructions";
  parameter Modelica.SIunits.Angle lat "Latitude";
  parameter Real winWalRat(
    min=0.01,
    max=0.99) = 0.33 "Window to wall ratio for exterior walls";
  parameter Modelica.SIunits.Length hWin = 1.5 "Height of windows";
  parameter Buildings.HeatTransfer.Data.Solids.Plywood matFur(x=0.15, nStaRef=5)
    "Material for furniture"
    annotation (Placement(transformation(extent={{140,460},{160,480}})));
  parameter Buildings.HeatTransfer.Data.Resistances.Carpet matCar "Carpet"
    annotation (Placement(transformation(extent={{180,460},{200,480}})));
  parameter Buildings.HeatTransfer.Data.Solids.Concrete matCon(
    x=0.1,
    k=1.311,
    c=836,
    nStaRef=5) "Concrete"
    annotation (Placement(transformation(extent={{140,430},{160,450}})));
  parameter Buildings.HeatTransfer.Data.Solids.Plywood matWoo(
    x=0.01,
    k=0.11,
    d=544,
    nStaRef=1) "Wood for exterior construction"
    annotation (Placement(transformation(extent={{140,400},{160,420}})));
  parameter Buildings.HeatTransfer.Data.Solids.Generic matIns(
    x=0.087,
    k=0.049,
    c=836.8,
    d=265,
    nStaRef=5) "Steelframe construction with insulation"
    annotation (Placement(transformation(extent={{180,400},{200,420}})));
  parameter Buildings.HeatTransfer.Data.Solids.GypsumBoard matGyp(
    x=0.0127,
    k=0.16,
    c=830,
    d=784,
    nStaRef=2) "Gypsum board"
    annotation (Placement(transformation(extent={{138,372},{158,392}})));
  parameter Buildings.HeatTransfer.Data.Solids.GypsumBoard matGyp2(
    x=0.025,
    k=0.16,
    c=830,
    d=784,
    nStaRef=2) "Gypsum board"
    annotation (Placement(transformation(extent={{178,372},{198,392}})));
  parameter Buildings.HeatTransfer.Data.Solids.Plywood matCarTra(
    k=0.11,
    d=544,
    nStaRef=1,
    x=0.215/0.11) "Wood for floor"
    annotation (Placement(transformation(extent={{102,460},{122,480}})));
  parameter Real kIntNor(min=0, max=1) = 1
    "Gain factor to scale internal heat gain in north zone";
  constant Modelica.SIunits.Height hRoo=2.74 "Room height";

  parameter Boolean sampleModel = false
    "Set to true to time-sample the model, which can give shorter simulation time if there is already time sampling in the system model"
    annotation (
      Evaluate=true,
      Dialog(tab="Experimental (may be changed in future releases)"));

  Buildings.ThermalZones.Detailed.MixedAir sou(
    redeclare package Medium = Medium,
    lat=lat,
    AFlo=6.49*3.05,
    nConPar=0,
    nConBou=3,
    nConExt=1,
    nConExtWin=1,
    nSurBou=1,
    hRoo=3.6576,
    surBou(
        A = {6.49*3.05},
        each absIR=0.9,
        each absSol=0.9,
        each til=Buildings.Types.Tilt.Floor),
    datConExt(
         layers={WestExt},
         A={3.05*2.74},
         til={Buildings.Types.Tilt.Wall},
         azi={Buildings.Types.Azimuth.W}),
    datConExtWin(
        layers={SouthExt},
        A={6.49*2.74},
        glaSys={glaSys},
        hWin={1.8288},
        wWin={5.88},
        til={Buildings.Types.Tilt.Wall},
        azi={Buildings.Types.Azimuth.S}),
    datConBou(
         layers = {celDiv, zonDiv, ceiling},
         A = {3.05*2.74, 6.49*2.74, 6.49*3.05},
         til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling},
         azi = {Buildings.Types.Azimuth.E, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.S}),
    nPorts=5,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    final sampleModel=sampleModel) "South zone"
    annotation (Placement(transformation(extent={{144,-44},{184,-4}})));
  Buildings.ThermalZones.Detailed.MixedAir ple(
    redeclare package Medium = Medium,
    lat=lat,
    AFlo=6.49*(3.05+3.05+3.23),
    hRoo=1.625,
    nSurBou=0,
    nConPar=0,
    nConBou=6,
    nConExt=4,
    nConExtWin=0,
    datConExt(
         layers={WestExt,
         SouthExt,
         NorthExt,
         R20Wal},
         A={9.33*1.63, 6.49*1.75, 2.68*1.5, 6.49*9.33},
         til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall,Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling},
         azi={Buildings.Types.Azimuth.W,Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.S}),
    datConBou(
         layers = {celDiv, parCon, parCon, ceiling, ceiling, ceiling},
         A = {9.33*1.63, 1.26*1.5, 2.55*1.5, 6.49*3.23, 6.49*3.05, 6.49*3.05},
         til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Floor, Buildings.Types.Tilt.Floor, Buildings.Types.Tilt.Floor},
         azi = {Buildings.Types.Azimuth.E, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.S}),
    nPorts=5,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
      extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    final sampleModel=sampleModel) "Ceiling plenum"
    annotation (Placement(transformation(extent={{358,60},{398,100}})));
  Buildings.ThermalZones.Detailed.MixedAir nor(
    redeclare package Medium = Medium,
    lat=lat,
    AFlo=6.49*3.23,
    hRoo=3.6576,
    nConPar=0,
    nConExtWin=0,
    nConExt=3,
    nConBou=6,
    nSurBou=1,
    surBou(
        A = {6.49*3.23},
        each absIR=0.9,
        each absSol=0.9,
        each til=Buildings.Types.Tilt.Floor),
    datConExt(
         layers={WestExt,
         NorthExt,
         extDoo},
         A={3.23*2.74, 2.68*2.74-1.37*2.39, 1.37*2.39},
         til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
         azi={Buildings.Types.Azimuth.W,Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.N}),
    datConBou(
         layers = {celDiv, parCon, parDoo, parCon, zonDiv, ceiling},
         A = {3.23*2.74, 1.26*2.74, 2.39*1.22, 2.55*2.74-2.39*1.22, 6.49*2.74, 6.49*3.23},
         til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall,Buildings.Types.Tilt.Ceiling},
         azi = {Buildings.Types.Azimuth.E, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.S}),
    nPorts=5,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    final sampleModel=sampleModel) "North zone"
    annotation (Placement(transformation(extent={{144,116},{184,156}})));
  Buildings.ThermalZones.Detailed.MixedAir cor(
    redeclare package Medium = Medium,
    lat=lat,
    AFlo=6.49*3.05,
    hRoo=3.6576,
    nConExt=1,
    nConExtWin=0,
    nConPar=0,
    nConBou=4,
    nSurBou=1,
    surBou(
        A = {6.49*3.05},
        each absIR=0.9,
        each absSol=0.9,
        each til=Buildings.Types.Tilt.Floor),
    datConExt(
         layers={WestExt},
         A={3.05*2.74},
         til={Buildings.Types.Tilt.Wall},
         azi={Buildings.Types.Azimuth.W}),
    datConBou(
         layers = {celDiv, zonDiv, zonDiv, ceiling},
         A = {3.05*2.74, 6.49*2.74, 6.49*2.74, 6.49*3.05},
         til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall,Buildings.Types.Tilt.Ceiling},
         azi = {Buildings.Types.Azimuth.E, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.S}),
    nPorts=10,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    final sampleModel=sampleModel) "Core zone"
    annotation (Placement(transformation(extent={{144,36},{184,76}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsSou[2](
      redeclare package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{70,-42},{110,-26}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsPle[2](
      redeclare package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{314,28},{354,44}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsNor[2](
      redeclare package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{70,118},{110,134}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsCor[2](
      redeclare package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{70,38},{110,54}})));
  Modelica.Blocks.Math.MatrixGain gai(K=40*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-100,100},{-80,120}})));
  Modelica.Blocks.Sources.Constant uSha(k=0)
    "Control signal for the shading device"
    annotation (Placement(transformation(extent={{-80,170},{-60,190}})));
  Modelica.Blocks.Routing.Replicator replicator(nout=1)
    annotation (Placement(transformation(extent={{-40,170},{-20,190}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather bus"
    annotation (Placement(transformation(extent={{200,190},{220,210}})));
  Buildings.Examples.VAVReheat.ThermalZones.RoomLeakage leaSou(
    redeclare package Medium = Medium,
    VRoo=6.49*3.05*3.6576,
    s=6.49/3.05,
    azi=Buildings.Types.Azimuth.S,
    final use_windPressure=use_windPressure)
    "Model for air infiltration through the envelope"
    annotation (Placement(transformation(extent={{-56,408},{-20,448}})));
  Buildings.Examples.VAVReheat.ThermalZones.RoomLeakage leaPle(
    redeclare package Medium = Medium,
    VRoo=6.49*(3.05 + 3.05 + 3.23)*1.625,
    s=6.49/9.33,
    azi=Buildings.Types.Azimuth.W,
    final use_windPressure=use_windPressure)
    "Model for air infiltration through the envelope"
    annotation (Placement(transformation(extent={{-56,342},{-20,382}})));
  Buildings.Examples.VAVReheat.ThermalZones.RoomLeakage leaNor(
    redeclare package Medium = Medium,
    VRoo=6.49*3.23*3.6576,
    s=6.49/3.23,
    azi=Buildings.Types.Azimuth.W,
    final use_windPressure=use_windPressure)
    "Model for air infiltration through the envelope"
    annotation (Placement(transformation(extent={{-56,286},{-20,326}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirSou
    "Air temperature sensor"
    annotation (Placement(transformation(extent={{290,340},{310,360}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirPle
    "Air temperature sensor"
    annotation (Placement(transformation(extent={{292,310},{312,330}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirNor
    "Air temperature sensor"
    annotation (Placement(transformation(extent={{292,280},{312,300}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirCor
    "Air temperature sensor"
    annotation (Placement(transformation(extent={{292,244},{312,264}})));
  Modelica.Blocks.Routing.Multiplex3
    multiplex3 annotation (Placement(transformation(extent={{340,280},{360,300}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir[3](
    each unit="K",
    each displayUnit="degC") "Room air temperatures"
    annotation (Placement(transformation(extent={{378,148},{398,168}}),
        iconTransformation(extent={{378,148},{398,168}})));
  Buildings.Airflow.Multizone.DoorDiscretizedOpen opeSouCor(
    redeclare package Medium = Medium,
    wOpe=0.01,
    forceErrorControlOnFlow=false) "Opening between perimeter1 and core"
    annotation (Placement(transformation(extent={{84,0},{104,20}})));
  Buildings.Airflow.Multizone.DoorDiscretizedOpen opeEasCor(
    redeclare package Medium = Medium,
    wOpe=0.01,
    forceErrorControlOnFlow=false) "Opening between perimeter2 and core"
    annotation (Placement(transformation(extent={{250,38},{270,58}})));
  Buildings.Airflow.Multizone.DoorDiscretizedOpen opeNorCor(
    redeclare package Medium = Medium,
    wOpe=0.01,
    forceErrorControlOnFlow=false) "Opening between perimeter3 and core"
    annotation (Placement(transformation(extent={{80,74},{100,94}})));
  Modelica.Blocks.Sources.CombiTimeTable intGaiFra(
    table=[0,0.05;
           8,0.05;
           9,0.9;
           12,0.9;
           12,0.8;
           13,0.8;
           13,1;
           17,1;
           19,0.1;
           24,0.05],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "Fraction of internal heat gain"
    annotation (Placement(transformation(extent={{-140,100},{-120,120}})));
  Buildings.Fluid.Sensors.RelativePressure senRelPre(redeclare package Medium = Medium)
    "Building pressure measurement"
    annotation (Placement(transformation(extent={{60,240},{40,260}})));
  Buildings.Fluid.Sources.Outside out(nPorts=1, redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-58,240},{-38,260}})));
  Modelica.Blocks.Interfaces.RealOutput p_rel
    "Relative pressure signal of building static pressure" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-170,220})));

  Modelica.Blocks.Math.Gain gaiIntNor[3](each k=kIntNor)
    "Gain for internal heat gain amplification for north zone"
    annotation (Placement(transformation(extent={{-60,134},{-40,154}})));
  Modelica.Blocks.Math.Gain gaiIntSou[3](each k=2 - kIntNor)
    "Gain to change the internal heat gain for south"
    annotation (Placement(transformation(extent={{-56,72},{-36,92}})));
  parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.Construction9
    SouthExt
    annotation (Placement(transformation(extent={{-134,468},{-114,488}})));
  parameter
    Data.Constructions.OpaqueConstructions.Roofs.ASHRAE_901_1975Roof
    R20Wal annotation (Placement(transformation(extent={{-92,466},{-72,486}})));
  parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.CellAndElectricalDividingWall
    R52Wal annotation (Placement(transformation(extent={{-50,468},{-30,488}})));
  parameter
    Data.Constructions.GlazingSystems.ASHRAE901Gla
    glaSys
    annotation (Placement(transformation(extent={{-130,434},{-110,454}})));
  parameter
    Data.Constructions.OpaqueConstructions.PartitionConstructions.PartitionWall
    parCon annotation (Placement(transformation(extent={{-12,466},{8,486}})));
  parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.TestCellDividngWall
    celDiv annotation (Placement(transformation(extent={{28,466},{48,486}})));
  parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.TestBedDividingWall
    bedDiv annotation (Placement(transformation(extent={{12,432},{32,452}})));
  parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.TestZoneDividngWall
    zonDiv
    annotation (Placement(transformation(extent={{-130,398},{-110,418}})));
  parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.Construction1
    WestExt
    annotation (Placement(transformation(extent={{-130,368},{-110,388}})));
  parameter
    Data.Constructions.OpaqueConstructions.Roofs.CeilingTile
    ceiling
    annotation (Placement(transformation(extent={{-132,334},{-112,354}})));
  parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.Construction3
    NorthExt annotation (Placement(transformation(extent={{12,402},{32,422}})));
  parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.ExteriorDoorInsulated
    extDoo annotation (Placement(transformation(extent={{18,372},{38,392}})));
  parameter
    Data.Constructions.OpaqueConstructions.PartitionConstructions.PartitionDoor
    parDoo
    annotation (Placement(transformation(extent={{-130,306},{-110,326}})));
  Modelica.Blocks.Sources.CombiTimeTable Lighting(
    table=[0,0.05; 8,0.05; 9,0.9; 12,0.9; 12,0.8; 13,0.8; 13,1; 17,1; 19,0.1;
        24,0.05],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from lights"
    annotation (Placement(transformation(extent={{-140,58},{-120,78}})));
  Modelica.Blocks.Sources.CombiTimeTable Plug(
    table=[0,0.05; 8,0.05; 9,0.9; 12,0.9; 12,0.8; 13,0.8; 13,1; 17,1; 19,0.1;
        24,0.05],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from plug"
    annotation (Placement(transformation(extent={{-140,20},{-120,40}})));
  Modelica.Blocks.Sources.CombiTimeTable occupant(
    table=[0,0.05; 8,0.05; 9,0.9; 12,0.9; 12,0.8; 13,0.8; 13,1; 17,1; 19,0.1;
        24,0.05],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from occupant"
    annotation (Placement(transformation(extent={{-140,-12},{-120,8}})));
  Modelica.Blocks.Math.MatrixGain ligGai(K=20*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-102,58},{-82,78}})));
  Modelica.Blocks.Math.MatrixGain plgGai(K=20*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-102,20},{-82,40}})));
  Modelica.Blocks.Math.MatrixGain occGai(K=20*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-102,-12},{-82,8}})));
  Modelica.Blocks.Math.Sum sumIntGai(nin=3)
    annotation (Placement(transformation(extent={{-58,20},{-38,40}})));
equation
  connect(sou.surf_conBou[2], cor.surf_conBou[3]) annotation (Line(
      points={{170,-40},{170,-54},{200,-54},{200,20},{170,20},{170,40.25}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(sou.surf_conBou[3], ple.surf_conBou[6]) annotation (Line(
      points={{170,-39.3333},{170,-54},{384,-54},{384,64.8333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ple.surf_conBou[5], cor.surf_conBou[4]) annotation (Line(
      points={{384,64.5},{384,20},{170,20},{170,40.75}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ple.surf_conBou[4], nor.surf_conBou[6]) annotation (Line(
      points={{384,64.1667},{384,24},{220,24},{220,100},{170,100},{170,120.833}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(nor.surf_conBou[5], cor.surf_conBou[2]) annotation (Line(
      points={{170,120.5},{170,100},{200,100},{200,26},{170,26},{170,39.75}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(uSha.y, replicator.u) annotation (Line(
      points={{-59,180},{-42,180}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(replicator.y, nor.uSha) annotation (Line(
      points={{-19,180},{130,180},{130,154},{142.4,154}},
      color={0,0,127},
      pattern=LinePattern.Dash,
      smooth=Smooth.None));
  connect(replicator.y, sou.uSha) annotation (Line(
      points={{-19,180},{130,180},{130,-6},{142.4,-6}},
      color={0,0,127},
      pattern=LinePattern.Dash,
      smooth=Smooth.None));
  connect(replicator.y, cor.uSha) annotation (Line(
      points={{-19,180},{130,180},{130,74},{142.4,74}},
      color={0,0,127},
      pattern=LinePattern.Dash,
      smooth=Smooth.None));
  connect(gai.y, cor.qGai_flow)          annotation (Line(
      points={{-79,110},{120,110},{120,64},{142.4,64}},
      color={0,0,127},
      pattern=LinePattern.Dash,
      smooth=Smooth.None));
  connect(sou.weaBus, weaBus) annotation (Line(
      points={{181.9,-6.1},{181.9,8},{210,8},{210,200}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(ple.weaBus, weaBus) annotation (Line(
      points={{395.9,97.9},{395.9,120},{210,120},{210,200}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(nor.weaBus, weaBus) annotation (Line(
      points={{181.9,153.9},{182,160},{182,168},{210,168},{210,200}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(cor.weaBus, weaBus) annotation (Line(
      points={{181.9,73.9},{181.9,90},{210,90},{210,200}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus, leaSou.weaBus) annotation (Line(
      points={{210,200},{-80,200},{-80,428},{-56,428}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus, leaPle.weaBus) annotation (Line(
      points={{210,200},{-80,200},{-80,362},{-56,362}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus, leaNor.weaBus) annotation (Line(
      points={{210,200},{-80,200},{-80,306},{-56,306}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(multiplex3.y, TRooAir) annotation (Line(
      points={{361,290},{372,290},{372,158},{388,158}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(temAirSou.T, multiplex3.u1[1]) annotation (Line(
      points={{310,350},{328,350},{328,297},{338,297}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(temAirNor.T, multiplex3.u2[1]) annotation (Line(
      points={{312,290},{326,290},{326,290},{338,290}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(temAirCor.T, multiplex3.u3[1]) annotation (Line(
      points={{312,254},{332,254},{332,283},{338,283}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(sou.heaPorAir, temAirSou.port) annotation (Line(
      points={{163,-24},{224,-24},{224,100},{264,100},{264,350},{290,350}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ple.heaPorAir,temAirPle. port) annotation (Line(
      points={{377,80},{286,80},{286,320},{292,320}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(nor.heaPorAir, temAirNor.port) annotation (Line(
      points={{163,136},{164,136},{164,290},{292,290}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(cor.heaPorAir, temAirCor.port) annotation (Line(
      points={{163,56},{162,56},{162,254},{292,254}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(sou.ports[1], portsSou[1]) annotation (Line(
      points={{149,-37.2},{114,-37.2},{114,-34},{80,-34}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sou.ports[2], portsSou[2]) annotation (Line(
      points={{149,-35.6},{124,-35.6},{124,-34},{100,-34}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ple.ports[1],portsPle [1]) annotation (Line(
      points={{363,66.8},{300,66.8},{300,36},{324,36}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(ple.ports[2],portsPle [2]) annotation (Line(
      points={{363,68.4},{300,68.4},{300,36},{344,36}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(nor.ports[1], portsNor[1]) annotation (Line(
      points={{149,122.8},{114,122.8},{114,126},{80,126}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(nor.ports[2], portsNor[2]) annotation (Line(
      points={{149,124.4},{124,124.4},{124,126},{100,126}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(cor.ports[1], portsCor[1]) annotation (Line(
      points={{149,42.4},{114,42.4},{114,46},{80,46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(cor.ports[2], portsCor[2]) annotation (Line(
      points={{149,43.2},{124,43.2},{124,46},{100,46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(leaSou.port_b, sou.ports[3]) annotation (Line(
      points={{-20,428},{-2,428},{-2,-72},{134,-72},{134,-34},{149,-34}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(leaPle.port_b, ple.ports[3]) annotation (Line(
      points={{-20,362},{246,362},{246,70},{363,70}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(leaNor.port_b, nor.ports[3]) annotation (Line(
      points={{-20,306},{138,306},{138,126},{149,126}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeSouCor.port_b1, cor.ports[3]) annotation (Line(
      points={{104,16},{116,16},{116,44},{149,44}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeSouCor.port_a2, cor.ports[4]) annotation (Line(
      points={{104,4},{116,4},{116,44.8},{149,44.8}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeSouCor.port_a1, sou.ports[4]) annotation (Line(
      points={{84,16},{74,16},{74,-20},{134,-20},{134,-32.4},{149,-32.4}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeSouCor.port_b2, sou.ports[5]) annotation (Line(
      points={{84,4},{74,4},{74,-20},{134,-20},{134,-30.8},{149,-30.8}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeEasCor.port_b1, ple.ports[4]) annotation (Line(
      points={{270,54},{290,54},{290,71.6},{363,71.6}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeEasCor.port_a2, ple.ports[5]) annotation (Line(
      points={{270,42},{290,42},{290,73.2},{363,73.2}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeEasCor.port_a1, cor.ports[5]) annotation (Line(
      points={{250,54},{190,54},{190,34},{142,34},{142,45.6},{149,45.6}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeEasCor.port_b2, cor.ports[6]) annotation (Line(
      points={{250,42},{190,42},{190,34},{142,34},{142,46.4},{149,46.4}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeNorCor.port_b1, nor.ports[4]) annotation (Line(
      points={{100,90},{124,90},{124,127.6},{149,127.6}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeNorCor.port_a2, nor.ports[5]) annotation (Line(
      points={{100,78},{124,78},{124,129.2},{149,129.2}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeNorCor.port_a1, cor.ports[7]) annotation (Line(
      points={{80,90},{76,90},{76,60},{142,60},{142,47.2},{149,47.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(opeNorCor.port_b2, cor.ports[8]) annotation (Line(
      points={{80,78},{76,78},{76,60},{142,60},{142,48},{149,48}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(intGaiFra.y, gai.u) annotation (Line(
      points={{-119,110},{-102,110}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(cor.ports[10], senRelPre.port_a) annotation (Line(
      points={{149,49.6},{110,49.6},{110,250},{60,250}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(out.weaBus, weaBus) annotation (Line(
      points={{-58,250.2},{-70,250.2},{-70,250},{-80,250},{-80,200},{210,200}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(out.ports[1], senRelPre.port_b) annotation (Line(
      points={{-38,250},{40,250}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(senRelPre.p_rel, p_rel) annotation (Line(
      points={{50,241},{50,220},{-170,220}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(gai.y, gaiIntNor.u) annotation (Line(
      points={{-79,110},{-68,110},{-68,144},{-62,144}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(gai.y, gaiIntSou.u) annotation (Line(
      points={{-79,110},{-68,110},{-68,82},{-58,82}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(gaiIntSou.y, sou.qGai_flow) annotation (Line(
      points={{-35,82},{68,82},{68,-16},{142.4,-16}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(gai.y, ple.qGai_flow) annotation (Line(points={{-79,110},{138,110},{
          138,88},{356.4,88}}, color={0,0,127}));
  connect(replicator.y, ple.uSha) annotation (Line(points={{-19,180},{168,180},
          {168,98},{356.4,98}}, color={0,0,127}));
  connect(Lighting.y, ligGai.u)
    annotation (Line(points={{-119,68},{-104,68}}, color={0,0,127}));
  connect(Plug.y, plgGai.u)
    annotation (Line(points={{-119,30},{-104,30}}, color={0,0,127}));
  connect(occupant.y, occGai.u)
    annotation (Line(points={{-119,-2},{-104,-2}}, color={0,0,127}));
  connect(plgGai.y[1], sumIntGai.u[2])
    annotation (Line(points={{-81,30},{-60,30}}, color={0,0,127}));
  connect(occGai.y[1], sumIntGai.u[1]) annotation (Line(points={{-81,-2},{-70,
          -2},{-70,28.6667},{-60,28.6667}}, color={0,0,127}));
  connect(ligGai.y[1], sumIntGai.u[3]) annotation (Line(points={{-81,68},{-70,
          68},{-70,31.3333},{-60,31.3333}}, color={0,0,127}));
  connect(gaiIntNor.y, nor.qGai_flow)
    annotation (Line(points={{-39,144},{142.4,144}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-160,-100},
            {400,500}},
        initialScale=0.1)),     Icon(coordinateSystem(
          preserveAspectRatio=true, extent={{-160,-100},{400,500}}), graphics={
        Rectangle(
          extent={{-80,-80},{380,180}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,160},{360,-60}},
          pattern=LinePattern.None,
          lineColor={117,148,176},
          fillColor={170,213,255},
          fillPattern=FillPattern.Sphere),
        Rectangle(
          extent={{0,-80},{294,-60}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{0,-74},{294,-66}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{8,8},{294,100}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{20,88},{280,22}},
          pattern=LinePattern.None,
          lineColor={117,148,176},
          fillColor={170,213,255},
          fillPattern=FillPattern.Sphere),
        Polygon(
          points={{-56,170},{20,94},{12,88},{-62,162},{-56,170}},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{290,16},{366,-60},{358,-66},{284,8},{290,16}},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{284,96},{360,168},{368,162},{292,90},{284,96}},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-80,120},{-60,-20}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-74,120},{-66,-20}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-64,-56},{18,22},{26,16},{-58,-64},{-64,-56}},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{360,122},{380,-18}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{366,122},{374,-18}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{2,170},{296,178}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{2,160},{296,180}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{2,166},{296,174}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-84,234},{-62,200}},
          lineColor={0,0,255},
          textString="dP")}),
    Documentation(revisions="<html>
<ul>
<li>
May 1, 2013, by Michael Wetter:<br/>
Declared the parameter record to be a parameter, as declaring its elements
to be parameters does not imply that the whole record has the variability of a parameter.
</li>
</ul>
</html>"));
end FlexlabX1A;
