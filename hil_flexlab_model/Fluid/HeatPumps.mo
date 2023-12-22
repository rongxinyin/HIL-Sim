within hil_flexlab_model.Fluid;
package HeatPumps "Package with model for heat pumps"

  package Data "Different models used for a black box heat pump model"

    record AAONRQ002Cooling "AAON-RQ-002 cooling performance dataset"
      extends AixLib.DataBase.Chiller.ChillerBaseDataDefinition(
        tableP_ele=[0, 23.9, 29.4, 35, 40; 8,1460.0, 1660.0, 1880.0, 2130.0;  13,1470.0, 1670.0, 1900.0, 2150.0],
        tableQdot_eva=[0, 23.9, 29.4, 35, 40; 8,6335.0, 6083.0, 5807.0, 5582.0;  13,5341.0, 5113.0, 4873.0,4618.0],
        mFlow_conNom=7743/4180/5,
        mFlow_evaNom=(1190*1.2)/3600,
        tableUppBou=[20, 20; 35, 20]);

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false)),
        Diagram(coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html><p>
  Data&#160;record&#160;for&#160;type&#160;AWO-M/AWO-M-E-AC&#160;201.A04,
  obtained from the technical guide in the UK. <a href=
  \"https://professionals.viessmann.co.uk/content/dam/vi-brands/UK/PDFs/Datasheets/Vitocal%20Technical%20Guide.PDF/_jcr_content/renditions/original.media_file.download_attachment.file/Vitocal%20Technical%20Guide.PDF\">
  Link</a> to the datasheet
</p>
<ul>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>"));
    end AAONRQ002Cooling;

    annotation (Icon(graphics={
          Rectangle(
            lineColor={200,200,200},
            fillColor={248,248,248},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0),
          Rectangle(
            lineColor={128,128,128},
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0),
          Ellipse(
            lineColor={102,102,102},
            fillColor={204,204,204},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Sphere,
            extent={{-60.0,-60.0},{60.0,60.0}})}));
  end Data;

  package Examples
    "Collection of models that illustrate model use and test models"

    model TesRTUHP
      "Example for the reversible heat pump model with ports to connect to other RTU components"
     extends Modelica.Icons.Example;
     extends hil_flexlab_model.Test2.Fluid1.HeatPumps.BaseClasses.RTUHP;

     Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
        tableOnFile=true,
        tableName="tab1",
        fileName=ModelicaServices.ExternalReferences.loadResource(
            "modelica://hil_flexlab_model/Data/2021-03-09_HP_Filtered.txt"),
        columns=6:14,
        timeScale=60) annotation (Placement(transformation(extent={{-156,-92},
                {-136,-72}})));

      Buildings.Fluid.Sources.Boundary_pT sinkSideFixedInlet(nPorts=1,
          redeclare package Medium = Medium_sin)
        "Fixed boundary at the inlet of the sink side" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-152,0})));
      Buildings.Fluid.Movers.FlowControlled_m_flow fanSup(
        m_flow_nominal=0.2,
        addPowerToMedium=false,
        nominalValuesDefineDefaultPressureCurve=true,
        dp_nominal=600,
        per(use_powerCharacteristic=false),
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        use_inputFilter=true,
        redeclare package Medium = Medium_sin)
                                            "Supply fan"
        annotation (Placement(transformation(extent={{-134,10},{-114,-10}})));
      Buildings.Controls.OBC.UnitConversions.From_cfm from_cfm annotation (
          Placement(transformation(extent={{-152,-62},{-132,-42}})));
      Modelica.Blocks.Sources.Constant den(final k=1.23)
        "Fixed density of air" annotation (Placement(transformation(
            extent={{8,8},{-8,-8}},
            rotation=180,
            origin={-144,-24})));
      Modelica.Blocks.Math.Product m3s_kgs annotation (Placement(
            transformation(extent={{-120,-50},{-100,-30}})));
      Modelica.Blocks.Sources.Pulse    staTest(
        amplitude=1,
        width=60,
        period=300,
        nperiod=10,
        offset=1,
        startTime=0) "Pulse stage setpoint between 1 and 2"                                              annotation (Placement(
            transformation(
            extent={{8,8},{-8,-8}},
            rotation=180,
            origin={-132,60})));
      Buildings.Fluid.Sources.Boundary_pT sinkSideFixedOutlet(redeclare package
                  Medium = Medium_sin, nPorts=1)
        "Fixed boundary at the outlet of the sink side" annotation (Placement(
            transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={130,0})));
    equation

      connect(sinkSideFixedInlet.ports[1], fanSup.port_a)
        annotation (Line(points={{-142,0},{-134,0}}, color={0,127,255}));
      connect(m3s_kgs.y, fanSup.m_flow_in) annotation (Line(points={{-99,-40},
              {-88,-40},{-88,-20},{-124,-20},{-124,-12}}, color={0,0,127}));
      connect(from_cfm.y, m3s_kgs.u2) annotation (Line(points={{-130,-52},{
              -128,-52},{-128,-46},{-122,-46}}, color={0,0,127}));
      connect(m3s_kgs.u1, den.y) annotation (Line(points={{-122,-34},{-128,
              -34},{-128,-24},{-135.2,-24}}, color={0,0,127}));
      connect(from_cfm.u, combiTimeTable.y[5]) annotation (Line(points={{-154,
              -52},{-164,-52},{-164,-100},{-120,-100},{-120,-82},{-135,-82}},
            color={0,0,127}));
      connect(combiTimeTable.y[4], outsideTemptoKelvin.Fahrenheit)
        annotation (Line(points={{-135,-82},{-120,-82},{-120,-60},{-98,-60}},
            color={0,0,127}));
      connect(staTest.y, nSetGai.u) annotation (Line(points={{-123.2,60},{-108,
              60},{-108,46},{-92,46}}, color={0,0,127}));
      connect(fanSup.port_b, port_a)
        annotation (Line(points={{-114,0},{-100,0}}, color={0,127,255}));
      connect(port_b, sinkSideFixedOutlet.ports[1])
        annotation (Line(points={{100,0},{120,0}}, color={0,127,255}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}})),
        experiment(
          StopTime=10800,
          Interval=60,
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
</html>", revisions="<html><ul>
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
    end TesRTUHP;

    model TesFMU "Example for the heat pump and controls FMU"
      extends Modelica.Icons.Example;

      parameter Real refIneFre = 0.0015 "refrigerant inertia parameter";
      parameter Real k_hea = 1.25 "Proportional gain of heating controller";
      parameter Modelica.SIunits.Time Ti_hea = 7000 "Integral time constant of heating controller";
      parameter Modelica.SIunits.ThermodynamicTemperature maxSAT = 311 "max supply air temperature";
      parameter Real kSta1 = 0.12 "PI center line to activate stage 1";
      parameter Real kSta2 = 0.35 "PI center line to activate stage 2";
      parameter Real banSta1 = 0.01 "PI band to activate stage 1";
      parameter Real banSta2 = 0.01 "PI band to activate stage 2";
      parameter Real onOffConHeaBan = 0.25 "bandwidth for on off heating controller";

      Buildings.Controls.OBC.UnitConversions.From_cfm from_cfm annotation (
          Placement(transformation(extent={{-84,34},{-68,50}})));
      Modelica.Blocks.Sources.Constant den(final k=1.189) "Fixed density of air"
                               annotation (Placement(transformation(
            extent={{8,8},{-8,-8}},
            rotation=180,
            origin={-76,68})));
      Modelica.Blocks.Math.Product m3s_kgs annotation (Placement(
            transformation(extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-50,46})));
      Aachen_HP_VS_FMU aachen_HP_2stage_FMU(
        refIneFre=refIneFre,
        k_hea=k_hea,
        Ti_hea=Ti_hea,
        maxSAT=maxSAT,
        kSta1=kSta1,
        kSta2=kSta2,
        banSta1=banSta1,
        banSta2=banSta2,
        rtuConFMU(onOffConHea(bandwidth=0.192)))
        annotation (Placement(transformation(extent={{-14,-20},{26,20}})));
      Modelica.Blocks.Math.Add sumTem annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-36,8})));
      Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
        tableOnFile=true,
        tableName="tab1",
        fileName=ModelicaServices.ExternalReferences.loadResource("modelica://hil_flexlab_model/Data/RTUHPdata_41322.txt"),
        columns=6:20,
        smoothness=Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1,
        timeScale=60)
        annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));

      Modelica.Blocks.Interfaces.RealOutput supTemMea
        "Measured supply air temperature" annotation (Placement(
            transformation(extent={{100,-90},{120,-70}}), iconTransformation(
              extent={{100,-90},{120,-70}})));
      Modelica.Blocks.Interfaces.RealOutput powTotMea "Measured power"
        annotation (Placement(transformation(extent={{100,-110},{120,-90}}),
            iconTransformation(extent={{100,-110},{120,-90}})));
      Modelica.Thermal.HeatTransfer.Celsius.FromKelvin  supplyTemptoCelsius
        annotation (Placement(transformation(extent={{20,-96},{36,-80}})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin supplyTemptoKelvin
        annotation (Placement(transformation(extent={{-76,-96},{-60,-80}})));
      Modelica.Blocks.Math.Add sta annotation (Placement(transformation(
            extent={{6,-6},{-6,6}},
            rotation=180,
            origin={-76,90})));
      Modelica.Blocks.Interfaces.RealOutput staMea "Measured stage"
        annotation (Placement(transformation(extent={{100,60},{120,80}}),
            iconTransformation(extent={{100,60},{120,80}})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin outsideTemptoKelvin
        annotation (Placement(transformation(extent={{-84,-46},{-68,-30}})));
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
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin rooTemptoKelvin
        annotation (Placement(transformation(extent={{-76,-78},{-60,-62}})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin retTemptoKelvin
        annotation (Placement(transformation(extent={{-84,-12},{-68,4}})));
      Modelica.Thermal.HeatTransfer.Celsius.FromKelvin supplyTempModtoCelsius
        annotation (Placement(transformation(extent={{74,6},{90,22}})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin setpointTemptoKelvin
        annotation (Placement(transformation(extent={{-76,-62},{-60,-46}})));
      Modelica.Blocks.Sources.Constant cp(final k=1006)
        "Fixed specific heat of air" annotation (Placement(transformation(
            extent={{8,8},{-8,-8}},
            rotation=180,
            origin={-40,68})));
      Modelica.Blocks.Math.Add dTMea(k2=-1) annotation (Placement(transformation(
            extent={{6,-6},{-6,6}},
            rotation=180,
            origin={48,-30})));
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
      Modelica.Blocks.Interfaces.RealOutput qdotMea "Measured thermal power"
        annotation (Placement(transformation(extent={{100,-70},{120,-50}}),
            iconTransformation(extent={{100,-80},{120,-60}})));
      Modelica.Blocks.Math.Product mcpdTMod annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={82,52})));
      Modelica.Blocks.Math.Product mcpdTMea annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={84,-60})));
      Modelica.Blocks.Interfaces.RealOutput PIHeaDemMea
        "Measured PI heating demand" annotation (Placement(transformation(extent={{100,80},
                {120,100}}),     iconTransformation(extent={{100,80},{120,100}})));
      Modelica.Blocks.Math.Gain gaiPIHeaDem(k=0.01) annotation (Placement(
            transformation(
            extent={{-4,4},{4,-4}},
            rotation=0,
            origin={88,90})));
      Modelica.Blocks.Interfaces.RealOutput PIHeaDemMod "Modeled PI heating demand"
        annotation (Placement(transformation(extent={{100,-14},{120,6}}),
            iconTransformation(extent={{100,-20},{120,0}})));
      Modelica.Blocks.Interfaces.RealOutput staMod "Modeled stage" annotation (
          Placement(transformation(extent={{100,-48},{120,-28}}),
            iconTransformation(extent={{100,-60},{120,-40}})));
      Modelica.Blocks.Math.Add RA(k2=-1) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-80,22})));
      Modelica.Blocks.Sources.Constant minOA(final k=125)
        "Fixed outside air flow rate" annotation (Placement(transformation(
            extent={{6,6},{-6,-6}},
            rotation=180,
            origin={-142,18})));
      Modelica.Blocks.Math.Product perRA "percentage of return air"
        annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-54,8})));
      Modelica.Blocks.Math.Division fraRA "fraction of return air"
        annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-50,26})));
      Modelica.Blocks.Math.Product perOA "percentage of outdoor air"
        annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-54,-22})));
      Modelica.Blocks.Math.Division fraOA "fraction of outside air"
        annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-76,-20})));
    equation

      connect(from_cfm.y, m3s_kgs.u2) annotation (Line(points={{-66.4,42},{
              -58,42},{-58,42.4},{-57.2,42.4}}, color={0,0,127}));
      connect(m3s_kgs.u1, den.y) annotation (Line(points={{-57.2,49.6},{-64,
              49.6},{-64,68},{-67.2,68}},    color={0,0,127}));
      connect(m3s_kgs.y, aachen_HP_2stage_FMU.u_m_flow) annotation (Line(
            points={{-43.4,46},{-26,46},{-26,16},{-18,16}},
                                                          color={0,0,127}));
      connect(combiTimeTable.y[5], from_cfm.u) annotation (Line(points={{-99,0},
              {-94,0},{-94,42},{-85.6,42}},    color={0,0,127}));
      connect(supplyTemptoCelsius.Celsius, supTemMea) annotation (Line(points={{36.8,
              -88},{74,-88},{74,-80},{110,-80}},       color={0,0,127}));
      connect(supplyTemptoKelvin.Kelvin,supplyTemptoCelsius. Kelvin)
        annotation (Line(points={{-59.2,-88},{18.4,-88}},
                                                      color={0,0,127}));
      connect(combiTimeTable.y[3], supplyTemptoKelvin.Fahrenheit) annotation (
         Line(points={{-99,0},{-94,0},{-94,-88},{-77.6,-88}}, color={0,0,127}));
      connect(combiTimeTable.y[9], powTotMea) annotation (Line(points={{-99,0},{-94,
              0},{-94,-100},{110,-100}},    color={0,0,127}));
      connect(combiTimeTable.y[10], sta.u2) annotation (Line(points={{-99,0},
              {-94,0},{-94,93.6},{-83.2,93.6}}, color={0,0,127}));
      connect(combiTimeTable.y[11], sta.u1) annotation (Line(points={{-99,0},
              {-94,0},{-94,86.4},{-83.2,86.4}}, color={0,0,127}));
      connect(combiTimeTable.y[4], outsideTemptoKelvin.Fahrenheit)
        annotation (Line(points={{-99,0},{-94,0},{-94,-38},{-85.6,-38}},
                                                     color={0,0,127}));
      connect(outsideTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TDryBul)
        annotation (Line(points={{-67.2,-38},{-34,-38},{-34,0},{-18,0}},
                                                     color={0,0,127}));
      connect(powTotMod, powTotMod)
        annotation (Line(points={{110,30},{110,30}}, color={0,0,127}));
      connect(aachen_HP_2stage_FMU.y_PEleHP, powTotMod) annotation (Line(
            points={{28,12.8},{58,12.8},{58,30},{110,30}}, color={0,0,127}));
      connect(aachen_HP_2stage_FMU.y_HeaCal, heaCalMod) annotation (Line(
            points={{28,-13.6},{80,-13.6},{80,-20},{110,-20}},
                                                             color={255,0,255}));
      connect(combiTimeTable.y[1], rooTemptoKelvin.Fahrenheit) annotation (
          Line(points={{-99,0},{-94,0},{-94,-70},{-77.6,-70}}, color={0,0,127}));
      connect(rooTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TRoo)
        annotation (Line(points={{-59.2,-70},{-26,-70},{-26,-16},{-18,-16}},
            color={0,0,127}));
      connect(combiTimeTable.y[2], retTemptoKelvin.Fahrenheit) annotation (
          Line(points={{-99,0},{-94,0},{-94,-4},{-85.6,-4}}, color={0,0,127}));
      connect(aachen_HP_2stage_FMU.y_TSup, supplyTempModtoCelsius.Kelvin)
        annotation (Line(points={{28,9.2},{62,9.2},{62,14},{72.4,14}},
                                                                     color={0,
              0,127}));
      connect(supplyTempModtoCelsius.Celsius, supTemMod)
        annotation (Line(points={{90.8,14},{110,14}},
                                                    color={0,0,127}));
      connect(sta.y, staMea) annotation (Line(points={{-69.4,90},{16,90},{16,70},{110,
              70}},          color={0,0,127}));
      connect(combiTimeTable.y[12], setpointTemptoKelvin.Fahrenheit) annotation (
          Line(points={{-99,0},{-94,0},{-94,-54},{-77.6,-54}}, color={0,0,127}));
      connect(setpointTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TRooSetPoi)
        annotation (Line(points={{-59.2,-54},{-30,-54},{-30,-8},{-18,-8}}, color={0,
              0,127}));
      connect(m3s_kgs.y, mcp.u2) annotation (Line(points={{-43.4,46},{-26,46},
              {-26,52.4},{40.8,52.4}},
                            color={0,0,127}));
      connect(cp.y, mcp.u1) annotation (Line(points={{-31.2,68},{10,68},{10,
              60},{40,60},{40,59.6},{40.8,59.6}},
                                          color={0,0,127}));
      connect(aachen_HP_2stage_FMU.u_TMix, dTMea.u2) annotation (Line(points={{-18,8},
              {-24,8},{-24,-26.4},{40.8,-26.4}}, color={0,0,127}));
      connect(aachen_HP_2stage_FMU.y_TSup, dTMod.u1) annotation (Line(points={{28,9.2},
              {32,9.2},{32,32.4},{40.8,32.4}}, color={0,0,127}));
      connect(aachen_HP_2stage_FMU.u_TMix, dTMod.u2) annotation (Line(points={{-18,8},
              {-24,8},{-24,39.6},{40.8,39.6}}, color={0,0,127}));
      connect(supplyTemptoKelvin.Kelvin, dTMea.u1) annotation (Line(points={{-59.2,
              -88},{-2,-88},{-2,-33.6},{40.8,-33.6}},
                                                   color={0,0,127}));
      connect(mcpdTMea.y, qdotMea)
        annotation (Line(points={{90.6,-60},{110,-60}}, color={0,0,127}));
      connect(mcpdTMod.y, qdotMod)
        annotation (Line(points={{88.6,52},{110,52}}, color={0,0,127}));
      connect(dTMod.y, mcpdTMod.u2) annotation (Line(points={{54.6,36},{60,36},{60,48.4},
              {74.8,48.4}}, color={0,0,127}));
      connect(dTMea.y, mcpdTMea.u1) annotation (Line(points={{54.6,-30},{60,
              -30},{60,-44},{76,-44},{76,-56.4},{76.8,-56.4}},
                                                      color={0,0,127}));
      connect(mcp.y, mcpdTMod.u1) annotation (Line(points={{54.6,56},{74,56},{74,55.6},
              {74.8,55.6}},                   color={0,0,127}));
      connect(mcp.y, mcpdTMea.u2) annotation (Line(points={{54.6,56},{66,56},
              {66,-63.6},{76.8,-63.6}},
                             color={0,0,127}));
      connect(PIHeaDemMea, gaiPIHeaDem.y)
        annotation (Line(points={{110,90},{92.4,90}},   color={0,0,127}));
      connect(combiTimeTable.y[15], gaiPIHeaDem.u) annotation (Line(points={{-99,0},
              {-94,0},{-94,100},{26,100},{26,90},{83.2,90}},
                                             color={0,0,127}));
      connect(qdotMea, qdotMea)
        annotation (Line(points={{110,-60},{110,-60}}, color={0,0,127}));
      connect(aachen_HP_2stage_FMU.y_heaSta, staMod) annotation (Line(points={{28,
              -16.4},{70,-16.4},{70,-38},{110,-38}},
                                              color={0,0,127}));
      connect(aachen_HP_2stage_FMU.y_PI, PIHeaDemMod) annotation (Line(points={{28,-4},
              {110,-4}},                   color={0,0,127}));
      connect(sumTem.y, aachen_HP_2stage_FMU.u_TMix)
        annotation (Line(points={{-29.4,8},{-18,8}}, color={0,0,127}));
      connect(combiTimeTable.y[5], RA.u1) annotation (Line(points={{-99,0},{
              -94,0},{-94,25.6},{-87.2,25.6}}, color={0,0,127}));
      connect(RA.y, fraRA.u1) annotation (Line(points={{-73.4,22},{-72,22},{
              -72,26},{-66,26},{-66,29.6},{-57.2,29.6}}, color={0,0,127}));
      connect(retTemptoKelvin.Kelvin, perRA.u2) annotation (Line(points={{
              -67.2,-4},{-64,-4},{-64,4.4},{-61.2,4.4}}, color={0,0,127}));
      connect(fraRA.y, perRA.u1) annotation (Line(points={{-43.4,26},{-42,26},
              {-42,18},{-66,18},{-66,11.6},{-61.2,11.6}}, color={0,0,127}));
      connect(perRA.y, sumTem.u1) annotation (Line(points={{-47.4,8},{-46,8},
              {-46,11.6},{-43.2,11.6}}, color={0,0,127}));
      connect(perOA.y, sumTem.u2) annotation (Line(points={{-47.4,-22},{-46,
              -22},{-46,4.4},{-43.2,4.4}}, color={0,0,127}));
      connect(combiTimeTable.y[5], fraRA.u2) annotation (Line(points={{-99,0},
              {-94,0},{-94,12},{-70,12},{-70,20},{-66,20},{-66,22.4},{-57.2,
              22.4}}, color={0,0,127}));
      connect(outsideTemptoKelvin.Kelvin, perOA.u2) annotation (Line(points={
              {-67.2,-38},{-64,-38},{-64,-25.6},{-61.2,-25.6}}, color={0,0,
              127}));
      connect(combiTimeTable.y[5], fraOA.u2) annotation (Line(points={{-99,0},
              {-94,0},{-94,-23.6},{-83.2,-23.6}}, color={0,0,127}));
      connect(minOA.y, fraOA.u1) annotation (Line(points={{-135.4,18},{-128,
              18},{-128,-16.4},{-83.2,-16.4}}, color={0,0,127}));
      connect(minOA.y, RA.u2) annotation (Line(points={{-135.4,18},{-128,18},
              {-128,18.4},{-87.2,18.4}}, color={0,0,127}));
      connect(fraOA.y, perOA.u1) annotation (Line(points={{-69.4,-20},{-66,
              -20},{-66,-18.4},{-61.2,-18.4}}, color={0,0,127}));
        annotation (Line(points={{-29.6,8},{-24,8}}, color={0,0,127}),
                  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}})),
        experiment(
          StopTime=27000,
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
</html>", revisions="<html><ul>
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
    end TesFMU;

    model TesFMU_compile "Example for the heat pump and controls FMU"
     extends Modelica.Icons.Example;

      parameter Real refIneFre = 0.0015 "refrigerant inertia parameter";
      parameter Real k_hea=0.33 "Proportional gain of heating controller";
      parameter Modelica.SIunits.Time Ti_hea=20000 "Integral time constant of heating controller";
      parameter Modelica.SIunits.ThermodynamicTemperature maxSAT = 310 "max supply air temperature";
      parameter Real uLowSta1 = 0.12 "PI lower bound to activate stage 1";
      parameter Real uUppSta1 = 0.20 "PI upper bound to activate stage 1";
      parameter Real uLowSta2 = 0.35 "PI lower bound to activate stage 2";
      parameter Real uUppSta2 = 0.45 "PI upper bound to activate stage 2";
      parameter Real kSta1 = 0.12 "PI center line to activate stage 1";
      parameter Real kSta2 = 0.35 "PI center line to activate stage 2";
      parameter Real banSta1 = 0.01 "PI band to activate stage 1";
      parameter Real banSta2 = 0.01 "PI band to activate stage 2";

      Buildings.Controls.OBC.UnitConversions.From_cfm from_cfm annotation (
          Placement(transformation(extent={{-84,30},{-68,46}})));
      Modelica.Blocks.Sources.Constant den(final k=1.189) "Fixed density of air"
                               annotation (Placement(transformation(
            extent={{8,8},{-8,-8}},
            rotation=180,
            origin={-76,66})));
      Modelica.Blocks.Math.Product m3s_kgs annotation (Placement(
            transformation(extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-50,44})));
      hil_flexlab_model_Fluid_Aachen_HP_02stage_FMU_fmu aachen_HP_2stage_FMU
        annotation (Placement(transformation(extent={{-18,-18},{22,22}})));
      Modelica.Blocks.Math.Add sumTem(k1=1.65, k2=0.35)
                                      annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-50,16})));
      Modelica.Blocks.Math.Gain aveTem(k=0.5) annotation (Placement(
            transformation(
            extent={{-4,-4},{4,4}},
            rotation=0,
            origin={-34,8})));
      Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
        tableOnFile=true,
        tableName="tab1",
        fileName=ModelicaServices.ExternalReferences.loadResource(
            "modelica://hil_flexlab_model/Data/2022-03-06_HP_Filtered.txt"),
        columns=6:20,
        smoothness=Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1,
        timeScale=60)
        annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));

      Modelica.Blocks.Interfaces.RealOutput supTemMea
        "Measured supply air temperature" annotation (Placement(
            transformation(extent={{100,-80},{120,-60}}), iconTransformation(
              extent={{100,-80},{120,-60}})));
      Modelica.Blocks.Interfaces.RealOutput powTotMea "Measured power"
        annotation (Placement(transformation(extent={{100,-100},{120,-80}}),
            iconTransformation(extent={{100,-100},{120,-80}})));
      Modelica.Thermal.HeatTransfer.Celsius.FromKelvin  supplyTemptoCelsius
        annotation (Placement(transformation(extent={{20,-88},{36,-72}})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin supplyTemptoKelvin
        annotation (Placement(transformation(extent={{-76,-88},{-60,-72}})));
      Modelica.Blocks.Math.Add sta annotation (Placement(transformation(
            extent={{6,-6},{-6,6}},
            rotation=180,
            origin={-76,90})));
      Modelica.Blocks.Interfaces.RealOutput staMea "Measured stage"
        annotation (Placement(transformation(extent={{100,60},{120,80}}),
            iconTransformation(extent={{100,60},{120,80}})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin outsideTemptoKelvin
        annotation (Placement(transformation(extent={{-84,-8},{-68,8}})));
      Modelica.Blocks.Interfaces.RealOutput powTotMod "Modeled power"
        annotation (Placement(transformation(extent={{100,10},{120,30}}),
            iconTransformation(extent={{100,10},{120,30}})));
      Modelica.Blocks.Interfaces.RealOutput supTemMod
        "Modeled supply air temperature" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
                -10},{120,10}})));
      Modelica.Blocks.Interfaces.BooleanOutput heaCalMod annotation (
          Placement(transformation(extent={{100,-30},{120,-10}}),
            iconTransformation(extent={{100,-30},{120,-10}})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin rooTemptoKelvin
        annotation (Placement(transformation(extent={{-76,-56},{-60,-40}})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin retTemptoKelvin
        annotation (Placement(transformation(extent={{-84,12},{-68,28}})));
      Modelica.Thermal.HeatTransfer.Celsius.FromKelvin supplyTempModtoCelsius
        annotation (Placement(transformation(extent={{72,-8},{88,8}})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin setpointTemptoKelvin
        annotation (Placement(transformation(extent={{-76,-34},{-60,-18}})));
      Modelica.Blocks.Sources.Constant cp(final k=1006)
        "Fixed specific heat of air" annotation (Placement(transformation(
            extent={{8,8},{-8,-8}},
            rotation=180,
            origin={-40,66})));
      Modelica.Blocks.Math.Add dTMea(k2=-1) annotation (Placement(transformation(
            extent={{6,-6},{-6,6}},
            rotation=180,
            origin={48,-30})));
      Modelica.Blocks.Math.Add dTMod(k2=-1) annotation (Placement(transformation(
            extent={{6,-6},{-6,6}},
            rotation=180,
            origin={48,30})));
      Modelica.Blocks.Math.Product mcp annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={48,56})));
      Modelica.Blocks.Interfaces.RealOutput qdotMod "Modeled thermal power"
        annotation (Placement(transformation(extent={{100,34},{120,54}}),
            iconTransformation(extent={{100,10},{120,30}})));
      Modelica.Blocks.Interfaces.RealOutput qdotMea "Measured thermal power"
        annotation (Placement(transformation(extent={{100,-62},{120,-42}}),
            iconTransformation(extent={{100,10},{120,30}})));
      Modelica.Blocks.Math.Product mcpdTMod annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={82,44})));
      Modelica.Blocks.Math.Product mcpdTMea annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={84,-44})));
      Modelica.Blocks.Interfaces.RealOutput PIHeaDemMea
        "Measured PI heating demand" annotation (Placement(transformation(extent={{100,
                110},{120,90}}), iconTransformation(extent={{100,60},{120,80}})));
      Modelica.Blocks.Math.Gain gaiPIHeaDem(k=0.01) annotation (Placement(
            transformation(
            extent={{-4,4},{4,-4}},
            rotation=0,
            origin={88,100})));
      Modelica.Blocks.Interfaces.RealOutput PIMod "Measured thermal power"
        annotation (Placement(transformation(extent={{100,-46},{120,-26}}),
            iconTransformation(extent={{100,10},{120,30}})));

    equation

      connect(from_cfm.y, m3s_kgs.u2) annotation (Line(points={{-66.4,38},{-62,38},{
              -62,40.4},{-57.2,40.4}},          color={0,0,127}));
      connect(m3s_kgs.u1, den.y) annotation (Line(points={{-57.2,47.6},{-64,47.6},{-64,
              66},{-67.2,66}},               color={0,0,127}));
      connect(m3s_kgs.y, aachen_HP_2stage_FMU.u_m_flow) annotation (Line(
            points={{-43.4,44},{-32,44},{-32,15.4},{-18.8,15.4}},
                                                          color={0,0,127}));
      connect(combiTimeTable.y[5], from_cfm.u) annotation (Line(points={{-99,
              0},{-94,0},{-94,38},{-85.6,38}}, color={0,0,127}));
      connect(supplyTemptoCelsius.Celsius, supTemMea) annotation (Line(points=
             {{36.8,-80},{74,-80},{74,-70},{110,-70}}, color={0,0,127}));
      connect(supplyTemptoKelvin.Kelvin,supplyTemptoCelsius. Kelvin)
        annotation (Line(points={{-59.2,-80},{18.4,-80}},
                                                      color={0,0,127}));
      connect(combiTimeTable.y[3], supplyTemptoKelvin.Fahrenheit) annotation (
         Line(points={{-99,0},{-94,0},{-94,-80},{-77.6,-80}}, color={0,0,127}));
      connect(combiTimeTable.y[9], powTotMea) annotation (Line(points={{-99,0},
              {-94,0},{-94,-90},{110,-90}}, color={0,0,127}));
      connect(combiTimeTable.y[10], sta.u2) annotation (Line(points={{-99,0},
              {-94,0},{-94,93.6},{-83.2,93.6}}, color={0,0,127}));
      connect(combiTimeTable.y[11], sta.u1) annotation (Line(points={{-99,0},
              {-94,0},{-94,86.4},{-83.2,86.4}}, color={0,0,127}));
      connect(combiTimeTable.y[4], outsideTemptoKelvin.Fahrenheit)
        annotation (Line(points={{-99,0},{-85.6,0}}, color={0,0,127}));
      connect(outsideTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TDryBul)
        annotation (Line(points={{-67.2,0},{-44,0},{-44,8.8},{-18.8,8.8}},
                                                     color={0,0,127}));
      connect(sumTem.y, aveTem.u) annotation (Line(points={{-43.4,16},{-40,16},
              {-40,8},{-38.8,8}}, color={0,0,127}));
      connect(aveTem.y, aachen_HP_2stage_FMU.u_TMix)
        annotation (Line(points={{-29.6,8},{-24,8},{-24,-11.2},{-18.8,-11.2}},
                                                     color={0,0,127}));
      connect(powTotMod, powTotMod)
        annotation (Line(points={{110,20},{110,20}}, color={0,0,127}));
      connect(aachen_HP_2stage_FMU.y_PEleHP, powTotMod) annotation (Line(
            points={{26,6},{60,6},{60,20},{110,20}},       color={0,0,127}));
      connect(aachen_HP_2stage_FMU.y_HeaCal, heaCalMod) annotation (Line(
            points={{26,-2},{60,-2},{60,-20},{110,-20}},     color={255,0,255}));
      connect(combiTimeTable.y[1], rooTemptoKelvin.Fahrenheit) annotation (
          Line(points={{-99,0},{-94,0},{-94,-48},{-77.6,-48}}, color={0,0,127}));
      connect(rooTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TRoo)
        annotation (Line(points={{-59.2,-48},{-40,-48},{-40,2},{-18.8,2}},
            color={0,0,127}));
      connect(retTemptoKelvin.Kelvin, sumTem.u1) annotation (Line(points={{
              -67.2,20},{-58,20},{-58,19.6},{-57.2,19.6}}, color={0,0,127}));
      connect(combiTimeTable.y[2], retTemptoKelvin.Fahrenheit) annotation (
          Line(points={{-99,0},{-94,0},{-94,20},{-85.6,20}}, color={0,0,127}));
      connect(outsideTemptoKelvin.Kelvin, sumTem.u2) annotation (Line(points=
              {{-67.2,0},{-62,0},{-62,12},{-58,12},{-58,12.4},{-57.2,12.4}},
            color={0,0,127}));
      connect(aachen_HP_2stage_FMU.y_TSup, supplyTempModtoCelsius.Kelvin)
        annotation (Line(points={{26,14},{60,14},{60,0},{70.4,0}},   color={0,
              0,127}));
      connect(supplyTempModtoCelsius.Celsius, supTemMod)
        annotation (Line(points={{88.8,0},{110,0}}, color={0,0,127}));
      connect(sta.y, staMea) annotation (Line(points={{-69.4,90},{16,90},{16,
              70},{110,70}}, color={0,0,127}));
      connect(combiTimeTable.y[12], setpointTemptoKelvin.Fahrenheit) annotation (
          Line(points={{-99,0},{-94,0},{-94,-26},{-77.6,-26}}, color={0,0,127}));
      connect(setpointTemptoKelvin.Kelvin, aachen_HP_2stage_FMU.u_TRooSetPoi)
        annotation (Line(points={{-59.2,-26},{-50,-26},{-50,-4.6},{-18.8,-4.6}},
                                                                           color={0,
              0,127}));
      connect(m3s_kgs.y, mcp.u2) annotation (Line(points={{-43.4,44},{-32,44},{-32,52.4},
              {40.8,52.4}}, color={0,0,127}));
      connect(cp.y, mcp.u1) annotation (Line(points={{-31.2,66},{10,66},{10,60},{40,
              60},{40,59.6},{40.8,59.6}}, color={0,0,127}));
      connect(aachen_HP_2stage_FMU.u_TMix, dTMea.u2) annotation (Line(points={{-18.8,
              -11.2},{-30,-11.2},{-30,-26.4},{40.8,-26.4}},
                                                 color={0,0,127}));
      connect(aachen_HP_2stage_FMU.y_TSup, dTMod.u1) annotation (Line(points={{26,14},
              {32,14},{32,26.4},{40.8,26.4}},  color={0,0,127}));
      connect(aachen_HP_2stage_FMU.u_TMix, dTMod.u2) annotation (Line(points={{-18.8,
              -11.2},{-30,-11.2},{-30,33.6},{40.8,33.6}},
                                               color={0,0,127}));
      connect(supplyTemptoKelvin.Kelvin, dTMea.u1) annotation (Line(points={{-59.2,-80},
              {-10,-80},{-10,-33.6},{40.8,-33.6}}, color={0,0,127}));
      connect(mcpdTMea.y, qdotMea)
        annotation (Line(points={{90.6,-44},{100,-44},{100,-52},{110,-52}},
                                                        color={0,0,127}));
      connect(mcpdTMod.y, qdotMod)
        annotation (Line(points={{88.6,44},{110,44}}, color={0,0,127}));
      connect(dTMod.y, mcpdTMod.u2) annotation (Line(points={{54.6,30},{60,30},{60,40.4},
              {74.8,40.4}}, color={0,0,127}));
      connect(dTMea.y, mcpdTMea.u1) annotation (Line(points={{54.6,-30},{60,-30},{60,
              -40},{76,-40},{76,-40.4},{76.8,-40.4}}, color={0,0,127}));
      connect(mcp.y, mcpdTMod.u1) annotation (Line(points={{54.6,56},{64,56},{64,48},
              {74,48},{74,47.6},{74.8,47.6}}, color={0,0,127}));
      connect(mcp.y, mcpdTMea.u2) annotation (Line(points={{54.6,56},{64,56},{64,-47.6},
              {76.8,-47.6}}, color={0,0,127}));
      connect(PIHeaDemMea, gaiPIHeaDem.y)
        annotation (Line(points={{110,100},{92.4,100}}, color={0,0,127}));
      connect(combiTimeTable.y[15], gaiPIHeaDem.u) annotation (Line(points={{-99,0},
              {-94,0},{-94,100},{83.2,100}}, color={0,0,127}));
      connect(aachen_HP_2stage_FMU.y_PI, PIMod) annotation (Line(points={{26,-10},
              {62,-10},{62,-36},{110,-36}},          color={0,0,127}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
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
</html>", revisions="<html><ul>
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
    end TesFMU_compile;

    annotation (Icon(graphics={
          Rectangle(
            lineColor={200,200,200},
            fillColor={248,248,248},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0),
          Rectangle(
            lineColor={128,128,128},
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0),
          Polygon(
            origin={8.0,14.0},
            lineColor={78,138,73},
            fillColor={78,138,73},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}));
  end Examples;

  package Validation
    "Collection of models that illustrate model use and test models"

    model HeatPumpCalibration "Example for the reversible heat pump model."
     extends Modelica.Icons.Example;

      replaceable package Medium_sin = Buildings.Media.Air
        constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
      replaceable package Medium_sou = Buildings.Media.Air
        constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
      Buildings.Fluid.Sources.MassFlowSource_T             sourceSideMassFlowSource(
        use_T_in=true,
        m_flow=1,
        nPorts=1,
        redeclare package Medium = Medium_sou,
        T=275.15) "Ideal mass flow source at the inlet of the source side"
                  annotation (Placement(transformation(extent={{-54,-80},{-34,-60}})));

      Buildings.Fluid.Sources.Boundary_pT               sourceSideFixedBoundary(
                                                                             nPorts=
           1, redeclare package Medium = Medium_sou)
              "Fixed boundary at the outlet of the source side"
              annotation (Placement(transformation(extent={{-11,11},{11,-11}},
            rotation=0,
            origin={-81,3})));
      Modelica.Blocks.Sources.Constant T_amb_internal(k=291.15)
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=-90,
            origin={0,-64})));
      hil_flexlab_model.Test2.Fluid1.HeatPumps.HeatPump heatPump(
        Q_useNominal=6535,
        refIneFre_constant=0.00333,
        useBusConnectorOnly=true,
        CEva=100,
        GEvaOut=5,
        CCon=100,
        GConOut=5,
        dpEva_nominal=0,
        dpCon_nominal=0,
        VCon=0.4,
        use_conCap=false,
        redeclare package Medium_con = Medium_sin,
        redeclare package Medium_eva = Medium_sou,
        use_refIne=true,
        use_rev=false,
        TCon_start=290.15,
        TEva_start=281.15,
        redeclare model PerDataMainHP =
            AixLib.DataBase.HeatPump.PerformanceData.LookUpTable2D (dataTable=
                hil_flexlab_model.Test2.Fluid1.HeatPumps.Data.RongxinSampleHP()),
        redeclare model PerDataRevHP =
            AixLib.DataBase.Chiller.PerformanceData.LookUpTable2D (smoothness=
                Modelica.Blocks.Types.Smoothness.LinearSegments, dataTable=
                AixLib.DataBase.Chiller.EN14511.Vitocal200AWO201()),
        VEva=0.04,
        use_evaCap=false,
        scalingFactor=1,
        energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
        mFlow_conNominal=0.5,
        mFlow_evaNominal=0.5,
        use_autoCalc=false,
        TAmbEva_nominal=273.15,
        TAmbCon_nominal=288.15) annotation (Placement(transformation(
            extent={{-24,-29},{24,29}},
            rotation=270,
            origin={2,-21})));

      Modelica.Blocks.Sources.BooleanConstant booleanConstant
        annotation (Placement(transformation(extent={{-6,-6},{6,6}},
            rotation=270,
            origin={16,78})));

      Buildings.Fluid.Sensors.TemperatureTwoPort
                                              senTAct(
        final m_flow_nominal=heatPump.m1_flow_nominal,
        final tau=1,
        final initType=Modelica.Blocks.Types.Init.InitialState,
        final tauHeaTra=1200,
        final allowFlowReversal=heatPump.allowFlowReversalCon,
        final transferHeat=false,
        redeclare final package Medium = Medium_sin,
        final T_start=303.15,
        final TAmb=291.15) "Temperature at sink inlet" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={54,-64})));
      Modelica.Blocks.Logical.Hysteresis hysHeating(
        pre_y_start=true,
        uLow=273.15 + 31.2,
        uHigh=273.15 + 32.2)
        annotation (Placement(transformation(extent={{66,58},{56,68}})));
      Modelica.Blocks.Math.BooleanToReal booleanToReal
        annotation (Placement(transformation(extent={{5,-5},{-5,5}},
            rotation=90,
            origin={7,29})));

      Buildings.Fluid.MixingVolumes.MixingVolume
                                              Room(
        nPorts=2,
        final use_C_flow=false,
        final m_flow_nominal=heatPump.m1_flow_nominal,
        final V=5,
        final allowFlowReversal=true,
        redeclare package Medium = Medium_sin)
        "Volume of Condenser" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={86,-20})));

      Modelica.Blocks.Logical.Not not2 "Negate output of hysteresis"
        annotation (Placement(transformation(extent={{-5,-5},{5,5}},
            origin={45,63},
            rotation=180)));
      Buildings.Fluid.Sources.Boundary_pT sinkSideFixedBoundary(     nPorts=1,
          redeclare package Medium = Medium_sin)
        "Fixed boundary at the outlet of the sink side" annotation (Placement(
            transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={88,-64})));
      Modelica.Blocks.Sources.Constant iceFac(final k=1)
        "Fixed value for icing factor. 1 means no icing/frosting (full heat transfer in heat exchanger)" annotation (Placement(
            transformation(
            extent={{8,8},{-8,-8}},
            rotation=180,
            origin={-66,38})));
      Modelica.Blocks.Logical.LogicalSwitch logicalSwitch
        annotation (Placement(transformation(extent={{24,48},{14,58}})));
      Modelica.Blocks.Logical.Hysteresis hysCooling(
        pre_y_start=false,
        uLow=273.15 + 15,
        uHigh=273.15 + 19)
        annotation (Placement(transformation(extent={{66,42},{56,52}})));
      AixLib.Controls.Interfaces.VapourCompressionMachineControlBus sigBus1
        annotation (Placement(transformation(extent={{-36,16},{-6,50}}),
            iconTransformation(extent={{-24,24},{-6,50}})));
      Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
        tableOnFile=true,
        tableName="tab1",
        fileName=ModelicaServices.ExternalReferences.loadResource(
            "modelica://hil_flexlab_model/Data/2022-02-08_HP_Filtered.txt"),
        columns=6:18,
        timeScale=60) annotation (Placement(transformation(extent={{-140,60},{-120,80}})));

      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin roomTemptoKelvin
        annotation (Placement(transformation(extent={{54,98},{74,118}})));
      Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature roomTemp
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={130,30})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin returnTemptoKelvin
        annotation (Placement(transformation(extent={{-34,78},{-14,98}})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin outsideTemptoKelvin
        annotation (Placement(transformation(extent={{-90,-76},{-70,-56}})));
      Buildings.Controls.OBC.UnitConversions.From_cfm from_cfm
        annotation (Placement(transformation(extent={{-70,60},{-50,80}})));
      Buildings.Fluid.Sensors.DensityTwoPort senDen(redeclare package Medium =
            Buildings.Media.Air,   m_flow_nominal=0.2)
        annotation (Placement(transformation(extent={{48,-10},{68,10}})));
      Modelica.Blocks.Math.Product m3s_kgs
        annotation (Placement(transformation(extent={{-34,54},{-14,74}})));
      Modelica.Blocks.Interfaces.RealOutput supplyTempMea
        "Measured supply air temperature"
        annotation (Placement(transformation(extent={{100,-94},{120,-74}})));
      Modelica.Thermal.HeatTransfer.Fahrenheit.ToKelvin supplyTemptoKelvin
        annotation (Placement(transformation(extent={{-90,-94},{-70,-74}})));
      Modelica.Blocks.Interfaces.RealOutput powerTotMea "Measured power"
        annotation (Placement(transformation(extent={{100,-110},{120,-90}})));
      Buildings.Fluid.Movers.FlowControlled_m_flow fanSup(
        m_flow_nominal=0.2,
        addPowerToMedium=false,
        nominalValuesDefineDefaultPressureCurve=true,
        dp_nominal=600,
        per(use_powerCharacteristic=false),
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        use_inputFilter=true,
        redeclare package Medium = Medium_sin)
                                            "Supply fan"
        annotation (Placement(transformation(extent={{44,18},{24,38}})));
      Modelica.Blocks.Interfaces.RealOutput returnTempMea
        "Measured supply air temperature"
        annotation (Placement(transformation(extent={{100,78},{120,98}})));
      Modelica.Thermal.HeatTransfer.Celsius.FromKelvin  supplyTemptoCelsius
        annotation (Placement(transformation(extent={{20,-94},{40,-74}})));
      Modelica.Thermal.HeatTransfer.Celsius.FromKelvin returnTemptoCelsius
        annotation (Placement(transformation(extent={{54,78},{74,98}})));
      Modelica.Blocks.Math.Gain gain(k=0.5)
        annotation (Placement(transformation(extent={{-88,-50},{-68,-30}})));
      Modelica.Blocks.Math.Product sta_nSet
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-38,-14})));
      Modelica.Blocks.Math.Add sta annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-126,-8})));
      Modelica.Blocks.Sources.Constant basPow(final k=175)
        "baseline power for heat pump RTU" annotation (Placement(
            transformation(
            extent={{8,8},{-8,-8}},
            rotation=180,
            origin={92,66})));
      Modelica.Blocks.Math.Add pow annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=180,
            origin={152,60})));
      Modelica.Blocks.Interfaces.RealOutput powerTotMod "Modeled power"
        annotation (Placement(transformation(extent={{170,50},{190,70}})));
    equation

      connect(sourceSideMassFlowSource.ports[1], heatPump.port_a2) annotation (Line(
            points={{-34,-70},{-24,-70},{-24,-45},{-12.5,-45}}, color={0,127,255}));
      connect(heatPump.port_b2, sourceSideFixedBoundary.ports[1]) annotation (Line(
            points={{-12.5,3},{-70,3}},                   color={0,127,255}));
      connect(heatPump.port_b1, senTAct.port_a) annotation (Line(points={{16.5,-45},
              {30,-45},{30,-64},{44,-64}}, color={0,127,255}));
      connect(senTAct.T, hysHeating.u) annotation (Line(points={{54,-53},{54,-54},{
              54,-54},{54,-54},{54,-8},{70,-8},{70,63},{67,63}}, color={0,0,127}));
      connect(hysHeating.y, not2.u)
        annotation (Line(points={{55.5,63},{51,63}}, color={255,0,255}));
      connect(senTAct.port_b, sinkSideFixedBoundary.ports[1]) annotation (Line(
            points={{64,-64},{72,-64},{72,-64},{78,-64}}, color={0,127,255}));
      connect(senTAct.port_b, Room.ports[1]) annotation (Line(points={{64,-64},{66,-64},
              {66,-18},{76,-18}},      color={0,127,255}));
      connect(logicalSwitch.u1, not2.y) annotation (Line(points={{25,57},{36,57},{
              36,63},{39.5,63}}, color={255,0,255}));
      connect(hysCooling.y, logicalSwitch.u3) annotation (Line(points={{55.5,47},
              {36,47},{36,49},{25,49}},color={255,0,255}));
      connect(senTAct.T, hysCooling.u) annotation (Line(points={{54,-53},{54,
              -8},{70,-8},{70,47},{67,47}},
            color={0,0,127}));
      connect(booleanConstant.y, logicalSwitch.u2) annotation (Line(points={{
              16,71.4},{16,66},{32,66},{32,53},{25,53}}, color={255,0,255}));
      connect(logicalSwitch.y, booleanToReal.u)
        annotation (Line(points={{13.5,53},{7,53},{7,35}}, color={255,0,255}));
      connect(booleanConstant.y, sigBus1.modeSet) annotation (Line(points={{
              16,71.4},{-10,71.4},{-10,33.085},{-20.925,33.085}}, color={255,
              0,255}), Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(iceFac.y, sigBus1.iceFacMea) annotation (Line(points={{-57.2,38},{-34,
              38},{-34,33.085},{-20.925,33.085}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(sigBus1, heatPump.sigBus) annotation (Line(
          points={{-21,33},{-21,16},{-10,16},{-10,2.76},{-7.425,2.76}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(roomTemp.port, Room.heatPort) annotation (Line(points={{130,20},{130,0},
              {86,0},{86,-10}}, color={191,0,0}));
      connect(roomTemptoKelvin.Kelvin, roomTemp.T)
        annotation (Line(points={{75,108},{130,108},{130,42}}, color={0,0,127}));
      connect(combiTimeTable.y[1], roomTemptoKelvin.Fahrenheit) annotation (Line(
            points={{-119,70},{-80,70},{-80,108},{52,108}}, color={0,0,127}));
      connect(combiTimeTable.y[2], returnTemptoKelvin.Fahrenheit) annotation (Line(
            points={{-119,70},{-80,70},{-80,88},{-36,88}},color={0,0,127}));
      connect(outsideTemptoKelvin.Kelvin, sourceSideMassFlowSource.T_in)
        annotation (Line(points={{-69,-66},{-56,-66}}, color={0,0,127}));
      connect(combiTimeTable.y[4], outsideTemptoKelvin.Fahrenheit) annotation (Line(
            points={{-119,70},{-106,70},{-106,-66},{-92,-66}}, color={0,0,127}));
      connect(combiTimeTable.y[5], from_cfm.u)
        annotation (Line(points={{-119,70},{-72,70}}, color={0,0,127}));
      connect(Room.ports[2], senDen.port_b) annotation (Line(points={{76,-22},{72,-22},
              {72,0},{68,0}}, color={0,127,255}));
      connect(from_cfm.y, m3s_kgs.u1)
        annotation (Line(points={{-48,70},{-36,70}}, color={0,0,127}));
      connect(senDen.d, m3s_kgs.u2) annotation (Line(points={{58,11},{-44,11},{-44,58},
              {-36,58}}, color={0,0,127}));
      connect(combiTimeTable.y[3], supplyTemptoKelvin.Fahrenheit) annotation (Line(
            points={{-119,70},{-106,70},{-106,-84},{-92,-84}}, color={0,0,127}));
      connect(senDen.port_a, fanSup.port_a) annotation (Line(points={{48,0},{
              46,0},{46,28},{44,28}},
                               color={0,127,255}));
      connect(heatPump.port_a1, fanSup.port_b)
        annotation (Line(points={{16.5,3},{16.5,28},{24,28}}, color={0,127,255}));
      connect(m3s_kgs.y, fanSup.m_flow_in) annotation (Line(points={{-13,64},
              {-2,64},{-2,44},{34,44},{34,40}},
                                        color={0,0,127}));
      connect(combiTimeTable.y[9], powerTotMea) annotation (Line(points={{
              -119,70},{-106,70},{-106,-100},{110,-100}}, color={0,0,127}));
      connect(supplyTemptoKelvin.Kelvin, supplyTemptoCelsius.Kelvin)
        annotation (Line(points={{-69,-84},{18,-84}}, color={0,0,127}));
      connect(supplyTemptoCelsius.Celsius, supplyTempMea)
        annotation (Line(points={{41,-84},{110,-84}}, color={0,0,127}));
      connect(returnTemptoKelvin.Kelvin, returnTemptoCelsius.Kelvin)
        annotation (Line(points={{-13,88},{52,88}}, color={0,0,127}));
      connect(returnTemptoCelsius.Celsius, returnTempMea)
        annotation (Line(points={{75,88},{110,88}}, color={0,0,127}));
      connect(gain.y, sta_nSet.u1)
        annotation (Line(points={{-67,-40},{-44,-40},{-44,-26}}, color={0,0,127}));
      connect(booleanToReal.y, sta_nSet.u2) annotation (Line(points={{7,23.5},{7,20},
              {-24,20},{-24,-34},{-32,-34},{-32,-26}}, color={0,0,127}));
      connect(sta_nSet.y, sigBus1.nSet) annotation (Line(points={{-38,-3},{-38,24},{
              -24,24},{-24,33.085},{-20.925,33.085}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(sta.u1, combiTimeTable.y[10]) annotation (Line(points={{-132,4},{-132,
              24},{-106,24},{-106,70},{-119,70}}, color={0,0,127}));
      connect(sta.u2, combiTimeTable.y[11]) annotation (Line(points={{-120,4},{-120,
              24},{-106,24},{-106,70},{-119,70}}, color={0,0,127}));
      connect(sta.y, gain.u) annotation (Line(points={{-126,-19},{-126,-40},{-90,-40}},
            color={0,0,127}));
      connect(basPow.y, pow.u2)
        annotation (Line(points={{100.8,66},{140,66}}, color={0,0,127}));
      connect(pow.y, powerTotMod)
        annotation (Line(points={{163,60},{180,60}}, color={0,0,127}));
      connect(pow.u1, sigBus1.PelMea) annotation (Line(points={{140,54},{100,
              54},{100,32},{54,32},{54,40},{-20,40},{-20,33.085},{-20.925,
              33.085}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}})),
        experiment(
          StopTime=7000,
          Interval=60,
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
</html>", revisions="<html><ul>
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
    end HeatPumpCalibration;

    annotation (Icon(graphics={
          Rectangle(
            lineColor={200,200,200},
            fillColor={248,248,248},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0),
          Rectangle(
            lineColor={128,128,128},
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0),
          Polygon(
            origin={8.0,14.0},
            lineColor={78,138,73},
            fillColor={78,138,73},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}));
  end Validation;

  package BaseClasses "base class models for RTU HP"

    model RTUHP_VS "Model for RTU HP"

     replaceable package Medium_sou = Buildings.Media.Air;
     replaceable package Medium_sin = Buildings.Media.Air;
     parameter Real refIneFre = refIneFre "refrigerant inertia parameter";

     Buildings.Fluid.Sources.MassFlowSource_T inSou(
        use_T_in=true,
        m_flow=1,
        nPorts=1,
        redeclare package Medium = Medium_sou) "Ideal mass flow source at the inlet of the source side"
        annotation (Placement(transformation(extent={{-62,-74},{-42,-54}})));
     Buildings.Fluid.Sources.Boundary_pT outSou(nPorts=1, redeclare package
          Medium = Medium_sou)
        "Fixed boundary at the outlet of the source side" annotation (
          Placement(transformation(
            extent={{-11,11},{11,-11}},
            rotation=0,
            origin={-53,-29})));
      hil_flexlab_model.Test2.Fluid1.HeatPumps.HeatPump heaPum(
        Q_useNominal=6535,
        refIneFre_constant=refIneFre,
        nthOrder=3,
        useBusConnectorOnly=true,
        CEva=100,
        GEvaOut=5,
        CCon=100,
        GConOut=5,
        dpEva_nominal=0,
        dpCon_nominal=0,
        VCon=0.4,
        use_conCap=false,
        redeclare package Medium_con = Medium_sin,
        redeclare package Medium_eva = Medium_sou,
        use_refIne=true,
        use_rev=false,
        TCon_start=290.15,
        TEva_start=281.15,
        redeclare model PerDataMainHP =
            AixLib.DataBase.HeatPump.PerformanceData.LookUpTable2D (dataTable=
                hil_flexlab_model.Test2.Fluid1.HeatPumps.Data.RongxinSampleHP()),
        redeclare model PerDataRevHP =
            AixLib.DataBase.Chiller.PerformanceData.LookUpTable2D (smoothness=
                Modelica.Blocks.Types.Smoothness.LinearSegments, dataTable=
                AixLib.DataBase.Chiller.EN14511.Vitocal200AWO201()),
        VEva=0.04,
        use_evaCap=false,
        scalingFactor=1.35,
        energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
        mFlow_conNominal=0.5,
        mFlow_evaNominal=0.5,
        use_autoCalc=true,
        TAmbEva_nominal=273.15,
        TAmbCon_nominal=288.15) annotation (Placement(transformation(
            extent={{-23,-28},{23,28}},
            rotation=0,
            origin={3.00001,-14})));

     Modelica.Blocks.Sources.BooleanConstant heaOn annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-52,64})));

      Buildings.Fluid.Sensors.TemperatureTwoPort senTAct(
        final m_flow_nominal=heaPum.m1_flow_nominal,
        final tau=1,
        final initType=Modelica.Blocks.Types.Init.InitialState,
        final tauHeaTra=1200,
        final allowFlowReversal=heaPum.allowFlowReversalCon,
        final transferHeat=false,
        redeclare final package Medium = Medium_sin,
        final T_start=303.15,
        final TAmb=291.15) "Temperature at sink inlet" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={60,0})));
     Modelica.Blocks.Sources.Constant iceFac(final k=1)
       "Fixed value for icing factor. 1 means no icing/frosting (full heat transfer in heat exchanger)" annotation (Placement(
           transformation(
           extent={{8,8},{-8,-8}},
           rotation=180,
           origin={-60,20})));
     AixLib.Controls.Interfaces.VapourCompressionMachineControlBus sigBus1
       annotation (Placement(transformation(extent={{-36,16},{-6,50}}),
           iconTransformation(extent={{-24,24},{-6,50}})));
     Modelica.Blocks.Interfaces.RealOutput PEle(quantity="Power", unit="W")
        "Electrical power consumed by the unit"
        annotation (Placement(transformation(extent={{100,70},{120,90}})));
     Modelica.Blocks.Interfaces.RealInput TEvaIn(quantity=
            "ThermodynamicTemperature", unit="K", displayUnit="degC")
        "Outside air dry bulb temperature" annotation (Placement(
            transformation(extent={{-120,-90},{-100,-70}})));
     Modelica.Blocks.Interfaces.RealInput sta "Heating stage" annotation (
          Placement(transformation(extent={{-120,70},{-100,90}}),
            iconTransformation(extent={{-120,70},{-100,90}})));
     Modelica.Blocks.Interfaces.RealOutput TSup(quantity=
            "ThermodynamicTemperature", unit="K", displayUnit="degC")
        "Electrical power consumed by the unit"
        annotation (Placement(transformation(extent={{100,50},{120,70}})));
     Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
           Medium_sin)
       annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
     Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
           Medium_sin)
       annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    equation
      connect(inSou.ports[1], heaPum.port_a2) annotation (Line(points={{-42,
              -64},{26,-64},{26,-28}}, color={0,127,255}));
      connect(heaPum.port_b2, outSou.ports[1]) annotation (Line(points={{-20,
              -28},{-42,-28},{-42,-29}}, color={0,127,255}));
      connect(heaPum.port_b1, senTAct.port_a)
        annotation (Line(points={{26,0},{50,0}}, color={0,127,255}));
      connect(heaOn.y, sigBus1.modeSet) annotation (Line(points={{-45.4,64},{
              -22,64},{-22,33.085},{-20.925,33.085}}, color={255,0,255}),
          Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
     connect(iceFac.y,sigBus1. iceFacMea) annotation (Line(points={{-51.2,20},{-24,
             20},{-24,32},{-22,32},{-22,33.085},{-20.925,33.085}},
                                                 color={0,0,127}), Text(
         string="%second",
         index=1,
         extent={{6,3},{6,3}},
         horizontalAlignment=TextAlignment.Left));
      connect(sigBus1, heaPum.sigBus) annotation (Line(
          points={{-21,33},{-21,16},{-30,16},{-30,-23.1},{-19.77,-23.1}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(sigBus1.PelMea, PEle) annotation (Line(
          points={{-20.925,33.085},{-4,33.085},{-4,80},{110,80}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(senTAct.T, TSup) annotation (Line(points={{60,11},{60,60},{110,
              60}}, color={0,0,127}));
      connect(port_a, heaPum.port_a1)
        annotation (Line(points={{-100,0},{-20,0}}, color={0,127,255}));
     connect(senTAct.port_b,port_b)
       annotation (Line(points={{70,0},{100,0}}, color={0,127,255}));
      connect(TEvaIn, inSou.T_in) annotation (Line(points={{-110,-80},{-86,-80},
              {-86,-60},{-64,-60}}, color={0,0,127}));
      connect(sta, sigBus1.nSet) annotation (Line(points={{-110,80},{-68,80},
              {-68,33.085},{-20.925,33.085}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
     annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
           coordinateSystem(preserveAspectRatio=false)));
    end RTUHP_VS;

    model RTUHP_Cool "Model for RTU HP"

     replaceable package Medium_sou = Buildings.Media.Air;
     replaceable package Medium_sin = Buildings.Media.Air;
     parameter Real refIneFre = refIneFre "refrigerant inertia parameter";

     Buildings.Fluid.Sources.MassFlowSource_T inSou(
        use_T_in=true,
        m_flow=1,
        nPorts=1,
        redeclare package Medium = Medium_sou) "Ideal mass flow source at the inlet of the source side"
        annotation (Placement(transformation(extent={{-62,-74},{-42,-54}})));
     Buildings.Fluid.Sources.Boundary_pT outSou(nPorts=1, redeclare package
          Medium = Medium_sou)
        "Fixed boundary at the outlet of the source side" annotation (
          Placement(transformation(
            extent={{-11,11},{11,-11}},
            rotation=0,
            origin={-53,-29})));
      hil_flexlab_model.Test2.Fluid1.HeatPumps.HeatPump heaPum(
        Q_useNominal=6535,
        refIneFre_constant=refIneFre,
        nthOrder=3,
        useBusConnectorOnly=true,
        CEva=100,
        GEvaOut=5,
        CCon=100,
        GConOut=5,
        dpEva_nominal=0,
        dpCon_nominal=0,
        VCon=0.4,
        use_conCap=false,
        redeclare package Medium_con = Medium_sin,
        redeclare package Medium_eva = Medium_sou,
        use_refIne=true,
        use_rev=true,
        TCon_start=290.15,
        TEva_start=281.15,
        redeclare model PerDataMainHP =
            AixLib.DataBase.HeatPump.PerformanceData.LookUpTable2D (dataTable=
                hil_flexlab_model.Test2.Fluid1.HeatPumps.Data.RongxinSampleHP()),
        redeclare model PerDataRevHP =
            AixLib.DataBase.Chiller.PerformanceData.LookUpTable2D (smoothness=
                Modelica.Blocks.Types.Smoothness.LinearSegments, dataTable=
                hil_flexlab_model.Fluid.HeatPumps.Data.AAONRQ002Cooling()),
        VEva=0.04,
        use_evaCap=false,
        scalingFactor=1.35,
        energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
        mFlow_conNominal=0.5,
        mFlow_evaNominal=0.5,
        use_autoCalc=true,
        TAmbEva_nominal=273.15,
        TAmbCon_nominal=288.15) annotation (Placement(transformation(
            extent={{-23,-28},{23,28}},
            rotation=0,
            origin={3.00001,-14})));

      Buildings.Fluid.Sensors.TemperatureTwoPort senTAct(
        final m_flow_nominal=heaPum.m1_flow_nominal,
        final tau=1,
        final initType=Modelica.Blocks.Types.Init.InitialState,
        final tauHeaTra=1200,
        final allowFlowReversal=heaPum.allowFlowReversalCon,
        final transferHeat=false,
        redeclare final package Medium = Medium_sin,
        final T_start=303.15,
        final TAmb=291.15) "Temperature at sink inlet" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={60,0})));
     Modelica.Blocks.Sources.Constant iceFac(final k=1)
       "Fixed value for icing factor. 1 means no icing/frosting (full heat transfer in heat exchanger)" annotation (Placement(
           transformation(
           extent={{8,8},{-8,-8}},
           rotation=180,
           origin={-60,20})));
     Modelica.Blocks.Math.Gain nSetGai(k=0.5)
        annotation (Placement(transformation(extent={{-90,36},{-70,56}})));
     AixLib.Controls.Interfaces.VapourCompressionMachineControlBus sigBus1
       annotation (Placement(transformation(extent={{-36,16},{-6,50}}),
           iconTransformation(extent={{-24,24},{-6,50}})));
     Modelica.Blocks.Interfaces.RealOutput PEle(quantity="Power", unit="W")
        "Electrical power consumed by the unit"
        annotation (Placement(transformation(extent={{100,70},{120,90}})));
     Modelica.Blocks.Interfaces.RealInput TEvaIn(quantity=
            "ThermodynamicTemperature", unit="K", displayUnit="degC")
        "Outside air dry bulb temperature" annotation (Placement(
            transformation(extent={{-120,-90},{-100,-70}})));
     Modelica.Blocks.Interfaces.RealInput sta "Heating stage" annotation (
          Placement(transformation(extent={{-120,52},{-100,72}}),
            iconTransformation(extent={{-120,52},{-100,72}})));
     Modelica.Blocks.Interfaces.RealOutput TSup(quantity=
            "ThermodynamicTemperature", unit="K", displayUnit="degC")
        "Electrical power consumed by the unit"
        annotation (Placement(transformation(extent={{100,50},{120,70}})));
     Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
           Medium_sin)
       annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
     Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
           Medium_sin)
       annotation (Placement(transformation(extent={{90,-10},{110,10}})));
     Modelica.Blocks.Interfaces.BooleanInput heasta "Heating stage"
        annotation (Placement(transformation(extent={{-120,80},{-100,100}}),
            iconTransformation(extent={{-120,80},{-100,100}})));
    equation
      connect(inSou.ports[1], heaPum.port_a2) annotation (Line(points={{-42,
              -64},{26,-64},{26,-28}}, color={0,127,255}));
      connect(heaPum.port_b2, outSou.ports[1]) annotation (Line(points={{-20,
              -28},{-42,-28},{-42,-29}}, color={0,127,255}));
      connect(heaPum.port_b1, senTAct.port_a)
        annotation (Line(points={{26,0},{50,0}}, color={0,127,255}));
     connect(iceFac.y,sigBus1. iceFacMea) annotation (Line(points={{-51.2,20},{-24,
             20},{-24,32},{-22,32},{-22,33.085},{-20.925,33.085}},
                                                 color={0,0,127}), Text(
         string="%second",
         index=1,
         extent={{6,3},{6,3}},
         horizontalAlignment=TextAlignment.Left));
      connect(sigBus1, heaPum.sigBus) annotation (Line(
          points={{-21,33},{-21,16},{-30,16},{-30,-23.1},{-19.77,-23.1}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(sigBus1.PelMea, PEle) annotation (Line(
          points={{-20.925,33.085},{-4,33.085},{-4,80},{110,80}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(nSetGai.y, sigBus1.nSet) annotation (Line(points={{-69,46},{-46,
              46},{-46,33.085},{-20.925,33.085}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(senTAct.T, TSup) annotation (Line(points={{60,11},{60,60},{110,
              60}}, color={0,0,127}));
      connect(port_a, heaPum.port_a1)
        annotation (Line(points={{-100,0},{-20,0}}, color={0,127,255}));
     connect(senTAct.port_b,port_b)
       annotation (Line(points={{70,0},{100,0}}, color={0,127,255}));
      connect(TEvaIn, inSou.T_in) annotation (Line(points={{-110,-80},{-86,-80},
              {-86,-60},{-64,-60}}, color={0,0,127}));
      connect(sta, nSetGai.u) annotation (Line(points={{-110,62},{-100,62},{
              -100,46},{-92,46}}, color={0,0,127}));
      connect(heasta, sigBus1.modeSet) annotation (Line(points={{-110,90},{
              -22,90},{-22,33.085},{-20.925,33.085}}, color={255,0,255}),
          Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
     annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
           coordinateSystem(preserveAspectRatio=false)));
    end RTUHP_Cool;

    annotation (Icon(graphics={
          Rectangle(
            lineColor={200,200,200},
            fillColor={248,248,248},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0),
          Rectangle(
            lineColor={128,128,128},
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0),
          Ellipse(
            extent={{-30.0,-30.0},{30.0,30.0}},
            lineColor={128,128,128},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}));
  end BaseClasses;

  annotation (Icon(graphics={
        Rectangle(
          lineColor={200,200,200},
          fillColor={248,248,248},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-100.0,-100.0},{100.0,100.0}},
          radius=25.0),
        Rectangle(
          lineColor={128,128,128},
          extent={{-100.0,-100.0},{100.0,100.0}},
          radius=25.0),
        Ellipse(
          origin={10.0,10.0},
          fillColor={76,76,76},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{-80.0,-80.0},{-20.0,-20.0}}),
        Ellipse(
          origin={10.0,10.0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{0.0,-80.0},{60.0,-20.0}}),
        Ellipse(
          origin={10.0,10.0},
          fillColor={128,128,128},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{0.0,0.0},{60.0,60.0}}),
        Ellipse(
          origin={10.0,10.0},
          lineColor={128,128,128},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-80.0,0.0},{-20.0,60.0}})}));
end HeatPumps;
