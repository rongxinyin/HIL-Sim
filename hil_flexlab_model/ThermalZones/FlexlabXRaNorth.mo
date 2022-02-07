within hil_flexlab_model.ThermalZones;
model FlexlabXRaNorth "Model of a flexlab xra north facing"
  replaceable package Medium = Buildings.Media.Air
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
    nPorts=2,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
      extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    final sampleModel=sampleModel) "Ceiling plenum"
    annotation (Placement(transformation(extent={{108,-14},{148,26}})));

  Modelica.Blocks.Sources.Constant uSha(k=1)
    "Control signal for the shading device"
    annotation (Placement(transformation(extent={{4,244},{24,264}})));
  Modelica.Blocks.Routing.Replicator replicator(nout=1)
    annotation (Placement(transformation(extent={{42,244},{62,264}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather bus"
    annotation (Placement(transformation(extent={{200,224},{220,244}})));
  Buildings.Examples.VAVReheat.ThermalZones.RoomLeakage leaPle(
    redeclare package Medium = Medium,
    VRoo=6.49*(3.05 + 3.05 + 3.23)*1.625,
    s=6.49/9.33,
    azi=Buildings.Types.Azimuth.W,
    final use_windPressure=use_windPressure)
    "Model for air infiltration through the envelope"
    annotation (Placement(transformation(extent={{-74,40},{-38,80}})));
  Buildings.Examples.VAVReheat.ThermalZones.RoomLeakage leaCell(
    redeclare package Medium = Medium,
    VRoo=6.49*3.23*3.6576,
    s=6.49/3.23,
    azi=Buildings.Types.Azimuth.W,
    final use_windPressure=use_windPressure)
    "Model for air infiltration through the envelope"
    annotation (Placement(transformation(extent={{-4,150},{32,190}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirCellA
    "Air temperature sensor"
    annotation (Placement(transformation(extent={{268,170},{288,190}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir(each unit="K", each displayUnit=
       "degC") "Room air temperatures" annotation (Placement(transformation(
          extent={{380,156},{400,176}}), iconTransformation(extent={{380,156},{
            400,176}})));
  Buildings.Fluid.Sensors.RelativePressure senRelPre(redeclare package Medium = Medium)
    "Building pressure measurement"
    annotation (Placement(transformation(extent={{100,98},{80,118}})));
  Buildings.Fluid.Sources.Outside out(nPorts=1, redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{0,98},{20,118}})));
  Modelica.Blocks.Interfaces.RealOutput p_rel
    "Relative pressure signal of building static pressure" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-170,220})));

  parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.Construction9
    SouthExt
    annotation (Placement(transformation(extent={{-126,466},{-106,486}})));
  parameter
    Data.Constructions.OpaqueConstructions.Roofs.ASHRAE_901_1975Roof
    R20Wal annotation (Placement(transformation(extent={{-92,466},{-72,486}})));
  parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.CellAndElectricalDividingWall
    R52Wal annotation (Placement(transformation(extent={{-54,466},{-34,486}})));
  parameter
    Data.Constructions.GlazingSystems.SingleClear3
    glaSys(haveInteriorShade=false)
    annotation (Placement(transformation(extent={{-126,434},{-106,454}})));
  parameter
    Data.Constructions.OpaqueConstructions.PartitionConstructions.PartitionWall
    parCon annotation (Placement(transformation(extent={{-12,466},{8,486}})));
  parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.TestCellDividngWall
    celDiv annotation (Placement(transformation(extent={{30,466},{50,486}})));
  parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.TestBedDividingWall
    bedDiv annotation (Placement(transformation(extent={{-92,434},{-72,454}})));
  parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.TestZoneDividngWall
    zonDiv
    annotation (Placement(transformation(extent={{-126,398},{-106,418}})));
  parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.Construction1
    WestExt
    annotation (Placement(transformation(extent={{-126,368},{-106,388}})));
  parameter
    Data.Constructions.OpaqueConstructions.Roofs.CeilingTile
    ceiling
    annotation (Placement(transformation(extent={{-90,368},{-70,388}})));
  parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.Construction3
    NorthExt annotation (Placement(transformation(extent={{-12,434},{8,454}})));
  parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.ExteriorDoorInsulated
    extDoo annotation (Placement(transformation(extent={{30,434},{50,454}})));
  parameter
    Data.Constructions.OpaqueConstructions.PartitionConstructions.PartitionDoor
    parDoo
    annotation (Placement(transformation(extent={{-56,370},{-36,390}})));
  parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.CellAndElectricalDividingWall
    higIns
    annotation (Placement(transformation(extent={{-10,400},{10,420}})));

  parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.ExteriorDoorUninsulated
    extDooUn annotation (Placement(transformation(extent={{-54,434},{-34,454}})));

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
    annotation (Placement(transformation(extent={{30,400},{50,420}})));
  Modelica.Blocks.Sources.CombiTimeTable ligSch(
    table=[0,0; 7,0; 7,0.5; 8,0.5; 8,0.9; 17,0.9; 17,0.5; 21,0.5; 21,0; 24,0],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from lights"
    annotation (Placement(transformation(extent={{-128,322},{-108,342}})));
  Modelica.Blocks.Sources.CombiTimeTable pluSch(
    table=[0,0.4; 9,0.4; 9,0.9; 13,0.9; 13,0.8; 14,0.8; 14,0.9; 18,0.9; 18,0.5;
        19,0.5; 19,0.4; 24,0.4],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from plug"
    annotation (Placement(transformation(extent={{-128,284},{-108,304}})));
  Modelica.Blocks.Sources.CombiTimeTable occSch(
    table=[0,0; 7,0; 7,0.5; 8,0.5; 8,1; 12,1; 12,0.5; 13,0.5; 13,1; 17,1; 17,
        0.5; 18,0.5; 18,0.0; 24,0.0],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "internal heat gain from occupant"
    annotation (Placement(transformation(extent={{-128,252},{-108,272}})));
  Modelica.Blocks.Math.MatrixGain ligGai(K=6*[0.5; 0.5; 0.0])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-90,322},{-70,342}})));
  Modelica.Blocks.Math.MatrixGain plgGai(K=7*[0.5; 0.5; 0.0])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-90,284},{-70,304}})));
  Modelica.Blocks.Math.MatrixGain occGai(K=10*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-90,252},{-70,272}})));
  Modelica.Blocks.Sources.CombiTimeTable intGaiPle(
    table=[0,0.05; 8,0.05; 9,0.9; 12,0.9; 12,0.8; 13,0.8; 13,1; 17,1; 19,0.1; 24,
        0.05],
    timeScale=3600,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "Fraction of internal heat gain"
    annotation (Placement(transformation(extent={{-122,-44},{-102,-24}})));
  Modelica.Blocks.Math.MatrixGain gaiPle(K=0*[0.4; 0.4; 0.2])
    "Matrix gain to split up heat gain in radiant, convective and latent gain"
    annotation (Placement(transformation(extent={{-76,-44},{-56,-24}})));

  Modelica.Blocks.Sources.CombiTimeTable intGaiClo(table=[0,0,0,0; 86400,0,0,0],
      tableOnFile=false) "Internal gain heat flow for the closet"
    annotation (Placement(transformation(extent={{90,380},{110,400}})));

  Modelica.Blocks.Sources.CombiTimeTable intGaiEle(table=[0,0,0,0; 86400,0,0,0],
      tableOnFile=false) "Internal gain heat flow for the electrical room"
    annotation (Placement(transformation(extent={{162,462},{182,482}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-42,322},{-22,342}})));
  Modelica.Blocks.Math.Add3 add3_2
    annotation (Placement(transformation(extent={{-42,284},{-22,304}})));
  Modelica.Blocks.Math.Add3 add3_3
    annotation (Placement(transformation(extent={{-42,250},{-22,270}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_1
    annotation (Placement(transformation(extent={{-4,284},{16,304}})));
  XRA.TestCellRotate
               testCellRotate(
                        redeclare package Medium = Medium,
                        nPorts=4)
    annotation (Placement(transformation(extent={{108,160},{148,200}})));

  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsCell[2](redeclare
      package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{38,146},{78,162}})));
  XRA.Closet closet(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{176,362},{216,402}})));
  XRA.Electrical electrical(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{244,444},{284,484}})));
  Modelica.Blocks.Sources.Constant const(k=0)   annotation (Placement(
        transformation(extent={{318,262},{338,282}})));
  Modelica.Blocks.Logical.Greater greater annotation (Placement(
        transformation(extent={{358,270},{378,290}})));
  Modelica.Blocks.Interfaces.BooleanOutput occ "Occupied signal"
    annotation (Placement(transformation(extent={{398,270},{418,290}})));
equation
  connect(uSha.y, replicator.u) annotation (Line(
      points={{25,254},{40,254}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(ple.weaBus, weaBus) annotation (Line(
      points={{145.9,23.9},{206,23.9},{206,234},{210,234}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus, leaPle.weaBus) annotation (Line(
      points={{210,234},{-86,234},{-86,60},{-74,60}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus, leaCell.weaBus) annotation (Line(
      points={{210,234},{-86,234},{-86,170},{-4,170}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(leaPle.port_b, ple.ports[2]) annotation (Line(
      points={{-38,60},{-14,60},{-14,-2},{113,-2}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(out.weaBus, weaBus) annotation (Line(
      points={{0,108.2},{-34,108.2},{-34,234},{210,234}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(out.ports[1], senRelPre.port_b) annotation (Line(
      points={{20,108},{80,108}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=0.5));
  connect(senRelPre.p_rel, p_rel) annotation (Line(
      points={{90,99},{90,26},{-114,26},{-114,220},{-170,220}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(ligSch.y, ligGai.u)
    annotation (Line(points={{-107,332},{-92,332}},color={0,0,127}));
  connect(pluSch.y, plgGai.u)
    annotation (Line(points={{-107,294},{-92,294}},color={0,0,127}));
  connect(occSch.y, occGai.u)
    annotation (Line(points={{-107,262},{-92,262}},color={0,0,127}));
  connect(intGaiPle.y, gaiPle.u)
    annotation (Line(points={{-101,-34},{-78,-34}},  color={0,0,127}));
  connect(gaiPle.y, ple.qGai_flow) annotation (Line(points={{-55,-34},{26,-34},
          {26,14},{106.4,14}},  color={0,0,127}));

  connect(ligGai.y[1], add3_1.u1) annotation (Line(points={{-69,332},{-54,332},
          {-54,340},{-44,340}},color={0,0,127}));
  connect(plgGai.y[1], add3_1.u2) annotation (Line(points={{-69,294},{-54,294},
          {-54,332},{-44,332}},color={0,0,127}));
  connect(occGai.y[1], add3_1.u3) annotation (Line(points={{-69,262},{-54,262},
          {-54,324},{-44,324}},color={0,0,127}));
  connect(ligGai.y[2], add3_2.u1) annotation (Line(points={{-69,332},{-54,332},
          {-54,302},{-44,302}},color={0,0,127}));
  connect(plgGai.y[2], add3_2.u2)
    annotation (Line(points={{-69,294},{-44,294}}, color={0,0,127}));
  connect(occGai.y[2], add3_2.u3) annotation (Line(points={{-69,262},{-54,262},
          {-54,286},{-44,286}},color={0,0,127}));
  connect(ligGai.y[3], add3_3.u1) annotation (Line(points={{-69,332},{-54,332},
          {-54,268},{-44,268}},color={0,0,127}));
  connect(plgGai.y[3], add3_3.u2) annotation (Line(points={{-69,294},{-54,294},
          {-54,260},{-44,260}},color={0,0,127}));
  connect(occGai.y[3], add3_3.u3) annotation (Line(points={{-69,262},{-54,262},
          {-54,252},{-44,252}},color={0,0,127}));
  connect(add3_1.y, multiplex3_1.u1[1]) annotation (Line(points={{-21,332},{-14,
          332},{-14,301},{-6,301}},  color={0,0,127}));
  connect(add3_2.y, multiplex3_1.u2[1])
    annotation (Line(points={{-21,294},{-6,294}},  color={0,0,127}));
  connect(add3_3.y, multiplex3_1.u3[1]) annotation (Line(points={{-21,260},{-14,
          260},{-14,287},{-6,287}},  color={0,0,127}));
  connect(multiplex3_1.y, testCellRotate.qGai_flow) annotation (Line(points={{
          17,294},{86,294},{86,188},{106.4,188}}, color={0,0,127}));
  connect(temAirCellA.port, testCellRotate.heaPorAir)
    annotation (Line(points={{268,180},{127,180}}, color={191,0,0}));
  connect(testCellRotate.surf_conBou[5], ple.surf_conBou[6]) annotation (Line(
        points={{134,164},{178,164},{178,-24},{134,-24},{134,-9.16667}}, color=
          {191,0,0}));
  connect(leaCell.port_b, testCellRotate.ports[3]) annotation (Line(points={{32,
          170},{72,170},{72,171},{113,171}}, color={0,127,255}));
  connect(testCellRotate.ports[1], portsCell[1]) annotation (Line(points={{113,
          167},{87.5,167},{87.5,154},{48,154}}, color={0,127,255}));
  connect(testCellRotate.ports[2], portsCell[2]) annotation (Line(points={{113,
          169},{82,169},{82,154},{68,154}}, color={0,127,255}));
  connect(replicator.y, testCellRotate.uSha) annotation (Line(points={{63,254},
          {76,254},{76,198},{106.4,198}}, color={0,0,127}));
  connect(weaBus, closet.weaBus) annotation (Line(
      points={{210,234},{210,282},{248,282},{248,400},{213.9,400},{213.9,399.9}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));

  connect(intGaiClo.y, closet.qGai_flow)
    annotation (Line(points={{111,390},{174.4,390}}, color={0,0,127}));
  connect(intGaiEle.y, electrical.qGai_flow)
    annotation (Line(points={{183,472},{242.4,472}}, color={0,0,127}));
   connect(electrical.surf_surBou[2], closet.surf_conBou[1]) annotation (Line(points={{260.2,
          450},{176,450},{176,366},{202,366}},
                                        color={191,0,0}));
  connect(closet.surf_surBou[2], testCellRotate.surf_conBou[3]) annotation (
      Line(points={{192.2,368},{134,368},{134,164}}, color={191,0,0}));
  connect(weaBus, electrical.weaBus) annotation (Line(
      points={{210,234},{316,234},{316,482},{281.9,482},{281.9,481.9}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(TRooAir, temAirCellA.T) annotation (Line(points={{390,166},{338,166},{
          338,180},{288,180}}, color={0,0,127}));
  connect(testCellRotate.weaBus, weaBus) annotation (Line(
      points={{145.9,197.9},{177.95,197.9},{177.95,234},{210,234}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(senRelPre.port_a, testCellRotate.ports[4]) annotation (Line(points={{
          100,108},{106,108},{106,173},{113,173}}, color={0,127,255}));

  connect(greater.y,occ)
    annotation (Line(points={{379,280},{408,280}}, color={255,0,255}));
  connect(greater.u1, occSch.y[1]) annotation (Line(points={{356,280},{122,280},
          {122,262},{-107,262}}, color={0,0,127}));
  connect(const.y, greater.u2)
    annotation (Line(points={{339,272},{356,272}}, color={0,0,127}));
                           annotation (choicesAllMatching=true,
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-160,-100},
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
</html>"),
    experiment(
      StartTime=19180800,
      StopTime=19612800,
      Interval=300,
      __Dymola_Algorithm="Dassl"));
end FlexlabXRaNorth;
