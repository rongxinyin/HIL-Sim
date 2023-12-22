within hil_flexlab_model.Fluid;
model Aachen_HP_2stage_FMU_wTMixCalc_Cool
  "copy of FMU with internal TMix calculation"

  replaceable package Medium_sou = Buildings.Media.Air;
  replaceable package Medium_sin = Buildings.Media.Air;

  parameter Real refIneFre = 0.0015 "refrigerant inertia parameter";
  parameter Real k_hea = 1.25 "Proportional gain of heating controller";
  parameter Modelica.SIunits.Time Ti_hea = 7000 "Integral time constant of heating controller";
  parameter Modelica.SIunits.ThermodynamicTemperature maxSAT = 311 "max supply air temperature";
  parameter Real kSta1 = 0.12 "PI center line to activate stage 1";
  parameter Real kSta2 = 0.35 "PI center line to activate stage 2";
  parameter Real banSta1 = 0.01 "PI band to activate stage 1";
  parameter Real banSta2 = 0.01 "PI band to activate stage 2";
  parameter Real onOffConHeaBan = 0.25 "bandwidth for on off heating controller";

  HeatPumps.BaseClasses.RTUHP_Cool rtuHP(
    redeclare package Medium_sin = Medium_sin,
    redeclare package Medium_sou = Medium_sou,
    refIneFre=refIneFre) annotation (Placement(transformation(extent={{0,28},{32,60}})));
  Buildings.Fluid.Sources.MassFlowSource_T supFan(
    redeclare package Medium = Medium_sou,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(extent={{-80,-2},{-60,18}})));
  Modelica.Blocks.Interfaces.RealInput u_m_flow(unit="kg/s") annotation (
      Placement(transformation(extent={{-140,60},{-100,100}}),
        iconTransformation(extent={{-140,60},{-100,100}})));
  Buildings.Fluid.Sources.Boundary_pT roo(nPorts=1, redeclare package Medium =
        Medium_sou) "Fixed boundary at the outlet of the source side"
    annotation (Placement(transformation(
        extent={{-11,11},{11,-11}},
        rotation=180,
        origin={79,21})));
  Modelica.Blocks.Interfaces.RealOutput y_TSup(unit="K", displayUnit="degC")
    annotation (Placement(transformation(extent={{100,40},{120,60}}),
        iconTransformation(extent={{100,40},{120,60}})));
  Modelica.Blocks.Interfaces.RealOutput y_PEleHP(unit="W")
    annotation (Placement(transformation(extent={{100,60},{120,80}}),
        iconTransformation(extent={{100,60},{120,80}})));
  BaseClasses.Controls.RTU_control_FMU_Delay_Cool rtuConFMU(
    k_hea=k_hea,
    Ti_hea=Ti_hea,
    maxSAT = maxSAT,
    kSta1=kSta1,
    kSta2=kSta2,
    banSta1=banSta1,
    banSta2=banSta2,
    onOffConHeaBan=onOffConHeaBan)
    annotation (Placement(transformation(extent={{0,-80},{22,-32}})));
  Modelica.Blocks.Interfaces.RealInput u_TDryBul(unit="K", displayUnit="degC")
    "outside temperature measurement"
                                   annotation (Placement(transformation(extent={{-16,-16},
            {16,16}},           origin={-118,-26}), iconTransformation(extent={{-140,
            -20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput u_TRoo(unit="K", displayUnit="degC")
    "Zone temperature measurement" annotation (Placement(transformation(extent={{-16,-16},
            {16,16}},           origin={-116,-100}),iconTransformation(extent={{-140,
            -100},{-100,-60}})));
  Modelica.Blocks.Interfaces.RealInput u_THeaSetPoi(unit="K", displayUnit=
       "degC") "Zone temperature measurement" annotation (Placement(
        transformation(extent={{-17,-17},{17,17}}, origin={-117,-49}),
        iconTransformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Interfaces.BooleanOutput y_HeaCal
    annotation (Placement(transformation(extent={{100,-80},{120,-60}}),
        iconTransformation(extent={{100,-80},{120,-60}})));
  Modelica.Blocks.Interfaces.RealOutput y_PI
    annotation (Placement(transformation(extent={{100,-30},{120,-10}}),
        iconTransformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Interfaces.RealOutput y_heaSta annotation (Placement(
        transformation(extent={{100,-100},{120,-80}}),
                                                    iconTransformation(extent={{100,
            -100},{120,-80}})));
  Modelica.Blocks.Math.Division fraRA "fraction of return air"
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-166,36})));
  Modelica.Blocks.Math.Product perRA "percentage of return air"
    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-130,24})));
  Modelica.Blocks.Math.Product perOA "percentage of outdoor air"
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-130,2})));
  Modelica.Blocks.Math.Division fraOA "fraction of outside air"
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-166,-4})));
  Modelica.Blocks.Math.Add RA(k2=-1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-192,46})));
  Modelica.Blocks.Sources.Constant minOA(final k=(125*1.189)/(35.31*60))
    "Fixed outside air flow rate" annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={-220,18})));
  Modelica.Blocks.Math.Add sumTem annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-106,12})));
  Modelica.Blocks.Interfaces.RealInput u_TRet(unit="K", displayUnit="degC")
    "return temperature measurement" annotation (Placement(transformation(
          extent={{-20,-20},{20,20}}, origin={-120,50}), iconTransformation(
          extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Logical.Switch swiHea "Switch for turning heating on/off"
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-11,-19})));
  Modelica.Blocks.Interfaces.RealInput u_TCooSetPoi(unit="K", displayUnit=
        "degC") "Zone temperature measurement" annotation (Placement(
        transformation(extent={{-16,-16},{16,16}}, origin={-118,-74}),
        iconTransformation(extent={{-140,-60},{-100,-20}})));
equation
  connect(supFan.ports[1], rtuHP.port_a) annotation (Line(points={{-60,8},{-16,8},
          {-16,44},{0,44}}, color={0,127,255}));
  connect(u_m_flow, supFan.m_flow_in) annotation (Line(points={{-120,80},{-90,
          80},{-90,16},{-82,16}},
                              color={0,0,127}));
  connect(rtuHP.port_b, roo.ports[1]) annotation (Line(points={{32,44},{52,44},{
          52,21},{68,21}}, color={0,127,255}));
  connect(rtuHP.TSup, y_TSup) annotation (Line(points={{33.6,53.6},{64,53.6},
          {64,50},{110,50}},             color={0,0,127}));
  connect(rtuHP.PEle, y_PEleHP) annotation (Line(points={{33.6,56.8},{64,56.8},
          {64,70},{110,70}},color={0,0,127}));
  connect(u_TDryBul, rtuHP.TEvaIn) annotation (Line(points={{-118,-26},{-40,
          -26},{-40,31.2},{-1.6,31.2}},
                                   color={0,0,127}));
  connect(u_TRoo, rtuConFMU.TRoo) annotation (Line(points={{-116,-100},{-38,
          -100},{-38,-73.4545},{-2.2,-73.4545}},
                               color={0,0,127}));
  connect(rtuConFMU.TSup, rtuHP.TSup) annotation (Line(points={{-2.2,-80},{
          -22,-80},{-22,-90},{42,-90},{42,53.6},{33.6,53.6}},        color={0,0,
          127}));
  connect(u_THeaSetPoi, rtuConFMU.TSetRooHea) annotation (Line(points={{-117,
          -49},{-50,-49},{-50,-60.3636},{-2.2,-60.3636}}, color={0,0,127}));
  connect(rtuConFMU.heaCal, y_HeaCal) annotation (Line(points={{23.98,-69.7455},
          {68,-69.7455},{68,-70},{110,-70}},                 color={255,0,255}));
  connect(y_PI, rtuConFMU.sigPI) annotation (Line(points={{110,-20},{56,-20},{
          56,-59.0545},{23.98,-59.0545}},
                                       color={0,0,127}));
  connect(rtuConFMU.heaSta, y_heaSta) annotation (Line(points={{23.98,-73.4545},
          {62,-73.4545},{62,-90},{110,-90}},
                                       color={0,0,127}));
  connect(y_PI, y_PI)
    annotation (Line(points={{110,-20},{110,-20}}, color={0,0,127}));
  connect(perOA.y,sumTem. u2) annotation (Line(points={{-123.4,2},{-118,2},{
          -118,8.4},{-113.2,8.4}},     color={0,0,127}));
  connect(perRA.y,sumTem. u1) annotation (Line(points={{-123.4,24},{-118,24},
          {-118,15.6},{-113.2,15.6}},
                                    color={0,0,127}));
  connect(minOA.y,RA. u2) annotation (Line(points={{-213.4,18},{-206,18},{
          -206,42.4},{-199.2,42.4}}, color={0,0,127}));
  connect(minOA.y,fraOA. u1) annotation (Line(points={{-213.4,18},{-206,18},{
          -206,-0.4},{-173.2,-0.4}},       color={0,0,127}));
  connect(u_TDryBul, perOA.u2) annotation (Line(points={{-118,-26},{-100,-26},
          {-100,-10},{-146,-10},{-146,-1.6},{-137.2,-1.6}}, color={0,0,127}));
  connect(fraRA.y, perRA.u1) annotation (Line(points={{-159.4,36},{-152,36},{
          -152,20.4},{-137.2,20.4}}, color={0,0,127}));
  connect(fraOA.y, perOA.u1) annotation (Line(points={{-159.4,-4},{-152,-4},{
          -152,5.6},{-137.2,5.6}}, color={0,0,127}));
  connect(sumTem.y, supFan.T_in)
    annotation (Line(points={{-99.4,12},{-82,12}}, color={0,0,127}));
  connect(RA.y, fraRA.u1) annotation (Line(points={{-185.4,46},{-182,46},{
          -182,39.6},{-173.2,39.6}}, color={0,0,127}));
  connect(u_TRet, perRA.u2) annotation (Line(points={{-120,50},{-100,50},{
          -100,36},{-142,36},{-142,27.6},{-137.2,27.6}}, color={0,0,127}));
  connect(u_m_flow, RA.u1) annotation (Line(points={{-120,80},{-90,80},{-90,
          68},{-206,68},{-206,49.6},{-199.2,49.6}}, color={0,0,127}));
  connect(u_m_flow, fraRA.u2) annotation (Line(points={{-120,80},{-90,80},{
          -90,68},{-178,68},{-178,32.4},{-173.2,32.4}}, color={0,0,127}));
  connect(u_m_flow, fraOA.u2) annotation (Line(points={{-120,80},{-90,80},{
          -90,68},{-178,68},{-178,-7.6},{-173.2,-7.6}}, color={0,0,127}));
  connect(rtuHP.heasta, rtuConFMU.heaCal) annotation (Line(points={{-1.6,58.4},
          {-1.6,-3.04},{23.98,-3.04},{23.98,-69.7455}}, color={255,0,255}));
  connect(u_TCooSetPoi, rtuConFMU.TSetRooCoo) annotation (Line(points={{-118,
          -74},{-60,-74},{-60,-46.6182},{-1.32,-46.6182}}, color={0,0,127}));
  connect(rtuConFMU.cooSta, swiHea.u3) annotation (Line(points={{24.09,
          -48.6909},{-6.955,-48.6909},{-6.955,-25},{-7,-25}}, color={0,0,127}));
  connect(rtuConFMU.heaSta, swiHea.u1) annotation (Line(points={{23.98,-73.4545},
          {23.98,-85.7272},{-15,-85.7272},{-15,-25}},           color={0,0,
          127}));
  connect(swiHea.y, rtuHP.sta) annotation (Line(points={{-11,-13.5},{-11,
          20.25},{-1.6,20.25},{-1.6,53.92}}, color={0,0,127}));
  connect(swiHea.u2, rtuConFMU.heaCal) annotation (Line(points={{-11,-25},{-11,
          -25.5},{23.98,-25.5},{23.98,-69.7455}},     color={255,0,255}));
    annotation (Placement(transformation(extent={{100,-74},{120,-54}}),
        iconTransformation(extent={{100,-74},{120,-54}})),
                                            experiment(
      Interval=60,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
                        Icon(graphics={
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
        Text(
          extent={{-56,64},{68,-60}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={175,175,175},
          textString="fmu",
          textStyle={TextStyle.Bold})}));
end Aachen_HP_2stage_FMU_wTMixCalc_Cool;
