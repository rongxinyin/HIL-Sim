within hil_flexlab_model.BaseClasses;
partial model partialInterface "Interface for examples"
  replaceable package MediumA = Buildings.Media.Air "Medium model for air"
      annotation (choicesAllMatching = true);
  replaceable package MediumW = Buildings.Media.Water "Medium model for water"
      annotation (choicesAllMatching = true);
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=casDat.weaDatImport)
    annotation (Placement(transformation(extent={{-120,80},{-100,100}})));
  Buildings.BoundaryConditions.WeatherData.Bus
                                     weaBus "Weather data bus"
    annotation (Placement(transformation(extent={{-98,80},{-78,100}})));
  Modelica.Blocks.Sources.CombiTimeTable TSetRooHea(table=[0,16 + 273.15; 8*
        3600,16 + 273.15; 9*3600,21 + 273.15; 22*3600,21 + 273.15; 23*3600,16
         + 273.15; 24*3600,16 + 273.15],
                              extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "Heating setpoint for room temperature"
    annotation (Placement(transformation(extent={{-120,0},{-100,20}})));
  Modelica.Blocks.Sources.CombiTimeTable TSetRooCoo(table=[0,27 + 273.15; 8*
        3600,27 + 273.15; 9*3600,24 + 273.15; 22*3600,24 + 273.15; 23*3600,27
         + 273.15; 24*3600,27 + 273.15],
                              extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "Cooling setpoint for room temperature"
    annotation (Placement(transformation(extent={{-120,-30},{-100,-10}})));
  Modelica.Blocks.Interfaces.RealOutput PEle_HVAC
    "Electrical power of HVAC system"
    annotation (Placement(transformation(extent={{100,90},{120,110}})));
  replaceable hil_flexlab_model.ThermalZones.RoomMultiFluid roo(
    redeclare package MediumA = MediumA,
    occ_density=casDat.occ_density,
    mAir_flow_nominal=casDat.mAir_flow_nominal,
    lat=weaDat.lat,
    AFlo=casDat.AFlo,
    nPorts=2) annotation (Placement(transformation(extent={{26,-22},{66,18}})));
  Buildings.Electrical.AC.OnePhase.Sources.PVSimpleOriented pv(A=roo.roo.AFlo,
    til=0,
    lat=weaDat.lat,
    azi=0,
    V_nominal=110)
           "PV panels"
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  Buildings.Electrical.AC.OnePhase.Sources.FixedVoltage fixVol(f=60, V=120)
    "Fixed voltage source"
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Modelica.Blocks.Math.MultiSum totPowHVAC
    annotation (Placement(transformation(extent={{80,94},{92,106}})));
  Modelica.Blocks.Math.Gain gaiPV(k=-1) "PV consumption gain" annotation (
      Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={64,72})));
  replaceable hil_flexlab_model.Data.PSP_4B_Med casDat(minOAFlo=15/2118.88*casDat.occ_density*1.2*
        roo.roo.AFlo) "Case study data"
    annotation (Placement(transformation(extent={{-180,82},{-160,102}})));
  hil_flexlab_model.BaseClasses.Controls.RTU con(
    mAir_flow_nominal=casDat.mAir_flow_nominal,
    mAir_flow_minOA=casDat.minOAFlo,
    mAir_flow_hea=casDat.mAir_flow_nominal,
    mAir_flow_coo=casDat.mAir_flow_nominal)
    annotation (Placement(transformation(extent={{-80,-20},{-60,16}})));
  hil_flexlab_model.BaseClasses.Infiltration inf(
    redeclare package Medium = MediumA,
    ACH=casDat.ACH_infiltration,
    V=99*4) "Infiltration model" annotation (Placement(transformation(extent={{100,-60},{80,-40}})));
  Modelica.Blocks.Interfaces.RealOutput PEle
    "Electrical power of total building"
    annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Blocks.Math.MultiSum totPow(nu=2)
    annotation (Placement(transformation(extent={{80,74},{92,86}})));
  Modelica.Blocks.Interfaces.RealOutput PGas "Gas power of total building"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
equation
  connect(weaDat.weaBus,weaBus)  annotation (Line(
      points={{-100,90},{-88,90}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(weaBus,roo. weaBus) annotation (Line(
      points={{-88,90},{-86,90},{-86,28},{35,28},{35,16}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(weaBus, pv.weaBus) annotation (Line(
      points={{-88,90},{50,90},{50,59}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(fixVol.terminal, pv.terminal)
    annotation (Line(points={{20,50},{40,50}}, color={0,120,120}));
  connect(pv.P,gaiPV. u)
    annotation (Line(points={{61,57},{64,57},{64,67.2}}, color={0,0,127}));
  connect(totPowHVAC.y, PEle_HVAC)
    annotation (Line(points={{93.02,100},{110,100}}, color={0,0,127}));
  connect(roo.occ,con. occSta) annotation (Line(points={{67,10},{80,10},{80,20},
          {-90,20},{-90,14.2},{-82,14.2}},
                                       color={255,0,255}));
  connect(roo.TRooAir,con. TRoo) annotation (Line(points={{67,-2},{82,-2},{82,
          18},{-88,18},{-88,-0.527273},{-82,-0.527273}},
                                             color={0,0,127}));
  connect(con.TSetRooHea, TSetRooHea.y[1]) annotation (Line(points={{-82,
          9.29091},{-96,9.29091},{-96,10},{-99,10}},
                                     color={0,0,127}));
  connect(con.TSetRooCoo, TSetRooCoo.y[1]) annotation (Line(points={{-82,
          4.38182},{-96,4.38182},{-96,-20},{-99,-20}},
                                       color={0,0,127}));
  connect(inf.weaBus, pv.weaBus) annotation (Line(
      points={{99,-41},{99,-6},{100,-6},{100,28},{-86,28},{-86,90},{50,90},{50,
          59}},
      color={255,204,51},
      thickness=0.5));
  connect(totPowHVAC.y, totPow.u[1]) annotation (Line(points={{93.02,100},{96,
          100},{96,90},{78,90},{78,82.1},{80,82.1}}, color={0,0,127}));
  connect(roo.PIntLoa, totPow.u[2]) annotation (Line(points={{67,4},{84,4},{84,
          48},{78,48},{78,77.9},{80,77.9}}, color={0,0,127}));
  connect(totPow.y, PEle)
    annotation (Line(points={{93.02,80},{110,80}}, color={0,0,127}));
  connect(inf.port_b, roo.ports[1]) annotation (Line(points={{80,-46},{20,-46},
          {20,-6.6},{26,-6.6}}, color={0,127,255}));
  connect(inf.port_a, roo.ports[2]) annotation (Line(points={{80,-54},{22,-54},
          {22,-2.6},{26,-2.6}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end partialInterface;
