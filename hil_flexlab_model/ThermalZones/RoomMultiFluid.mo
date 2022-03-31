within hil_flexlab_model.ThermalZones;
model RoomMultiFluid
  "BESTest Case 600 with fluid ports for air HVAC and internal load"
  replaceable package MediumA = Buildings.Media.Air "Medium model";
  parameter Modelica.SIunits.DimensionlessRatio occ_density "Occupant density in ppl/m^2";
  parameter Modelica.SIunits.MassFlowRate mAir_flow_nominal
    "Design airflow rate of system";
  parameter Modelica.SIunits.Angle lat "Building latitude";
  parameter Modelica.SIunits.Angle S_=
    Buildings.Types.Azimuth.S "Azimuth for south walls";
  parameter Modelica.SIunits.Angle E_=
    Buildings.Types.Azimuth.E "Azimuth for east walls";
  parameter Modelica.SIunits.Angle W_=
    Buildings.Types.Azimuth.W "Azimuth for west walls";
  parameter Modelica.SIunits.Angle N_=
    Buildings.Types.Azimuth.N "Azimuth for north walls";
  parameter Modelica.SIunits.Angle C_=
    Buildings.Types.Tilt.Ceiling "Tilt for ceiling";
  parameter Modelica.SIunits.Angle F_=
    Buildings.Types.Tilt.Floor "Tilt for floor";
  parameter Modelica.SIunits.Angle Z_=
    Buildings.Types.Tilt.Wall "Tilt for wall";
  parameter Integer nConExtWin = 2 "Number of constructions with a window";
  parameter Integer nConBou = 1
    "Number of surface that are connected to constructions that are modeled inside the room";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic matExtWal(
    nLay=3,
    absIR_a=0.9,
    absIR_b=0.9,
    absSol_a=0.7,
    absSol_b=0.7,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0100,
        k=0.1100,
        c=1210.00,
        d=544.62,
        nStaRef=Buildings.ThermalZones.Detailed.Validation.BESTEST.nStaRef),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0539,
        k=0.0490,
        c=836.80,
        d=265.00,
        nStaRef=Buildings.ThermalZones.Detailed.Validation.BESTEST.nStaRef),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0127,
        k=0.1600,
        c=830.00,
        d=784.90,
        nStaRef=Buildings.ThermalZones.Detailed.Validation.BESTEST.nStaRef)})
    "Steel Frame Non-Res Exterior Wall: 1. Wood Siding + 2. Steel Frame Non-Res Wall Insulation + 3. 1/2 in Gypsum"
    annotation (Placement(transformation(extent={{100,80},{114,94}})));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic matFlo(
    final nLay= 2,
    absIR_a=0.9,
    absIR_b=0.9,
    absSol_a=0.7,
    absSol_b=0.7,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0300,
        k=0.1386,
        c=0.00,
        d=0.00,
        nStaRef=Buildings.ThermalZones.Detailed.Validation.BESTEST.nStaRef),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.1016,
        k=1.3110,
        c=836.80,
        d=2240.00,
        nStaRef=Buildings.ThermalZones.Detailed.Validation.BESTEST.nStaRef)})
    "Slab on Grade Floor: 1. CP02 Carpet Pad + 2. HW Concrete"
    annotation (Placement(transformation(extent={{160,80},{174,94}})));
  parameter Buildings.HeatTransfer.Data.Solids.Generic soil(
    x=2,
    k=1.3,
    c=800,
    d=1500) "Soil properties"
    annotation (Placement(transformation(extent={{100,60},{120,80}})));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic roof(
    nLay=3,
    absIR_a=0.9,
    absIR_b=0.9,
    absSol_a=0.7,
    absSol_b=0.7,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0095,
        k=0.1600,
        c=1460.00,
        d=1121.29,
        nStaRef=Buildings.ThermalZones.Detailed.Validation.BESTEST.nStaRef),
     Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.1247,
        k=0.0490,
        c=836.80,
        d=265.00,
        nStaRef=Buildings.ThermalZones.Detailed.Validation.BESTEST.nStaRef),
     Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0015,
        k=45.0060,
        c=418.40,
        d=7680.00,
        nStaRef=Buildings.ThermalZones.Detailed.Validation.BESTEST.nStaRef)})
    "IEAD Non-Res Roof: 1. Roof Membrane + 2. IEAD Non-Res Roof Insulation + 3. Metal Decking"
    annotation (Placement(transformation(extent={{140,80},{154,94}})));
  parameter Buildings.ThermalZones.Detailed.Validation.BESTEST.Data.Win600 window600(
    UFra=3.2365,
    haveExteriorShade=false,
    haveInteriorShade=false) "Window"
    annotation (Placement(transformation(extent={{120,80},{134,94}})));
  parameter Integer nPorts=0 "Number of ports" annotation (Evaluate=true,
      Dialog(
      connectorSizing=true,
      tab="General",
      group="Ports"));
  Buildings.HeatTransfer.Conduction.SingleLayer soi(
    A=99,
    material=soil,
    steadyStateInitial=true,
    stateAtSurface_a=false,
    stateAtSurface_b=false,
    T_a_start=283.15,
    T_b_start=283.75) "2 m deep soil (per definition on p.4 of ASHRAE 140-2007)"
    annotation (Placement(transformation(
        extent={{12.5,-12.5},{-7.5,7.5}},
        rotation=-90,
        origin={70.5,-47.5})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus
    "Weather data bus"
    annotation (Placement(transformation(extent={{-118,172},{-102,188}}),
        iconTransformation(extent={{-118,172},{-102,188}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir(unit="K")
    "Room air temperature"
    annotation (Placement(transformation(extent={{200,-10},{220,10}}),
        iconTransformation(extent={{200,-10},{220,10}})));
  Buildings.ThermalZones.Detailed.MixedAir roo(
    redeclare package Medium = MediumA,
    hRoo=4,
    nConExtWin=2,
    nConBou=3,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    AFlo=AFlo,
    datConBou(
      layers={matFlo,matIntWal,matIntWal},
      A={99,9*4,11*4},
      til={F_,Z_,Z_}),
    datConExt(
      layers={roof},
      A={99},
      til={C_},
      azi={S_}),
    nConExt=1,
    nConPar=0,
    nSurBou=0,
    datConExtWin(
      layers={matExtWal,matExtWal},
      A={9*4,11*4},
      glaSys={window600,window600},
      wWin={9,11},
      hWin={1.4,1.4},
      fFra={0.001,0.001},
      til={Z_,Z_},
      azi={W_,S_}),
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    lat=lat,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    steadyStateWindow=false,
    nPorts=nPorts)
    "Room model for CORNER_CLASS_1_POD_1_ZN_1_FLR_1 of RefBldgPrimarySchoolNew2004_v1.3_5.0_SI"
    annotation (Placement(transformation(extent={{32,-26},{84,26}})));
  Modelica.Blocks.Routing.Multiplex3 mul "Multiplex"
    annotation (Placement(transformation(extent={{0,80},{22,102}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TSoi[nConBou](
    each T= 283.15) "Boundary condition for construction"
    annotation (Placement(transformation(
        extent={{0,0},{-20,20}},
        origin={140,-80})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senTZon
    "Zone air temperature sensor"
    annotation (Placement(transformation(extent={{160,-10},{180,10}})));
  Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses.InternalLoads schOcc(table=[0,
        0; 3600*1,0; 3600*2,0; 3600*3,0; 3600*4,0; 3600*5,0; 3600*6,0; 3600*7,0;
        3600*8,0; 3600*9,0.75; 3600*10,0.75; 3600*11,0.75; 3600*12,0.75; 3600*
        13,0.75; 3600*14,0.75; 3600*15,0.75; 3600*16,0.75; 3600*17,0.15; 3600*
        18,0.15; 3600*19,0.15; 3600*20,0.15; 3600*21,0.15; 3600*22,0; 3600*23,0;
        3600*24,0; 3600*(24*1 + 1),0; 3600*(24*1 + 2),0; 3600*(24*1 + 3),0;
        3600*(24*1 + 4),0; 3600*(24*1 + 5),0; 3600*(24*1 + 6),0; 3600*(24*1 + 7),
        0; 3600*(24*1 + 8),0; 3600*(24*1 + 9),0.75; 3600*(24*1 + 10),0.75; 3600
        *(24*1 + 11),0.75; 3600*(24*1 + 12),0.75; 3600*(24*1 + 13),0.75; 3600*(
        24*1 + 14),0.75; 3600*(24*1 + 15),0.75; 3600*(24*1 + 16),0.75; 3600*(24
        *1 + 17),0.15; 3600*(24*1 + 18),0.15; 3600*(24*1 + 19),0.15; 3600*(24*1
         + 20),0.15; 3600*(24*1 + 21),0.15; 3600*(24*1 + 22),0; 3600*(24*1 + 23),
        0; 3600*(24*2),0; 3600*(24*2 + 1),0; 3600*(24*2 + 2),0; 3600*(24*2 + 3),
        0; 3600*(24*2 + 4),0; 3600*(24*2 + 5),0; 3600*(24*2 + 6),0; 3600*(24*2
         + 7),0; 3600*(24*2 + 8),0; 3600*(24*2 + 9),0.75; 3600*(24*2 + 10),0.75;
        3600*(24*2 + 11),0.75; 3600*(24*2 + 12),0.75; 3600*(24*2 + 13),0.75;
        3600*(24*2 + 14),0.75; 3600*(24*2 + 15),0.75; 3600*(24*2 + 16),0.75;
        3600*(24*2 + 17),0.15; 3600*(24*2 + 18),0.15; 3600*(24*2 + 19),0.15;
        3600*(24*2 + 20),0.15; 3600*(24*2 + 21),0.15; 3600*(24*2 + 22),0; 3600*
        (24*2 + 23),0; 3600*(24*3),0; 3600*(24*3 + 1),0; 3600*(24*3 + 2),0;
        3600*(24*3 + 3),0; 3600*(24*3 + 4),0; 3600*(24*3 + 5),0; 3600*(24*3 + 6),
        0; 3600*(24*3 + 7),0; 3600*(24*3 + 8),0; 3600*(24*3 + 9),0.75; 3600*(24
        *3 + 10),0.75; 3600*(24*3 + 11),0.75; 3600*(24*3 + 12),0.75; 3600*(24*3
         + 13),0.75; 3600*(24*3 + 14),0.75; 3600*(24*3 + 15),0.75; 3600*(24*3
         + 16),0.75; 3600*(24*3 + 17),0.15; 3600*(24*3 + 18),0.15; 3600*(24*3
         + 19),0.15; 3600*(24*3 + 20),0.15; 3600*(24*3 + 21),0.15; 3600*(24*3
         + 22),0; 3600*(24*3 + 23),0; 3600*(24*4),0; 3600*(24*4 + 1),0; 3600*(
        24*4 + 2),0; 3600*(24*4 + 3),0; 3600*(24*4 + 4),0; 3600*(24*4 + 5),0;
        3600*(24*4 + 6),0; 3600*(24*4 + 7),0; 3600*(24*4 + 8),0; 3600*(24*4 + 9),
        0.75; 3600*(24*4 + 10),0.75; 3600*(24*4 + 11),0.75; 3600*(24*4 + 12),
        0.75; 3600*(24*4 + 13),0.75; 3600*(24*4 + 14),0.75; 3600*(24*4 + 15),
        0.75; 3600*(24*4 + 16),0.75; 3600*(24*4 + 17),0.15; 3600*(24*4 + 18),
        0.15; 3600*(24*4 + 19),0.15; 3600*(24*4 + 20),0.15; 3600*(24*4 + 21),
        0.15; 3600*(24*4 + 22),0; 3600*(24*4 + 23),0; 3600*(24*5),0; 3600*(24*5
         + 1),0; 3600*(24*5 + 2),0; 3600*(24*5 + 3),0; 3600*(24*5 + 4),0; 3600*
        (24*5 + 5),0; 3600*(24*5 + 6),0; 3600*(24*5 + 7),0; 3600*(24*5 + 8),0;
        3600*(24*5 + 9),0.75; 3600*(24*5 + 10),0.75; 3600*(24*5 + 11),0.75;
        3600*(24*5 + 12),0.75; 3600*(24*5 + 13),0.75; 3600*(24*5 + 14),0.75;
        3600*(24*5 + 15),0.75; 3600*(24*5 + 16),0.75; 3600*(24*5 + 17),0.15;
        3600*(24*5 + 18),0.15; 3600*(24*5 + 19),0.15; 3600*(24*5 + 20),0.15;
        3600*(24*5 + 21),0.15; 3600*(24*5 + 22),0; 3600*(24*5 + 23),0; 3600*(24
        *6),0; 3600*(24*6 + 1),0; 3600*(24*6 + 2),0; 3600*(24*6 + 3),0; 3600*(
        24*6 + 4),0; 3600*(24*6 + 5),0; 3600*(24*6 + 6),0; 3600*(24*6 + 7),0;
        3600*(24*6 + 8),0; 3600*(24*6 + 9),0; 3600*(24*6 + 10),0; 3600*(24*6 +
        11),0; 3600*(24*6 + 12),0; 3600*(24*6 + 13),0; 3600*(24*6 + 14),0; 3600
        *(24*6 + 15),0; 3600*(24*6 + 16),0; 3600*(24*6 + 17),0; 3600*(24*6 + 18),
        0; 3600*(24*6 + 19),0; 3600*(24*6 + 20),0; 3600*(24*6 + 21),0; 3600*(24
        *6 + 22),0; 3600*(24*6 + 23),0; 3600*(24*7),0])          "Occupancy fraction schedule"
    annotation (Placement(transformation(extent={{-280,180},{-260,200}})));
  Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses.InternalLoads schLig(table=[0,
        0.18; 3600*1,0.18; 3600*2,0.18; 3600*3,0.18; 3600*4,0.18; 3600*5,0.18;
        3600*6,0.18; 3600*7,0.18; 3600*8,0.9; 3600*9,0.9; 3600*10,0.9; 3600*11,
        0.9; 3600*12,0.9; 3600*13,0.9; 3600*14,0.9; 3600*15,0.9; 3600*16,0.9;
        3600*17,0.9; 3600*18,0.9; 3600*19,0.9; 3600*20,0.9; 3600*21,0.9; 3600*
        22,0.18; 3600*23,0.18; 3600*24,0.18; 3600*(24*1 + 1),0.18; 3600*(24*1
         + 2),0.18; 3600*(24*1 + 3),0.18; 3600*(24*1 + 4),0.18; 3600*(24*1 + 5),
        0.18; 3600*(24*1 + 6),0.18; 3600*(24*1 + 7),0.18; 3600*(24*1 + 8),0.9;
        3600*(24*1 + 9),0.9; 3600*(24*1 + 10),0.9; 3600*(24*1 + 11),0.9; 3600*(
        24*1 + 12),0.9; 3600*(24*1 + 13),0.9; 3600*(24*1 + 14),0.9; 3600*(24*1
         + 15),0.9; 3600*(24*1 + 16),0.9; 3600*(24*1 + 17),0.9; 3600*(24*1 + 18),
        0.9; 3600*(24*1 + 19),0.9; 3600*(24*1 + 20),0.9; 3600*(24*1 + 21),0.9;
        3600*(24*1 + 22),0.18; 3600*(24*1 + 23),0.18; 3600*(24*2),0.18; 3600*(
        24*2 + 1),0.18; 3600*(24*2 + 2),0.18; 3600*(24*2 + 3),0.18; 3600*(24*2
         + 4),0.18; 3600*(24*2 + 5),0.18; 3600*(24*2 + 6),0.18; 3600*(24*2 + 7),
        0.18; 3600*(24*2 + 8),0.9; 3600*(24*2 + 9),0.9; 3600*(24*2 + 10),0.9;
        3600*(24*2 + 11),0.9; 3600*(24*2 + 12),0.9; 3600*(24*2 + 13),0.9; 3600*
        (24*2 + 14),0.9; 3600*(24*2 + 15),0.9; 3600*(24*2 + 16),0.9; 3600*(24*2
         + 17),0.9; 3600*(24*2 + 18),0.9; 3600*(24*2 + 19),0.9; 3600*(24*2 + 20),
        0.9; 3600*(24*2 + 21),0.9; 3600*(24*2 + 22),0.18; 3600*(24*2 + 23),0.18;
        3600*(24*3),0.18; 3600*(24*3 + 1),0.18; 3600*(24*3 + 2),0.18; 3600*(24*
        3 + 3),0.18; 3600*(24*3 + 4),0.18; 3600*(24*3 + 5),0.18; 3600*(24*3 + 6),
        0.18; 3600*(24*3 + 7),0.18; 3600*(24*3 + 8),0.9; 3600*(24*3 + 9),0.9;
        3600*(24*3 + 10),0.9; 3600*(24*3 + 11),0.9; 3600*(24*3 + 12),0.9; 3600*
        (24*3 + 13),0.9; 3600*(24*3 + 14),0.9; 3600*(24*3 + 15),0.9; 3600*(24*3
         + 16),0.9; 3600*(24*3 + 17),0.9; 3600*(24*3 + 18),0.9; 3600*(24*3 + 19),
        0.9; 3600*(24*3 + 20),0.9; 3600*(24*3 + 21),0.9; 3600*(24*3 + 22),0.18;
        3600*(24*3 + 23),0.18; 3600*(24*4),0.18; 3600*(24*4 + 1),0.18; 3600*(24
        *4 + 2),0.18; 3600*(24*4 + 3),0.18; 3600*(24*4 + 4),0.18; 3600*(24*4 +
        5),0.18; 3600*(24*4 + 6),0.18; 3600*(24*4 + 7),0.18; 3600*(24*4 + 8),
        0.9; 3600*(24*4 + 9),0.9; 3600*(24*4 + 10),0.9; 3600*(24*4 + 11),0.9;
        3600*(24*4 + 12),0.9; 3600*(24*4 + 13),0.9; 3600*(24*4 + 14),0.9; 3600*
        (24*4 + 15),0.9; 3600*(24*4 + 16),0.9; 3600*(24*4 + 17),0.9; 3600*(24*4
         + 18),0.9; 3600*(24*4 + 19),0.9; 3600*(24*4 + 20),0.9; 3600*(24*4 + 21),
        0.9; 3600*(24*4 + 22),0.18; 3600*(24*4 + 23),0.18; 3600*(24*5),0.18;
        3600*(24*5 + 1),0.18; 3600*(24*5 + 2),0.18; 3600*(24*5 + 3),0.18; 3600*
        (24*5 + 4),0.18; 3600*(24*5 + 5),0.18; 3600*(24*5 + 6),0.18; 3600*(24*5
         + 7),0.18; 3600*(24*5 + 8),0.9; 3600*(24*5 + 9),0.9; 3600*(24*5 + 10),
        0.9; 3600*(24*5 + 11),0.9; 3600*(24*5 + 12),0.9; 3600*(24*5 + 13),0.9;
        3600*(24*5 + 14),0.9; 3600*(24*5 + 15),0.9; 3600*(24*5 + 16),0.9; 3600*
        (24*5 + 17),0.9; 3600*(24*5 + 18),0.9; 3600*(24*5 + 19),0.9; 3600*(24*5
         + 20),0.9; 3600*(24*5 + 21),0.9; 3600*(24*5 + 22),0.18; 3600*(24*5 +
        23),0.18; 3600*(24*6),0.18; 3600*(24*6 + 1),0.18; 3600*(24*6 + 2),0.18;
        3600*(24*6 + 3),0.18; 3600*(24*6 + 4),0.18; 3600*(24*6 + 5),0.18; 3600*
        (24*6 + 6),0.18; 3600*(24*6 + 7),0.18; 3600*(24*6 + 8),0.18; 3600*(24*6
         + 9),0.18; 3600*(24*6 + 10),0.18; 3600*(24*6 + 11),0.18; 3600*(24*6 +
        12),0.18; 3600*(24*6 + 13),0.18; 3600*(24*6 + 14),0.18; 3600*(24*6 + 15),
        0.18; 3600*(24*6 + 16),0.18; 3600*(24*6 + 17),0.18; 3600*(24*6 + 18),
        0.18; 3600*(24*6 + 19),0.18; 3600*(24*6 + 20),0.18; 3600*(24*6 + 21),
        0.18; 3600*(24*6 + 22),0.18; 3600*(24*6 + 23),0.18; 3600*(24*7),0.18])
                                                                             "Lighting fraction schedule"
    annotation (Placement(transformation(extent={{-280,36},{-260,56}})));
  Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses.InternalLoads schEqu(table=[0,
        0.35; 3600*1,0.35; 3600*2,0.35; 3600*3,0.35; 3600*4,0.35; 3600*5,0.35;
        3600*6,0.35; 3600*7,0.35; 3600*8,0.35; 3600*9,0.95; 3600*10,0.95; 3600*
        11,0.95; 3600*12,0.95; 3600*13,0.95; 3600*14,0.95; 3600*15,0.95; 3600*
        16,0.95; 3600*17,0.95; 3600*18,0.35; 3600*19,0.35; 3600*20,0.35; 3600*
        21,0.35; 3600*22,0.35; 3600*23,0.35; 3600*24,0.35; 3600*(24*1 + 1),0.35;
        3600*(24*1 + 2),0.35; 3600*(24*1 + 3),0.35; 3600*(24*1 + 4),0.35; 3600*
        (24*1 + 5),0.35; 3600*(24*1 + 6),0.35; 3600*(24*1 + 7),0.35; 3600*(24*1
         + 8),0.35; 3600*(24*1 + 9),0.95; 3600*(24*1 + 10),0.95; 3600*(24*1 +
        11),0.95; 3600*(24*1 + 12),0.95; 3600*(24*1 + 13),0.95; 3600*(24*1 + 14),
        0.95; 3600*(24*1 + 15),0.95; 3600*(24*1 + 16),0.95; 3600*(24*1 + 17),
        0.95; 3600*(24*1 + 18),0.35; 3600*(24*1 + 19),0.35; 3600*(24*1 + 20),
        0.35; 3600*(24*1 + 21),0.35; 3600*(24*1 + 22),0.35; 3600*(24*1 + 23),
        0.35; 3600*(24*2),0.35; 3600*(24*2 + 1),0.35; 3600*(24*2 + 2),0.35;
        3600*(24*2 + 3),0.35; 3600*(24*2 + 4),0.35; 3600*(24*2 + 5),0.35; 3600*
        (24*2 + 6),0.35; 3600*(24*2 + 7),0.35; 3600*(24*2 + 8),0.35; 3600*(24*2
         + 9),0.95; 3600*(24*2 + 10),0.95; 3600*(24*2 + 11),0.95; 3600*(24*2 +
        12),0.95; 3600*(24*2 + 13),0.95; 3600*(24*2 + 14),0.95; 3600*(24*2 + 15),
        0.95; 3600*(24*2 + 16),0.95; 3600*(24*2 + 17),0.95; 3600*(24*2 + 18),
        0.35; 3600*(24*2 + 19),0.35; 3600*(24*2 + 20),0.35; 3600*(24*2 + 21),
        0.35; 3600*(24*2 + 22),0.35; 3600*(24*2 + 23),0.35; 3600*(24*3),0.35;
        3600*(24*3 + 1),0.35; 3600*(24*3 + 2),0.35; 3600*(24*3 + 3),0.35; 3600*
        (24*3 + 4),0.35; 3600*(24*3 + 5),0.35; 3600*(24*3 + 6),0.35; 3600*(24*3
         + 7),0.35; 3600*(24*3 + 8),0.35; 3600*(24*3 + 9),0.95; 3600*(24*3 + 10),
        0.95; 3600*(24*3 + 11),0.95; 3600*(24*3 + 12),0.95; 3600*(24*3 + 13),
        0.95; 3600*(24*3 + 14),0.95; 3600*(24*3 + 15),0.95; 3600*(24*3 + 16),
        0.95; 3600*(24*3 + 17),0.95; 3600*(24*3 + 18),0.35; 3600*(24*3 + 19),
        0.35; 3600*(24*3 + 20),0.35; 3600*(24*3 + 21),0.35; 3600*(24*3 + 22),
        0.35; 3600*(24*3 + 23),0.35; 3600*(24*4),0.35; 3600*(24*4 + 1),0.35;
        3600*(24*4 + 2),0.35; 3600*(24*4 + 3),0.35; 3600*(24*4 + 4),0.35; 3600*
        (24*4 + 5),0.35; 3600*(24*4 + 6),0.35; 3600*(24*4 + 7),0.35; 3600*(24*4
         + 8),0.35; 3600*(24*4 + 9),0.95; 3600*(24*4 + 10),0.95; 3600*(24*4 +
        11),0.95; 3600*(24*4 + 12),0.95; 3600*(24*4 + 13),0.95; 3600*(24*4 + 14),
        0.95; 3600*(24*4 + 15),0.95; 3600*(24*4 + 16),0.95; 3600*(24*4 + 17),
        0.95; 3600*(24*4 + 18),0.35; 3600*(24*4 + 19),0.35; 3600*(24*4 + 20),
        0.35; 3600*(24*4 + 21),0.35; 3600*(24*4 + 22),0.35; 3600*(24*4 + 23),
        0.35; 3600*(24*5),0.35; 3600*(24*5 + 1),0.35; 3600*(24*5 + 2),0.35;
        3600*(24*5 + 3),0.35; 3600*(24*5 + 4),0.35; 3600*(24*5 + 5),0.35; 3600*
        (24*5 + 6),0.35; 3600*(24*5 + 7),0.35; 3600*(24*5 + 8),0.35; 3600*(24*5
         + 9),0.95; 3600*(24*5 + 10),0.95; 3600*(24*5 + 11),0.95; 3600*(24*5 +
        12),0.95; 3600*(24*5 + 13),0.95; 3600*(24*5 + 14),0.95; 3600*(24*5 + 15),
        0.95; 3600*(24*5 + 16),0.95; 3600*(24*5 + 17),0.95; 3600*(24*5 + 18),
        0.35; 3600*(24*5 + 19),0.35; 3600*(24*5 + 20),0.35; 3600*(24*5 + 21),
        0.35; 3600*(24*5 + 22),0.35; 3600*(24*5 + 23),0.35; 3600*(24*6),0.35;
        3600*(24*6 + 1),0.35; 3600*(24*6 + 2),0.35; 3600*(24*6 + 3),0.35; 3600*
        (24*6 + 4),0.35; 3600*(24*6 + 5),0.35; 3600*(24*6 + 6),0.35; 3600*(24*6
         + 7),0.35; 3600*(24*6 + 8),0.35; 3600*(24*6 + 9),0.35; 3600*(24*6 + 10),
        0.35; 3600*(24*6 + 11),0.35; 3600*(24*6 + 12),0.35; 3600*(24*6 + 13),
        0.35; 3600*(24*6 + 14),0.35; 3600*(24*6 + 15),0.35; 3600*(24*6 + 16),
        0.35; 3600*(24*6 + 17),0.35; 3600*(24*6 + 18),0.35; 3600*(24*6 + 19),
        0.35; 3600*(24*6 + 20),0.35; 3600*(24*6 + 21),0.35; 3600*(24*6 + 22),
        0.35; 3600*(24*6 + 23),0.35; 3600*(24*7),0.35])                      "Equipment fraction schedule"
    annotation (Placement(transformation(extent={{-280,108},{-260,128}})));
  Modelica.Blocks.Logical.Greater greater annotation (Placement(
        transformation(extent={{140,110},{160,130}})));
  Modelica.Blocks.Interfaces.BooleanOutput occ "Occupied signal"
    annotation (Placement(transformation(extent={{200,110},{220,130}})));
  Modelica.Blocks.Sources.Constant const(k=0)   annotation (Placement(
        transformation(extent={{100,102},{120,122}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senTZonMeaRad
    "Zone mean radiant temperature sensor"
    annotation (Placement(transformation(extent={{162,-40},{182,-20}})));
  Modelica.Blocks.Interfaces.RealOutput TRooMeaRad(unit="K")
    "Room mean radiant temperature" annotation (Placement(transformation(extent=
           {{200,-40},{220,-20}}), iconTransformation(extent={{200,-70},{220,-50}})));
  Modelica.Fluid.Interfaces.FluidPorts_b ports[nPorts](redeclare package Medium =
        Buildings.Media.Air) "Fluid ports"
    annotation (Placement(transformation(extent={{-210,-66},{-190,14}})));
  hil_flexlab_model.ThermalZones.InternalLoad lig(
    radFraction=0.37,
    latPower_nominal=0,
    senPower_nominal=15.07) annotation (Placement(transformation(extent={{-280,16},{-260,36}})));
  hil_flexlab_model.ThermalZones.InternalLoad equ(
    latPower_nominal=0,
    senPower_nominal=15,
    radFraction=0.5) annotation (Placement(transformation(extent={{-280,88},{-260,108}})));
  hil_flexlab_model.ThermalZones.OccupancyLoad occ1(
    radFraction=0.6,
    occ_density=occ_density,
    senPower=74,
    latPower=58) annotation (Placement(transformation(extent={{-280,160},{-260,180}})));
  Modelica.Blocks.Math.MultiSum sumRad(nu=3) "Sum of radiant internal gains"
    annotation (Placement(transformation(extent={{-140,142},{-128,154}})));
  Modelica.Blocks.Math.MultiSum sumCon(nu=3) "Sum of convective internal gains"
    annotation (Placement(transformation(extent={{-140,122},{-128,134}})));
  Modelica.Blocks.Math.MultiSum sumLat(nu=3) "Sum of latent internal gains"
    annotation (Placement(transformation(extent={{-140,100},{-128,112}})));
  Modelica.Blocks.Interfaces.RealOutput PIntLoa
    "Electrical power consumption of internal loads"
    annotation (Placement(transformation(extent={{200,50},{220,70}})));
  Modelica.Blocks.Math.Gain gaiIntLoa(k=roo.AFlo)
    "Gain for multiplying internal loads by floor area"
    annotation (Placement(transformation(extent={{140,40},{160,60}})));
  Modelica.Blocks.Math.Add addLig "Sum lighting power"
    annotation (Placement(transformation(extent={{-100,30},{-80,50}})));
  Modelica.Blocks.Math.Add addEqu "Sum equipment power"
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
  Modelica.Blocks.Math.Add addInt "Sum internal gain power"
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic matIntWal(
    nLay=2,
    absIR_a=0.9,
    absIR_b=0.9,
    absSol_a=0.7,
    absSol_b=0.7,
    material={Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0127,
        k=0.1600,
        c=830.00,
        d=784.90,
        nStaRef=Buildings.ThermalZones.Detailed.Validation.BESTEST.nStaRef),
        Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0127,
        k=0.1600,
        c=830.00,
        d=784.90,
        nStaRef=Buildings.ThermalZones.Detailed.Validation.BESTEST.nStaRef)})
    "Steel Frame Non-Res Exterior Wall: 1. 1/2 in Gypsum + 2. 1/2 in Gypsum"
    annotation (Placement(transformation(extent={{87,80},{101,94}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow QFro(Q_flow=0)
    "Boundary condition for adjacent zones"
    annotation (Placement(transformation(extent={{10,-60},{30,-40}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow QFro1(Q_flow=0)
    "Boundary condition for adjacent zones"
    annotation (Placement(transformation(extent={{10,-90},{30,-70}})));
  parameter Modelica.SIunits.Area AFlo=99 "Floor area";
protected
  Modelica.Blocks.Math.Product proOcc "Product for internal gain"
    annotation (Placement(transformation(extent={{-240,188},{-220,208}})));
protected
  Modelica.Blocks.Math.Product proEqu "Product for internal gain"
    annotation (Placement(transformation(extent={{-240,116},{-220,136}})));
protected
  Modelica.Blocks.Math.Product proLig "Product for internal gain"
    annotation (Placement(transformation(extent={{-240,44},{-220,64}})));
protected
  Modelica.Blocks.Math.Product proOcc2 "Product for internal gain"
    annotation (Placement(transformation(extent={{-240,144},{-220,164}})));
protected
  Modelica.Blocks.Math.Product proEqu1 "Product for internal gain"
    annotation (Placement(transformation(extent={{-216,94},{-196,114}})));
protected
  Modelica.Blocks.Math.Product proEqu2 "Product for internal gain"
    annotation (Placement(transformation(extent={{-240,72},{-220,92}})));
protected
  Modelica.Blocks.Math.Product proLig1 "Product for internal gain"
    annotation (Placement(transformation(extent={{-216,22},{-196,42}})));
protected
  Modelica.Blocks.Math.Product proLig2 "Product for internal gain"
    annotation (Placement(transformation(extent={{-240,0},{-220,20}})));
protected
  Modelica.Blocks.Math.Product proOcc1 "Product for internal gain"
    annotation (Placement(transformation(extent={{-216,166},{-196,186}})));
equation
  connect(mul.y, roo.qGai_flow) annotation (Line(
      points={{23.1,91},{24,91},{24,10.4},{29.92,10.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSoi[1].port, soi.port_a) annotation (Line(
      points={{120,-70},{68,-70},{68,-60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(soi.port_b, roo.surf_conBou[1]) annotation (Line(
      points={{68,-40},{68,-21.6667},{65.8,-21.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(weaBus, roo.weaBus) annotation (Line(
      points={{-110,180},{82,180},{82,112},{81.27,112},{81.27,23.27}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(senTZon.T, TRooAir) annotation (Line(points={{180,0},{210,0}},
                    color={0,0,127}));
  connect(senTZon.port, roo.heaPorAir) annotation (Line(points={{160,0},{56.7,0}},
                             color={191,0,0}));
  connect(greater.y, occ)
    annotation (Line(points={{161,120},{210,120}}, color={255,0,255}));
  connect(const.y, greater.u2)
    annotation (Line(points={{121,112},{138,112}}, color={0,0,127}));
  connect(senTZonMeaRad.port, roo.heaPorRad) annotation (Line(points={{162,-30},
          {110,-30},{110,-4.94},{56.7,-4.94}}, color={191,0,0}));
  connect(senTZonMeaRad.T, TRooMeaRad)
    annotation (Line(points={{182,-30},{210,-30}}, color={0,0,127}));
  connect(ports, roo.ports) annotation (Line(points={{-200,-26},{-82,-26},{-82,
          -13},{38.5,-13}},
                       color={0,127,255}));
  connect(gaiIntLoa.y, PIntLoa) annotation (Line(points={{161,50},{180,50},{180,
          60},{210,60}}, color={0,0,127}));
            connect(schOcc.y[1], proOcc.u1) annotation (Line(points={{-259,190},{-252,190},
          {-252,204},{-242,204}}, color={0,0,127}));
  connect(proOcc.y, sumRad.u[1]) annotation (Line(points={{-219,198},{-140,198},
          {-140,150.8}}, color={0,0,127}));
  connect(occ1.rad, proOcc.u2) annotation (Line(points={{-259,174},{-248,174},{
          -248,192},{-242,192}}, color={0,0,127}));
  connect(schOcc.y[1], proOcc1.u1) annotation (Line(points={{-259,190},{-252,190},
          {-252,182},{-218,182}}, color={0,0,127}));
  connect(occ1.con, proOcc1.u2)
    annotation (Line(points={{-259,170},{-218,170}}, color={0,0,127}));
  connect(proOcc1.y, sumCon.u[1]) annotation (Line(points={{-195,176},{-152,176},
          {-152,130.8},{-140,130.8}}, color={0,0,127}));
  connect(schOcc.y[1], proOcc2.u1) annotation (Line(points={{-259,190},{-252,190},
          {-252,160},{-242,160}}, color={0,0,127}));
  connect(occ1.lat, proOcc2.u2) annotation (Line(points={{-259,166},{-256,166},
          {-256,148},{-242,148}}, color={0,0,127}));
  connect(proOcc2.y, sumLat.u[1]) annotation (Line(points={{-219,154},{-150,154},
          {-150,108.8},{-140,108.8}}, color={0,0,127}));
  connect(schEqu.y[1], proEqu.u1) annotation (Line(points={{-259,118},{-250,118},
          {-250,132},{-242,132}}, color={0,0,127}));
  connect(schEqu.y[1], proEqu1.u1) annotation (Line(points={{-259,118},{-250,118},
          {-250,110},{-218,110}}, color={0,0,127}));
  connect(schEqu.y[1], proEqu2.u1) annotation (Line(points={{-259,118},{-250,118},
          {-250,88},{-242,88}}, color={0,0,127}));
  connect(equ.lat, proEqu2.u2) annotation (Line(points={{-259,94},{-256,94},{-256,
          76},{-242,76}}, color={0,0,127}));
  connect(equ.con, proEqu1.u2)
    annotation (Line(points={{-259,98},{-218,98}}, color={0,0,127}));
  connect(equ.rad, proEqu.u2) annotation (Line(points={{-259,102},{-246,102},{-246,
          120},{-242,120}}, color={0,0,127}));
  connect(proEqu.y, sumRad.u[2]) annotation (Line(points={{-219,126},{-180,126},
          {-180,148},{-140,148}}, color={0,0,127}));
  connect(proEqu1.y, sumCon.u[2]) annotation (Line(points={{-195,104},{-178,104},
          {-178,128},{-140,128}}, color={0,0,127}));
  connect(proEqu2.y, sumLat.u[2]) annotation (Line(points={{-219,82},{-176,82},
          {-176,106},{-140,106}}, color={0,0,127}));
  connect(schLig.y[1], proLig.u1) annotation (Line(points={{-259,46},{-250,46},
          {-250,60},{-242,60}}, color={0,0,127}));
  connect(schLig.y[1], proLig1.u1) annotation (Line(points={{-259,46},{-250,46},
          {-250,38},{-218,38}}, color={0,0,127}));
  connect(schLig.y[1], proLig2.u1) annotation (Line(points={{-259,46},{-250,46},
          {-250,16},{-242,16}}, color={0,0,127}));
  connect(lig.lat, proLig2.u2) annotation (Line(points={{-259,22},{-256,22},{-256,
          4},{-242,4}}, color={0,0,127}));
  connect(lig.con, proLig1.u2)
    annotation (Line(points={{-259,26},{-218,26}}, color={0,0,127}));
  connect(lig.rad, proLig.u2) annotation (Line(points={{-259,30},{-246,30},{-246,
          48},{-242,48}}, color={0,0,127}));
  connect(proLig.y, sumRad.u[3]) annotation (Line(points={{-219,54},{-164,54},{
          -164,145.2},{-140,145.2}}, color={0,0,127}));
  connect(proLig1.y, sumCon.u[3]) annotation (Line(points={{-195,32},{-162,32},
          {-162,125.2},{-140,125.2}}, color={0,0,127}));
  connect(proLig2.y, sumLat.u[3]) annotation (Line(points={{-219,10},{-140,10},
          {-140,103.2}}, color={0,0,127}));
  connect(sumRad.y, mul.u1[1]) annotation (Line(points={{-126.98,148},{-20,148},
          {-20,98.7},{-2.2,98.7}}, color={0,0,127}));
  connect(sumCon.y, mul.u2[1]) annotation (Line(points={{-126.98,128},{-40,128},
          {-40,91},{-2.2,91}}, color={0,0,127}));
  connect(sumLat.y, mul.u3[1]) annotation (Line(points={{-126.98,106},{-60,106},
          {-60,83.3},{-2.2,83.3}}, color={0,0,127}));
  connect(schOcc.y[1], greater.u1) annotation (Line(points={{-259,190},{138,190},
          {138,120}}, color={0,0,127}));
  connect(addEqu.y, addInt.u1) annotation (Line(points={{-79,70},{0,70},{0,56},
          {38,56}}, color={0,0,127}));
  connect(addInt.u2, addLig.y) annotation (Line(points={{38,44},{0,44},{0,40},{
          -79,40}}, color={0,0,127}));
  connect(addInt.y, gaiIntLoa.u)
    annotation (Line(points={{61,50},{138,50}}, color={0,0,127}));
  connect(proEqu.y, addEqu.u1) annotation (Line(points={{-219,126},{-186,126},{
          -186,76},{-102,76}}, color={0,0,127}));
  connect(proEqu1.y, addEqu.u2) annotation (Line(points={{-195,104},{-188,104},
          {-188,64},{-102,64}}, color={0,0,127}));
  connect(proLig.y, addLig.u1) annotation (Line(points={{-219,54},{-180,54},{
          -180,46},{-102,46}}, color={0,0,127}));
  connect(proLig1.y, addLig.u2) annotation (Line(points={{-195,32},{-120,32},{
          -120,34},{-102,34}}, color={0,0,127}));
  connect(QFro.port, roo.surf_conBou[2]) annotation (Line(points={{30,-50},{50,
          -50},{50,-34},{65.8,-34},{65.8,-20.8}}, color={191,0,0}));
  connect(QFro1.port, roo.surf_conBou[3]) annotation (Line(points={{30,-80},{54,
          -80},{54,-38},{65.8,-38},{65.8,-19.9333}}, color={191,0,0}));
annotation (Documentation(info="<html>
<p>
This is a single zone model based on the envelope of the BESTEST Case 600
building, though it has some modifications.  Supply and return air ports are
included for simulation with air-based HVAC systems.  Heating and cooling
setpoints and internal loads are time-varying according to an assumed
occupancy schedule.
</p>
<p>
This zone model utilizes schedules and constructions from
the <code>Schedules</code> and <code>Constructions</code> packages.
</p>
</html>", revisions="<html>
<ul>
<li>
June 21, 2017, by Michael Wetter:<br/>
Refactored implementation.
</li>
<li>
June 1, 2017, by David Blum:<br/>
First implementation.
</li>
</ul>
</html>"),
    Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
    Icon(coordinateSystem(extent={{-200,-200},{200,200}}),
        graphics={
        Rectangle(
          extent={{-158,-160},{162,160}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-138,138},{142,-140}},
          pattern=LinePattern.None,
          lineColor={117,148,176},
          fillColor={170,213,255},
          fillPattern=FillPattern.Sphere),
        Rectangle(
          extent={{142,70},{162,-70}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{148,70},{156,-70}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid)}));
end RoomMultiFluid;
