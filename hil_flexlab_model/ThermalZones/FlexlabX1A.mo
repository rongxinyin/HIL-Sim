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
        hWin={1.716},
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
  Buildings.ThermalZones.Detailed.MixedAir clo(
    redeclare package Medium = Medium,
    hRoo = 3.6576,
    AFlo = 3.93,
    lat = 0.66098585832754,
    nConExt = 2,
    nConBou = 3,
    nSurBou = 2,
    nConExtWin = 0,
    nConPar = 0,
    surBou(
        A = {3.6576 * 2.886075 - 2.39*1.22, 2.39 * 1.22},
        each absIR = 0.9,
        each absSol = 0.9,
        each til=Buildings.Types.Tilt.Wall),
    datConExt(
        layers = {higIns, R20Wal},
        A = {3.6576 * 1.667, 3.93},
        til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling},
        azi = {Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.N}),
    datConBou(
        layers = {higIns, celDiv, slaCon},
        A = {3.6576*1.524, 3.6576 * 1.524, 3.93},
        til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Floor},
        azi = {Buildings.Types.Azimuth.W, Buildings.Types.Azimuth.E, Buildings.Types.Azimuth.N},
        stateAtSurface_a = {true, false, false}),
    nPorts=4,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    final sampleModel=sampleModel) "Closet"
    annotation (Placement(transformation(extent={{154,312},{194,352}})));

  Buildings.ThermalZones.Detailed.MixedAir ele(
    redeclare package Medium = Medium,
    hRoo = 3.6576,
    AFlo = 2.39,
    lat = 0.66098585832754,
    nSurBou = 2,
    nConExt=4,
    nConExtWin=0,
    nConPar=0,
    nConBou=1,
    surBou(
      A = {3.6576 * 1.2641, 3.6576 * 1.524},
      each absIR = 0.9,
      each absSol = 0.9,
      each til = Buildings.Types.Tilt.Wall),
    datConExt(
      layers = {NorthExt, NorthExt, extDooUn, R20Wal},
      A = {3.6576 * 1.26413, 3.6576 * 1.524 - 2.38658 * 1.524, 2.38658*1.524, 2.39},
      til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling},
      azi = {Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.W, Buildings.Types.Azimuth.W, Buildings.Types.Azimuth.N}),
    datConBou(
     layers = {slaCon},
     A = {2.39},
     til = {Buildings.Types.Tilt.Floor},
     azi = {Buildings.Types.Azimuth.N},
     each stateAtSurface_a = false),
    nPorts=4,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    final sampleModel=sampleModel) "Model of the electrical room"
    annotation (Placement(transformation(extent={{154,372},{194,412}})));


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
  Modelica.Blocks.Math.MatrixGain gaiNor(K=35*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-100,100},{-80,120}})));
  Modelica.Blocks.Sources.Constant uSha(k=1)
    "Control signal for the shading device"
    annotation (Placement(transformation(extent={{-80,170},{-60,190}})));
  Modelica.Blocks.Routing.Replicator replicator(nout=1)
    annotation (Placement(transformation(extent={{-40,170},{-20,190}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather bus"
    annotation (Placement(transformation(extent={{200,224},{220,244}})));
  Buildings.Examples.VAVReheat.ThermalZones.RoomLeakage leaSou(
    redeclare package Medium = Medium,
    VRoo=6.49*3.05*3.6576,
    s=6.49/3.05,
    azi=Buildings.Types.Azimuth.S,
    final use_windPressure=use_windPressure)
    "Model for air infiltration through the envelope"
    annotation (Placement(transformation(extent={{-56,400},{-20,440}})));
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
    annotation (Placement(transformation(extent={{296,242},{316,262}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirCor
    "Air temperature sensor"
    annotation (Placement(transformation(extent={{294,280},{314,300}})));
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
    annotation (Placement(transformation(extent={{82,74},{102,94}})));
  Modelica.Blocks.Sources.CombiTimeTable intGaiNor(
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
    Data.Constructions.GlazingSystems.SingleClear3
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
  parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.CellAndElectricalDividingWall
    higIns
    annotation (Placement(transformation(extent={{84,464},{104,484}})));

  parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.ExteriorDoorUninsulated
    extDooUn annotation (Placement(transformation(extent={{54,434},{74,454}})));

  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic
    slaCon(nLay=3, material={Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.1524,
        k=1.13,
        c=1000,
        d=1400,
        nSta=5),Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.127,
        k=0.036,
        c=1200,
        d=40),Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.2,
        k=1.8,
        c=1100,
        d=2400)}) "Construction of the slab"
    annotation (Placement(transformation(extent={{120,464},{140,484}})));
  Modelica.Blocks.Sources.CombiTimeTable ligSch(
    table=[0,0; 7,0; 7,0.5; 8,0.5; 8,0.9; 17,0.9; 17,0.5; 21,0.5; 21,0; 24,0],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from lights"
    annotation (Placement(transformation(extent={{246,466},{266,486}})));
  Modelica.Blocks.Sources.CombiTimeTable pluSch(
    table=[0,0.4; 9,0.4; 9,0.9; 13,0.9; 13,0.8; 14,0.8; 14,0.9; 18,0.9; 18,0.5;
        19,0.5; 19,0.4; 24,0.4],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from plug"
    annotation (Placement(transformation(extent={{246,428},{266,448}})));
  Modelica.Blocks.Sources.CombiTimeTable occSch(
    table=[0,0; 7,0; 7,0.5; 8,0.5; 8,1; 12,1; 12,0.5; 13,0.5; 13,1; 17,1; 17,
        0.5; 18,0.5; 18,0.0; 24,0.0],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from occupant"
    annotation (Placement(transformation(extent={{246,396},{266,416}})));
  Modelica.Blocks.Math.MatrixGain ligGai(K=10*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{284,466},{304,486}})));
  Modelica.Blocks.Math.MatrixGain plgGai(K=10*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{284,428},{304,448}})));
  Modelica.Blocks.Math.MatrixGain occGai(K=14*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{284,396},{304,416}})));
  Modelica.Blocks.Sources.CombiTimeTable intGaiPle(
    table=[0,0.05; 8,0.05; 9,0.9; 12,0.9; 12,0.8; 13,0.8; 13,1; 17,1; 19,0.1; 24,
        0.05],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "Fraction of internal heat gain"
    annotation (Placement(transformation(extent={{-138,-62},{-118,-42}})));
  Modelica.Blocks.Math.MatrixGain gaiPle(K=0*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-100,-62},{-80,-42}})));
  Modelica.Blocks.Math.MatrixGain gaiSou(K=35*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-100,-24},{-80,-4}})));
  Modelica.Blocks.Sources.CombiTimeTable intGaiSou(
    table=[0,0.05; 8,0.05; 9,0.9; 12,0.9; 12,0.8; 13,0.8; 13,1; 17,1; 19,0.1; 24,
        0.05],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "Fraction of internal heat gain"
    annotation (Placement(transformation(extent={{-138,-24},{-118,-4}})));
  Modelica.Blocks.Sources.CombiTimeTable intGaiCor(
    table=[0,0.05; 8,0.05; 9,0.9; 12,0.9; 12,0.8; 13,0.8; 13,1; 17,1; 19,0.1; 24,
        0.05],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "Fraction of internal heat gain"
    annotation (Placement(transformation(extent={{-138,20},{-118,40}})));
  Modelica.Blocks.Math.MatrixGain gaiCor(K=35*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));

  Modelica.Blocks.Sources.CombiTimeTable intGaiClo(table=[0,0,0,0; 86400,0,0,0],
      tableOnFile=false) "Internal gain heat flow for the closet"
    annotation (Placement(transformation(extent={{82,370},{102,390}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsClo[2](redeclare
      package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{74,316},{114,332}})));

  Modelica.Blocks.Sources.CombiTimeTable intGaiEle(table=[0,0,0,0; 86400,0,0,0],
      tableOnFile=false) "Internal gain heat flow for the electrical room"
    annotation (Placement(transformation(extent={{82,402},{102,422}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{332,466},{352,486}})));
  Modelica.Blocks.Math.Add3 add3_2
    annotation (Placement(transformation(extent={{332,428},{352,448}})));
  Modelica.Blocks.Math.Add3 add3_3
    annotation (Placement(transformation(extent={{332,394},{352,414}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_1
    annotation (Placement(transformation(extent={{370,428},{390,448}})));
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
  connect(replicator.y, sou.uSha) annotation (Line(
      points={{-19,180},{130,180},{130,-6},{142.4,-6}},
      color={0,0,127},
      pattern=LinePattern.Dash,
      smooth=Smooth.None));
  connect(sou.weaBus, weaBus) annotation (Line(
      points={{181.9,-6.1},{181.9,8},{210,8},{210,234}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(ple.weaBus, weaBus) annotation (Line(
      points={{395.9,97.9},{395.9,120},{210,120},{210,234}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(nor.weaBus, weaBus) annotation (Line(
      points={{181.9,153.9},{181.9,168},{210,168},{210,234}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(cor.weaBus, weaBus) annotation (Line(
      points={{181.9,73.9},{181.9,90},{210,90},{210,234}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus, leaSou.weaBus) annotation (Line(
      points={{210,234},{-80,234},{-80,420},{-56,420}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus, leaPle.weaBus) annotation (Line(
      points={{210,234},{-80,234},{-80,362},{-56,362}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus, leaNor.weaBus) annotation (Line(
      points={{210,234},{-80,234},{-80,306},{-56,306}},
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
  connect(sou.heaPorAir, temAirSou.port) annotation (Line(
      points={{163,-24},{224,-24},{224,100},{264,100},{264,350},{290,350}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ple.heaPorAir,temAirPle. port) annotation (Line(
      points={{377,80},{286,80},{286,320},{292,320}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(nor.heaPorAir, temAirNor.port) annotation (Line(
      points={{163,136},{238,136},{238,252},{296,252}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(cor.heaPorAir, temAirCor.port) annotation (Line(
      points={{163,56},{186,56},{186,110},{274,110},{274,290},{294,290}},
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
      points={{-20,420},{-2,420},{-2,-72},{134,-72},{134,-34},{149,-34}},
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
      points={{102,90},{124,90},{124,127.6},{149,127.6}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeNorCor.port_a2, nor.ports[5]) annotation (Line(
      points={{102,78},{124,78},{124,129.2},{149,129.2}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(opeNorCor.port_a1, cor.ports[7]) annotation (Line(
      points={{82,90},{76,90},{76,60},{142,60},{142,47.2},{149,47.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(opeNorCor.port_b2, cor.ports[8]) annotation (Line(
      points={{82,78},{76,78},{76,60},{142,60},{142,48},{149,48}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(intGaiNor.y, gaiNor.u) annotation (Line(
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
      points={{-58,250.2},{-70,250.2},{-70,250},{-80,250},{-80,234},{210,234}},
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
  connect(ligSch.y, ligGai.u)
    annotation (Line(points={{267,476},{282,476}}, color={0,0,127}));
  connect(pluSch.y, plgGai.u)
    annotation (Line(points={{267,438},{282,438}}, color={0,0,127}));
  connect(occSch.y, occGai.u)
    annotation (Line(points={{267,406},{282,406}}, color={0,0,127}));
  connect(intGaiPle.y, gaiPle.u)
    annotation (Line(points={{-117,-52},{-102,-52}}, color={0,0,127}));
  connect(gaiPle.y, ple.qGai_flow) annotation (Line(points={{-79,-52},{324,-52},
          {324,88},{356.4,88}}, color={0,0,127}));
  connect(intGaiSou.y, gaiSou.u)
    annotation (Line(points={{-117,-14},{-102,-14}}, color={0,0,127}));
  connect(intGaiCor.y, gaiCor.u)
    annotation (Line(points={{-117,30},{-102,30}}, color={0,0,127}));
  connect(weaBus, clo.weaBus) annotation (Line(
      points={{210,234},{226,234},{226,350},{212,350},{212,349.9},{191.9,349.9}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));

  connect(intGaiClo.y, clo.qGai_flow) annotation (Line(points={{103,380},{130,380},
          {130,340},{152.4,340}}, color={0,0,127}));
  connect(clo.ports[1],portsClo[1]) annotation (Line(points={{159,319},{126,319},
          {126,324},{84,324}},  color={0,127,255}));
  connect(clo.ports[2],portsClo[2]) annotation (Line(points={{159,321},{128,321},
          {128,324},{104,324}}, color={0,127,255}));
  connect(ele.surf_surBou[2], clo.surf_conBou[1]) annotation (Line(points={{170.2,
          378.5},{176,378.5},{176,315.333},{180,315.333}},
                                        color={191,0,0}));
  connect(clo.surf_surBou[2], nor.surf_conBou[3]) annotation (Line(points={{170.2,
          318.5},{170,318.5},{170,119.833}},
                          color={191,0,0}));
  connect(weaBus, ele.weaBus) annotation (Line(
      points={{210,234},{226,234},{226,409.9},{191.9,409.9}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(intGaiEle.y, ele.qGai_flow) annotation (Line(points={{103,412},{128.5,
          412},{128.5,400},{152.4,400}}, color={0,0,127}));
  connect(temAirNor.T, multiplex3.u3[1]) annotation (Line(points={{316,252},{
          326,252},{326,283},{338,283}}, color={0,0,127}));
  connect(temAirCor.T, multiplex3.u2[1])
    annotation (Line(points={{314,290},{338,290}}, color={0,0,127}));
  connect(ligGai.y[1], add3_1.u1) annotation (Line(points={{305,476},{320,476},{
          320,484},{330,484}}, color={0,0,127}));
  connect(plgGai.y[1], add3_1.u2) annotation (Line(points={{305,438},{320,438},{
          320,476},{330,476}}, color={0,0,127}));
  connect(occGai.y[1], add3_1.u3) annotation (Line(points={{305,406},{320,406},{
          320,468},{330,468}}, color={0,0,127}));
  connect(ligGai.y[2], add3_2.u1) annotation (Line(points={{305,476},{320,476},{
          320,446},{330,446}}, color={0,0,127}));
  connect(plgGai.y[2], add3_2.u2)
    annotation (Line(points={{305,438},{330,438}}, color={0,0,127}));
  connect(occGai.y[2], add3_2.u3) annotation (Line(points={{305,406},{320,406},{
          320,430},{330,430}}, color={0,0,127}));
  connect(ligGai.y[3], add3_3.u1) annotation (Line(points={{305,476},{320,476},{
          320,412},{330,412}}, color={0,0,127}));
  connect(plgGai.y[3], add3_3.u2) annotation (Line(points={{305,438},{320,438},{
          320,404},{330,404}}, color={0,0,127}));
  connect(occGai.y[3], add3_3.u3) annotation (Line(points={{305,406},{320,406},{
          320,396},{330,396}}, color={0,0,127}));
  connect(add3_1.y, multiplex3_1.u1[1]) annotation (Line(points={{353,476},{360,
          476},{360,445},{368,445}}, color={0,0,127}));
  connect(add3_2.y, multiplex3_1.u2[1])
    annotation (Line(points={{353,438},{368,438}}, color={0,0,127}));
  connect(add3_3.y, multiplex3_1.u3[1]) annotation (Line(points={{353,404},{360,
          404},{360,431},{368,431}}, color={0,0,127}));
  connect(multiplex3_1.y, nor.qGai_flow) annotation (Line(points={{391,438},{410,
          438},{410,144},{142.4,144}}, color={0,0,127}));
  connect(multiplex3_1.y, cor.qGai_flow) annotation (Line(points={{391,438},{
          410,438},{410,64},{142.4,64}}, color={0,0,127}));
  connect(multiplex3_1.y, sou.qGai_flow) annotation (Line(points={{391,438},{
          410,438},{410,-16},{142.4,-16}}, color={0,0,127}));
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
