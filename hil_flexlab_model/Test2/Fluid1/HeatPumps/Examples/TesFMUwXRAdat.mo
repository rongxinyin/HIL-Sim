within hil_flexlab_model.Test2.Fluid1.HeatPumps.Examples;
model TesFMUwXRAdat "Example for the heat pump and controls FMU with XRA data"
  extends Modelica.Icons.Example;

  parameter Real refIneFre = 0.0015 "refrigerant inertia parameter";
  parameter Real k_hea = 1.25 "Proportional gain of heating controller";
  parameter Modelica.Units.SI.Time Ti_hea = 7000 "Integral time constant of heating controller";
  parameter Modelica.Units.SI.ThermodynamicTemperature maxSAT = 311 "max supply air temperature";
  parameter Real kSta1 = 0.12 "PI center line to activate stage 1";
  parameter Real kSta2 = 0.35 "PI center line to activate stage 2";
  parameter Real banSta1 = 0.01 "PI band to activate stage 1";
  parameter Real banSta2 = 0.01 "PI band to activate stage 2";
  parameter Real onOffConHeaBan = 0.25 "bandwidth for on off heating controller";

  hil_flexlab_model.Test2.Fluid1.Aachen_HP_2stage_FMU
    aachen_HP_2stage_FMU(
    refIneFre=refIneFre,
    k_hea=k_hea,
    Ti_hea=Ti_hea,
    maxSAT=maxSAT,
    kSta1=kSta1,
    kSta2=kSta2,
    banSta1=banSta1,
    banSta2=banSta2,
    rtuConFMU(onOffConHea(bandwidth=0.192)))
    annotation (Placement(transformation(extent={{-18,-20},{22,20}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    tableName="tab1",
    fileName=ModelicaServices.ExternalReferences.loadResource(
        "modelica://hil_flexlab_model/Data/test_data03272022.txt"),
    columns=3:7,
    smoothness=Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1,
    timeScale=60)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));

  Modelica.Blocks.Interfaces.RealOutput powTotMod "Modeled power"
    annotation (Placement(transformation(extent={{100,20},{120,40}}),
        iconTransformation(extent={{100,20},{120,40}})));
  Modelica.Blocks.Interfaces.RealOutput supTemMod
    "Modeled supply air temperature" annotation (Placement(transformation(
          extent={{100,4},{120,24}}),   iconTransformation(extent={{100,4},{120,
            24}})));
  Modelica.Blocks.Interfaces.BooleanOutput heaCalMod annotation (
      Placement(transformation(extent={{100,-30},{120,-10}}),
        iconTransformation(extent={{100,-30},{120,-10}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin supplyTempModtoCelsius
    annotation (Placement(transformation(extent={{74,6},{90,22}})));
  Modelica.Blocks.Sources.Constant cp(final k=1006)
    "Fixed specific heat of air" annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=180,
        origin={-40,66})));
  Modelica.Blocks.Math.Add dTMod(k2=-1) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={48,36})));
  Modelica.Blocks.Math.Product mcp annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={48,56})));
  Modelica.Blocks.Interfaces.RealOutput qdotMod "Modeled thermal power"
    annotation (Placement(transformation(extent={{100,42},{120,62}}),
        iconTransformation(extent={{100,42},{120,62}})));
  Modelica.Blocks.Math.Product mcpdTMod annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={82,52})));
  Modelica.Blocks.Interfaces.RealOutput PIHeaDemMod "Modeled PI heating demand"
    annotation (Placement(transformation(extent={{100,-14},{120,6}}),
        iconTransformation(extent={{100,-20},{120,0}})));
  Modelica.Blocks.Interfaces.RealOutput staMod "Modeled stage" annotation (
      Placement(transformation(extent={{100,-48},{120,-28}}),
        iconTransformation(extent={{100,-60},{120,-40}})));
equation

  connect(powTotMod, powTotMod)
    annotation (Line(points={{110,30},{110,30}}, color={0,0,127}));
  connect(aachen_HP_2stage_FMU.y_PEleHP, powTotMod) annotation (Line(
        points={{24,12.8},{58,12.8},{58,30},{110,30}}, color={0,0,127}));
  connect(aachen_HP_2stage_FMU.y_HeaCal, heaCalMod) annotation (Line(
        points={{24,-13.6},{80,-13.6},{80,-20},{110,-20}},
                                                         color={255,0,255}));
  connect(aachen_HP_2stage_FMU.y_TSup, supplyTempModtoCelsius.Kelvin)
    annotation (Line(points={{24,9.2},{62,9.2},{62,14},{72.4,14}},
                                                                 color={0,
          0,127}));
  connect(supplyTempModtoCelsius.Celsius, supTemMod)
    annotation (Line(points={{90.8,14},{110,14}},
                                                color={0,0,127}));
  connect(cp.y, mcp.u1) annotation (Line(points={{-31.2,66},{10,66},{10,60},{40,
          60},{40,59.6},{40.8,59.6}}, color={0,0,127}));
  connect(aachen_HP_2stage_FMU.y_TSup, dTMod.u1) annotation (Line(points={{24,9.2},
          {32,9.2},{32,32.4},{40.8,32.4}}, color={0,0,127}));
  connect(aachen_HP_2stage_FMU.u_TMix, dTMod.u2) annotation (Line(points={{-22,8},
          {-48,8},{-48,39.6},{40.8,39.6}}, color={0,0,127}));
  connect(mcpdTMod.y, qdotMod)
    annotation (Line(points={{88.6,52},{110,52}}, color={0,0,127}));
  connect(dTMod.y, mcpdTMod.u2) annotation (Line(points={{54.6,36},{60,36},{60,48.4},
          {74.8,48.4}}, color={0,0,127}));
  connect(mcp.y, mcpdTMod.u1) annotation (Line(points={{54.6,56},{74,56},{74,55.6},
          {74.8,55.6}},                   color={0,0,127}));
  connect(aachen_HP_2stage_FMU.y_heaSta, staMod) annotation (Line(points={{24,
          -16.4},{70,-16.4},{70,-38},{110,-38}},
                                          color={0,0,127}));
  connect(aachen_HP_2stage_FMU.y_PI, PIHeaDemMod) annotation (Line(points={{24,-4},
          {110,-4}},                   color={0,0,127}));
  connect(combiTimeTable.y[1], aachen_HP_2stage_FMU.u_TMix) annotation (
      Line(points={{-79,0},{-48,0},{-48,8},{-22,8}}, color={0,0,127}));
  connect(combiTimeTable.y[2], mcp.u2) annotation (Line(points={{-79,0},{
          -62,0},{-62,52.4},{40.8,52.4}}, color={0,0,127}));
  connect(combiTimeTable.y[2], aachen_HP_2stage_FMU.u_m_flow) annotation (
     Line(points={{-79,0},{-62,0},{-62,16},{-22,16}}, color={0,0,127}));
  connect(combiTimeTable.y[3], aachen_HP_2stage_FMU.u_TDryBul)
    annotation (Line(points={{-79,0},{-22,0}}, color={0,0,127}));
  connect(combiTimeTable.y[4], aachen_HP_2stage_FMU.u_TRooSetPoi)
    annotation (Line(points={{-79,0},{-48,0},{-48,-8},{-22,-8}}, color={0,
          0,127}));
  connect(combiTimeTable.y[5], aachen_HP_2stage_FMU.u_TRoo) annotation (
      Line(points={{-79,0},{-48,0},{-48,-16},{-22,-16}}, color={0,0,127}));
    annotation (Line(points={{-29.6,8},{-24,8}}, color={0,0,127}),
              Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
    experiment(
      StopTime=42000,
      Interval=1,
      Tolerance=1e-06),
__Dymola_Commands(file="modelica://AixLib/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/HeatPump.mos"
        "Simulate and plot"),
    Documentation(info="<html><h4>
  <span style=\"color: #008000\">Overview</span>
</h4>
<p>
  Simple test set-up for the HeatPumpDetailed model. The heat pump is
  turned on and off while the source temperature increases linearly.
  Outputs are the electric power consumption of the heat pump and the
  supply temperature.
</p>
<p>
  Besides using the default simple table data, the user should also
  test tabulated data from <a href=
  \"modelica://AixLib.DataBase.HeatPump\">AixLib.DataBase.HeatPump</a> or
  polynomial functions.
</p>
</html>",
      revisions="<html><ul>
  <li>
    <i>May 22, 2019</i> by Julian Matthes:<br/>
    Rebuild due to the introducion of the thermal machine partial model
    (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/715\">#715</a>)
  </li>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>"),
    __Dymola_Commands(file="Modelica://AixLib/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/HeatPump.mos" "Simulate and plot"),
    Icon(coordinateSystem(extent={{-100,-100},{100,80}})));
end TesFMUwXRAdat;
