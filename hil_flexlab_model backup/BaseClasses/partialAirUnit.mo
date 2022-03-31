within hil_flexlab_model.BaseClasses;
partial model partialAirUnit "Partial model for an air supply unit"
  replaceable package MediumA = Buildings.Media.Air "Medium model for air"
      annotation (choicesAllMatching = true);
  replaceable package MediumW = Buildings.Media.Water "Medium model for water"
      annotation (choicesAllMatching = true);

  parameter Modelica.SIunits.MassFlowRate mAir_flow_nominal "Design airflow rate of system"
    annotation(Dialog(group="Air design"));

  parameter Modelica.SIunits.MassFlowRate mAir_flow_minOA "Minimum outdoor airflow rate of system"
    annotation(Dialog(group="Air design"));

  parameter Modelica.SIunits.Power QHea_flow_nominal(min=0) "Design heating capacity of heating coil"
    annotation(Dialog(group="Heating design"));

  parameter Modelica.SIunits.Power QCoo_flow_nominal(min=0) "Design cooling capacity of cooling coil"
    annotation(Dialog(group="Cooling design"));

  parameter Modelica.SIunits.PressureDifference dp_nominal(displayUnit="Pa") = 500
    "Design pressure drop of flow leg with fan"
    annotation(Dialog(group="Air design"));

  Modelica.Blocks.Interfaces.RealInput uFan(
    final unit="1") "Fan control signal"
    annotation (Placement(transformation(extent={{-240,120},{-200,160}})));
  Modelica.Blocks.Interfaces.RealInput uHea(
    final unit="1") "Control signal for heating"
    annotation (Placement(transformation(extent={{-240,60},{-200,100}})));
  Modelica.Blocks.Interfaces.RealInput uCoo(final unit="1")
    "Control signal for cooling"
    annotation (Placement(transformation(extent={{-240,0},{-200,40}})));
  Modelica.Blocks.Interfaces.RealInput uEco "Control signal for economizer"
    annotation (Placement(transformation(extent={{-240,-60},{-200,-20}})));

  Modelica.Fluid.Interfaces.FluidPort_a supplyAir(
    redeclare final package Medium = MediumA) "Supply air"
    annotation (Placement(transformation(extent={{190,30},{210,50}}),
        iconTransformation(extent={{190,30},{210,50}})));
  Modelica.Fluid.Interfaces.FluidPort_b returnAir(
    redeclare final package Medium = MediumA) "Return air"
    annotation (Placement(transformation(extent={{190,-50},{210,-30}}),
        iconTransformation(extent={{190,-50},{210,-30}})));

  Modelica.Blocks.Interfaces.RealOutput PFan(final unit="W")
    "Electrical power consumed by the supply fan"
    annotation (Placement(transformation(extent={{200,130},{220,150}}),
        iconTransformation(extent={{200,130},{220,150}})));

  Modelica.Blocks.Interfaces.RealOutput TMixAir(
    final unit="K",
    displayUnit="degC") "Mixed air temperature"
    annotation (Placement(transformation(extent={{200,-170},{220,-150}}),
        iconTransformation(extent={{200,-170},{220,-150}})));

  Modelica.Blocks.Interfaces.RealOutput TSup(
    final unit="K",
    displayUnit="degC") "Supply air temperature after cooling coil"
    annotation (Placement(transformation(extent={{200,-190},{220,-170}}),
        iconTransformation(extent={{200,-190},{220,-170}})));

  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather bus"
  annotation (Placement(
        transformation(extent={{-200,150},{-160,190}}), iconTransformation(
          extent={{-170,128},{-150,148}})));

  Buildings.Fluid.Sensors.TemperatureTwoPort senTSup(
    m_flow_nominal=mAir_flow_nominal,
    allowFlowReversal=false,
    redeclare package Medium = MediumA,
    tau=0)                              "Supply air temperature sensor"
    annotation (Placement(transformation(extent={{130,30},{150,50}})));

  Buildings.Fluid.Movers.FlowControlled_m_flow fanSup(
    m_flow_nominal=mAir_flow_nominal,
    addPowerToMedium=false,
    nominalValuesDefineDefaultPressureCurve=true,
    dp_nominal=dp_nominal,
    per(
      use_powerCharacteristic=false,
      hydraulicEfficiency(eta={hydraulicEfficiency}),
      motorEfficiency(eta={motorEfficiency})),
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    allowFlowReversal=false,
    use_inputFilter=true,
    redeclare package Medium = MediumA) "Supply fan"
    annotation (Placement(transformation(extent={{-30,30},{-10,50}})));

  Buildings.Fluid.FixedResistances.PressureDrop totalRes(
    m_flow_nominal=mAir_flow_nominal,
    dp_nominal=dp_nominal,
    allowFlowReversal=false,
    redeclare package Medium = MediumA)
    annotation (Placement(transformation(extent={{0,30},{20,50}})));

  Buildings.Fluid.Sources.Outside out(
    redeclare package Medium = MediumA, nPorts=2)
    "Boundary conditions for outside air"
    annotation (Placement(transformation(extent={{-180,-22},{-160,-2}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTMixAir(
    m_flow_nominal=mAir_flow_nominal,
    allowFlowReversal=false,
    redeclare package Medium = MediumA,
    tau=0)
    "Mixed air temperature sensor"
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));

  Modelica.Blocks.Math.Gain gaiFan(k=mAir_flow_nominal)
    "Gain for fan mass flow rate"
    annotation (Placement(transformation(extent={{-80,130},{-60,150}})));

  hil_flexlab_model.BaseClasses.IdealValve ideEco(redeclare package Medium = MediumA, final
      m_flow_nominal=mAir_flow_nominal) "Ideal economizer" annotation (Placement(transformation(
        rotation=90,
        extent={{10,-10},{-10,10}},
        origin={-80,46})));

  Modelica.Blocks.Interfaces.RealOutput phiRetAir
    "Relative humidity of return air"
    annotation (Placement(transformation(extent={{200,-250},{220,-230}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTRetAir(
    m_flow_nominal=mAir_flow_nominal,
    allowFlowReversal=false,
    redeclare package Medium = MediumA,
    tau=0)                              "Return air temperature sensor"
    annotation (Placement(transformation(extent={{-10,-30},{-30,-50}})));
  Modelica.Blocks.Interfaces.RealOutput TRet(final unit="K", displayUnit="degC")
    "Return air temperature" annotation (Placement(transformation(extent={{200,
            -230},{220,-210}}), iconTransformation(extent={{200,-230},{220,-210}})));
  Buildings.Fluid.Sensors.RelativeHumidityTwoPort senRelHumRetAir(
    redeclare package Medium = MediumA,
    allowFlowReversal=false,
    m_flow_nominal=mAir_flow_nominal,
    tau=0) "Relative humidity of return air"
    annotation (Placement(transformation(extent={{-40,-30},{-60,-50}})));
  Buildings.Fluid.Sensors.RelativeHumidityTwoPort senRelHumSupAir(
    redeclare package Medium = MediumA,
    allowFlowReversal=false,
    m_flow_nominal=mAir_flow_nominal,
    tau=0) "Relative humidity of supply air"
    annotation (Placement(transformation(extent={{160,30},{180,50}})));
  Modelica.Blocks.Interfaces.RealOutput phiSupAir
    "Supply air relative humidity after cooling coil"
    annotation (Placement(transformation(extent={{200,-210},{220,-190}})));
  Modelica.Blocks.Interfaces.RealOutput mFloSup(final unit="kg/s")
    "Supply air flowrate" annotation (Placement(transformation(extent={{200,
            -110},{220,-90}}), iconTransformation(extent={{200,-110},{220,-90}})));
  Modelica.Blocks.Interfaces.RealOutput mFloOut(final unit="kg/s")
    "Outside air flowrate" annotation (Placement(transformation(extent={{200,
            -130},{220,-110}}),iconTransformation(extent={{200,-130},{220,-110}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFloSup(redeclare package Medium =
        MediumA) "Supply air flowrate sensor"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFloOut(redeclare package Medium =
        MediumA) "Outside air flowrate sensor" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-94,18})));
  parameter Modelica.SIunits.DimensionlessRatio hydraulicEfficiency = 0.7 "Supply fan hydraulic efficiency";
  parameter Modelica.SIunits.DimensionlessRatio motorEfficiency = 0.7 "Supply fan motor efficiency";
  Modelica.Blocks.Interfaces.RealOutput QHea(final unit="W")
    "Thermal load on heating coil" annotation (Placement(transformation(extent=
            {{200,-70},{220,-50}}), iconTransformation(extent={{200,-70},{220,
            -50}})));
  Modelica.Blocks.Interfaces.RealOutput QCoo(final unit="W")
    "Thermal load on cooling coil" annotation (Placement(transformation(extent=
            {{200,-90},{220,-70}}), iconTransformation(extent={{200,-90},{220,
            -70}})));
protected
  parameter Real HRSizeMinOAMult = 1.25 "IECHR size multiplier over minimum OA flowrate";
equation
  connect(fanSup.port_b, totalRes.port_a)
    annotation (Line(points={{-10,40},{0,40}},   color={0,127,255}));
  connect(fanSup.P, PFan) annotation (Line(points={{-9,49},{-6,49},{-6,140},{210,
          140}},             color={0,0,127}));
  connect(weaBus, out.weaBus) annotation (Line(
      points={{-180,170},{-180,-11.8}},
      color={255,204,51},
      thickness=0.5), Text(
      textString="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(senTMixAir.port_b, fanSup.port_a)
    annotation (Line(points={{-40,40},{-30,40}},          color={0,127,255}));

  connect(gaiFan.y, fanSup.m_flow_in)
    annotation (Line(points={{-59,140},{-20,140},{-20,52}}, color={0,0,127}));

  connect(gaiFan.u, uFan)
    annotation (Line(points={{-82,140},{-220,140}}, color={0,0,127}));
  connect(senTMixAir.T, TMixAir) annotation (Line(points={{-50,51},{-50,70},{188,
          70},{188,-160},{210,-160}},
                                    color={0,0,127}));
  connect(senTSup.T, TSup) annotation (Line(points={{140,51},{140,64},{154,64},
          {154,-180},{210,-180}},color={0,0,127}));
  connect(ideEco.port_2, senTMixAir.port_a)
    annotation (Line(points={{-70.2,40},{-60,40}}, color={0,127,255}));
  connect(senTRetAir.T,TRet)  annotation (Line(points={{-20,-51},{-20,-220},{
          210,-220}},                  color={0,0,127}));
  connect(senRelHumRetAir.phi, phiRetAir) annotation (Line(points={{-50.1,-51},
          {-50.1,-240},{210,-240}},                   color={0,0,127}));
  connect(senTRetAir.port_a, returnAir)
    annotation (Line(points={{-10,-40},{200,-40}}, color={0,127,255}));
  connect(senTRetAir.port_b, senRelHumRetAir.port_a) annotation (Line(points={{-30,-40},
          {-40,-40}},                              color={0,127,255}));
  connect(senRelHumRetAir.port_b, ideEco.port_3)
    annotation (Line(points={{-60,-40},{-80,-40},{-80,36}},color={0,127,255}));
  connect(senTSup.port_b, senRelHumSupAir.port_a)
    annotation (Line(points={{150,40},{160,40}}, color={0,127,255}));
  connect(senRelHumSupAir.port_b, supplyAir)
    annotation (Line(points={{180,40},{200,40}}, color={0,127,255}));
  connect(senRelHumSupAir.phi, phiSupAir) annotation (Line(points={{170.1,51},{
          170.1,64},{180,64},{180,-200},{210,-200}}, color={0,0,127}));
  connect(senMasFloSup.port_b, senTSup.port_a) annotation (Line(points={{120,40},
          {124,40},{124,40},{130,40}}, color={0,127,255}));
  connect(ideEco.port_1, senMasFloOut.port_b) annotation (Line(points={{-89.8,
          40},{-94,40},{-94,28}}, color={0,127,255}));
  connect(senMasFloSup.m_flow, mFloSup) annotation (Line(points={{110,51},{110,
          64},{126,64},{126,-100},{210,-100}}, color={0,0,127}));
  connect(senMasFloOut.m_flow, mFloOut) annotation (Line(points={{-105,18},{
          -130,18},{-130,-120},{210,-120}}, color={0,0,127}));
  connect(out.ports[1], ideEco.port_3) annotation (Line(points={{-160,-10},{-80,
          -10},{-80,36}}, color={0,127,255}));
  connect(senMasFloOut.port_a, out.ports[2]) annotation (Line(points={{-94,8},{
          -126,8},{-126,-14},{-160,-14}}, color={0,127,255}));
  connect(ideEco.y, uEco) annotation (Line(points={{-80,57},{-142,57},{-142,-40},
          {-220,-40}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-240},
            {200,160}}), graphics={
        Rectangle(
          extent={{-202,160},{200,-240}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{180,40},{-186,0}},
          lineColor={175,175,175},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-32,36},{-4,22}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{180,-72},{-186,-112}},
          lineColor={175,175,175},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-50,0},{-90,-72}},
          lineColor={175,175,175},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-48,36},{-14,2}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-38,26},{-24,12}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{40,40},{54,0}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Backward),
        Rectangle(
          extent={{102,40},{116,0}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Backward),
        Rectangle(
          extent={{-110,40},{-96,0}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Backward),
        Rectangle(
          extent={{-110,-72},{-96,-112}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Backward),
        Rectangle(
          extent={{-7,20},{7,-20}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Backward,
          origin={-70,-37},
          rotation=90),
        Line(points={{198,140},{-30,140},{-30,50}}, color={0,0,127}),
        Line(points={{-138,-38},{-128,-28},{-118,-38}},
                                                     color={0,0,0}),
        Line(points={{-160,-38},{-150,-28},{-138,-38}},
                                                     color={0,0,0}),
        Line(points={{-182,-38},{-172,-28},{-160,-38}},
                                                      color={0,0,0}),
        Rectangle(extent={{-182,40},{-118,-112}},lineColor={0,0,0}),
        Line(points={{-150,-112},{-150,-102}},
                                         color={28,108,200}),
        Line(points={{-150,-112},{-142,-102}},
                                         color={28,108,200}),
        Line(points={{-150,-112},{-158,-102}},
                                         color={28,108,200}),
        Line(points={{-170,-112},{-162,-102}},
                                         color={28,108,200}),
        Line(points={{-170,-112},{-170,-102}},
                                         color={28,108,200}),
        Line(points={{-170,-112},{-178,-102}},
                                          color={28,108,200}),
        Line(points={{-130,-112},{-138,-102}},
                                         color={28,108,200}),
        Line(points={{-130,-112},{-130,-102}},
                                         color={28,108,200}),
        Line(points={{-130,-112},{-122,-102}},
                                         color={28,108,200})}),  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-200,-240},{200,160}})),
      Documentation(info="<html>
<p>

</p>
</html>", revisions="<html>
<ul>
<li>
December 18, 2019, by David Blum:<br/>
First implementation.
</li>
</ul>
</html>"));
end partialAirUnit;
