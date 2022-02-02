within hil_flexlab_model;
package Fluid "Package with models for fluid flow systems"
  package HeatPump "Package with model for heat pump"
    model HeatPump
      "Grey-box model for reversible heat pumps using a black-box to simulate the refrigeration cycle"
      extends
        AixLib.Fluid.BaseClasses.PartialReversibleVapourCompressionMachine(
      use_rev=true,
      final machineType = true,
      redeclare AixLib.Fluid.HeatPumps.BaseClasses.InnerCycle_HeatPump innerCycle(
          final use_rev=use_rev,
          final scalingFactor=scalingFactor,
          redeclare model PerDataMainHP = PerDataMainHP,
          redeclare model PerDataRevHP = PerDataRevHP));

      replaceable model PerDataMainHP =
          AixLib.DataBase.HeatPump.PerformanceData.BaseClasses.PartialPerformanceData
      "Performance data of a heat pump in main operation mode"
        annotation (choicesAllMatching=true);
      replaceable model PerDataRevHP =
          AixLib.DataBase.Chiller.PerformanceData.BaseClasses.PartialPerformanceData
      "Performance data of a heat pump in reversible operation mode"
        annotation (Dialog(enable=use_rev),choicesAllMatching=true);

      annotation (Icon(coordinateSystem(extent={{-100,-120},{100,120}}), graphics={
            Rectangle(
              extent={{-16,83},{16,-83}},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              origin={1,-64},
              rotation=90),
            Rectangle(
              extent={{-17,83},{17,-83}},
              fillColor={255,0,128},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0},
              origin={1,61},
              rotation=90),
            Text(
              extent={{-76,6},{74,-36}},
              lineColor={28,108,200},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Line(
              points={{-9,40},{9,40},{-5,-2},{9,-40},{-9,-40}},
              color={0,0,0},
              smooth=Smooth.None,
              origin={-3,-60},
              rotation=-90),
            Line(
              points={{9,40},{-9,40},{5,-2},{-9,-40},{9,-40}},
              color={0,0,0},
              smooth=Smooth.None,
              origin={-5,56},
              rotation=-90),
            Rectangle(
              extent={{-82,42},{84,-46}},
              lineColor={238,46,47},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Line(points={{-88,60},{88,60}}, color={28,108,200}),
            Line(points={{-88,-60},{88,-60}}, color={28,108,200}),
        Line(
        origin={-75.5,-80.333},
        points={{43.5,8.3333},{37.5,0.3333},{25.5,-1.667},{33.5,-9.667},{17.5,-11.667},{27.5,-21.667},{13.5,-23.667},
                  {11.5,-31.667}},
          smooth=Smooth.Bezier,
          visible=use_evaCap),
            Polygon(
              points={{-70,-122},{-68,-108},{-58,-114},{-70,-122}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,0},
              visible=use_evaCap),
        Line( origin={40.5,93.667},
              points={{39.5,6.333},{37.5,0.3333},{25.5,-1.667},{33.5,-9.667},{17.5,
                  -11.667},{27.5,-21.667},{13.5,-23.667},{11.5,-27.667}},
              smooth=Smooth.Bezier,
              visible=use_conCap),
            Polygon(
              points={{86,110},{84,96},{74,102},{86,110}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,0},
              visible=use_conCap),
            Line(
              points={{-42,72},{34,72}},
              color={0,0,0},
              arrow={Arrow.None,Arrow.Filled},
              thickness=0.5),
            Line(
              points={{-38,0},{38,0}},
              color={0,0,0},
              arrow={Arrow.None,Arrow.Filled},
              thickness=0.5,
              origin={0,-74},
              rotation=180)}),                Diagram(coordinateSystem(extent={{-100,
                -120},{100,120}})),
        Documentation(revisions="<html><ul>
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
</html>",     info="<html>
<p>
  This generic grey-box heat pump model uses empirical data to model
  the refrigerant cycle. The modelling of system inertias and heat
  losses allow the simulation of transient states.
</p>
<p>
  Resulting in the choosen model structure, several configurations are
  possible:
</p>
<ol>
  <li>Compressor type: on/off or inverter controlled
  </li>
  <li>Reversible heat pump / only heating
  </li>
  <li>Source/Sink: Any combination of mediums is possible
  </li>
  <li>Generik: Losses and inertias can be switched on or off.
  </li>
</ol>
<h4>
  Concept
</h4>
<p>
  Using a signal bus as a connector, this heat pump model can be easily
  combined with the new <a href=
  \"modelica://AixLib.Systems.HeatPumpSystems.HeatPumpSystem\">HeatPumpSystem</a>
  or several control or safety blocks from <a href=
  \"modelica://AixLib.Controls.HeatPump\">AixLib.Controls.HeatPump</a>.
  The relevant data is aggregated. In order to control both chillers
  and heat pumps, both flow and return temperature are aggregated. The
  mode signal chooses the type of the heat pump operation. As a result,
  this model can also be used as a chiller:
</p>
<ul>
  <li>mode = true: Heating
  </li>
  <li>mode = false: Chilling
  </li>
</ul>
<p>
  To model both on/off and inverter controlled heat pumps, the
  compressor speed is normalizd to a relative value between 0 and 1.
</p>
<p>
  Possible icing of the evaporator is modelled with an input value
  between 0 and 1.
</p>
<p>
  The model structure is as follows. To understand each submodel,
  please have a look at the corresponding model information:
</p>
<ol>
  <li>
    <a href=
    \"AixLib.Fluid.HeatPumps.BaseClasses.InnerCycle\">InnerCycle</a>
    (Black Box): Here, the user can use between several input models or
    just easily create his own, modular black box model. Please look at
    the model description for more info.
  </li>
  <li>Inertia: A n-order element is used to model system inertias (mass
  and thermal) of components inside the refrigerant cycle (compressor,
  pipes, expansion valve)
  </li>
  <li>
    <a href=
    \"modelica://AixLib.Fluid.HeatExchangers.EvaporatorCondenserWithCapacity\">
    HeatExchanger</a>: This new model also enable modelling of thermal
    interias and heat losses in a heat exchanger. Please look at the
    model description for more info.
  </li>
</ol>
<h4>
  Parametrization
</h4>
<p>
  To simplify the parametrization of the evaporator and condenser
  volumes and nominal mass flows there exists an option of automatic
  estimation based on the nominal usable heating power of the HeatPump.
  This function uses a linear correlation of these parameters, which
  was established from the linear regression of more than 20 data sets
  of water-to-water heat pumps from different manufacturers (e.g.
  Carrier, Trane, Lennox) ranging from about 25kW to 1MW nominal power.
  The linear regressions with coefficients of determination above 91%
  give a good approximation of these parameters. Nevertheless,
  estimates for machines outside the given range should be checked for
  plausibility during simulation.
</p>
<h4>
  Assumptions
</h4>
<p>
  Several assumptions where made in order to model the heat pump. For a
  detailed description see the corresponding model.
</p>
<ol>
  <li>
    <a href=
    \"modelica://AixLib.Fluid.HeatPumps.BaseClasses.PerformanceData.LookUpTable2D\">
    Performance data 2D</a>: In order to model inverter controlled heat
    pumps, the compressor speed is scaled <b>linearly</b>
  </li>
  <li>
    <a href=
    \"modelica://AixLib.Fluid.HeatPumps.BaseClasses.PerformanceData.LookUpTable2D\">
    Performance data 2D</a>: Reduced evaporator power as a result of
    icing. The icing factor is multiplied with the evaporator power.
  </li>
  <li>
    <b>Inertia</b>: The default value of the n-th order element is set
    to 3. This follows comparisons with experimental data. Previous
    heat pump models are using n = 1 as a default. However, it was
    pointed out that a higher order element fits a real heat pump
    better in.
  </li>
  <li>
    <b>Scaling factor</b>: A scaling facor is implemented for scaling
    of the heat pump power and capacity. The factor scales the
    parameters V, m_flow_nominal, C, GIns, GOut and dp_nominal. As a
    result, the heat pump can supply more heat with the COP staying
    nearly constant. However, one has to make sure that the supplied
    pressure difference or mass flow is also scaled with this factor,
    as the nominal values do not increase said mass flow.
  </li>
</ol>
<h4>
  Known Limitations
</h4>
<ul>
  <li>The n-th order element has a big influence on computational time.
  Reducing the order or disabling it completly will decrease
  computational time.
  </li>
  <li>Reversing the mode: A normal 4-way-exchange valve suffers from
  heat losses and irreversibilities due to switching from one mode to
  another. Theses losses are not taken into account.
  </li>
</ul>
</html>"));
    end HeatPump;

    package Examples
      "Collection of models that illustrate model use and test models"

      model HeatPump "Example for the reversible heat pump model."
       extends Modelica.Icons.Example;

        replaceable package Medium_sin = Buildings.Media.Water
          constrainedby Modelica.Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
        replaceable package Medium_sou = Buildings.Media.Water
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
        hil_flexlab_model.Fluid.HeatPump.HeatPump heatPump(
          Q_useNominal=6535,
          refIneFre_constant=1,
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
          use_refIne=false,
          use_rev=false,
          redeclare model PerDataMainHP =
              AixLib.DataBase.HeatPump.PerformanceData.LookUpTable2D (dataTable
                =hil_flexlab_model.Fluid.HeatPump.PerformanceData.RongxinSampleHP()),

          redeclare model PerDataRevHP =
              AixLib.DataBase.Chiller.PerformanceData.LookUpTable2D (smoothness
                =Modelica.Blocks.Types.Smoothness.LinearSegments, dataTable=
                  AixLib.DataBase.Chiller.EN14511.Vitocal200AWO201()),
          VEva=0.04,
          use_evaCap=false,
          scalingFactor=1,
          energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
          mFlow_conNominal=0.5,
          mFlow_evaNominal=0.5,
          use_autoCalc=true,
          TAmbEva_nominal=273.15,
          TAmbCon_nominal=288.15,
          TCon_start=303.15) annotation (Placement(transformation(
              extent={{-24,-29},{24,29}},
              rotation=270,
              origin={2,-21})));

        Modelica.Blocks.Sources.BooleanStep     booleanStep(startTime=1800,
            startValue=true)
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
          uLow=273.15 + 30,
          uHigh=273.15 + 35)
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
          annotation (Placement(transformation(extent={{58,40},{48,50}})));
        AixLib.Controls.Interfaces.VapourCompressionMachineControlBus sigBus1
          annotation (Placement(transformation(extent={{-34,22},{-4,56}}),
              iconTransformation(extent={{-22,30},{-4,56}})));
      equation

        connect(sourceSideMassFlowSource.ports[1], heatPump.port_a2) annotation (Line(
              points={{-34,-70},{-24,-70},{-24,-45},{-12.5,-45}}, color={0,127,255}));
        connect(nIn.y, pumSou.Nrpm)
          annotation (Line(points={{50,29.6},{50,24}}, color={0,0,127}));
        connect(Room.heatPort, heatFlowRateCon.port)
          annotation (Line(points={{86,-10},{86,0}},        color={191,0,0}));
        connect(sine.y, gain.u) annotation (Line(points={{84.4,30},{92,30},{92,24.8}},
                            color={0,0,127}));
        connect(heatFlowRateCon.Q_flow, gain.y) annotation (Line(points={{86,12},{86,
                14},{92,14},{92,15.6}},   color={0,0,127}));
        connect(heatPump.port_b2, sourceSideFixedBoundary.ports[1]) annotation (Line(
              points={{-12.5,3},{-70,3}},                   color={0,127,255}));
        connect(heatPump.port_b1, senTAct.port_a) annotation (Line(points={{16.5,-45},
                {30,-45},{30,-64},{44,-64}}, color={0,127,255}));
        connect(Room.ports[1], pumSou.port_a) annotation (Line(points={{76,-18},{76,4},
                {60,4},{60,12}}, color={0,127,255}));
        connect(pumSou.port_b, heatPump.port_a1) annotation (Line(points={{40,12},{28,
                12},{28,3},{16.5,3}}, color={0,127,255}));
        connect(senTAct.T, hysHeating.u) annotation (Line(points={{54,-53},{54,-54},{
                54,-54},{54,-54},{54,-8},{70,-8},{70,63},{67,63}}, color={0,0,127}));
        connect(hysHeating.y, not2.u)
          annotation (Line(points={{55.5,63},{51,63}}, color={255,0,255}));
        connect(senTAct.port_b, sinkSideFixedBoundary.ports[1]) annotation (Line(
              points={{64,-64},{72,-64},{72,-64},{78,-64}}, color={0,127,255}));
        connect(senTAct.port_b, Room.ports[2]) annotation (Line(points={{64,-64},{66,
                -64},{66,-22},{76,-22}}, color={0,127,255}));
        connect(TsuSourceRamp.y, sourceSideMassFlowSource.T_in) annotation (Line(
              points={{-73,-80},{-66,-80},{-66,-66},{-56,-66}}, color={0,0,127},
              smooth=Smooth.None));
        connect(logicalSwitch.u1, not2.y) annotation (Line(points={{25,57},{36,57},{
                36,63},{39.5,63}}, color={255,0,255}));
        connect(hysCooling.y, logicalSwitch.u3) annotation (Line(points={{47.5,45},{
                36,45},{36,49},{25,49}}, color={255,0,255}));
        connect(senTAct.T, hysCooling.u) annotation (Line(points={{54,-53},{54,-54},{
                54,-54},{54,-54},{54,-54},{54,-54},{54,-8},{70,-8},{70,45},{59,45}},
              color={0,0,127}));
        connect(booleanStep.y, logicalSwitch.u2) annotation (Line(points={{-4,77.4},{
                -4,66},{32,66},{32,53},{25,53}}, color={255,0,255}));
        connect(logicalSwitch.y, booleanToReal.u)
          annotation (Line(points={{13.5,53},{7,53},{7,35}}, color={255,0,255}));
        connect(booleanStep.y, sigBus1.modeSet) annotation (Line(points={{-4,77.4},{-10,
                77.4},{-10,39.085},{-18.925,39.085}}, color={255,0,255}), Text(
            string="%second",
            index=1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        connect(iceFac.y, sigBus1.iceFacMea) annotation (Line(points={{-57.2,38},{-34,
                38},{-34,39.085},{-18.925,39.085}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(booleanToReal.y, sigBus1.nSet) annotation (Line(points={{7,23.5},{-18.925,
                23.5},{-18.925,39.085}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        connect(sigBus1, heatPump.sigBus) annotation (Line(
            points={{-19,39},{-19,16},{-10,16},{-10,2.76},{-7.425,2.76}},
            color={255,204,51},
            thickness=0.5), Text(
            string="%first",
            index=-1,
            extent={{-6,3},{-6,3}},
            horizontalAlignment=TextAlignment.Right));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}})),
          experiment(
            StopTime=1500,
            __Dymola_NumberOfIntervals=250,
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
</html>",   revisions="<html><ul>
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
</html>"),__Dymola_Commands(file="Modelica://AixLib/Resources/Scripts/Dymola/Fluid/HeatPumps/Examples/HeatPump.mos" "Simulate and plot"),
          Icon(coordinateSystem(extent={{-100,-100},{100,80}})));
      end HeatPump;
    end Examples;

    package PerformanceData
      "Different models used for a black box heat pump model"

      record HeatPumpBaseDataDefinition "Basic heat pump data"
          extends Modelica.Icons.Record;
        parameter Real tableQdot_con[:,:] "Heating power table; T in degC; Q_flow in W";
        parameter Real tableP_ele[:,:] "Electrical power table; T in degC; Q_flow in W";
        parameter Modelica.SIunits.MassFlowRate mFlow_conNom
          "Nominal mass flow rate in condenser";
        parameter Modelica.SIunits.MassFlowRate mFlow_evaNom
          "Nominal mass flow rate in evaporator";
        parameter Real tableUppBou[:,2] "Points to define upper boundary for sink temperature";

        annotation (Documentation(info="<html><h4>
  <span style=\"color: #008000\">Overview</span>
</h4>Base data definition used in the heat pump model. It defines the
table <span style=\"font-family: Courier New;\">table_Qdot_Co</span>
which gives the condenser heat flow rate and <span style=
\"font-family: Courier New;\">table_Pel</span> which gives the electric
power consumption of the heat pump. Both tables define the power values
depending on the evaporator inlet temperature (defined in first row)
and the condenser outlet temperature (defined in first column) in W.
The nominal mass flow rate in the condenser and evaporator are also
defined as parameters.
<h4>
  <span style=\"color: #008000\">Calculation of nominal mass flow
  rates</span>
</h4>
<ul>
  <li>General calculation ṁ = Q̇<sub>nominal</sub> / c<sub>p</sub> /
  ΔT
  </li>
</ul><b>Condenser</b> <span style=
\"font-family: Courier New;\">mFlow_conNom</span>
<ul>
  <li>According to <b>EN 14511</b> on <b>water</b> bound condenser side
  <span style=\"font-family: Courier New;\">ΔT = 5 K</span>
  </li>
  <li>According to EN 255 (deprecated) on <b>water</b> bound condenser
  side <span style=\"font-family: Courier New;\">ΔT = 10 K</span>
  </li>
</ul><b>Evaporator</b> <span style=
\"font-family: Courier New;\">mFlow_evaNom:</span>
<ul>
  <li>According to <b>EN 14511</b> on <b>water/glycol</b> bound
  evaporator side <span style=\"font-family: Courier New;\">ΔT = 3
  K</span>
  </li>
  <li>Possible calculation for <b>air</b> bound evaporator side <span>
    ṁ<sub>eva,nominal</sub> = (Q̇<sub>con,nominal</sub> -
    Ṗ<sub>el,nominal</sub>) / c<sub>p</sub> / ΔT</span> under the
    assumption (no literature source so far) of <span>ΔT = 5 K</span>
  </li>
</ul>
</html>",   revisions="<html><ul>
  <li>
    <i>MAy 7, 2020</i> by Philipp Mehrfeld:<br/>
    Add description of how to calculate m_flows
  </li>
  <li>
    <i>December 10, 2013</i> by Ole Odendahl:<br/>
    Formatted documentation appropriately
  </li>
</ul>
</html>
"),      Icon,     preferedView="info");
      end HeatPumpBaseDataDefinition;

      record RongxinSampleHP "RongxinSampleHP"
        extends
          hil_flexlab_model.Fluid.HeatPump.PerformanceData.HeatPumpBaseDataDefinition(
          tableP_ele=[0,-13.9,-8.3,-2.8,2.8,8.3,13.9,19.4; 18,850,930,1010,1110,
              1220,1370,1570; 21,980,1060,1160,1250,1370,1530,1730; 24,1110,
              1210,1310,1420,1540,1710,1920],
          tableQdot_con=[0,-13.9,-8.3,-2.8,2.8,8.3,13.9,19.4; 18,1800,2640,3430,
              4330,5370,6540,7850; 21,1610,2380,3260,4130,5140,6280,7570; 24,
              1390,2150,3080,3940,4910,6030,7910],
          mFlow_conNom=3960/4180/5,
          mFlow_evaNom=(2250*1.2)/3600,
          tableUppBou=[-15,25; 20,25]);

        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false)),
          Diagram(coordinateSystem(preserveAspectRatio=false)),
          Documentation(info="<html><p>
  <span style=
  \"font-family: Courier New; color: #006400;\">Data&#160;record&#160;for&#160;type&#160;AWO-M/AWO-M-E-AC&#160;201.A04,
  obtained from the technical guide in the UK.</span>
</p>
<ul>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>"));
      end RongxinSampleHP;
    end PerformanceData;
  end HeatPump;
end Fluid;
