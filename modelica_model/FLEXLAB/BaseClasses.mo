within FLEXLAB;
package BaseClasses
  "Package with base classes for Buildings.Examples.VAVReheat"
extends Modelica.Icons.BasesPackage;

  model Floor "Model of a floor of the building"
    extends FLEXLAB.BaseClasses.PartialFloor(
      final VRooCor=cor.AFlo*hRoo,
      final VRooSou=sou.AFlo*hRoo,
      final VRooNor=nor.AFlo*hRoo,
      final VRooEas=eas.AFlo*hRoo,
      final VRooWes=wes.AFlo*hRoo);

    parameter Modelica.SIunits.Area AFloCor = 2698/hRoo "Core zone floor area";
    parameter Modelica.SIunits.Area AFloSou = 568.77/hRoo "South zone floor area";
    parameter Modelica.SIunits.Area AFloNor = 568.77/hRoo "North zone floor area";
    parameter Modelica.SIunits.Area AFloEas = 360.0785/hRoo "East zone floor area";
    parameter Modelica.SIunits.Area AFloWes = 360.0785/hRoo "West zone floor area";

    parameter Buildings.HeatTransfer.Types.InteriorConvection intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature
      "Convective heat transfer model for room-facing surfaces of opaque constructions";
    parameter Modelica.SIunits.Angle lat "Latitude";
    parameter Real winWalRat(
      min=0.01,
      max=0.99) = 0.33 "Window to wall ratio for exterior walls";
    parameter Modelica.SIunits.Length hWin = 1.5 "Height of windows";
    parameter Buildings.HeatTransfer.Data.Solids.Plywood matFur(x=0.15, nStaRef
        =5) "Material for furniture"
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
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conExtWal(final
        nLay=3, material={matWoo,matIns,matGyp}) "Exterior construction"
      annotation (Placement(transformation(extent={{280,460},{300,480}})));
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conIntWal(final
        nLay=1, material={matGyp2}) "Interior wall construction"
      annotation (Placement(transformation(extent={{320,460},{340,480}})));
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conFlo(final
        nLay=1, material={matCon}) "Floor construction (opa_a is carpet)"
      annotation (Placement(transformation(extent={{280,420},{300,440}})));
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conFur(final
        nLay=1, material={matFur})
      "Construction for internal mass of furniture"
      annotation (Placement(transformation(extent={{320,420},{340,440}})));
    parameter Buildings.HeatTransfer.Data.Solids.Plywood matCarTra(
      k=0.11,
      d=544,
      nStaRef=1,
      x=0.215/0.11) "Wood for floor"
      annotation (Placement(transformation(extent={{102,460},{122,480}})));
    parameter Buildings.HeatTransfer.Data.GlazingSystems.DoubleClearAir13Clear glaSys(
      UFra=2,
      shade=Buildings.HeatTransfer.Data.Shades.Gray(),
      haveInteriorShade=false,
      haveExteriorShade=false) "Data record for the glazing system"
      annotation (Placement(transformation(extent={{240,460},{260,480}})));

    constant Modelica.SIunits.Height hRoo=2.74 "Room height";

    parameter Boolean sampleModel = false
      "Set to true to time-sample the model, which can give shorter simulation time if there is already time sampling in the system model"
      annotation (
        Evaluate=true,
        Dialog(tab="Experimental (may be changed in future releases)"));

    Buildings.ThermalZones.Detailed.MixedAir sou(
      redeclare package Medium = Medium,
      lat=lat,
      AFlo=AFloSou,
      hRoo=hRoo,
      nConExt=0,
      nConExtWin=1,
      datConExtWin(
        layers={conExtWal},
        A={49.91*hRoo},
        glaSys={glaSys},
        wWin={winWalRat/hWin*49.91*hRoo},
        each hWin=hWin,
        fFra={0.1},
        til={Buildings.Types.Tilt.Wall},
        azi={Buildings.Types.Azimuth.S}),
      nConPar=2,
      datConPar(
        layers={conFlo,conFur},
        A={AFloSou,414.68},
        til={Buildings.Types.Tilt.Floor,Buildings.Types.Tilt.Wall}),
      nConBou=3,
      datConBou(
        layers={conIntWal,conIntWal,conIntWal},
        A={6.47,40.76,6.47}*hRoo,
        til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall}),
      nSurBou=0,
      nPorts=5,
      intConMod=intConMod,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      final sampleModel=sampleModel) "South zone"
      annotation (Placement(transformation(extent={{144,-44},{184,-4}})));
    Buildings.ThermalZones.Detailed.MixedAir eas(
      redeclare package Medium = Medium,
      lat=lat,
      AFlo=AFloEas,
      hRoo=hRoo,
      nConExt=0,
      nConExtWin=1,
      datConExtWin(
        layers={conExtWal},
        A={33.27*hRoo},
        glaSys={glaSys},
        wWin={winWalRat/hWin*33.27*hRoo},
        each hWin=hWin,
        fFra={0.1},
        til={Buildings.Types.Tilt.Wall},
        azi={Buildings.Types.Azimuth.E}),
      nConPar=2,
      datConPar(
        layers={conFlo,conFur},
        A={AFloEas,262.52},
        til={Buildings.Types.Tilt.Floor,Buildings.Types.Tilt.Wall}),
      nConBou=1,
      datConBou(
        layers={conIntWal},
        A={24.13}*hRoo,
        til={Buildings.Types.Tilt.Wall}),
      nSurBou=2,
      surBou(
        each A=6.47*hRoo,
        each absIR=0.9,
        each absSol=0.9,
        til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall}),
      nPorts=5,
      intConMod=intConMod,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      final sampleModel=sampleModel) "East zone"
      annotation (Placement(transformation(extent={{304,56},{344,96}})));
    Buildings.ThermalZones.Detailed.MixedAir nor(
      redeclare package Medium = Medium,
      lat=lat,
      AFlo=AFloNor,
      hRoo=hRoo,
      nConExt=0,
      nConExtWin=1,
      datConExtWin(
        layers={conExtWal},
        A={49.91*hRoo},
        glaSys={glaSys},
        wWin={winWalRat/hWin*49.91*hRoo},
        each hWin=hWin,
        fFra={0.1},
        til={Buildings.Types.Tilt.Wall},
        azi={Buildings.Types.Azimuth.N}),
      nConPar=2,
      datConPar(
        layers={conFlo,conFur},
        A={AFloNor,414.68},
        til={Buildings.Types.Tilt.Floor,Buildings.Types.Tilt.Wall}),
      nConBou=3,
      datConBou(
        layers={conIntWal,conIntWal,conIntWal},
        A={6.47,40.76,6.47}*hRoo,
        til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall}),
      nSurBou=0,
      nPorts=5,
      intConMod=intConMod,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      final sampleModel=sampleModel) "North zone"
      annotation (Placement(transformation(extent={{144,116},{184,156}})));
    Buildings.ThermalZones.Detailed.MixedAir wes(
      redeclare package Medium = Medium,
      lat=lat,
      AFlo=AFloWes,
      hRoo=hRoo,
      nConExt=0,
      nConExtWin=1,
      datConExtWin(
        layers={conExtWal},
        A={33.27*hRoo},
        glaSys={glaSys},
        wWin={winWalRat/hWin*33.27*hRoo},
        each hWin=hWin,
        fFra={0.1},
        til={Buildings.Types.Tilt.Wall},
        azi={Buildings.Types.Azimuth.W}),
      nConPar=2,
      datConPar(
        layers={conFlo,conFur},
        A={AFloWes,262.52},
        til={Buildings.Types.Tilt.Floor,Buildings.Types.Tilt.Wall}),
      nConBou=1,
      datConBou(
        layers={conIntWal},
        A={24.13}*hRoo,
        til={Buildings.Types.Tilt.Wall}),
      nSurBou=2,
      surBou(
        each A=6.47*hRoo,
        each absIR=0.9,
        each absSol=0.9,
        til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall}),
      nPorts=5,
      intConMod=intConMod,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      final sampleModel=sampleModel) "West zone"
      annotation (Placement(transformation(extent={{12,36},{52,76}})));
    Buildings.ThermalZones.Detailed.MixedAir cor(
      redeclare package Medium = Medium,
      lat=lat,
      AFlo=AFloCor,
      hRoo=hRoo,
      nConExt=0,
      nConExtWin=0,
      nConPar=2,
      datConPar(
        layers={conFlo,conFur},
        A={AFloCor,1967.01},
        til={Buildings.Types.Tilt.Floor,Buildings.Types.Tilt.Wall}),
      nConBou=0,
      nSurBou=4,
      surBou(
        A={40.76,24.13,40.76,24.13}*hRoo,
        each absIR=0.9,
        each absSol=0.9,
        til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall}),
      nPorts=11,
      intConMod=intConMod,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      final sampleModel=sampleModel) "Core zone"
      annotation (Placement(transformation(extent={{144,36},{184,76}})));

    Modelica.Blocks.Math.MatrixGain gai(K=20*[0.4; 0.4; 0.2])
      "Matrix gain to split up heat gain in radiant, convective and latent gain"
      annotation (Placement(transformation(extent={{-100,100},{-80,120}})));
    Modelica.Blocks.Sources.CombiTimeTable intGaiFra(
      table=[0,0.05; 8,0.05; 9,0.9; 12,0.9; 12,0.8; 13,0.8; 13,1; 17,1; 19,0.1;
          24,0.05],
      timeScale=3600,
      extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
      "Fraction of internal heat gain"
      annotation (Placement(transformation(extent={{-140,100},{-120,120}})));
    Modelica.Blocks.Math.Gain gaiIntNor[3](each k=kIntNor)
      "Gain for internal heat gain amplification for north zone"
      annotation (Placement(transformation(extent={{-60,134},{-40,154}})));
    Modelica.Blocks.Math.Gain gaiIntSou[3](each k=2 - kIntNor)
      "Gain to change the internal heat gain for south"
      annotation (Placement(transformation(extent={{-60,-38},{-40,-18}})));
    Modelica.Blocks.Sources.Constant uSha(k=0)
      "Control signal for the shading device"
      annotation (Placement(transformation(extent={{-100,170},{-80,190}})));
    Modelica.Blocks.Routing.Replicator replicator(nout=1)
      annotation (Placement(transformation(extent={{-60,170},{-40,190}})));
  equation
    connect(sou.surf_conBou[1], wes.surf_surBou[2]) annotation (Line(
        points={{170,-40.6667},{170,-54},{62,-54},{62,20},{28.2,20},{28.2,42.5}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(sou.surf_conBou[2], cor.surf_surBou[1]) annotation (Line(
        points={{170,-40},{170,-54},{200,-54},{200,20},{160.2,20},{160.2,41.25}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(sou.surf_conBou[3], eas.surf_surBou[1]) annotation (Line(
        points={{170,-39.3333},{170,-54},{320.2,-54},{320.2,61.5}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(eas.surf_conBou[1], cor.surf_surBou[2]) annotation (Line(
        points={{330,60},{330,20},{160.2,20},{160.2,41.75}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(eas.surf_surBou[2], nor.surf_conBou[1]) annotation (Line(
        points={{320.2,62.5},{320.2,24},{220,24},{220,100},{170,100},{170,
            119.333}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(nor.surf_conBou[2], cor.surf_surBou[3]) annotation (Line(
        points={{170,120},{170,100},{200,100},{200,26},{160.2,26},{160.2,42.25}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(nor.surf_conBou[3], wes.surf_surBou[1]) annotation (Line(
        points={{170,120.667},{170,100},{60,100},{60,20},{28.2,20},{28.2,41.5}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(wes.surf_conBou[1], cor.surf_surBou[4]) annotation (Line(
        points={{38,40},{38,30},{160.2,30},{160.2,42.75}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(replicator.y, nor.uSha) annotation (Line(
        points={{-39,180},{130,180},{130,154},{142.4,154}},
        color={0,0,127},
        pattern=LinePattern.Dash,
        smooth=Smooth.None));
    connect(replicator.y, wes.uSha) annotation (Line(
        points={{-39,180},{-6,180},{-6,74},{10.4,74}},
        color={0,0,127},
        pattern=LinePattern.Dash,
        smooth=Smooth.None));
    connect(replicator.y, eas.uSha) annotation (Line(
        points={{-39,180},{232,180},{232,94},{302.4,94}},
        color={0,0,127},
        pattern=LinePattern.Dash,
        smooth=Smooth.None));
    connect(replicator.y, sou.uSha) annotation (Line(
        points={{-39,180},{130,180},{130,-6},{142.4,-6}},
        color={0,0,127},
        pattern=LinePattern.Dash,
        smooth=Smooth.None));
    connect(replicator.y, cor.uSha) annotation (Line(
        points={{-39,180},{130,180},{130,74},{142.4,74}},
        color={0,0,127},
        pattern=LinePattern.Dash,
        smooth=Smooth.None));
    connect(gai.y, cor.qGai_flow)          annotation (Line(
        points={{-79,110},{120,110},{120,64},{142.4,64}},
        color={0,0,127},
        pattern=LinePattern.Dash,
        smooth=Smooth.None));
    connect(gai.y, eas.qGai_flow)          annotation (Line(
        points={{-79,110},{226,110},{226,84},{302.4,84}},
        color={0,0,127},
        pattern=LinePattern.Dash,
        smooth=Smooth.None));
    connect(gai.y, wes.qGai_flow)          annotation (Line(
        points={{-79,110},{-14,110},{-14,64},{10.4,64}},
        color={0,0,127},
        pattern=LinePattern.Dash,
        smooth=Smooth.None));
    connect(sou.weaBus, weaBus) annotation (Line(
        points={{181.9,-6.1},{181.9,8},{210,8},{210,200}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        textString="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(eas.weaBus, weaBus) annotation (Line(
        points={{341.9,93.9},{341.9,120},{210,120},{210,200}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(nor.weaBus, weaBus) annotation (Line(
        points={{181.9,153.9},{182,160},{182,168},{210,168},{210,200}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(wes.weaBus, weaBus) annotation (Line(
        points={{49.9,73.9},{49.9,168},{210,168},{210,200}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(cor.weaBus, weaBus) annotation (Line(
        points={{181.9,73.9},{181.9,90},{210,90},{210,200}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(multiplex5_1.y, TRooAir) annotation (Line(
        points={{361,290},{372,290},{372,160},{390,160}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(temAirSou.T, multiplex5_1.u1[1]) annotation (Line(
        points={{310,350},{328,350},{328,300},{338,300}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(temAirEas.T, multiplex5_1.u2[1]) annotation (Line(
        points={{312,320},{324,320},{324,295},{338,295}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(temAirNor.T, multiplex5_1.u3[1]) annotation (Line(
        points={{312,290},{338,290}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(temAirWes.T, multiplex5_1.u4[1]) annotation (Line(
        points={{312,258},{324,258},{324,285},{338,285}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(temAirPer5.T, multiplex5_1.u5[1]) annotation (Line(
        points={{314,228},{322,228},{322,228},{332,228},{332,280},{338,280}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(sou.heaPorAir, temAirSou.port) annotation (Line(
        points={{163,-24},{224,-24},{224,100},{264,100},{264,350},{290,350}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(eas.heaPorAir, temAirEas.port) annotation (Line(
        points={{323,76},{286,76},{286,320},{292,320}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(nor.heaPorAir, temAirNor.port) annotation (Line(
        points={{163,136},{164,136},{164,290},{292,290}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(wes.heaPorAir, temAirWes.port) annotation (Line(
        points={{31,56},{70,56},{70,114},{186,114},{186,258},{292,258}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(cor.heaPorAir, temAirPer5.port) annotation (Line(
        points={{163,56},{162,56},{162,228},{294,228}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(sou.ports[1], portsSou[1]) annotation (Line(
        points={{149,-37.2},{114,-37.2},{114,-36},{80,-36}},
        color={0,127,255},
        thickness=0.5));
    connect(sou.ports[2], portsSou[2]) annotation (Line(
        points={{149,-35.6},{124,-35.6},{124,-36},{100,-36}},
        color={0,127,255},
        thickness=0.5));
    connect(eas.ports[1], portsEas[1]) annotation (Line(
        points={{309,62.8},{300,62.8},{300,36},{320,36}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(eas.ports[2], portsEas[2]) annotation (Line(
        points={{309,64.4},{298,64.4},{298,34},{320,34},{320,36},{340,36}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(nor.ports[1], portsNor[1]) annotation (Line(
        points={{149,122.8},{114,122.8},{114,124},{80,124}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(nor.ports[2], portsNor[2]) annotation (Line(
        points={{149,124.4},{124,124.4},{124,124},{100,124}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(wes.ports[1], portsWes[1]) annotation (Line(
        points={{17,42.8},{-12,42.8},{-12,44},{-40,44}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(wes.ports[2], portsWes[2]) annotation (Line(
        points={{17,44.4},{-2,44.4},{-2,44},{-20,44}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(cor.ports[1], portsCor[1]) annotation (Line(
        points={{149,42.3636},{114,42.3636},{114,46},{80,46}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(cor.ports[2], portsCor[2]) annotation (Line(
        points={{149,43.0909},{124,43.0909},{124,46},{100,46}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(leaSou.port_b, sou.ports[3]) annotation (Line(
        points={{-22,400},{-2,400},{-2,-72},{134,-72},{134,-34},{149,-34}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(leaEas.port_b, eas.ports[3]) annotation (Line(
        points={{-22,360},{246,360},{246,66},{309,66}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(leaNor.port_b, nor.ports[3]) annotation (Line(
        points={{-20,320},{138,320},{138,126},{149,126}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(leaWes.port_b, wes.ports[3]) annotation (Line(
        points={{-20,280},{4,280},{4,46},{17,46}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeSouCor.port_b1, cor.ports[3]) annotation (Line(
        points={{104,16},{116,16},{116,43.8182},{149,43.8182}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeSouCor.port_a2, cor.ports[4]) annotation (Line(
        points={{104,4},{118,4},{118,44.5455},{149,44.5455}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeSouCor.port_a1, sou.ports[4]) annotation (Line(
        points={{84,16},{74,16},{74,-20},{134,-20},{134,-32.4},{149,-32.4}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeSouCor.port_b2, sou.ports[5]) annotation (Line(
        points={{84,4},{72,4},{72,-22},{132,-22},{132,-30.8},{149,-30.8}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeEasCor.port_b1, eas.ports[4]) annotation (Line(
        points={{270,54},{290,54},{290,67.6},{309,67.6}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeEasCor.port_a2, eas.ports[5]) annotation (Line(
        points={{270,42},{292,42},{292,69.2},{309,69.2}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeEasCor.port_a1, cor.ports[5]) annotation (Line(
        points={{250,54},{190,54},{190,34},{142,34},{142,45.2727},{149,45.2727}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeEasCor.port_b2, cor.ports[6]) annotation (Line(
        points={{250,42},{190,42},{190,34},{142,34},{142,46},{149,46}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeNorCor.port_b1, nor.ports[4]) annotation (Line(
        points={{100,90},{124,90},{124,127.6},{149,127.6}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeNorCor.port_a2, nor.ports[5]) annotation (Line(
        points={{100,78},{126,78},{126,129.2},{149,129.2}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeNorCor.port_a1, cor.ports[7]) annotation (Line(
        points={{80,90},{76,90},{76,60},{142,60},{142,46.7273},{149,46.7273}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(opeNorCor.port_b2, cor.ports[8]) annotation (Line(
        points={{80,78},{76,78},{76,60},{142,60},{142,47.4545},{149,47.4545}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeWesCor.port_b1, cor.ports[9]) annotation (Line(
        points={{40,-4},{54,-4},{54,36},{112,36},{112,48.1818},{149,48.1818}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeWesCor.port_a2, cor.ports[10]) annotation (Line(
        points={{40,-16},{56,-16},{56,34},{114,34},{114,48.9091},{149,48.9091}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeWesCor.port_a1, wes.ports[4]) annotation (Line(
        points={{20,-4},{6,-4},{6,47.6},{17,47.6}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeWesCor.port_b2, wes.ports[5]) annotation (Line(
        points={{20,-16},{2,-16},{2,49.2},{17,49.2}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(cor.ports[11], senRelPre.port_a) annotation (Line(
        points={{149,49.6364},{112,49.6364},{112,250},{60,250}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(senRelPre.p_rel, p_rel) annotation (Line(
        points={{50,241},{50,220},{-170,220}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(gaiIntNor.y, nor.qGai_flow) annotation (Line(
        points={{-39,144},{142.4,144}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(gaiIntSou.y, sou.qGai_flow) annotation (Line(
        points={{-39,-28},{68,-28},{68,-16},{142.4,-16}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(gai.y,gaiIntSou. u) annotation (Line(
        points={{-79,110},{-68,110},{-68,-28},{-62,-28}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(gai.y,gaiIntNor. u) annotation (Line(
        points={{-79,110},{-68,110},{-68,144},{-62,144}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(intGaiFra.y,gai. u) annotation (Line(
        points={{-119,110},{-102,110}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(uSha.y,replicator. u) annotation (Line(
        points={{-79,180},{-62,180}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true,
          extent={{-160,-100},{380,500}},
          initialScale=0.1)),     Icon(coordinateSystem(
            preserveAspectRatio=true, extent={{-80,-80},{380,180}}), graphics={
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
            fillPattern=FillPattern.Solid)}),
      Documentation(revisions="<html>
    <ul>
<li>
January 23, 2020, by Milica Grahovac:<br/>
Updated core zone geometry parameters related to
room heat and mass balance.
</li>
<li>
November 15, 2019, by Milica Grahovac:<br/>
Added extend from a partial floor model.
</li>
<li>
May 1, 2013, by Michael Wetter:<br/>
Declared the parameter record to be a parameter, as declaring its elements
to be parameters does not imply that the whole record has the variability of a parameter.
</li>
</ul>
</html>",   info="<html>
<p>
Model of a floor that consists
of five thermal zones that are representative of one floor of the
new construction medium office building for Chicago, IL,
as described in the set of DOE Commercial Building Benchmarks.
There are four perimeter zones and one core zone.
The envelope thermal properties meet ASHRAE Standard 90.1-2004.
</p>
</html>"));
  end Floor;

  model MixingBox
    "Outside air mixing box with non-interlocked air dampers"

    replaceable package Medium =
        Modelica.Media.Interfaces.PartialMedium "Medium in the component"
      annotation (choicesAllMatching = true);
    import Modelica.Constants;

    parameter Boolean allowFlowReversal = true
      "= false to simplify equations, assuming, but not enforcing, no flow reversal"
      annotation(Dialog(tab="Assumptions"), Evaluate=true);

    parameter Boolean use_deltaM = true
      "Set to true to use deltaM for turbulent transition, else ReC is used";
    parameter Real deltaM = 0.3
      "Fraction of nominal mass flow rate where transition to turbulent occurs"
      annotation(Dialog(enable=use_deltaM));
    parameter Modelica.SIunits.Velocity v_nominal=1 "Nominal face velocity";

    parameter Boolean roundDuct = false
      "Set to true for round duct, false for square cross section"
      annotation(Dialog(enable=not use_deltaM));
    parameter Real ReC=4000
      "Reynolds number where transition to turbulent starts"
      annotation(Dialog(enable=not use_deltaM));

    parameter Boolean dp_nominalIncludesDamper=false
      "set to true if dp_nominal includes the pressure loss of the open damper"
      annotation (Dialog(group="Nominal condition"));

    parameter Modelica.SIunits.MassFlowRate mOut_flow_nominal
      "Mass flow rate outside air damper"
      annotation (Dialog(group="Nominal condition"));
    parameter Modelica.SIunits.PressureDifference dpOut_nominal(min=0, displayUnit="Pa")
      "Pressure drop outside air leg"
       annotation (Dialog(group="Nominal condition"));

    parameter Modelica.SIunits.MassFlowRate mRec_flow_nominal
      "Mass flow rate recirculation air damper"
      annotation (Dialog(group="Nominal condition"));
    parameter Modelica.SIunits.PressureDifference dpRec_nominal(min=0, displayUnit="Pa")
      "Pressure drop recirculation air leg"
       annotation (Dialog(group="Nominal condition"));

    parameter Modelica.SIunits.MassFlowRate mExh_flow_nominal
      "Mass flow rate exhaust air damper"
      annotation (Dialog(group="Nominal condition"));
    parameter Modelica.SIunits.PressureDifference dpExh_nominal(min=0, displayUnit="Pa")
      "Pressure drop exhaust air leg"
       annotation (Dialog(group="Nominal condition"));

    parameter Boolean from_dp=true
      "= true, use m_flow = f(dp) else dp = f(m_flow)"
      annotation (Dialog(tab="Advanced"));
    parameter Boolean linearized=false
      "= true, use linear relation between m_flow and dp for any flow rate"
      annotation (Dialog(tab="Advanced"));
    parameter Boolean use_constant_density=true
      "Set to true to use constant density for flow friction"
      annotation (Dialog(tab="Advanced"));
    parameter Real a=-1.51 "Coefficient a for damper characteristics"
      annotation (Dialog(tab="Damper coefficients"));
    parameter Real b=0.105*90 "Coefficient b for damper characteristics"
      annotation (Dialog(tab="Damper coefficients"));
    parameter Real yL=15/90 "Lower value for damper curve"
      annotation (Dialog(tab="Damper coefficients"));
    parameter Real yU=55/90 "Upper value for damper curve"
      annotation (Dialog(tab="Damper coefficients"));
    parameter Real k1=0.45
      "Flow coefficient for y=1, k1 = pressure drop divided by dynamic pressure"
      annotation (Dialog(tab="Damper coefficients"));

    parameter Modelica.SIunits.Time riseTime=15
      "Rise time of the filter (time to reach 99.6 % of an opening step)"
      annotation (Dialog(tab="Dynamics", group="Filtered opening"));
    parameter Modelica.Blocks.Types.Init init=Modelica.Blocks.Types.Init.InitialOutput
      "Type of initialization (no init/steady state/initial state/initial output)"
      annotation (Dialog(tab="Dynamics", group="Filtered opening"));
    parameter Real y_start=1 "Initial value of output"
      annotation (Dialog(tab="Dynamics", group="Filtered opening"));

    Modelica.Blocks.Interfaces.RealInput yRet(
      min=0,
      max=1,
      final unit="1")
      "Return damper position (0: closed, 1: open)" annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={-68,120}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={-68,120})));
    Modelica.Blocks.Interfaces.RealInput yOut(
      min=0,
      max=1,
      final unit="1")
      "Outdoor air damper signal (0: closed, 1: open)" annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,120}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,120})));
    Modelica.Blocks.Interfaces.RealInput yExh(
      min=0,
      max=1,
      final unit="1")
      "Exhaust air damper signal (0: closed, 1: open)" annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={60,120}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={70,120})));

    Modelica.Fluid.Interfaces.FluidPort_a port_Out(redeclare package Medium =
          Medium, m_flow(start=0, min=if allowFlowReversal then -Constants.inf else
                  0))
      "Fluid connector a (positive design flow direction is from port_a to port_b)"
      annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_Exh(redeclare package Medium =
          Medium, m_flow(start=0, max=if allowFlowReversal then +Constants.inf else
                  0))
      "Fluid connector b (positive design flow direction is from port_a to port_b)"
      annotation (Placement(transformation(extent={{-90,-70},{-110,-50}})));
    Modelica.Fluid.Interfaces.FluidPort_a port_Ret(redeclare package Medium =
          Medium, m_flow(start=0, min=if allowFlowReversal then -Constants.inf else
                  0))
      "Fluid connector a (positive design flow direction is from port_a to port_b)"
      annotation (Placement(transformation(extent={{110,-70},{90,-50}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_Sup(redeclare package Medium =
          Medium, m_flow(start=0, max=if allowFlowReversal then +Constants.inf else
                  0))
      "Fluid connector b (positive design flow direction is from port_a to port_b)"
      annotation (Placement(transformation(extent={{110,50},{90,70}})));

    Buildings.Fluid.Actuators.Dampers.Exponential damOut(
      redeclare package Medium = Medium,
      from_dp=from_dp,
      linearized=linearized,
      use_deltaM=use_deltaM,
      deltaM=deltaM,
      roundDuct=roundDuct,
      ReC=ReC,
      a=a,
      b=b,
      yL=yL,
      yU=yU,
      use_constant_density=use_constant_density,
      allowFlowReversal=allowFlowReversal,
      m_flow_nominal=mOut_flow_nominal,
      use_inputFilter=true,
      final riseTime=riseTime,
      final init=init,
      y_start=y_start,
      dpDamper_nominal=(k1)*1.2*(1)^2/2,
      dpFixed_nominal=if (dp_nominalIncludesDamper) then (dpOut_nominal) - (k1)
          *1.2*(1)^2/2 else (dpOut_nominal),
      k1=k1) "Outdoor air damper"
      annotation (Placement(transformation(extent={{-10,50},{10,70}})));

    Buildings.Fluid.Actuators.Dampers.Exponential damExh(
      redeclare package Medium = Medium,
      m_flow_nominal=mExh_flow_nominal,
      from_dp=from_dp,
      linearized=linearized,
      use_deltaM=use_deltaM,
      deltaM=deltaM,
      roundDuct=roundDuct,
      ReC=ReC,
      a=a,
      b=b,
      yL=yL,
      yU=yU,
      use_constant_density=use_constant_density,
      allowFlowReversal=allowFlowReversal,
      use_inputFilter=true,
      final riseTime=riseTime,
      final init=init,
      y_start=y_start,
      dpDamper_nominal=(k1)*1.2*(1)^2/2,
      dpFixed_nominal=if (dp_nominalIncludesDamper) then (dpExh_nominal) - (k1)
          *1.2*(1)^2/2 else (dpExh_nominal),
      k1=k1) "Exhaust air damper"
      annotation (Placement(transformation(extent={{-20,-70},{-40,-50}})));

    Buildings.Fluid.Actuators.Dampers.Exponential damRet(
      redeclare package Medium = Medium,
      m_flow_nominal=mRec_flow_nominal,
      from_dp=from_dp,
      linearized=linearized,
      use_deltaM=use_deltaM,
      deltaM=deltaM,
      roundDuct=roundDuct,
      ReC=ReC,
      a=a,
      b=b,
      yL=yL,
      yU=yU,
      use_constant_density=use_constant_density,
      allowFlowReversal=allowFlowReversal,
      use_inputFilter=true,
      final riseTime=riseTime,
      final init=init,
      y_start=y_start,
      dpDamper_nominal=(k1)*1.2*(1)^2/2,
      dpFixed_nominal=if (dp_nominalIncludesDamper) then (dpRec_nominal) - (k1)
          *1.2*(1)^2/2 else (dpRec_nominal),
      k1=k1) "Return air damper" annotation (Placement(transformation(
          origin={80,0},
          extent={{-10,-10},{10,10}},
          rotation=90)));

  protected
    parameter Medium.Density rho_default=Medium.density(sta_default)
      "Density, used to compute fluid volume";
    parameter Medium.ThermodynamicState sta_default=
       Medium.setState_pTX(T=Medium.T_default, p=Medium.p_default, X=Medium.X_default)
      "Default medium state";

  equation
    connect(damOut.port_a, port_Out)
      annotation (Line(points={{-10,60},{-100,60}}, color={0,127,255}));
    connect(damExh.port_b, port_Exh) annotation (Line(
        points={{-40,-60},{-100,-60}},
        color={0,127,255}));
    connect(port_Sup, damOut.port_b)
      annotation (Line(points={{100,60},{10,60}}, color={0,127,255}));
    connect(damRet.port_b, port_Sup) annotation (Line(
        points={{80,10},{80,60},{100,60}},
        color={0,127,255}));
    connect(port_Ret, damExh.port_a) annotation (Line(
        points={{100,-60},{-20,-60}},
        color={0,127,255}));
    connect(port_Ret,damRet. port_a) annotation (Line(
        points={{100,-60},{80,-60},{80,-10}},
        color={0,127,255}));

    connect(damRet.y, yRet)
      annotation (Line(points={{68,8.88178e-16},{-68,8.88178e-16},{-68,120}},
                                                          color={0,0,127}));
    connect(yOut, damOut.y)
      annotation (Line(points={{0,120},{0,72}}, color={0,0,127}));
    connect(yExh, damExh.y) annotation (Line(points={{60,120},{60,20},{-30,20},{-30,
            -48}}, color={0,0,127}));
    annotation (                       Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-94,12},{90,0}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-94,-54},{96,-66}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-4,6},{6,-56}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-86,-12},{-64,24},{-46,24},{-70,-12},{-86,-12}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{48,12},{70,6},{48,0},{48,12}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{72,-58},{92,-62}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{72,-54},{48,-60},{72,-66},{72,-54}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{28,8},{48,4}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-74,-76},{-52,-40},{-34,-40},{-58,-76},{-74,-76}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-20,-40},{2,-4},{20,-4},{-4,-40},{-20,-40}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{78,66},{90,10}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-94,66},{-82,8}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Line(
            points={{0,100},{0,60},{-54,60},{-54,24}},
            color={0,0,255}),  Text(
            extent={{-50,-84},{48,-132}},
            lineColor={0,0,255},
            textString=
                 "%name"),
          Line(
            points={{-68,100},{-68,80},{-20,80},{-20,-22}},
            color={0,0,255}),
          Line(
            points={{70,100},{70,-84},{-60,-84}},
            color={0,0,255})}),
  defaultComponentName="eco",
  Documentation(revisions="<html>
<ul>
<li>
November 10, 2017, by Michael Wetter:<br/>
Changed default of <code>raiseTime</code> as air damper motors, such as from JCI
have a travel time of about 30 seconds.
Shorter travel time also makes control loops more stable.
</li>
<li>
March 24, 2017, by Michael Wetter:<br/>
Renamed <code>filteredInput</code> to <code>use_inputFilter</code>.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/665\">#665</a>.
</li>
<li>
March 22, 2017, by Michael Wetter:<br/>
Removed the assignments of <code>AOut</code>, <code>AExh</code> and <code>ARec</code> as these are done in the damper instance using
a final assignment of the parameter.
This allows scaling the model with <code>m_flow_nominal</code>,
which is generally known in the flow leg,
and <code>v_nominal</code>, for which a default value can be specified.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/544\">#544</a>.
</li>
<li>
January 22, 2016, by Michael Wetter:<br/>
Corrected type declaration of pressure difference.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/404\">#404</a>.
</li>
<li>
December 14, 2012 by Michael Wetter:<br/>
Renamed protected parameters for consistency with the naming conventions.
</li>
<li>
February 14, 2012 by Michael Wetter:<br/>
Added filter to approximate the travel time of the actuator.
</li>
<li>
February 3, 2012, by Michael Wetter:<br/>
Removed assignment of <code>m_flow_small</code> as it is no
longer used in its base class.
</li>
<li>
February 23, 2010 by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>",   info="<html>
<p>
Model of an outside air mixing box with air dampers.
Set <code>y=0</code> to close the outside air and exhast air dampers.
</p>
<p>
If <code>dp_nominalIncludesDamper=true</code>, then the parameter <code>dp_nominal</code>
is equal to the pressure drop of the damper plus the fixed flow resistance at the nominal
flow rate.
If <code>dp_nominalIncludesDamper=false</code>, then <code>dp_nominal</code>
does not include the flow resistance of the air damper.
</p>
</html>"));
  end MixingBox;

  partial model PartialFloor "Interface for a model of a floor of a building"

    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      "Medium model for air" annotation (choicesAllMatching=true);

    parameter Boolean use_windPressure=true
      "Set to true to enable wind pressure";

    parameter Real kIntNor(min=0, max=1) = 1
      "Gain factor to scale internal heat gain in north zone";

    parameter Modelica.SIunits.Volume VRooCor "Room volume corridor";
    parameter Modelica.SIunits.Volume VRooSou "Room volume south";
    parameter Modelica.SIunits.Volume VRooNor "Room volume north";
    parameter Modelica.SIunits.Volume VRooEas "Room volume east";
    parameter Modelica.SIunits.Volume VRooWes "Room volume west";

    Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsSou[2](
        redeclare package Medium = Medium) "Fluid inlets and outlets"
      annotation (Placement(transformation(extent={{70,-44},{110,-28}}),
          iconTransformation(extent={{78,-32},{118,-16}})));

    Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsEas[2](
        redeclare package Medium = Medium) "Fluid inlets and outlets"
      annotation (Placement(transformation(extent={{310,28},{350,44}}),
          iconTransformation(extent={{306,40},{346,56}})));

    Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsNor[2](
        redeclare package Medium = Medium) "Fluid inlets and outlets"
      annotation (Placement(transformation(extent={{70,116},{110,132}}),
          iconTransformation(extent={{78,108},{118,124}})));

    Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsWes[2](
        redeclare package Medium = Medium) "Fluid inlets and outlets"
      annotation (Placement(transformation(extent={{-50,36},{-10,52}}),
          iconTransformation(extent={{-46,40},{-6,56}})));

    Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsCor[2](
        redeclare package Medium = Medium) "Fluid inlets and outlets"
      annotation (Placement(transformation(extent={{70,38},{110,54}}),
          iconTransformation(extent={{78,40},{118,56}})));

    Modelica.Blocks.Interfaces.RealOutput TRooAir[5](
      each unit="K",
      each displayUnit="degC") "Room air temperatures"
      annotation (Placement(transformation(extent={{380,150},{400,170}}),
          iconTransformation(extent={{380,40},{400,60}})));

    Modelica.Blocks.Interfaces.RealOutput p_rel
      "Relative pressure signal of building static pressure" annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-170,220}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-90,50})));

    Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather bus"
      annotation (Placement(transformation(extent={{200,190},{220,210}})));

    FLEXLAB.BaseClasses.RoomLeakage leaSou(
      redeclare package Medium = Medium,
      VRoo=VRooSou,
      s=49.91/33.27,
      azi=Buildings.Types.Azimuth.S,
      final use_windPressure=use_windPressure)
      "Model for air infiltration through the envelope"
      annotation (Placement(transformation(extent={{-58,380},{-22,420}})));
    FLEXLAB.BaseClasses.RoomLeakage leaEas(
      redeclare package Medium = Medium,
      VRoo=VRooEas,
      s=33.27/49.91,
      azi=Buildings.Types.Azimuth.E,
      final use_windPressure=use_windPressure)
      "Model for air infiltration through the envelope"
      annotation (Placement(transformation(extent={{-58,340},{-22,380}})));

    FLEXLAB.BaseClasses.RoomLeakage leaNor(
      redeclare package Medium = Medium,
      VRoo=VRooNor,
      s=49.91/33.27,
      azi=Buildings.Types.Azimuth.N,
      final use_windPressure=use_windPressure)
      "Model for air infiltration through the envelope"
      annotation (Placement(transformation(extent={{-56,300},{-20,340}})));

    FLEXLAB.BaseClasses.RoomLeakage leaWes(
      redeclare package Medium = Medium,
      VRoo=VRooWes,
      s=33.27/49.91,
      azi=Buildings.Types.Azimuth.W,
      final use_windPressure=use_windPressure)
      "Model for air infiltration through the envelope"
      annotation (Placement(transformation(extent={{-56,260},{-20,300}})));

    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirSou
      "Air temperature sensor"
      annotation (Placement(transformation(extent={{290,340},{310,360}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirEas
      "Air temperature sensor"
      annotation (Placement(transformation(extent={{292,310},{312,330}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirNor
      "Air temperature sensor"
      annotation (Placement(transformation(extent={{292,280},{312,300}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirWes
      "Air temperature sensor"
      annotation (Placement(transformation(extent={{292,248},{312,268}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirPer5
      "Air temperature sensor"
      annotation (Placement(transformation(extent={{294,218},{314,238}})));
    Modelica.Blocks.Routing.Multiplex5 multiplex5_1
      annotation (Placement(transformation(extent={{340,280},{360,300}})));

    Buildings.Airflow.Multizone.DoorOpen opeSouCor(redeclare package Medium =
          Medium, wOpe=10) "Opening between perimeter1 and core"
      annotation (Placement(transformation(extent={{84,0},{104,20}})));
    Buildings.Airflow.Multizone.DoorOpen opeEasCor(redeclare package Medium =
          Medium, wOpe=10) "Opening between perimeter2 and core"
      annotation (Placement(transformation(extent={{250,38},{270,58}})));
    Buildings.Airflow.Multizone.DoorOpen opeNorCor(redeclare package Medium =
          Medium, wOpe=10) "Opening between perimeter3 and core"
      annotation (Placement(transformation(extent={{80,74},{100,94}})));
    Buildings.Airflow.Multizone.DoorOpen opeWesCor(redeclare package Medium =
          Medium, wOpe=10) "Opening between perimeter3 and core"
      annotation (Placement(transformation(extent={{20,-20},{40,0}})));
    Buildings.Fluid.Sensors.RelativePressure senRelPre(redeclare package Medium
        =                                                                         Medium)
      "Building pressure measurement"
      annotation (Placement(transformation(extent={{60,240},{40,260}})));
    Buildings.Fluid.Sources.Outside out(nPorts=1, redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{-58,240},{-38,260}})));

  equation
    connect(weaBus, leaSou.weaBus) annotation (Line(
        points={{210,200},{-80,200},{-80,400},{-58,400}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(weaBus, leaEas.weaBus) annotation (Line(
        points={{210,200},{-80,200},{-80,360},{-58,360}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(weaBus, leaNor.weaBus) annotation (Line(
        points={{210,200},{-80,200},{-80,320},{-56,320}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(weaBus, leaWes.weaBus) annotation (Line(
        points={{210,200},{-80,200},{-80,280},{-56,280}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(out.weaBus, weaBus) annotation (Line(
        points={{-58,250.2},{-70,250.2},{-70,250},{-80,250},{-80,200},{210,200}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(multiplex5_1.y, TRooAir) annotation (Line(
        points={{361,290},{372,290},{372,160},{390,160}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(temAirSou.T, multiplex5_1.u1[1]) annotation (Line(
        points={{310,350},{328,350},{328,300},{338,300}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(temAirEas.T, multiplex5_1.u2[1]) annotation (Line(
        points={{312,320},{324,320},{324,295},{338,295}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(temAirNor.T, multiplex5_1.u3[1]) annotation (Line(
        points={{312,290},{338,290}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(temAirWes.T, multiplex5_1.u4[1]) annotation (Line(
        points={{312,258},{324,258},{324,285},{338,285}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(temAirPer5.T, multiplex5_1.u5[1]) annotation (Line(
        points={{314,228},{322,228},{322,228},{332,228},{332,280},{338,280}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(senRelPre.p_rel, p_rel) annotation (Line(
        points={{50,241},{50,220},{-170,220}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(out.ports[1], senRelPre.port_b) annotation (Line(
        points={{-38,250},{40,250}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true,
          extent={{-160,-100},{380,500}},
          initialScale=0.1)),   Icon(coordinateSystem(extent={{-80,-80},{380,160}},
          preserveAspectRatio=true),
           graphics={Rectangle(
            extent={{-80,160},{380,-80}},
            lineColor={95,95,95},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-118,94},{-96,60}},
            lineColor={0,0,255},
            textString="dP")}),
      Documentation(info="<html>
<p>
This is a partial model for one floor of the DOE reference office building.
</p>
</html>",
  revisions="<html>
<ul>
<li>
January 25, 2021, by Michael Wetter:<br/>
Replaced door model with the new model <a href=\"modelica://Buildings.Airflow.Multizone.DoorOpen\">
Buildings.Airflow.Multizone.DoorOpen</a>.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1353\">IBPSA, #1353</a>.
</li>
<li>
November 15, 2019, by Milica Grahovac:<br/>
First implementation.
</li>
</ul>
</html>"));
  end PartialFloor;

  partial model PartialOpenLoop
    "Partial model of variable air volume flow system with terminal reheat and five thermal zones"

    package MediumA = Buildings.Media.Air "Medium model for air";
    package MediumW = Buildings.Media.Water "Medium model for water";

    constant Integer numZon=5 "Total number of served VAV boxes";

    parameter Modelica.SIunits.Volume VRooCor=flo.VRooCor
      "Room volume corridor";
    parameter Modelica.SIunits.Volume VRooSou=flo.VRooSou
      "Room volume south";
    parameter Modelica.SIunits.Volume VRooNor=flo.VRooNor
      "Room volume north";
    parameter Modelica.SIunits.Volume VRooEas=flo.VRooEas
      "Room volume east";
    parameter Modelica.SIunits.Volume VRooWes=flo.VRooWes
      "Room volume west";

    parameter Modelica.SIunits.Area AFloCor=flo.cor.AFlo "Floor area corridor";
    parameter Modelica.SIunits.Area AFloSou=flo.sou.AFlo "Floor area south";
    parameter Modelica.SIunits.Area AFloNor=flo.nor.AFlo "Floor area north";
    parameter Modelica.SIunits.Area AFloEas=flo.eas.AFlo "Floor area east";
    parameter Modelica.SIunits.Area AFloWes=flo.wes.AFlo "Floor area west";

    parameter Modelica.SIunits.Area AFlo[numZon]={flo.cor.AFlo,flo.sou.AFlo,flo.eas.AFlo,
        flo.nor.AFlo,flo.wes.AFlo} "Floor area of each zone";
    final parameter Modelica.SIunits.Area ATot=sum(AFlo) "Total floor area";

    constant Real conv=1.2/3600 "Conversion factor for nominal mass flow rate";

    parameter Real ACHCor(final unit="1/h")=6
      "Design air change per hour core";
    parameter Real ACHSou(final unit="1/h")=6
      "Design air change per hour south";
    parameter Real ACHEas(final unit="1/h")=9
      "Design air change per hour east";
    parameter Real ACHNor(final unit="1/h")=6
      "Design air change per hour north";
    parameter Real ACHWes(final unit="1/h")=7
      "Design air change per hour west";

    parameter Modelica.SIunits.MassFlowRate mCor_flow_nominal=ACHCor*VRooCor*conv
      "Design mass flow rate core";
    parameter Modelica.SIunits.MassFlowRate mSou_flow_nominal=ACHSou*VRooSou*conv
      "Design mass flow rate south";
    parameter Modelica.SIunits.MassFlowRate mEas_flow_nominal=ACHEas*VRooEas*conv
      "Design mass flow rate east";
    parameter Modelica.SIunits.MassFlowRate mNor_flow_nominal=ACHNor*VRooNor*conv
      "Design mass flow rate north";
    parameter Modelica.SIunits.MassFlowRate mWes_flow_nominal=ACHWes*VRooWes*conv
      "Design mass flow rate west";

    parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.7*(mCor_flow_nominal
         + mSou_flow_nominal + mEas_flow_nominal + mNor_flow_nominal +
        mWes_flow_nominal) "Nominal mass flow rate";

    parameter Modelica.SIunits.Angle lat=41.98*3.14159/180 "Latitude";

    parameter Real ratOAFlo_A(final unit="m3/(s.m2)") = 0.3e-3
      "Outdoor airflow rate required per unit area";
    parameter Real ratOAFlo_P = 2.5e-3
      "Outdoor airflow rate required per person";
    parameter Real ratP_A = 5e-2
      "Occupant density";
    parameter Real effZ(final unit="1") = 0.8
      "Zone air distribution effectiveness (limiting value)";
    parameter Real divP(final unit="1") = 0.7
      "Occupant diversity ratio";
    parameter Modelica.SIunits.VolumeFlowRate VCorOA_flow_nominal=
      (ratOAFlo_P * ratP_A + ratOAFlo_A) * AFloCor / effZ
      "Zone outdoor air flow rate";
    parameter Modelica.SIunits.VolumeFlowRate VSouOA_flow_nominal=
      (ratOAFlo_P * ratP_A + ratOAFlo_A) * AFloSou / effZ
      "Zone outdoor air flow rate";
    parameter Modelica.SIunits.VolumeFlowRate VEasOA_flow_nominal=
      (ratOAFlo_P * ratP_A + ratOAFlo_A) * AFloEas / effZ
      "Zone outdoor air flow rate";
    parameter Modelica.SIunits.VolumeFlowRate VNorOA_flow_nominal=
      (ratOAFlo_P * ratP_A + ratOAFlo_A) * AFloNor / effZ
      "Zone outdoor air flow rate";
    parameter Modelica.SIunits.VolumeFlowRate VWesOA_flow_nominal=
      (ratOAFlo_P * ratP_A + ratOAFlo_A) * AFloWes / effZ
      "Zone outdoor air flow rate";
    parameter Modelica.SIunits.VolumeFlowRate Vou_flow_nominal=
      (divP * ratOAFlo_P * ratP_A + ratOAFlo_A) * sum(
        {AFloCor, AFloSou, AFloNor, AFloEas, AFloWes})
      "System uncorrected outdoor air flow rate";
    parameter Real effVen(final unit="1") = if divP < 0.6 then
      0.88 * divP + 0.22 else 0.75
      "System ventilation efficiency";
    parameter Modelica.SIunits.VolumeFlowRate Vot_flow_nominal=
      Vou_flow_nominal / effVen
      "System design outdoor air flow rate";

    parameter Modelica.SIunits.Temperature THeaOn=293.15
      "Heating setpoint during on";
    parameter Modelica.SIunits.Temperature THeaOff=285.15
      "Heating setpoint during off";
    parameter Modelica.SIunits.Temperature TCooOn=297.15
      "Cooling setpoint during on";
    parameter Modelica.SIunits.Temperature TCooOff=303.15
      "Cooling setpoint during off";
    parameter Modelica.SIunits.PressureDifference dpBuiStaSet(min=0) = 12
      "Building static pressure";
    parameter Real yFanMin = 0.1 "Minimum fan speed";

    parameter Boolean allowFlowReversal=true
      "= false to simplify equations, assuming, but not enforcing, no flow reversal"
      annotation (Evaluate=true);

    parameter Boolean use_windPressure=true "Set to true to enable wind pressure";

    parameter Boolean sampleModel=true
      "Set to true to time-sample the model, which can give shorter simulation time if there is already time sampling in the system model"
      annotation (Evaluate=true, Dialog(tab=
      "Experimental (may be changed in future releases)"));

    Buildings.Fluid.Sources.Outside amb(redeclare package Medium = MediumA,
        nPorts=3) "Ambient conditions"
      annotation (Placement(transformation(extent={{-136,-56},{-114,-34}})));

    replaceable FLEXLAB.BaseClasses.Floor flo(
      final lat=lat,
      final use_windPressure=use_windPressure,
      final sampleModel=sampleModel) constrainedby
      FLEXLAB.BaseClasses.PartialFloor(redeclare final package Medium = MediumA)
      "Model of a floor of the building that is served by this VAV system"
      annotation (Placement(transformation(extent={{772,396},{1100,616}})),
        choicesAllMatching=true);

    Buildings.Fluid.HeatExchangers.DryCoilEffectivenessNTU heaCoi(
      redeclare package Medium1 = MediumW,
      redeclare package Medium2 = MediumA,
      m1_flow_nominal=m_flow_nominal*1000*(10 - (-20))/4200/10,
      m2_flow_nominal=m_flow_nominal,
      show_T=true,
      configuration=Buildings.Fluid.Types.HeatExchangerConfiguration.CounterFlow,
      Q_flow_nominal=m_flow_nominal*1006*(16.7 - 8.5),
      dp1_nominal=0,
      dp2_nominal=200 + 200 + 100 + 40,
      allowFlowReversal1=false,
      allowFlowReversal2=allowFlowReversal,
      T_a1_nominal=318.15,
      T_a2_nominal=281.65) "Heating coil"
      annotation (Placement(transformation(extent={{118,-36},{98,-56}})));

    Buildings.Fluid.HeatExchangers.WetCoilCounterFlow cooCoi(
      show_T=true,
      UA_nominal=3*m_flow_nominal*1000*15/
          Buildings.Fluid.HeatExchangers.BaseClasses.lmtd(
          T_a1=26.2,
          T_b1=12.8,
          T_a2=6,
          T_b2=16),
      redeclare package Medium1 = MediumW,
      redeclare package Medium2 = MediumA,
      m1_flow_nominal=m_flow_nominal*1000*15/4200/10,
      m2_flow_nominal=m_flow_nominal,
      dp2_nominal=0,
      dp1_nominal=0,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      allowFlowReversal1=false,
      allowFlowReversal2=allowFlowReversal) "Cooling coil"
      annotation (Placement(transformation(extent={{210,-36},{190,-56}})));
    Buildings.Fluid.FixedResistances.PressureDrop dpRetDuc(
      m_flow_nominal=m_flow_nominal,
      redeclare package Medium = MediumA,
      allowFlowReversal=allowFlowReversal,
      dp_nominal=40) "Pressure drop for return duct"
      annotation (Placement(transformation(extent={{400,130},{380,150}})));
    Buildings.Fluid.Movers.SpeedControlled_y fanSup(
      redeclare package Medium = MediumA,
      per(pressure(V_flow={0,m_flow_nominal/1.2*2}, dp=2*{780 + 10 + dpBuiStaSet,
              0})),
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) "Supply air fan"
      annotation (Placement(transformation(extent={{300,-50},{320,-30}})));

    Buildings.Fluid.Sensors.VolumeFlowRate senSupFlo(redeclare package Medium
        = MediumA, m_flow_nominal=m_flow_nominal)
      "Sensor for supply fan flow rate"
      annotation (Placement(transformation(extent={{400,-50},{420,-30}})));

    Buildings.Fluid.Sensors.VolumeFlowRate senRetFlo(redeclare package Medium
        = MediumA, m_flow_nominal=m_flow_nominal)
      "Sensor for return fan flow rate"
      annotation (Placement(transformation(extent={{360,130},{340,150}})));

    Buildings.Fluid.Sources.Boundary_pT sinHea(
      redeclare package Medium = MediumW,
      p=300000,
      T=318.15,
      nPorts=1) "Sink for heating coil" annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={80,-122})));
    Buildings.Fluid.Sources.Boundary_pT sinCoo(
      redeclare package Medium = MediumW,
      p=300000,
      T=285.15,
      nPorts=1) "Sink for cooling coil" annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={180,-120})));
    Modelica.Blocks.Routing.RealPassThrough TOut(y(
        final quantity="ThermodynamicTemperature",
        final unit="K",
        displayUnit="degC",
        min=0))
      annotation (Placement(transformation(extent={{-300,170},{-280,190}})));
    Buildings.Fluid.Sensors.TemperatureTwoPort TSup(
      redeclare package Medium = MediumA,
      m_flow_nominal=m_flow_nominal,
      allowFlowReversal=allowFlowReversal)
      annotation (Placement(transformation(extent={{330,-50},{350,-30}})));
    Buildings.Fluid.Sensors.RelativePressure dpDisSupFan(redeclare package
        Medium =
          MediumA) "Supply fan static discharge pressure" annotation (Placement(
          transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={320,0})));
    Buildings.Controls.SetPoints.OccupancySchedule occSch(occupancy=3600*{6,19})
      "Occupancy schedule"
      annotation (Placement(transformation(extent={{-318,-220},{-298,-200}})));
    Buildings.Utilities.Math.Min min(nin=5) "Computes lowest room temperature"
      annotation (Placement(transformation(extent={{1200,440},{1220,460}})));
    Buildings.Utilities.Math.Average ave(nin=5)
      "Compute average of room temperatures"
      annotation (Placement(transformation(extent={{1200,410},{1220,430}})));
    Buildings.Fluid.Sources.MassFlowSource_T souCoo(
      redeclare package Medium = MediumW,
      T=279.15,
      nPorts=1,
      use_m_flow_in=true) "Source for cooling coil" annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={230,-120})));
    Buildings.Fluid.Sensors.TemperatureTwoPort TRet(
      redeclare package Medium = MediumA,
      m_flow_nominal=m_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Return air temperature sensor"
      annotation (Placement(transformation(extent={{110,130},{90,150}})));
    Buildings.Fluid.Sensors.TemperatureTwoPort TMix(
      redeclare package Medium = MediumA,
      m_flow_nominal=m_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Mixed air temperature sensor"
      annotation (Placement(transformation(extent={{30,-50},{50,-30}})));
    Buildings.Fluid.Sources.MassFlowSource_T souHea(
      redeclare package Medium = MediumW,
      T=318.15,
      use_m_flow_in=true,
      nPorts=1)           "Source for heating coil" annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={132,-120})));
    Buildings.Fluid.Sensors.VolumeFlowRate VOut1(redeclare package Medium =
          MediumA, m_flow_nominal=m_flow_nominal) "Outside air volume flow rate"
      annotation (Placement(transformation(extent={{-72,-44},{-50,-22}})));

    FLEXLAB.BaseClasses.VAVBranch cor(
      redeclare package MediumA = MediumA,
      redeclare package MediumW = MediumW,
      m_flow_nominal=mCor_flow_nominal,
      VRoo=VRooCor,
      allowFlowReversal=allowFlowReversal)
      "Zone for core of buildings (azimuth will be neglected)"
      annotation (Placement(transformation(extent={{570,22},{610,62}})));
    FLEXLAB.BaseClasses.VAVBranch sou(
      redeclare package MediumA = MediumA,
      redeclare package MediumW = MediumW,
      m_flow_nominal=mSou_flow_nominal,
      VRoo=VRooSou,
      allowFlowReversal=allowFlowReversal) "South-facing thermal zone"
      annotation (Placement(transformation(extent={{750,20},{790,60}})));
    FLEXLAB.BaseClasses.VAVBranch eas(
      redeclare package MediumA = MediumA,
      redeclare package MediumW = MediumW,
      m_flow_nominal=mEas_flow_nominal,
      VRoo=VRooEas,
      allowFlowReversal=allowFlowReversal) "East-facing thermal zone"
      annotation (Placement(transformation(extent={{930,20},{970,60}})));
    FLEXLAB.BaseClasses.VAVBranch nor(
      redeclare package MediumA = MediumA,
      redeclare package MediumW = MediumW,
      m_flow_nominal=mNor_flow_nominal,
      VRoo=VRooNor,
      allowFlowReversal=allowFlowReversal) "North-facing thermal zone"
      annotation (Placement(transformation(extent={{1090,20},{1130,60}})));
    FLEXLAB.BaseClasses.VAVBranch wes(
      redeclare package MediumA = MediumA,
      redeclare package MediumW = MediumW,
      m_flow_nominal=mWes_flow_nominal,
      VRoo=VRooWes,
      allowFlowReversal=allowFlowReversal) "West-facing thermal zone"
      annotation (Placement(transformation(extent={{1290,20},{1330,60}})));
    Buildings.Fluid.FixedResistances.Junction splRetRoo1(
      redeclare package Medium = MediumA,
      m_flow_nominal={m_flow_nominal,m_flow_nominal - mCor_flow_nominal,
          mCor_flow_nominal},
      from_dp=false,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering)
      "Splitter for room return"
      annotation (Placement(transformation(extent={{630,10},{650,-10}})));
    Buildings.Fluid.FixedResistances.Junction splRetSou(
      redeclare package Medium = MediumA,
      m_flow_nominal={mSou_flow_nominal + mEas_flow_nominal + mNor_flow_nominal
           + mWes_flow_nominal,mEas_flow_nominal + mNor_flow_nominal +
          mWes_flow_nominal,mSou_flow_nominal},
      from_dp=false,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering)
      "Splitter for room return"
      annotation (Placement(transformation(extent={{812,10},{832,-10}})));
    Buildings.Fluid.FixedResistances.Junction splRetEas(
      redeclare package Medium = MediumA,
      m_flow_nominal={mEas_flow_nominal + mNor_flow_nominal + mWes_flow_nominal,
          mNor_flow_nominal + mWes_flow_nominal,mEas_flow_nominal},
      from_dp=false,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering)
      "Splitter for room return"
      annotation (Placement(transformation(extent={{992,10},{1012,-10}})));
    Buildings.Fluid.FixedResistances.Junction splRetNor(
      redeclare package Medium = MediumA,
      m_flow_nominal={mNor_flow_nominal + mWes_flow_nominal,mWes_flow_nominal,
          mNor_flow_nominal},
      from_dp=false,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering)
      "Splitter for room return"
      annotation (Placement(transformation(extent={{1142,10},{1162,-10}})));
    Buildings.Fluid.FixedResistances.Junction splSupRoo1(
      redeclare package Medium = MediumA,
      m_flow_nominal={m_flow_nominal,m_flow_nominal - mCor_flow_nominal,
          mCor_flow_nominal},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving)
      "Splitter for room supply"
      annotation (Placement(transformation(extent={{570,-30},{590,-50}})));
    Buildings.Fluid.FixedResistances.Junction splSupSou(
      redeclare package Medium = MediumA,
      m_flow_nominal={mSou_flow_nominal + mEas_flow_nominal + mNor_flow_nominal
           + mWes_flow_nominal,mEas_flow_nominal + mNor_flow_nominal +
          mWes_flow_nominal,mSou_flow_nominal},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving)
      "Splitter for room supply"
      annotation (Placement(transformation(extent={{750,-30},{770,-50}})));
    Buildings.Fluid.FixedResistances.Junction splSupEas(
      redeclare package Medium = MediumA,
      m_flow_nominal={mEas_flow_nominal + mNor_flow_nominal + mWes_flow_nominal,
          mNor_flow_nominal + mWes_flow_nominal,mEas_flow_nominal},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving)
      "Splitter for room supply"
      annotation (Placement(transformation(extent={{930,-30},{950,-50}})));
    Buildings.Fluid.FixedResistances.Junction splSupNor(
      redeclare package Medium = MediumA,
      m_flow_nominal={mNor_flow_nominal + mWes_flow_nominal,mWes_flow_nominal,
          mNor_flow_nominal},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving)
      "Splitter for room supply"
      annotation (Placement(transformation(extent={{1090,-30},{1110,-50}})));
    Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
          Modelica.Utilities.Files.loadResource(
          "modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"))
      annotation (Placement(transformation(extent={{-360,170},{-340,190}})));
    Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather Data Bus"
      annotation (Placement(transformation(extent={{-330,170},{-310,190}}),
          iconTransformation(extent={{-360,170},{-340,190}})));

    Modelica.Blocks.Routing.DeMultiplex5 TRooAir(u(each unit="K", each
          displayUnit="degC")) "Demultiplex for room air temperature"
      annotation (Placement(transformation(extent={{490,160},{510,180}})));

    Buildings.Fluid.Sensors.TemperatureTwoPort TSupCor(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mCor_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air temperature"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={580,92})));
    Buildings.Fluid.Sensors.TemperatureTwoPort TSupSou(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mSou_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air temperature"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={760,92})));
    Buildings.Fluid.Sensors.TemperatureTwoPort TSupEas(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mEas_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air temperature"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={940,90})));
    Buildings.Fluid.Sensors.TemperatureTwoPort TSupNor(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mNor_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air temperature"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={1100,94})));
    Buildings.Fluid.Sensors.TemperatureTwoPort TSupWes(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mWes_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air temperature"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={1300,90})));
    Buildings.Fluid.Sensors.VolumeFlowRate VSupCor_flow(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mCor_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air flow rate"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={580,130})));
    Buildings.Fluid.Sensors.VolumeFlowRate VSupSou_flow(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mSou_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air flow rate"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={760,130})));
    Buildings.Fluid.Sensors.VolumeFlowRate VSupEas_flow(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mEas_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air flow rate"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={940,128})));
    Buildings.Fluid.Sensors.VolumeFlowRate VSupNor_flow(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mNor_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air flow rate"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={1100,132})));
    Buildings.Fluid.Sensors.VolumeFlowRate VSupWes_flow(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mWes_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air flow rate"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={1300,128})));
    FLEXLAB.BaseClasses.MixingBox eco(
      redeclare package Medium = MediumA,
      mOut_flow_nominal=m_flow_nominal,
      dpOut_nominal=10,
      mRec_flow_nominal=m_flow_nominal,
      dpRec_nominal=10,
      mExh_flow_nominal=m_flow_nominal,
      dpExh_nominal=10,
      from_dp=false) "Economizer" annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-10,-46})));

    Results res(
      final A=ATot,
      PFan=fanSup.P + 0,
      PHea=heaCoi.Q2_flow + cor.terHea.Q1_flow + nor.terHea.Q1_flow + wes.terHea.Q1_flow
           + eas.terHea.Q1_flow + sou.terHea.Q1_flow,
      PCooSen=cooCoi.QSen2_flow,
      PCooLat=cooCoi.QLat2_flow) "Results of the simulation";
    /*fanRet*/

  protected
    model Results "Model to store the results of the simulation"
      parameter Modelica.SIunits.Area A "Floor area";
      input Modelica.SIunits.Power PFan "Fan energy";
      input Modelica.SIunits.Power PHea "Heating energy";
      input Modelica.SIunits.Power PCooSen "Sensible cooling energy";
      input Modelica.SIunits.Power PCooLat "Latent cooling energy";

      Real EFan(
        unit="J/m2",
        start=0,
        nominal=1E5,
        fixed=true) "Fan energy";
      Real EHea(
        unit="J/m2",
        start=0,
        nominal=1E5,
        fixed=true) "Heating energy";
      Real ECooSen(
        unit="J/m2",
        start=0,
        nominal=1E5,
        fixed=true) "Sensible cooling energy";
      Real ECooLat(
        unit="J/m2",
        start=0,
        nominal=1E5,
        fixed=true) "Latent cooling energy";
      Real ECoo(unit="J/m2") "Total cooling energy";
    equation

      A*der(EFan) = PFan;
      A*der(EHea) = PHea;
      A*der(ECooSen) = PCooSen;
      A*der(ECooLat) = PCooLat;
      ECoo = ECooSen + ECooLat;

    end Results;
  public
    Buildings.Controls.OBC.CDL.Continuous.Gain gaiHeaCoi(k=m_flow_nominal*1000*40
          /4200/10) "Gain for heating coil mass flow rate"
      annotation (Placement(transformation(extent={{100,-220},{120,-200}})));
    Buildings.Controls.OBC.CDL.Continuous.Gain gaiCooCoi(k=m_flow_nominal*1000*15
          /4200/10) "Gain for cooling coil mass flow rate"
      annotation (Placement(transformation(extent={{100,-258},{120,-238}})));
    Buildings.Controls.OBC.CDL.Logical.OnOffController freSta(bandwidth=1)
      "Freeze stat for heating coil"
      annotation (Placement(transformation(extent={{0,-100},{20,-80}})));
    Buildings.Controls.OBC.CDL.Continuous.Sources.Constant freStaTSetPoi(k=273.15
           + 3) "Freeze stat set point for heating coil"
      annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
  equation
    connect(fanSup.port_b, dpDisSupFan.port_a) annotation (Line(
        points={{320,-40},{320,-10}},
        color={0,0,0},
        smooth=Smooth.None,
        pattern=LinePattern.Dot));
    connect(TSup.port_a, fanSup.port_b) annotation (Line(
        points={{330,-40},{320,-40}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(amb.ports[1], VOut1.port_a) annotation (Line(
        points={{-114,-42.0667},{-94,-42.0667},{-94,-33},{-72,-33}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splRetRoo1.port_1, dpRetDuc.port_a) annotation (Line(
        points={{630,0},{430,0},{430,140},{400,140}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splRetNor.port_1, splRetEas.port_2) annotation (Line(
        points={{1142,0},{1110,0},{1110,0},{1078,0},{1078,0},{1012,0}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splRetEas.port_1, splRetSou.port_2) annotation (Line(
        points={{992,0},{952,0},{952,0},{912,0},{912,0},{832,0}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splRetSou.port_1, splRetRoo1.port_2) annotation (Line(
        points={{812,0},{650,0}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splSupRoo1.port_3, cor.port_a) annotation (Line(
        points={{580,-30},{580,22}},
        color={0,127,255},
        thickness=0.5));
    connect(splSupRoo1.port_2, splSupSou.port_1) annotation (Line(
        points={{590,-40},{750,-40}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splSupSou.port_3, sou.port_a) annotation (Line(
        points={{760,-30},{760,20}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splSupSou.port_2, splSupEas.port_1) annotation (Line(
        points={{770,-40},{930,-40}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splSupEas.port_3, eas.port_a) annotation (Line(
        points={{940,-30},{940,20}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splSupEas.port_2, splSupNor.port_1) annotation (Line(
        points={{950,-40},{1090,-40}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splSupNor.port_3, nor.port_a) annotation (Line(
        points={{1100,-30},{1100,20}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splSupNor.port_2, wes.port_a) annotation (Line(
        points={{1110,-40},{1300,-40},{1300,20}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(cooCoi.port_b1, sinCoo.ports[1]) annotation (Line(
        points={{190,-52},{180,-52},{180,-110}},
        color={28,108,200},
        thickness=0.5));
    connect(weaDat.weaBus, weaBus) annotation (Line(
        points={{-340,180},{-320,180}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(weaBus.TDryBul, TOut.u) annotation (Line(
        points={{-320,180},{-302,180}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(amb.weaBus, weaBus) annotation (Line(
        points={{-136,-44.78},{-320,-44.78},{-320,180}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(splRetRoo1.port_3, flo.portsCor[2]) annotation (Line(
        points={{640,10},{640,364},{874,364},{874,472},{898,472},{898,504.308},
            {906.052,504.308}},
        color={0,127,255},
        thickness=0.5));
    connect(splRetSou.port_3, flo.portsSou[2]) annotation (Line(
        points={{822,10},{822,350},{900,350},{900,443.385},{906.052,443.385}},
        color={0,127,255},
        thickness=0.5));
    connect(splRetEas.port_3, flo.portsEas[2]) annotation (Line(
        points={{1002,10},{1002,368},{1068.63,368},{1068.63,504.308}},
        color={0,127,255},
        thickness=0.5));
    connect(splRetNor.port_3, flo.portsNor[2]) annotation (Line(
        points={{1152,10},{1152,446},{906.052,446},{906.052,561.846}},
        color={0,127,255},
        thickness=0.5));
    connect(splRetNor.port_2, flo.portsWes[2]) annotation (Line(
        points={{1162,0},{1342,0},{1342,394},{817.635,394},{817.635,504.308}},
        color={0,127,255},
        thickness=0.5));
    connect(weaBus, flo.weaBus) annotation (Line(
        points={{-320,180},{-320,632.923},{978.783,632.923}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(flo.TRooAir, min.u) annotation (Line(
        points={{1107.13,506},{1164.7,506},{1164.7,450},{1198,450}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(flo.TRooAir, ave.u) annotation (Line(
        points={{1107.13,506},{1166,506},{1166,420},{1198,420}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(TRooAir.u, flo.TRooAir) annotation (Line(
        points={{488,170},{480,170},{480,538},{1164,538},{1164,506},{1107.13,
            506}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));

    connect(cooCoi.port_b2, fanSup.port_a) annotation (Line(
        points={{210,-40},{300,-40}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(cor.port_b, TSupCor.port_a) annotation (Line(
        points={{580,62},{580,82}},
        color={0,127,255},
        thickness=0.5));

    connect(sou.port_b, TSupSou.port_a) annotation (Line(
        points={{760,60},{760,82}},
        color={0,127,255},
        thickness=0.5));
    connect(eas.port_b, TSupEas.port_a) annotation (Line(
        points={{940,60},{940,80}},
        color={0,127,255},
        thickness=0.5));
    connect(nor.port_b, TSupNor.port_a) annotation (Line(
        points={{1100,60},{1100,84}},
        color={0,127,255},
        thickness=0.5));
    connect(wes.port_b, TSupWes.port_a) annotation (Line(
        points={{1300,60},{1300,80}},
        color={0,127,255},
        thickness=0.5));

    connect(TSupCor.port_b, VSupCor_flow.port_a) annotation (Line(
        points={{580,102},{580,120}},
        color={0,127,255},
        thickness=0.5));
    connect(TSupSou.port_b, VSupSou_flow.port_a) annotation (Line(
        points={{760,102},{760,120}},
        color={0,127,255},
        thickness=0.5));
    connect(TSupEas.port_b, VSupEas_flow.port_a) annotation (Line(
        points={{940,100},{940,100},{940,118}},
        color={0,127,255},
        thickness=0.5));
    connect(TSupNor.port_b, VSupNor_flow.port_a) annotation (Line(
        points={{1100,104},{1100,122}},
        color={0,127,255},
        thickness=0.5));
    connect(TSupWes.port_b, VSupWes_flow.port_a) annotation (Line(
        points={{1300,100},{1300,118}},
        color={0,127,255},
        thickness=0.5));
    connect(VSupCor_flow.port_b, flo.portsCor[1]) annotation (Line(
        points={{580,140},{580,372},{866,372},{866,480},{891.791,480},{891.791,
            504.308}},
        color={0,127,255},
        thickness=0.5));

    connect(VSupSou_flow.port_b, flo.portsSou[1]) annotation (Line(
        points={{760,140},{760,356},{891.791,356},{891.791,443.385}},
        color={0,127,255},
        thickness=0.5));
    connect(VSupEas_flow.port_b, flo.portsEas[1]) annotation (Line(
        points={{940,138},{940,376},{1054.37,376},{1054.37,504.308}},
        color={0,127,255},
        thickness=0.5));
    connect(VSupNor_flow.port_b, flo.portsNor[1]) annotation (Line(
        points={{1100,142},{1100,498},{891.791,498},{891.791,561.846}},
        color={0,127,255},
        thickness=0.5));
    connect(VSupWes_flow.port_b, flo.portsWes[1]) annotation (Line(
        points={{1300,138},{1300,384},{803.374,384},{803.374,504.308}},
        color={0,127,255},
        thickness=0.5));
    connect(VOut1.port_b, eco.port_Out) annotation (Line(
        points={{-50,-33},{-42,-33},{-42,-40},{-20,-40}},
        color={0,127,255},
        thickness=0.5));
    connect(eco.port_Sup, TMix.port_a) annotation (Line(
        points={{0,-40},{30,-40}},
        color={0,127,255},
        thickness=0.5));
    connect(eco.port_Exh, amb.ports[2]) annotation (Line(
        points={{-20,-52},{-96,-52},{-96,-45},{-114,-45}},
        color={0,127,255},
        thickness=0.5));
    connect(eco.port_Ret, TRet.port_b) annotation (Line(
        points={{0,-52},{10,-52},{10,140},{90,140}},
        color={0,127,255},
        thickness=0.5));
    connect(senRetFlo.port_a, dpRetDuc.port_b)
      annotation (Line(points={{360,140},{380,140}}, color={0,127,255}));
    connect(TSup.port_b, senSupFlo.port_a)
      annotation (Line(points={{350,-40},{400,-40}}, color={0,127,255}));
    connect(senSupFlo.port_b, splSupRoo1.port_1)
      annotation (Line(points={{420,-40},{570,-40}}, color={0,127,255}));
    connect(cooCoi.port_a1, souCoo.ports[1]) annotation (Line(
        points={{210,-52},{230,-52},{230,-110}},
        color={28,108,200},
        thickness=0.5));
    connect(gaiHeaCoi.y, souHea.m_flow_in) annotation (Line(points={{122,-210},{124,
            -210},{124,-132}},     color={0,0,127}));
    connect(gaiCooCoi.y, souCoo.m_flow_in) annotation (Line(points={{122,-248},{222,
            -248},{222,-132}},     color={0,0,127}));
    connect(dpDisSupFan.port_b, amb.ports[3]) annotation (Line(
        points={{320,10},{320,14},{-88,14},{-88,-47.9333},{-114,-47.9333}},
        color={0,0,0},
        pattern=LinePattern.Dot));
    connect(senRetFlo.port_b, TRet.port_a) annotation (Line(points={{340,140},{
            226,140},{110,140}}, color={0,127,255}));
    connect(freStaTSetPoi.y, freSta.reference)
      annotation (Line(points={{-18,-90},{-10,-90},{-10,-84},{-2,-84}},
                                                    color={0,0,127}));
    connect(freSta.u, TMix.T) annotation (Line(points={{-2,-96},{-6,-96},{-6,-68},
            {20,-68},{20,-20},{40,-20},{40,-29}}, color={0,0,127}));
    connect(TMix.port_b, heaCoi.port_a2) annotation (Line(
        points={{50,-40},{98,-40}},
        color={0,127,255},
        thickness=0.5));
    connect(heaCoi.port_b2, cooCoi.port_a2) annotation (Line(
        points={{118,-40},{190,-40}},
        color={0,127,255},
        thickness=0.5));
    connect(souHea.ports[1], heaCoi.port_a1) annotation (Line(
        points={{132,-110},{132,-52},{118,-52}},
        color={28,108,200},
        thickness=0.5));
    connect(heaCoi.port_b1, sinHea.ports[1]) annotation (Line(
        points={{98,-52},{80,-52},{80,-112}},
        color={28,108,200},
        thickness=0.5));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-380,
              -400},{1420,660}})), Documentation(info="<html>
<p>
This model consist of an HVAC system, a building envelope model and a model
for air flow through building leakage and through open doors.
</p>
<p>
The HVAC system is a variable air volume (VAV) flow system with economizer
and a heating and cooling coil in the air handler unit. There is also a
reheat coil and an air damper in each of the five zone inlet branches.
The figure below shows the schematic diagram of the HVAC system
</p>
<p align=\"center\">
<img alt=\"image\" src=\"modelica://Buildings/Resources/Images/Examples/VAVReheat/vavSchematics.png\" border=\"1\"/>
</p>
<p>
Most of the HVAC control in this model is open loop.
Two models that extend this model, namely
<a href=\"modelica://Buildings.Examples.VAVReheat.ASHRAE2006\">
Buildings.Examples.VAVReheat.ASHRAE2006</a>
and
<a href=\"modelica://Buildings.Examples.VAVReheat.Guideline36\">
Buildings.Examples.VAVReheat.Guideline36</a>
add closed loop control. See these models for a description of
the control sequence.
</p>
<p>
To model the heat transfer through the building envelope,
a model of five interconnected rooms is used.
The five room model is representative of one floor of the
new construction medium office building for Chicago, IL,
as described in the set of DOE Commercial Building Benchmarks
(Deru et al, 2009). There are four perimeter zones and one core zone.
The envelope thermal properties meet ASHRAE Standard 90.1-2004.
The thermal room model computes transient heat conduction through
walls, floors and ceilings and long-wave radiative heat exchange between
surfaces. The convective heat transfer coefficient is computed based
on the temperature difference between the surface and the room air.
There is also a layer-by-layer short-wave radiation,
long-wave radiation, convection and conduction heat transfer model for the
windows. The model is similar to the
Window 5 model and described in TARCOG 2006.
</p>
<p>
Each thermal zone can have air flow from the HVAC system, through leakages of the building envelope (except for the core zone) and through bi-directional air exchange through open doors that connect adjacent zones. The bi-directional air exchange is modeled based on the differences in static pressure between adjacent rooms at a reference height plus the difference in static pressure across the door height as a function of the difference in air density.
Infiltration is a function of the
flow imbalance of the HVAC system.
</p>
<h4>References</h4>
<p>
Deru M., K. Field, D. Studer, K. Benne, B. Griffith, P. Torcellini,
 M. Halverson, D. Winiarski, B. Liu, M. Rosenberg, J. Huang, M. Yazdanian, and D. Crawley.
<i>DOE commercial building research benchmarks for commercial buildings</i>.
Technical report, U.S. Department of Energy, Energy Efficiency and
Renewable Energy, Office of Building Technologies, Washington, DC, 2009.
</p>
<p>
TARCOG 2006: Carli, Inc., TARCOG: Mathematical models for calculation
of thermal performance of glazing systems with our without
shading devices, Technical Report, Oct. 17, 2006.
</p>
</html>",   revisions="<html>
<ul>
<li>
July 10, 2020, by Antoine Gautier:<br/>
Added design parameters for outdoor air flow.<br/>
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/2019\">#2019</a>
</li>
<li>
November 25, 2019, by Milica Grahovac:<br/>
Declared the floor model as replaceable.
</li>
<li>
September 26, 2017, by Michael Wetter:<br/>
Separated physical model from control to facilitate implementation of alternate control
sequences.
</li>
<li>
May 19, 2016, by Michael Wetter:<br/>
Changed chilled water supply temperature to <i>6&deg;C</i>.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/509\">#509</a>.
</li>
<li>
April 26, 2016, by Michael Wetter:<br/>
Changed controller for freeze protection as the old implementation closed
the outdoor air damper during summer.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/511\">#511</a>.
</li>
<li>
January 22, 2016, by Michael Wetter:<br/>
Corrected type declaration of pressure difference.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/404\">#404</a>.
</li>
<li>
September 24, 2015 by Michael Wetter:<br/>
Set default temperature for medium to avoid conflicting
start values for alias variables of the temperature
of the building and the ambient air.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/426\">issue 426</a>.
</li>
</ul>
</html>"));
  end PartialOpenLoop;

  model RoomLeakage "Room leakage model"
    extends Buildings.BaseClasses.BaseIcon;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      "Medium in the component" annotation (choicesAllMatching=true);
    parameter Modelica.SIunits.Volume VRoo "Room volume";
    parameter Boolean use_windPressure=false
      "Set to true to enable wind pressure"
      annotation(Evaluate=true);
    Buildings.Fluid.FixedResistances.PressureDrop res(
      redeclare package Medium = Medium,
      dp_nominal=50,
      m_flow_nominal=VRoo*1.2/3600) "Resistance model"
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
          Medium) annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    Buildings.Fluid.Sources.Outside_CpLowRise
                          amb(redeclare package Medium = Medium, nPorts=1,
      s=s,
      azi=azi,
      Cp0=if use_windPressure then 0.6 else 0)
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    Buildings.BoundaryConditions.WeatherData.Bus weaBus "Bus with weather data"
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    Buildings.Fluid.Sensors.MassFlowRate senMasFlo1(redeclare package Medium = Medium,
        allowFlowReversal=true) "Sensor for mass flow rate" annotation (Placement(
          transformation(
          extent={{10,10},{-10,-10}},
          rotation=180,
          origin={-10,0})));
    Modelica.Blocks.Math.Gain ACHInf(k=1/VRoo/1.2*3600, y(unit="1/h"))
      "Air change per hour due to infiltration"
      annotation (Placement(transformation(extent={{12,30},{32,50}})));
    parameter Real s "Side ratio, s=length of this wall/length of adjacent wall";
    parameter Modelica.SIunits.Angle azi "Surface azimuth (South:0, West:pi/2)";

  equation
    connect(res.port_b, port_b) annotation (Line(points={{40,6.10623e-16},{55,
            6.10623e-16},{55,1.16573e-15},{70,1.16573e-15},{70,5.55112e-16},{100,
            5.55112e-16}},                                   color={0,127,255}));
    connect(amb.weaBus, weaBus) annotation (Line(
        points={{-60,0.2},{-80,0.2},{-80,5.55112e-16},{-100,5.55112e-16}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(amb.ports[1], senMasFlo1.port_a) annotation (Line(
        points={{-40,6.66134e-16},{-20,6.66134e-16},{-20,7.25006e-16}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(senMasFlo1.port_b, res.port_a) annotation (Line(
        points={{5.55112e-16,-1.72421e-15},{10,-1.72421e-15},{10,6.10623e-16},{20,
            6.10623e-16}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(senMasFlo1.m_flow, ACHInf.u) annotation (Line(
        points={{-10,11},{-10,40},{10,40}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={
          Ellipse(
            extent={{-80,40},{0,-40}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={0,127,255}),
          Rectangle(
            extent={{20,12},{80,-12}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={192,192,192}),
          Rectangle(
            extent={{20,6},{80,-6}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,127,255}),
          Line(points={{-100,0},{-80,0}}, color={0,0,255}),
          Line(points={{0,0},{20,0}}, color={0,0,255}),
          Line(points={{80,0},{90,0}}, color={0,0,255})}),
      Documentation(info="<html>
<p>
Room leakage.
</p></html>",   revisions="<html>
<ul>
<li>
July 20, 2007 by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
  end RoomLeakage;

  model VAVBranch "Supply branch of a VAV system"
    extends Modelica.Blocks.Icons.Block;
    replaceable package MediumA = Modelica.Media.Interfaces.PartialMedium
      "Medium model for air" annotation (choicesAllMatching=true);
    replaceable package MediumW = Modelica.Media.Interfaces.PartialMedium
      "Medium model for water" annotation (choicesAllMatching=true);

    parameter Boolean allowFlowReversal=true
      "= false to simplify equations, assuming, but not enforcing, no flow reversal";

    parameter Modelica.SIunits.MassFlowRate m_flow_nominal
      "Mass flow rate of this thermal zone";
    parameter Modelica.SIunits.Volume VRoo "Room volume";

    Buildings.Fluid.Actuators.Dampers.PressureIndependent vav(
      redeclare package Medium = MediumA,
      m_flow_nominal=m_flow_nominal,
      dpDamper_nominal=220 + 20,
      allowFlowReversal=allowFlowReversal) "VAV box for room" annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-50,40})));
    Buildings.Fluid.HeatExchangers.DryCoilEffectivenessNTU terHea(
      redeclare package Medium1 = MediumA,
      redeclare package Medium2 = MediumW,
      m1_flow_nominal=m_flow_nominal,
      m2_flow_nominal=m_flow_nominal*1000*(50 - 17)/4200/10,
      Q_flow_nominal=m_flow_nominal*1006*(50 - 16.7),
      configuration=Buildings.Fluid.Types.HeatExchangerConfiguration.CounterFlow,
      dp1_nominal=0,
      from_dp2=true,
      dp2_nominal=0,
      allowFlowReversal1=allowFlowReversal,
      allowFlowReversal2=false,
      T_a1_nominal=289.85,
      T_a2_nominal=355.35) "Heat exchanger of terminal box" annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-44,0})));
    Buildings.Fluid.Sources.Boundary_pT sinTer(
      redeclare package Medium = MediumW,
      p(displayUnit="Pa") = 3E5,
      nPorts=1) "Sink for terminal box " annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={40,-20})));
    Modelica.Fluid.Interfaces.FluidPort_a port_a(
      redeclare package Medium = MediumA)
      "Fluid connector a1 (positive design flow direction is from port_a1 to port_b1)"
      annotation (Placement(transformation(extent={{-60,-110},{-40,-90}}),
          iconTransformation(extent={{-60,-110},{-40,-90}})));
    Modelica.Fluid.Interfaces.FluidPort_a port_b(
      redeclare package Medium = MediumA)
      "Fluid connector b (positive design flow direction is from port_a1 to port_b1)"
      annotation (Placement(transformation(extent={{-60,90},{-40,110}}),
          iconTransformation(extent={{-60,90},{-40,110}})));
    Buildings.Fluid.Sensors.MassFlowRate senMasFlo(
      redeclare package Medium = MediumA,
      allowFlowReversal=allowFlowReversal)
      "Sensor for mass flow rate" annotation (Placement(
          transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={-50,70})));
    Modelica.Blocks.Math.Gain fraMasFlo(k=1/m_flow_nominal)
      "Fraction of mass flow rate, relative to nominal flow"
      annotation (Placement(transformation(extent={{0,70},{20,90}})));
    Modelica.Blocks.Math.Gain ACH(k=1/VRoo/1.2*3600) "Air change per hour"
      annotation (Placement(transformation(extent={{0,30},{20,50}})));
    Buildings.Fluid.Sources.MassFlowSource_T souTer(
      redeclare package Medium = MediumW,
      nPorts=1,
      use_m_flow_in=true,
      T=323.15) "Source for terminal box " annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={40,20})));
    Modelica.Blocks.Interfaces.RealInput yVAV "Signal for VAV damper"
                                                              annotation (
        Placement(transformation(extent={{-140,20},{-100,60}}),
          iconTransformation(extent={{-140,20},{-100,60}})));
    Modelica.Blocks.Interfaces.RealInput yVal
      "Actuator position for reheat valve (0: closed, 1: open)" annotation (
        Placement(transformation(extent={{-140,-60},{-100,-20}}),
          iconTransformation(extent={{-140,-60},{-100,-20}})));
    Buildings.Controls.OBC.CDL.Continuous.Gain gaiM_flow(
      final k=m_flow_nominal*1000*15/4200/10) "Gain for mass flow rate"
      annotation (Placement(transformation(extent={{80,2},{60,22}})));
    Modelica.Blocks.Interfaces.RealOutput y_actual "Actual VAV damper position"
      annotation (Placement(transformation(extent={{100,46},{120,66}}),
          iconTransformation(extent={{100,70},{120,90}})));
  equation
    connect(fraMasFlo.u, senMasFlo.m_flow) annotation (Line(
        points={{-2,80},{-24,80},{-24,70},{-39,70}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(vav.port_b, senMasFlo.port_a) annotation (Line(
        points={{-50,50},{-50,60}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(ACH.u, senMasFlo.m_flow) annotation (Line(
        points={{-2,40},{-24,40},{-24,70},{-39,70}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(souTer.ports[1], terHea.port_a2) annotation (Line(
        points={{30,20},{-38,20},{-38,10}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(port_a, terHea.port_a1) annotation (Line(
        points={{-50,-100},{-50,-10}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(senMasFlo.port_b, port_b) annotation (Line(
        points={{-50,80},{-50,100}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(terHea.port_b1, vav.port_a) annotation (Line(
        points={{-50,10},{-50,30}},
        color={0,127,255},
        thickness=0.5));
    connect(vav.y, yVAV) annotation (Line(points={{-62,40},{-120,40}},
                  color={0,0,127}));
    connect(souTer.m_flow_in, gaiM_flow.y)
      annotation (Line(points={{52,12},{58,12}}, color={0,0,127}));
    connect(sinTer.ports[1], terHea.port_b2) annotation (Line(points={{30,-20},{
            -38,-20},{-38,-10}}, color={0,127,255}));
    connect(gaiM_flow.u, yVal) annotation (Line(points={{82,12},{90,12},{90,-40},
            {-120,-40}}, color={0,0,127}));
    connect(vav.y_actual, y_actual)
      annotation (Line(points={{-57,45},{-57,56},{110,56}}, color={0,0,127}));
    annotation (Icon(
      graphics={
          Rectangle(
            extent={{-108.07,-16.1286},{93.93,-20.1286}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,127,255},
            origin={-68.1286,6.07},
            rotation=90),
          Rectangle(
            extent={{-68,-20},{-26,-60}},
            fillPattern=FillPattern.Solid,
            fillColor={175,175,175},
            pattern=LinePattern.None),
          Rectangle(
            extent={{100.8,-22},{128.8,-44}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={192,192,192},
            origin={-82,-76.8},
            rotation=90),
          Rectangle(
            extent={{102.2,-11.6667},{130.2,-25.6667}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,127,255},
            origin={-67.6667,-78.2},
            rotation=90),
          Polygon(
            points={{-62,32},{-34,48},{-34,46},{-62,30},{-62,32}},
            pattern=LinePattern.None,
            smooth=Smooth.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0}),
          Polygon(
            points={{-68,-28},{-34,-28},{-34,-30},{-68,-30},{-68,-28}},
            pattern=LinePattern.None,
            smooth=Smooth.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0}),
          Polygon(
            points={{-68,-52},{-34,-52},{-34,-54},{-68,-54},{-68,-52}},
            pattern=LinePattern.None,
            smooth=Smooth.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0}),
          Polygon(
            points={{-48,-34},{-34,-28},{-34,-30},{-48,-36},{-48,-34}},
            pattern=LinePattern.None,
            smooth=Smooth.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0}),
          Polygon(
            points={{-48,-34},{-34,-40},{-34,-42},{-48,-36},{-48,-34}},
            pattern=LinePattern.None,
            smooth=Smooth.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0}),
          Polygon(
            points={{-48,-46},{-34,-52},{-34,-54},{-48,-48},{-48,-46}},
            pattern=LinePattern.None,
            smooth=Smooth.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0}),
          Polygon(
            points={{-48,-46},{-34,-40},{-34,-42},{-48,-48},{-48,-46}},
            pattern=LinePattern.None,
            smooth=Smooth.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0})}), Documentation(info="<html>
<p>
Model for a VAV supply branch. 
The terminal VAV box has a pressure independent damper and a water reheat coil. 
The pressure independent damper model includes an idealized flow rate controller 
and requires a discharge air flow rate set-point (normalized to the nominal value) 
as a control signal.
</p>
</html>"));
  end VAVBranch;

  partial model PartialOpenLoop_3zones
    "Partial model of variable air volume flow system with terminal reheat and 3 thermal zones"

    package MediumA = Buildings.Media.Air "Medium model for air";
    package MediumW = Buildings.Media.Water "Medium model for water";

    constant Integer numZon=3 "Total number of served VAV boxes";

    parameter Modelica.SIunits.Volume VRooCor=flo.VRooCor
      "Room volume corridor";
    parameter Modelica.SIunits.Volume VRooSou=flo.VRooSou
      "Room volume south";
    parameter Modelica.SIunits.Volume VRooNor=flo.VRooNor
      "Room volume north";

    parameter Modelica.SIunits.Area AFloCor=flo.cor.AFlo "Floor area corridor";
    parameter Modelica.SIunits.Area AFloSou=flo.sou.AFlo "Floor area south";
    parameter Modelica.SIunits.Area AFloNor=flo.nor.AFlo "Floor area north";

    parameter Modelica.SIunits.Area AFlo[numZon]={flo.cor.AFlo,flo.sou.AFlo,
        flo.nor.AFlo} "Floor area of each zone";
    final parameter Modelica.SIunits.Area ATot=sum(AFlo) "Total floor area";

    constant Real conv=1.2/3600 "Conversion factor for nominal mass flow rate";

    parameter Real ACHCor(final unit="1/h")=6
      "Design air change per hour core";
    parameter Real ACHSou(final unit="1/h")=6
      "Design air change per hour south";
    parameter Real ACHNor(final unit="1/h")=6
      "Design air change per hour north";

    parameter Modelica.SIunits.MassFlowRate mCor_flow_nominal=ACHCor*VRooCor*conv
      "Design mass flow rate core";
    parameter Modelica.SIunits.MassFlowRate mSou_flow_nominal=ACHSou*VRooSou*conv
      "Design mass flow rate south";
    parameter Modelica.SIunits.MassFlowRate mNor_flow_nominal=ACHNor*VRooNor*conv
      "Design mass flow rate north";

    parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.7*(mCor_flow_nominal
         + mSou_flow_nominal + mNor_flow_nominal) "Nominal mass flow rate";

    parameter Modelica.SIunits.Angle lat=41.98*3.14159/180 "Latitude";

    parameter Real ratOAFlo_A(final unit="m3/(s.m2)") = 0.3e-3
      "Outdoor airflow rate required per unit area";
    parameter Real ratOAFlo_P = 2.5e-3
      "Outdoor airflow rate required per person";
    parameter Real ratP_A = 5e-2
      "Occupant density";
    parameter Real effZ(final unit="1") = 0.8
      "Zone air distribution effectiveness (limiting value)";
    parameter Real divP(final unit="1") = 0.7
      "Occupant diversity ratio";
    parameter Modelica.SIunits.VolumeFlowRate VCorOA_flow_nominal=
      (ratOAFlo_P * ratP_A + ratOAFlo_A) * AFloCor / effZ
      "Zone outdoor air flow rate";
    parameter Modelica.SIunits.VolumeFlowRate VSouOA_flow_nominal=
      (ratOAFlo_P * ratP_A + ratOAFlo_A) * AFloSou / effZ
      "Zone outdoor air flow rate";

    parameter Modelica.SIunits.VolumeFlowRate VNorOA_flow_nominal=
      (ratOAFlo_P * ratP_A + ratOAFlo_A) * AFloNor / effZ
      "Zone outdoor air flow rate";

    parameter Modelica.SIunits.VolumeFlowRate Vou_flow_nominal=
      (divP * ratOAFlo_P * ratP_A + ratOAFlo_A) * sum(
        {AFloCor, AFloSou, AFloNor})
      "System uncorrected outdoor air flow rate";
    parameter Real effVen(final unit="1") = if divP < 0.6 then
      0.88 * divP + 0.22 else 0.75
      "System ventilation efficiency";
    parameter Modelica.SIunits.VolumeFlowRate Vot_flow_nominal=
      Vou_flow_nominal / effVen
      "System design outdoor air flow rate";

    parameter Modelica.SIunits.Temperature THeaOn=293.15
      "Heating setpoint during on";
    parameter Modelica.SIunits.Temperature THeaOff=285.15
      "Heating setpoint during off";
    parameter Modelica.SIunits.Temperature TCooOn=297.15
      "Cooling setpoint during on";
    parameter Modelica.SIunits.Temperature TCooOff=303.15
      "Cooling setpoint during off";
    parameter Modelica.SIunits.PressureDifference dpBuiStaSet(min=0) = 12
      "Building static pressure";
    parameter Real yFanMin = 0.1 "Minimum fan speed";

    parameter Boolean allowFlowReversal=true
      "= false to simplify equations, assuming, but not enforcing, no flow reversal"
      annotation (Evaluate=true);

    parameter Boolean use_windPressure=true "Set to true to enable wind pressure";

    parameter Boolean sampleModel=true
      "Set to true to time-sample the model, which can give shorter simulation time if there is already time sampling in the system model"
      annotation (Evaluate=true, Dialog(tab=
      "Experimental (may be changed in future releases)"));

    Buildings.Fluid.Sources.Outside amb(redeclare package Medium = MediumA,
        nPorts=3) "Ambient conditions"
      annotation (Placement(transformation(extent={{-136,-56},{-114,-34}})));

    replaceable Floor_3zones                                   flo(
      final lat=lat,
      final use_windPressure=use_windPressure,
      final sampleModel=sampleModel) constrainedby
      FLEXLAB.BaseClasses.PartialFloor(
        redeclare final package Medium = MediumA)
      "Model of a floor of the building that is served by this VAV system"
      annotation (Placement(transformation(extent={{580,394},{908,614}})),  choicesAllMatching=true);

    Buildings.Fluid.HeatExchangers.DryCoilEffectivenessNTU heaCoi(
      redeclare package Medium1 = MediumW,
      redeclare package Medium2 = MediumA,
      m1_flow_nominal=m_flow_nominal*1000*(10 - (-20))/4200/10,
      m2_flow_nominal=m_flow_nominal,
      show_T=true,
      configuration=Buildings.Fluid.Types.HeatExchangerConfiguration.CounterFlow,
      Q_flow_nominal=m_flow_nominal*1006*(16.7 - 8.5),
      dp1_nominal=0,
      dp2_nominal=200 + 200 + 100 + 40,
      allowFlowReversal1=false,
      allowFlowReversal2=allowFlowReversal,
      T_a1_nominal=318.15,
      T_a2_nominal=281.65) "Heating coil"
      annotation (Placement(transformation(extent={{118,-36},{98,-56}})));

    Buildings.Fluid.HeatExchangers.WetCoilCounterFlow cooCoi(
      show_T=true,
      UA_nominal=3*m_flow_nominal*1000*15/
          Buildings.Fluid.HeatExchangers.BaseClasses.lmtd(
          T_a1=26.2,
          T_b1=12.8,
          T_a2=6,
          T_b2=16),
      redeclare package Medium1 = MediumW,
      redeclare package Medium2 = MediumA,
      m1_flow_nominal=m_flow_nominal*1000*15/4200/10,
      m2_flow_nominal=m_flow_nominal,
      dp2_nominal=0,
      dp1_nominal=0,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      allowFlowReversal1=false,
      allowFlowReversal2=allowFlowReversal) "Cooling coil"
      annotation (Placement(transformation(extent={{210,-36},{190,-56}})));
    Buildings.Fluid.FixedResistances.PressureDrop dpRetDuc(
      m_flow_nominal=m_flow_nominal,
      redeclare package Medium = MediumA,
      allowFlowReversal=allowFlowReversal,
      dp_nominal=40) "Pressure drop for return duct"
      annotation (Placement(transformation(extent={{400,130},{380,150}})));
    Buildings.Fluid.Movers.SpeedControlled_y fanSup(
      redeclare package Medium = MediumA,
      per(pressure(V_flow={0,m_flow_nominal/1.2*2}, dp=2*{780 + 10 + dpBuiStaSet,
              0})),
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) "Supply air fan"
      annotation (Placement(transformation(extent={{300,-50},{320,-30}})));

    Buildings.Fluid.Sensors.VolumeFlowRate senSupFlo(redeclare package Medium
        = MediumA, m_flow_nominal=m_flow_nominal)
      "Sensor for supply fan flow rate"
      annotation (Placement(transformation(extent={{400,-50},{420,-30}})));

    Buildings.Fluid.Sensors.VolumeFlowRate senRetFlo(redeclare package Medium
        = MediumA, m_flow_nominal=m_flow_nominal)
      "Sensor for return fan flow rate"
      annotation (Placement(transformation(extent={{360,130},{340,150}})));

    Buildings.Fluid.Sources.Boundary_pT sinHea(
      redeclare package Medium = MediumW,
      p=300000,
      T=318.15,
      nPorts=1) "Sink for heating coil" annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={80,-122})));
    Buildings.Fluid.Sources.Boundary_pT sinCoo(
      redeclare package Medium = MediumW,
      p=300000,
      T=285.15,
      nPorts=1) "Sink for cooling coil" annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={180,-120})));
    Modelica.Blocks.Routing.RealPassThrough TOut(y(
        final quantity="ThermodynamicTemperature",
        final unit="K",
        displayUnit="degC",
        min=0))
      annotation (Placement(transformation(extent={{-300,170},{-280,190}})));
    Buildings.Fluid.Sensors.TemperatureTwoPort TSup(
      redeclare package Medium = MediumA,
      m_flow_nominal=m_flow_nominal,
      allowFlowReversal=allowFlowReversal)
      annotation (Placement(transformation(extent={{330,-50},{350,-30}})));
    Buildings.Fluid.Sensors.RelativePressure dpDisSupFan(redeclare package
        Medium =
          MediumA) "Supply fan static discharge pressure" annotation (Placement(
          transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={320,0})));
    Buildings.Controls.SetPoints.OccupancySchedule occSch(occupancy=3600*{6,19})
      "Occupancy schedule"
      annotation (Placement(transformation(extent={{-318,-220},{-298,-200}})));
    Buildings.Utilities.Math.Min min(nin=3) "Computes lowest room temperature"
      annotation (Placement(transformation(extent={{1134,440},{1154,460}})));
    Buildings.Utilities.Math.Average ave(nin=3)
      "Compute average of room temperatures"
      annotation (Placement(transformation(extent={{1134,410},{1154,430}})));
    Buildings.Fluid.Sources.MassFlowSource_T souCoo(
      redeclare package Medium = MediumW,
      T=279.15,
      nPorts=1,
      use_m_flow_in=true) "Source for cooling coil" annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={230,-120})));
    Buildings.Fluid.Sensors.TemperatureTwoPort TRet(
      redeclare package Medium = MediumA,
      m_flow_nominal=m_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Return air temperature sensor"
      annotation (Placement(transformation(extent={{110,130},{90,150}})));
    Buildings.Fluid.Sensors.TemperatureTwoPort TMix(
      redeclare package Medium = MediumA,
      m_flow_nominal=m_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Mixed air temperature sensor"
      annotation (Placement(transformation(extent={{30,-50},{50,-30}})));
    Buildings.Fluid.Sources.MassFlowSource_T souHea(
      redeclare package Medium = MediumW,
      T=318.15,
      use_m_flow_in=true,
      nPorts=1)           "Source for heating coil" annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={132,-120})));
    Buildings.Fluid.Sensors.VolumeFlowRate VOut1(redeclare package Medium =
          MediumA, m_flow_nominal=m_flow_nominal) "Outside air volume flow rate"
      annotation (Placement(transformation(extent={{-72,-44},{-50,-22}})));

    FLEXLAB.BaseClasses.VAVBranch cor(
      redeclare package MediumA = MediumA,
      redeclare package MediumW = MediumW,
      m_flow_nominal=mCor_flow_nominal,
      VRoo=VRooCor,
      allowFlowReversal=allowFlowReversal)
      "Zone for core of buildings (azimuth will be neglected)"
      annotation (Placement(transformation(extent={{570,22},{610,62}})));
    FLEXLAB.BaseClasses.VAVBranch sou(
      redeclare package MediumA = MediumA,
      redeclare package MediumW = MediumW,
      m_flow_nominal=mSou_flow_nominal,
      VRoo=VRooSou,
      allowFlowReversal=allowFlowReversal) "South-facing thermal zone"
      annotation (Placement(transformation(extent={{750,20},{790,60}})));
    FLEXLAB.BaseClasses.VAVBranch nor(
      redeclare package MediumA = MediumA,
      redeclare package MediumW = MediumW,
      m_flow_nominal=mNor_flow_nominal,
      VRoo=VRooNor,
      allowFlowReversal=allowFlowReversal) "North-facing thermal zone"
      annotation (Placement(transformation(extent={{902,22},{942,62}})));

    Buildings.Fluid.FixedResistances.Junction splRetRoo1(
      redeclare package Medium = MediumA,
      m_flow_nominal={m_flow_nominal,m_flow_nominal - mCor_flow_nominal,
          mCor_flow_nominal},
      from_dp=false,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering)
      "Splitter for room return"
      annotation (Placement(transformation(extent={{630,10},{650,-10}})));
    Buildings.Fluid.FixedResistances.Junction splRetSou(
      redeclare package Medium = MediumA,
      m_flow_nominal={mSou_flow_nominal + mNor_flow_nominal + mNor_flow_nominal,
          mSou_flow_nominal,mNor_flow_nominal},
      from_dp=false,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering)
      "Splitter for room return"
      annotation (Placement(transformation(extent={{812,10},{832,-10}})));

    Buildings.Fluid.FixedResistances.Junction splSupRoo1(
      redeclare package Medium = MediumA,
      m_flow_nominal={m_flow_nominal,m_flow_nominal - mCor_flow_nominal,
          mCor_flow_nominal},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving)
      "Splitter for room supply"
      annotation (Placement(transformation(extent={{570,-30},{590,-50}})));
    Buildings.Fluid.FixedResistances.Junction splSupSou(
      redeclare package Medium = MediumA,
      m_flow_nominal={mSou_flow_nominal + mNor_flow_nominal,mNor_flow_nominal,mSou_flow_nominal},
      from_dp=true,
      linearized=true,
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      dp_nominal(each displayUnit="Pa") = {0,0,0},
      portFlowDirection_1=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Entering,
      portFlowDirection_2=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving,
      portFlowDirection_3=if allowFlowReversal then Modelica.Fluid.Types.PortFlowDirection.Bidirectional
           else Modelica.Fluid.Types.PortFlowDirection.Leaving)
      "Splitter for room supply"
      annotation (Placement(transformation(extent={{750,-30},{770,-50}})));

    Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
          Modelica.Utilities.Files.loadResource(
          "modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"))
      annotation (Placement(transformation(extent={{-360,170},{-340,190}})));
    Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather Data Bus"
      annotation (Placement(transformation(extent={{-330,170},{-310,190}}),
          iconTransformation(extent={{-360,170},{-340,190}})));

    Modelica.Blocks.Routing.DeMultiplex3 TRooAir(u(each unit="K", each
          displayUnit="degC")) "Demultiplex for room air temperature"
      annotation (Placement(transformation(extent={{490,160},{510,180}})));

    Buildings.Fluid.Sensors.TemperatureTwoPort TSupCor(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mCor_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air temperature"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={580,92})));
    Buildings.Fluid.Sensors.TemperatureTwoPort TSupSou(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mSou_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air temperature"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={760,92})));

    Buildings.Fluid.Sensors.TemperatureTwoPort TSupNor(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mNor_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air temperature"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={910,90})));
    Buildings.Fluid.Sensors.VolumeFlowRate VSupCor_flow(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mCor_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air flow rate"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={580,130})));
    Buildings.Fluid.Sensors.VolumeFlowRate VSupSou_flow(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mSou_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air flow rate"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={760,130})));
    Buildings.Fluid.Sensors.VolumeFlowRate VSupNor_flow(
      redeclare package Medium = MediumA,
      initType=Modelica.Blocks.Types.Init.InitialState,
      m_flow_nominal=mNor_flow_nominal,
      allowFlowReversal=allowFlowReversal) "Discharge air flow rate"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={912,156})));
    FLEXLAB.BaseClasses.MixingBox eco(
      redeclare package Medium = MediumA,
      mOut_flow_nominal=m_flow_nominal,
      dpOut_nominal=10,
      mRec_flow_nominal=m_flow_nominal,
      dpRec_nominal=10,
      mExh_flow_nominal=m_flow_nominal,
      dpExh_nominal=10,
      from_dp=false) "Economizer" annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-10,-46})));

    Results res(
      final A=ATot,
      PFan=fanSup.P + 0,
      PHea=heaCoi.Q2_flow + cor.terHea.Q1_flow + nor.terHea.Q1_flow + sou.terHea.Q1_flow,
      PCooSen=cooCoi.QSen2_flow,
      PCooLat=cooCoi.QLat2_flow) "Results of the simulation";
    /*fanRet*/

  protected
    model Results "Model to store the results of the simulation"
      parameter Modelica.SIunits.Area A "Floor area";
      input Modelica.SIunits.Power PFan "Fan energy";
      input Modelica.SIunits.Power PHea "Heating energy";
      input Modelica.SIunits.Power PCooSen "Sensible cooling energy";
      input Modelica.SIunits.Power PCooLat "Latent cooling energy";

      Real EFan(
        unit="J/m2",
        start=0,
        nominal=1E5,
        fixed=true) "Fan energy";
      Real EHea(
        unit="J/m2",
        start=0,
        nominal=1E5,
        fixed=true) "Heating energy";
      Real ECooSen(
        unit="J/m2",
        start=0,
        nominal=1E5,
        fixed=true) "Sensible cooling energy";
      Real ECooLat(
        unit="J/m2",
        start=0,
        nominal=1E5,
        fixed=true) "Latent cooling energy";
      Real ECoo(unit="J/m2") "Total cooling energy";
    equation

      A*der(EFan) = PFan;
      A*der(EHea) = PHea;
      A*der(ECooSen) = PCooSen;
      A*der(ECooLat) = PCooLat;
      ECoo = ECooSen + ECooLat;

    end Results;
  public
    Buildings.Controls.OBC.CDL.Continuous.Gain gaiHeaCoi(k=m_flow_nominal*1000*40
          /4200/10) "Gain for heating coil mass flow rate"
      annotation (Placement(transformation(extent={{100,-220},{120,-200}})));
    Buildings.Controls.OBC.CDL.Continuous.Gain gaiCooCoi(k=m_flow_nominal*1000*15
          /4200/10) "Gain for cooling coil mass flow rate"
      annotation (Placement(transformation(extent={{100,-258},{120,-238}})));
    Buildings.Controls.OBC.CDL.Logical.OnOffController freSta(bandwidth=1)
      "Freeze stat for heating coil"
      annotation (Placement(transformation(extent={{0,-100},{20,-80}})));
    Buildings.Controls.OBC.CDL.Continuous.Sources.Constant freStaTSetPoi(k=273.15
           + 3) "Freeze stat set point for heating coil"
      annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
  equation
    connect(fanSup.port_b, dpDisSupFan.port_a) annotation (Line(
        points={{320,-40},{320,-10}},
        color={0,0,0},
        smooth=Smooth.None,
        pattern=LinePattern.Dot));
    connect(TSup.port_a, fanSup.port_b) annotation (Line(
        points={{330,-40},{320,-40}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(amb.ports[1], VOut1.port_a) annotation (Line(
        points={{-114,-42.0667},{-94,-42.0667},{-94,-33},{-72,-33}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splRetRoo1.port_1, dpRetDuc.port_a) annotation (Line(
        points={{630,0},{430,0},{430,140},{400,140}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));

    connect(splRetSou.port_1, splRetRoo1.port_2) annotation (Line(
        points={{812,0},{650,0}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splSupRoo1.port_3, cor.port_a) annotation (Line(
        points={{580,-30},{580,22}},
        color={0,127,255},
        thickness=0.5));
    connect(splSupRoo1.port_2, splSupSou.port_1) annotation (Line(
        points={{590,-40},{750,-40}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(splSupSou.port_3, sou.port_a) annotation (Line(
        points={{760,-30},{760,20}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));

    connect(cooCoi.port_b1, sinCoo.ports[1]) annotation (Line(
        points={{190,-52},{180,-52},{180,-110}},
        color={28,108,200},
        thickness=0.5));
    connect(weaDat.weaBus, weaBus) annotation (Line(
        points={{-340,180},{-320,180}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(weaBus.TDryBul, TOut.u) annotation (Line(
        points={{-320,180},{-302,180}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(amb.weaBus, weaBus) annotation (Line(
        points={{-136,-44.78},{-320,-44.78},{-320,180}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(splRetRoo1.port_3, flo.portsCor[2]) annotation (Line(
        points={{640,10},{640,364},{874,364},{874,472},{898,472},{898,502.308},
            {714.052,502.308}},
        color={0,127,255},
        thickness=0.5));
    connect(splRetSou.port_3, flo.portsSou[2]) annotation (Line(
        points={{822,10},{822,350},{900,350},{900,441.385},{714.052,441.385}},
        color={0,127,255},
        thickness=0.5));

    connect(weaBus, flo.weaBus) annotation (Line(
        points={{-320,180},{-320,630.923},{786.783,630.923}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(flo.TRooAir, min.u) annotation (Line(
        points={{915.13,504},{1066.7,504},{1066.7,450},{1132,450}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(flo.TRooAir, ave.u) annotation (Line(
        points={{915.13,504},{1068,504},{1068,420},{1132,420}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));

    connect(cooCoi.port_b2, fanSup.port_a) annotation (Line(
        points={{210,-40},{300,-40}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(cor.port_b, TSupCor.port_a) annotation (Line(
        points={{580,62},{580,82}},
        color={0,127,255},
        thickness=0.5));

    connect(sou.port_b, TSupSou.port_a) annotation (Line(
        points={{760,60},{760,82}},
        color={0,127,255},
        thickness=0.5));

    connect(nor.port_b, TSupNor.port_a) annotation (Line(
        points={{912,62},{912,80},{910,80}},
        color={0,127,255},
        thickness=0.5));

    connect(TSupCor.port_b, VSupCor_flow.port_a) annotation (Line(
        points={{580,102},{580,120}},
        color={0,127,255},
        thickness=0.5));
    connect(TSupSou.port_b, VSupSou_flow.port_a) annotation (Line(
        points={{760,102},{760,120}},
        color={0,127,255},
        thickness=0.5));

    connect(TSupNor.port_b, VSupNor_flow.port_a) annotation (Line(
        points={{910,100},{910,146},{912,146}},
        color={0,127,255},
        thickness=0.5));

    connect(VSupCor_flow.port_b, flo.portsCor[1]) annotation (Line(
        points={{580,140},{580,372},{866,372},{866,480},{699.791,480},{699.791,
            502.308}},
        color={0,127,255},
        thickness=0.5));

    connect(VSupSou_flow.port_b, flo.portsSou[1]) annotation (Line(
        points={{760,140},{760,356},{699.791,356},{699.791,441.385}},
        color={0,127,255},
        thickness=0.5));

    connect(VSupNor_flow.port_b, flo.portsNor[1]) annotation (Line(
        points={{912,166},{912,498},{699.791,498},{699.791,559.846}},
        color={0,127,255},
        thickness=0.5));

    connect(VOut1.port_b, eco.port_Out) annotation (Line(
        points={{-50,-33},{-42,-33},{-42,-40},{-20,-40}},
        color={0,127,255},
        thickness=0.5));
    connect(eco.port_Sup, TMix.port_a) annotation (Line(
        points={{0,-40},{30,-40}},
        color={0,127,255},
        thickness=0.5));
    connect(eco.port_Exh, amb.ports[2]) annotation (Line(
        points={{-20,-52},{-96,-52},{-96,-45},{-114,-45}},
        color={0,127,255},
        thickness=0.5));
    connect(eco.port_Ret, TRet.port_b) annotation (Line(
        points={{0,-52},{10,-52},{10,140},{90,140}},
        color={0,127,255},
        thickness=0.5));
    connect(senRetFlo.port_a, dpRetDuc.port_b)
      annotation (Line(points={{360,140},{380,140}}, color={0,127,255}));
    connect(TSup.port_b, senSupFlo.port_a)
      annotation (Line(points={{350,-40},{400,-40}}, color={0,127,255}));
    connect(senSupFlo.port_b, splSupRoo1.port_1)
      annotation (Line(points={{420,-40},{570,-40}}, color={0,127,255}));
    connect(cooCoi.port_a1, souCoo.ports[1]) annotation (Line(
        points={{210,-52},{230,-52},{230,-110}},
        color={28,108,200},
        thickness=0.5));
    connect(gaiHeaCoi.y, souHea.m_flow_in) annotation (Line(points={{122,-210},{124,
            -210},{124,-132}},     color={0,0,127}));
    connect(gaiCooCoi.y, souCoo.m_flow_in) annotation (Line(points={{122,-248},{222,
            -248},{222,-132}},     color={0,0,127}));
    connect(dpDisSupFan.port_b, amb.ports[3]) annotation (Line(
        points={{320,10},{320,14},{-88,14},{-88,-47.9333},{-114,-47.9333}},
        color={0,0,0},
        pattern=LinePattern.Dot));
    connect(senRetFlo.port_b, TRet.port_a) annotation (Line(points={{340,140},{
            226,140},{110,140}}, color={0,127,255}));
    connect(freStaTSetPoi.y, freSta.reference)
      annotation (Line(points={{-18,-90},{-10,-90},{-10,-84},{-2,-84}},
                                                    color={0,0,127}));
    connect(freSta.u, TMix.T) annotation (Line(points={{-2,-96},{-6,-96},{-6,-68},
            {20,-68},{20,-20},{40,-20},{40,-29}}, color={0,0,127}));
    connect(TMix.port_b, heaCoi.port_a2) annotation (Line(
        points={{50,-40},{98,-40}},
        color={0,127,255},
        thickness=0.5));
    connect(heaCoi.port_b2, cooCoi.port_a2) annotation (Line(
        points={{118,-40},{190,-40}},
        color={0,127,255},
        thickness=0.5));
    connect(souHea.ports[1], heaCoi.port_a1) annotation (Line(
        points={{132,-110},{132,-52},{118,-52}},
        color={28,108,200},
        thickness=0.5));
    connect(heaCoi.port_b1, sinHea.ports[1]) annotation (Line(
        points={{98,-52},{80,-52},{80,-112}},
        color={28,108,200},
        thickness=0.5));
    connect(splSupSou.port_2, nor.port_a) annotation (Line(
        points={{770,-40},{912,-40},{912,22}},
        color={0,127,255},
        thickness=0.5));
    connect(splRetSou.port_2, flo.portsNor[2]) annotation (Line(
        points={{832,0},{994,0},{994,559.846},{714.052,559.846}},
        color={0,127,255},
        thickness=0.5));
    connect(TRooAir.u, flo.TRooAir) annotation (Line(points={{488,170},{344,170},
            {344,210},{1198,210},{1198,504},{915.13,504}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-380,
              -400},{1420,660}})), Documentation(info="<html>
<p>
This model consist of an HVAC system, a building envelope model and a model
for air flow through building leakage and through open doors.
</p>
<p>
The HVAC system is a variable air volume (VAV) flow system with economizer
and a heating and cooling coil in the air handler unit. There is also a
reheat coil and an air damper in each of the five zone inlet branches.
The figure below shows the schematic diagram of the HVAC system
</p>
<p align=\"center\">
<img alt=\"image\" src=\"modelica://Buildings/Resources/Images/Examples/VAVReheat/vavSchematics.png\" border=\"1\"/>
</p>
<p>
Most of the HVAC control in this model is open loop.
Two models that extend this model, namely
<a href=\"modelica://Buildings.Examples.VAVReheat.ASHRAE2006\">
Buildings.Examples.VAVReheat.ASHRAE2006</a>
and
<a href=\"modelica://Buildings.Examples.VAVReheat.Guideline36\">
Buildings.Examples.VAVReheat.Guideline36</a>
add closed loop control. See these models for a description of
the control sequence.
</p>
<p>
To model the heat transfer through the building envelope,
a model of five interconnected rooms is used.
The five room model is representative of one floor of the
new construction medium office building for Chicago, IL,
as described in the set of DOE Commercial Building Benchmarks
(Deru et al, 2009). There are four perimeter zones and one core zone.
The envelope thermal properties meet ASHRAE Standard 90.1-2004.
The thermal room model computes transient heat conduction through
walls, floors and ceilings and long-wave radiative heat exchange between
surfaces. The convective heat transfer coefficient is computed based
on the temperature difference between the surface and the room air.
There is also a layer-by-layer short-wave radiation,
long-wave radiation, convection and conduction heat transfer model for the
windows. The model is similar to the
Window 5 model and described in TARCOG 2006.
</p>
<p>
Each thermal zone can have air flow from the HVAC system, through leakages of the building envelope (except for the core zone) and through bi-directional air exchange through open doors that connect adjacent zones. The bi-directional air exchange is modeled based on the differences in static pressure between adjacent rooms at a reference height plus the difference in static pressure across the door height as a function of the difference in air density.
Infiltration is a function of the
flow imbalance of the HVAC system.
</p>
<h4>References</h4>
<p>
Deru M., K. Field, D. Studer, K. Benne, B. Griffith, P. Torcellini,
 M. Halverson, D. Winiarski, B. Liu, M. Rosenberg, J. Huang, M. Yazdanian, and D. Crawley.
<i>DOE commercial building research benchmarks for commercial buildings</i>.
Technical report, U.S. Department of Energy, Energy Efficiency and
Renewable Energy, Office of Building Technologies, Washington, DC, 2009.
</p>
<p>
TARCOG 2006: Carli, Inc., TARCOG: Mathematical models for calculation
of thermal performance of glazing systems with our without
shading devices, Technical Report, Oct. 17, 2006.
</p>
</html>",   revisions="<html>
<ul>
<li>
July 10, 2020, by Antoine Gautier:<br/>
Added design parameters for outdoor air flow.<br/>
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/2019\">#2019</a>
</li>
<li>
November 25, 2019, by Milica Grahovac:<br/>
Declared the floor model as replaceable.
</li>
<li>
September 26, 2017, by Michael Wetter:<br/>
Separated physical model from control to facilitate implementation of alternate control
sequences.
</li>
<li>
May 19, 2016, by Michael Wetter:<br/>
Changed chilled water supply temperature to <i>6&deg;C</i>.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/509\">#509</a>.
</li>
<li>
April 26, 2016, by Michael Wetter:<br/>
Changed controller for freeze protection as the old implementation closed
the outdoor air damper during summer.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/511\">#511</a>.
</li>
<li>
January 22, 2016, by Michael Wetter:<br/>
Corrected type declaration of pressure difference.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/404\">#404</a>.
</li>
<li>
September 24, 2015 by Michael Wetter:<br/>
Set default temperature for medium to avoid conflicting
start values for alias variables of the temperature
of the building and the ambient air.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/426\">issue 426</a>.
</li>
</ul>
</html>"));
  end PartialOpenLoop_3zones;

  model Floor_3zones "Model of a floor of the building with 3 zones"
    extends FLEXLAB.BaseClasses.PartialFloor_3zones(
      final VRooCor=cor.AFlo*hRoo,
      final VRooSou=sou.AFlo*hRoo,
      final VRooNor=nor.AFlo*hRoo);

    parameter Modelica.SIunits.Area AFloCor = 2698/hRoo "Core zone floor area";
    parameter Modelica.SIunits.Area AFloSou = 568.77/hRoo "South zone floor area";
    parameter Modelica.SIunits.Area AFloNor = 568.77/hRoo "North zone floor area";

    parameter Buildings.HeatTransfer.Types.InteriorConvection intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature
      "Convective heat transfer model for room-facing surfaces of opaque constructions";
    parameter Modelica.SIunits.Angle lat "Latitude";
    parameter Real winWalRat(
      min=0.01,
      max=0.99) = 0.33 "Window to wall ratio for exterior walls";
    parameter Modelica.SIunits.Length hWin = 1.5 "Height of windows";
    parameter Buildings.HeatTransfer.Data.Solids.Plywood matFur(x=0.15, nStaRef
        =5) "Material for furniture"
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
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conExtWal(final
        nLay=3, material={matWoo,matIns,matGyp}) "Exterior construction"
      annotation (Placement(transformation(extent={{280,460},{300,480}})));
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conIntWal(final
        nLay=1, material={matGyp2}) "Interior wall construction"
      annotation (Placement(transformation(extent={{320,460},{340,480}})));
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conFlo(final
        nLay=1, material={matCon}) "Floor construction (opa_a is carpet)"
      annotation (Placement(transformation(extent={{280,420},{300,440}})));
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conFur(final
        nLay=1, material={matFur})
      "Construction for internal mass of furniture"
      annotation (Placement(transformation(extent={{320,420},{340,440}})));
    parameter Buildings.HeatTransfer.Data.Solids.Plywood matCarTra(
      k=0.11,
      d=544,
      nStaRef=1,
      x=0.215/0.11) "Wood for floor"
      annotation (Placement(transformation(extent={{102,460},{122,480}})));
    parameter Buildings.HeatTransfer.Data.GlazingSystems.DoubleClearAir13Clear glaSys(
      UFra=2,
      shade=Buildings.HeatTransfer.Data.Shades.Gray(),
      haveInteriorShade=false,
      haveExteriorShade=false) "Data record for the glazing system"
      annotation (Placement(transformation(extent={{240,460},{260,480}})));

    constant Modelica.SIunits.Height hRoo=2.74 "Room height";

    parameter Boolean sampleModel = false
      "Set to true to time-sample the model, which can give shorter simulation time if there is already time sampling in the system model"
      annotation (
        Evaluate=true,
        Dialog(tab="Experimental (may be changed in future releases)"));

    Buildings.ThermalZones.Detailed.MixedAir sou(
      redeclare package Medium = Medium,
      lat=lat,
      AFlo=AFloSou,
      hRoo=hRoo,
      nConExt=0,
      nConExtWin=1,
      datConExtWin(
        layers={conExtWal},
        A={49.91*hRoo},
        glaSys={glaSys},
        wWin={winWalRat/hWin*49.91*hRoo},
        each hWin=hWin,
        fFra={0.1},
        til={Buildings.Types.Tilt.Wall},
        azi={Buildings.Types.Azimuth.S}),
      nConPar=2,
      datConPar(
        layers={conFlo,conFur},
        A={AFloSou,414.68},
        til={Buildings.Types.Tilt.Floor,Buildings.Types.Tilt.Wall}),
      nConBou=3,
      datConBou(
        layers={conIntWal,conIntWal,conIntWal},
        A={6.47,40.76,6.47}*hRoo,
        til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall}),
      nSurBou=0,
      nPorts=5,
      intConMod=intConMod,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      final sampleModel=sampleModel) "South zone"
      annotation (Placement(transformation(extent={{144,-44},{184,-4}})));

    Buildings.ThermalZones.Detailed.MixedAir nor(
      redeclare package Medium = Medium,
      lat=lat,
      AFlo=AFloNor,
      hRoo=hRoo,
      nConExt=0,
      nConExtWin=1,
      datConExtWin(
        layers={conExtWal},
        A={49.91*hRoo},
        glaSys={glaSys},
        wWin={winWalRat/hWin*49.91*hRoo},
        each hWin=hWin,
        fFra={0.1},
        til={Buildings.Types.Tilt.Wall},
        azi={Buildings.Types.Azimuth.N}),
      nConPar=2,
      datConPar(
        layers={conFlo,conFur},
        A={AFloNor,414.68},
        til={Buildings.Types.Tilt.Floor,Buildings.Types.Tilt.Wall}),
      nConBou=3,
      datConBou(
        layers={conIntWal,conIntWal,conIntWal},
        A={6.47,40.76,6.47}*hRoo,
        til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall}),
      nSurBou=0,
      nPorts=5,
      intConMod=intConMod,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      final sampleModel=sampleModel) "North zone"
      annotation (Placement(transformation(extent={{144,116},{184,156}})));

    Buildings.ThermalZones.Detailed.MixedAir cor(
      redeclare package Medium = Medium,
      lat=lat,
      AFlo=AFloCor,
      hRoo=hRoo,
      nConExt=0,
      nConExtWin=0,
      nConPar=2,
      datConPar(
        layers={conFlo,conFur},
        A={AFloCor,1967.01},
        til={Buildings.Types.Tilt.Floor,Buildings.Types.Tilt.Wall}),
      nConBou=0,
      nSurBou=4,
      surBou(
        A={40.76,24.13,40.76,24.13}*hRoo,
        each absIR=0.9,
        each absSol=0.9,
        til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall}),
      nPorts=12,
      intConMod=intConMod,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
      final sampleModel=sampleModel) "Core zone"
      annotation (Placement(transformation(extent={{144,36},{184,76}})));

    Modelica.Blocks.Math.MatrixGain gai(K=20*[0.4; 0.4; 0.2])
      "Matrix gain to split up heat gain in radiant, convective and latent gain"
      annotation (Placement(transformation(extent={{-100,100},{-80,120}})));
    Modelica.Blocks.Sources.CombiTimeTable intGaiFra(
      table=[0,0.05; 8,0.05; 9,0.9; 12,0.9; 12,0.8; 13,0.8; 13,1; 17,1; 19,0.1;
          24,0.05],
      timeScale=3600,
      extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
      "Fraction of internal heat gain"
      annotation (Placement(transformation(extent={{-140,100},{-120,120}})));
    Modelica.Blocks.Math.Gain gaiIntNor[3](each k=kIntNor)
      "Gain for internal heat gain amplification for north zone"
      annotation (Placement(transformation(extent={{-60,134},{-40,154}})));
    Modelica.Blocks.Math.Gain gaiIntSou[3](each k=2 - kIntNor)
      "Gain to change the internal heat gain for south"
      annotation (Placement(transformation(extent={{-60,-38},{-40,-18}})));
    Modelica.Blocks.Sources.Constant uSha(k=0)
      "Control signal for the shading device"
      annotation (Placement(transformation(extent={{-100,170},{-80,190}})));
    Modelica.Blocks.Routing.Replicator replicator(nout=1)
      annotation (Placement(transformation(extent={{-60,170},{-40,190}})));
  equation

    connect(sou.surf_conBou[2], cor.surf_surBou[1]) annotation (Line(
        points={{170,-40},{170,-54},{200,-54},{200,20},{160.2,20},{160.2,41.25}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(nor.surf_conBou[2], cor.surf_surBou[3]) annotation (Line(
        points={{170,120},{170,100},{200,100},{200,26},{160.2,26},{160.2,42.25}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(replicator.y, nor.uSha) annotation (Line(
        points={{-39,180},{130,180},{130,154},{142.4,154}},
        color={0,0,127},
        pattern=LinePattern.Dash,
        smooth=Smooth.None));

    connect(replicator.y, sou.uSha) annotation (Line(
        points={{-39,180},{130,180},{130,-6},{142.4,-6}},
        color={0,0,127},
        pattern=LinePattern.Dash,
        smooth=Smooth.None));
    connect(replicator.y, cor.uSha) annotation (Line(
        points={{-39,180},{130,180},{130,74},{142.4,74}},
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
        textString="%second",
        index=1,
        extent={{6,3},{6,3}}));

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
    connect(multiplex3_1.y, TRooAir) annotation (Line(
        points={{365,284},{372,284},{372,160},{390,160}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(temAirSou.T,multiplex3_1.u1[1])  annotation (Line(
        points={{310,350},{328,350},{328,291},{342,291}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));

    connect(temAirNor.T,multiplex3_1.u2[1])  annotation (Line(
        points={{306,284},{316,284},{316,271},{326,271},{326,284},{342,284}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));

    connect(temAirCor.T,multiplex3_1.u3[1])  annotation (Line(
        points={{300,222},{322,222},{322,228},{332,228},{332,277},{342,277}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(sou.heaPorAir, temAirSou.port) annotation (Line(
        points={{163,-24},{224,-24},{224,100},{264,100},{264,350},{290,350}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(nor.heaPorAir, temAirNor.port) annotation (Line(
        points={{163,136},{164,136},{164,284},{286,284}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(cor.heaPorAir, temAirCor.port) annotation (Line(
        points={{163,56},{162,56},{162,222},{280,222}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(sou.ports[1], portsSou[1]) annotation (Line(
        points={{149,-37.2},{114,-37.2},{114,-36},{80,-36}},
        color={0,127,255},
        thickness=0.5));
    connect(sou.ports[2], portsSou[2]) annotation (Line(
        points={{149,-35.6},{124,-35.6},{124,-36},{100,-36}},
        color={0,127,255},
        thickness=0.5));

    connect(nor.ports[1], portsNor[1]) annotation (Line(
        points={{149,122.8},{114,122.8},{114,124},{80,124}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(nor.ports[2], portsNor[2]) annotation (Line(
        points={{149,124.4},{124,124.4},{124,124},{100,124}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(cor.ports[1], portsCor[1]) annotation (Line(
        points={{149,42.3333},{114,42.3333},{114,46},{80,46}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(cor.ports[2], portsCor[2]) annotation (Line(
        points={{149,43},{124,43},{124,46},{100,46}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(leaSou.port_b, sou.ports[3]) annotation (Line(
        points={{-22,400},{-2,400},{-2,-72},{134,-72},{134,-34},{149,-34}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));

    connect(leaNor.port_b, nor.ports[3]) annotation (Line(
        points={{-20,308},{138,308},{138,126},{149,126}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));

    connect(opeSouCor.port_b1, cor.ports[3]) annotation (Line(
        points={{104,16},{116,16},{116,43.6667},{149,43.6667}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeSouCor.port_a2, cor.ports[4]) annotation (Line(
        points={{104,4},{118,4},{118,44.3333},{149,44.3333}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeSouCor.port_a1, sou.ports[4]) annotation (Line(
        points={{84,16},{74,16},{74,-20},{134,-20},{134,-32.4},{149,-32.4}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeSouCor.port_b2, sou.ports[5]) annotation (Line(
        points={{84,4},{72,4},{72,-22},{132,-22},{132,-30.8},{149,-30.8}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));

    connect(opeNorCor.port_b1, nor.ports[4]) annotation (Line(
        points={{100,90},{124,90},{124,127.6},{149,127.6}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeNorCor.port_a2, nor.ports[5]) annotation (Line(
        points={{100,78},{126,78},{126,129.2},{149,129.2}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(opeNorCor.port_a1, cor.ports[7]) annotation (Line(
        points={{80,90},{76,90},{76,60},{142,60},{142,46.3333},{149,46.3333}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(opeNorCor.port_b2, cor.ports[8]) annotation (Line(
        points={{80,78},{76,78},{76,60},{142,60},{142,47},{149,47}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));

    connect(cor.ports[11], senRelPre.port_a) annotation (Line(
        points={{149,49},{112,49},{112,250},{60,250}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(senRelPre.p_rel, p_rel) annotation (Line(
        points={{50,241},{50,220},{-170,220}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(gaiIntNor.y, nor.qGai_flow) annotation (Line(
        points={{-39,144},{142.4,144}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(gaiIntSou.y, sou.qGai_flow) annotation (Line(
        points={{-39,-28},{68,-28},{68,-16},{142.4,-16}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(gai.y,gaiIntSou. u) annotation (Line(
        points={{-79,110},{-68,110},{-68,-28},{-62,-28}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(gai.y,gaiIntNor. u) annotation (Line(
        points={{-79,110},{-68,110},{-68,144},{-62,144}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(intGaiFra.y,gai. u) annotation (Line(
        points={{-119,110},{-102,110}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(uSha.y,replicator. u) annotation (Line(
        points={{-79,180},{-62,180}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(cor.ports[12], leaCor.port_b) annotation (Line(
        points={{149,49.6667},{64,49.6667},{64,356},{-20,356}},
        color={0,127,255},
        thickness=0.5));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true,
          extent={{-160,-100},{380,500}},
          initialScale=0.1)),     Icon(coordinateSystem(
            preserveAspectRatio=true, extent={{-80,-80},{380,180}}), graphics={
          Rectangle(
            extent={{-80,-80},{380,180}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-64,168},{360,-60}},
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
            extent={{-62,6},{360,106}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-58,94},{358,18}},
            pattern=LinePattern.None,
            lineColor={117,148,176},
            fillColor={170,213,255},
            fillPattern=FillPattern.Sphere),
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
            fillPattern=FillPattern.Solid)}),
      Documentation(revisions="<html>
    <ul>
<li>
January 23, 2020, by Milica Grahovac:<br/>
Updated core zone geometry parameters related to
room heat and mass balance.
</li>
<li>
November 15, 2019, by Milica Grahovac:<br/>
Added extend from a partial floor model.
</li>
<li>
May 1, 2013, by Michael Wetter:<br/>
Declared the parameter record to be a parameter, as declaring its elements
to be parameters does not imply that the whole record has the variability of a parameter.
</li>
</ul>
</html>",   info="<html>
<p>
Model of a floor that consists
of five thermal zones that are representative of one floor of the
new construction medium office building for Chicago, IL,
as described in the set of DOE Commercial Building Benchmarks.
There are four perimeter zones and one core zone.
The envelope thermal properties meet ASHRAE Standard 90.1-2004.
</p>
</html>"));
  end Floor_3zones;

  partial model PartialFloor_3zones
    "Interface for a model of a floor of a building with 3 zones"

    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      "Medium model for air" annotation (choicesAllMatching=true);

    parameter Boolean use_windPressure=true
      "Set to true to enable wind pressure";

    parameter Real kIntNor(min=0, max=1) = 1
      "Gain factor to scale internal heat gain in north zone";

    parameter Modelica.SIunits.Volume VRooCor "Room volume corridor";
    parameter Modelica.SIunits.Volume VRooSou "Room volume south";
    parameter Modelica.SIunits.Volume VRooNor "Room volume north";

    Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsSou[2](
        redeclare package Medium = Medium) "Fluid inlets and outlets"
      annotation (Placement(transformation(extent={{70,-44},{110,-28}}),
          iconTransformation(extent={{78,-32},{118,-16}})));

    Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsNor[2](
        redeclare package Medium = Medium) "Fluid inlets and outlets"
      annotation (Placement(transformation(extent={{70,116},{110,132}}),
          iconTransformation(extent={{78,108},{118,124}})));

    Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsCor[2](
        redeclare package Medium = Medium) "Fluid inlets and outlets"
      annotation (Placement(transformation(extent={{70,38},{110,54}}),
          iconTransformation(extent={{78,40},{118,56}})));

    Modelica.Blocks.Interfaces.RealOutput TRooAir[3](
      each unit="K",
      each displayUnit="degC") "Room air temperatures"
      annotation (Placement(transformation(extent={{380,150},{400,170}}),
          iconTransformation(extent={{380,40},{400,60}})));

    Modelica.Blocks.Interfaces.RealOutput p_rel
      "Relative pressure signal of building static pressure" annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-170,220}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-90,50})));

    Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather bus"
      annotation (Placement(transformation(extent={{200,190},{220,210}})));

    FLEXLAB.BaseClasses.RoomLeakage leaSou(
      redeclare package Medium = Medium,
      VRoo=VRooSou,
      s=49.91/33.27,
      azi=Buildings.Types.Azimuth.S,
      final use_windPressure=use_windPressure)
      "Model for air infiltration through the envelope"
      annotation (Placement(transformation(extent={{-58,380},{-22,420}})));

    FLEXLAB.BaseClasses.RoomLeakage leaNor(
      redeclare package Medium = Medium,
      VRoo=VRooNor,
      s=49.91/33.27,
      azi=Buildings.Types.Azimuth.N,
      final use_windPressure=use_windPressure)
      "Model for air infiltration through the envelope"
      annotation (Placement(transformation(extent={{-56,288},{-20,328}})));

    FLEXLAB.BaseClasses.RoomLeakage leaCor(
      redeclare package Medium = Medium,
      VRoo=VRooCor,
      s=33.27/49.91,
      azi=Buildings.Types.Azimuth.W,
      final use_windPressure=use_windPressure)
      "Model for air infiltration through the envelope"
      annotation (Placement(transformation(extent={{-56,336},{-20,376}})));

    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirSou
      "Air temperature sensor"
      annotation (Placement(transformation(extent={{290,340},{310,360}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirNor
      "Air temperature sensor"
      annotation (Placement(transformation(extent={{286,274},{306,294}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirCor
      "Air temperature sensor"
      annotation (Placement(transformation(extent={{280,212},{300,232}})));

    Buildings.Airflow.Multizone.DoorOpen opeSouCor(redeclare package Medium =
          Medium, wOpe=10) "Opening between perimeter1 and core"
      annotation (Placement(transformation(extent={{84,0},{104,20}})));
    Buildings.Airflow.Multizone.DoorOpen opeNorCor(redeclare package Medium =
          Medium, wOpe=10) "Opening between perimeter3 and core"
      annotation (Placement(transformation(extent={{80,74},{100,94}})));
    Buildings.Fluid.Sensors.RelativePressure senRelPre(redeclare package Medium
        =                                                                         Medium)
      "Building pressure measurement"
      annotation (Placement(transformation(extent={{60,240},{40,260}})));
    Buildings.Fluid.Sources.Outside out(nPorts=1, redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{-58,240},{-38,260}})));

    Modelica.Blocks.Routing.Multiplex3 multiplex3_1
      annotation (Placement(transformation(extent={{344,274},{364,294}})));
  equation
    connect(weaBus, leaSou.weaBus) annotation (Line(
        points={{210,200},{-80,200},{-80,400},{-58,400}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(weaBus, leaNor.weaBus) annotation (Line(
        points={{210,200},{-80,200},{-80,308},{-56,308}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(weaBus,leaCor. weaBus) annotation (Line(
        points={{210,200},{-80,200},{-80,356},{-56,356}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(out.weaBus, weaBus) annotation (Line(
        points={{-58,250.2},{-70,250.2},{-70,250},{-80,250},{-80,200},{210,200}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(senRelPre.p_rel, p_rel) annotation (Line(
        points={{50,241},{50,220},{-170,220}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dash));
    connect(out.ports[1], senRelPre.port_b) annotation (Line(
        points={{-38,250},{40,250}},
        color={0,127,255},
        smooth=Smooth.None,
        thickness=0.5));
    connect(temAirSou.T,multiplex3_1. u1[1]) annotation (Line(points={{310,350},{
            328,350},{328,291},{342,291}}, color={0,0,127}));
    connect(temAirNor.T,multiplex3_1. u2[1])
      annotation (Line(points={{306,284},{324,284},{324,284},{342,284}},
                                                     color={0,0,127}));
    connect(temAirCor.T,multiplex3_1. u3[1]) annotation (Line(points={{300,222},{
            300,253},{342,253},{342,277}}, color={0,0,127}));
    connect(multiplex3_1.y, TRooAir) annotation (Line(points={{365,284},{376,284},
            {376,160},{390,160}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true,
          extent={{-160,-100},{380,500}},
          initialScale=0.1)),   Icon(coordinateSystem(extent={{-80,-80},{380,160}},
          preserveAspectRatio=true),
           graphics={Rectangle(
            extent={{-80,160},{380,-80}},
            lineColor={95,95,95},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-118,94},{-96,60}},
            lineColor={0,0,255},
            textString="dP")}),
      Documentation(info="<html>
<p>
This is a partial model for one floor of the DOE reference office building.
</p>
</html>",
  revisions="<html>
<ul>
<li>
January 25, 2021, by Michael Wetter:<br/>
Replaced door model with the new model <a href=\"modelica://Buildings.Airflow.Multizone.DoorOpen\">
Buildings.Airflow.Multizone.DoorOpen</a>.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1353\">IBPSA, #1353</a>.
</li>
<li>
November 15, 2019, by Milica Grahovac:<br/>
First implementation.
</li>
</ul>
</html>"));
  end PartialFloor_3zones;
annotation (preferredView="info", Documentation(info="<html>
<p>
This package contains base classes that are used to construct the models in
<a href=\"modelica://Buildings.Examples.VAVReheat\">Buildings.Examples.VAVReheat</a>.
</p>
</html>"));
end BaseClasses;
