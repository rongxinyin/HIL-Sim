within hil_flexlab_model.Test2.BaseClasses1.Controls;
model RTU_control_FMU_Delay "Implements common control for RTU system"

  parameter Real k_hea=k_hea "Proportional gain of heating controller";
  parameter Modelica.Units.SI.Time Ti_hea=Ti_hea "Integral time constant of heating controller";
  parameter Modelica.Units.SI.ThermodynamicTemperature maxSAT = maxSAT "max supply air temperature";
  parameter Real kSta1 = kSta1 "PI center line to activate stage 1";
  parameter Real kSta2 = kSta2 "PI center line to activate stage 2";
  parameter Real banSta1 = banSta1 "PI band to activate stage 1";
  parameter Real onOffConHeaBan = onOffConHeaBan "bandwidth for on off heating controller";

    parameter Real banSta2 = banSta2 "PI band to activate stage 2";

  Modelica.Blocks.Interfaces.RealInput TSetRooHea(final unit="K", displayUnit=
        "degC")
    "Zone heating setpoint temperature" annotation (Placement(transformation(
        extent={{20,20},{-20,-20}},
        rotation=180,
        origin={-120,180})));
  Modelica.Blocks.Interfaces.RealInput TRoo(final unit="K", displayUnit="degC")
    "Zone temperature measurement"
  annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        origin={-120,60})));
  Modelica.Blocks.Interfaces.RealOutput heaSta(final unit="1")
    "Control signal for heating"
    annotation (Placement(transformation(extent={{100,40},{136,76}}),
        iconTransformation(extent={{100,40},{136,76}})));
  Buildings.Controls.Continuous.LimPID conHea(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=Ti_hea,
    final yMax=1,
    final yMin=0,
    final k=k_hea,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0,
    reset=Buildings.Types.Reset.Parameter) "Heating feedback controller"
    annotation (Placement(transformation(extent={{-58,170},{-38,190}})));
  Modelica.Blocks.Logical.Switch swiHea "Switch for turning heating on/off"
    annotation (Placement(transformation(extent={{4,120},{24,140}})));
  Modelica.Blocks.Sources.Constant offHea(k=0) "Off signal"
    annotation (Placement(transformation(extent={{-48,40},{-28,60}})));

  Modelica.Blocks.Interfaces.RealInput TSup(final unit="K", displayUnit="degC")
    "Supply air temperature"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Logical.OnOffController onOffConSupHeatSetPoi(bandwidth=0.5)
              "Enable freeze protection"
    annotation (Placement(transformation(extent={{-30,-4},{-10,16}})));
  Modelica.Blocks.Sources.Constant UpperLimSup(k=maxSAT)
    "Setpoint temperature for freeze protection"
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  hil_flexlab_model.Test2.HeatStage heatStage(
    kSta1=kSta1,
    kSta2=kSta2,
    banSta1=banSta1,
    banSta2=banSta2) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=-90,
        origin={-24,162})));
  Modelica.Blocks.Logical.Switch swiTim "Switch for turning heating on/off"
    annotation (Placement(transformation(extent={{44,48},{64,68}})));
  hil_flexlab_model.Test2.BaseClasses1.Controls.BaseClasses.OnOffController
    onOffConHea(bandwidth=onOffConHeaBan) "Enable heating"
    annotation (Placement(transformation(extent={{-84,126},{-64,146}})));
  Modelica.Blocks.Logical.Switch UppLimSwi "Switch for turning heating on/off"
    annotation (Placement(transformation(extent={{40,200},{60,220}})));
  Modelica.Blocks.Logical.Not NotLim
    annotation (Placement(transformation(extent={{8,200},{20,212}})));
  Modelica.Blocks.MathBoolean.OnDelay
                                onDelay(delayTime=120)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={14,82})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean
    annotation (Placement(transformation(extent={{76,200},{96,220}})));
  Modelica.Blocks.Interfaces.BooleanOutput heaCal
    "Control signal for heating" annotation (Placement(transformation(extent={{100,88},
            {136,124}}),           iconTransformation(extent={{100,88},{136,
            124}})));
  Modelica.Blocks.Interfaces.RealOutput pre_swi1_Stage_y
    "Control signal for heating" annotation (Placement(transformation(extent={{100,146},
            {136,182}}),    iconTransformation(extent={{100,146},{136,182}})));
  Modelica.Blocks.Interfaces.RealOutput post_swi1_Stage_y
    "Control signal for heating" annotation (Placement(transformation(extent={{100,112},
            {136,148}}),   iconTransformation(extent={{100,112},{136,148}})));
  Modelica.Blocks.Interfaces.RealOutput onOff_diff_y
    "Control signal for heating" annotation (Placement(transformation(extent={{100,10},
            {136,46}}),            iconTransformation(extent={{100,10},{136,
            46}})));
  Modelica.Blocks.Interfaces.RealOutput sigPI(final unit="1")
    "PI signal for heating" annotation (Placement(transformation(extent={{100,174},
            {136,210}}), iconTransformation(extent={{100,174},{136,210}})));
equation
  connect(offHea.y, swiHea.u3) annotation (Line(points={{-27,50},{-14,50},{
          -14,122},{2,122}},
                    color={0,0,127}));
  connect(TSup, onOffConSupHeatSetPoi.u) annotation (Line(points={{-120,0},{
          -32,0}},                          color={0,0,127}));
  connect(UpperLimSup.y, onOffConSupHeatSetPoi.reference) annotation (Line(
        points={{-59,20},{-52,20},{-52,12},{-32,12}},     color={0,0,127}));
  connect(TSetRooHea, conHea.u_s) annotation (Line(points={{-120,180},{-60,
          180}},                     color={0,0,127}));
  connect(TRoo, conHea.u_m) annotation (Line(points={{-120,60},{-70,60},{-70,110},
          {-48,110},{-48,168}},
                           color={0,0,127}));
  connect(TSetRooHea, onOffConHea.reference) annotation (Line(points={{-120,
          180},{-94,180},{-94,142},{-86,142}},
                                          color={0,0,127}));
  connect(TRoo, onOffConHea.u) annotation (Line(points={{-120,60},{-92,60},{
          -92,130},{-86,130}},
                         color={0,0,127}));
  connect(onOffConHea.y, swiHea.u2) annotation (Line(points={{-63,136},{-32,
          136},{-32,130},{2,130}},
                           color={255,0,255}));
  connect(offHea.y, UppLimSwi.u1) annotation (Line(points={{-27,50},{-14,50},
          {-14,218},{38,218}},
                          color={0,0,127}));
  connect(swiHea.y, UppLimSwi.u3) annotation (Line(points={{25,130},{28,130},
          {28,202},{38,202}},
                     color={0,0,127}));
  connect(UppLimSwi.u2, NotLim.y) annotation (Line(points={{38,210},{26,210},
          {26,206},{20.6,206}}, color={255,0,255}));
  connect(onOffConSupHeatSetPoi.y, NotLim.u) annotation (Line(points={{-9,6},
          {-6,6},{-6,206},{6.8,206}}, color={255,0,255}));
  connect(offHea.y, swiTim.u3)
    annotation (Line(points={{-27,50},{42,50}}, color={0,0,127}));
  connect(UppLimSwi.y, swiTim.u1) annotation (Line(points={{61,210},{66,210},
          {66,180},{38,180},{38,66},{42,66}}, color={0,0,127}));
  connect(onDelay.y, swiTim.u2)
    annotation (Line(points={{14,70},{14,58},{42,58}}, color={255,0,255}));
  connect(UppLimSwi.y, realToBoolean.u)
    annotation (Line(points={{61,210},{74,210}}, color={0,0,127}));
  connect(realToBoolean.y, onDelay.u) annotation (Line(points={{97,210},{98,
          210},{98,174},{66,174},{66,114},{14,114},{14,96}},  color={255,0,
          255}));
  connect(conHea.y, heatStage.uHea) annotation (Line(points={{-37,180},{-24,
          180},{-24,171.6}},
                        color={0,0,127}));
  connect(heatStage.y_Sta, swiHea.u1)
    annotation (Line(points={{-24,152.4},{-24,138},{2,138}}, color={0,0,127}));
  connect(swiTim.y, heaSta) annotation (Line(points={{65,58},{118,58}},
                 color={0,0,127}));
  connect(heaSta, heaSta)
    annotation (Line(points={{118,58},{118,58}},   color={0,0,127}));
  connect(heaCal, onOffConHea.y) annotation (Line(points={{118,106},{-32,106},
          {-32,136},{-63,136}},
                           color={255,0,255}));
  connect(post_swi1_Stage_y, swiHea.y) annotation (Line(points={{118,130},{72,
          130},{72,130},{25,130}},
                             color={0,0,127}));
  connect(onOffConHea.diff, onOff_diff_y) annotation (Line(points={{-63,131.2},
          {-56,131.2},{-56,28},{118,28}},     color={0,0,127}));
  connect(conHea.y, sigPI) annotation (Line(points={{-37,180},{12,180},{12,
          192},{118,192}},              color={0,0,127}));
  connect(pre_swi1_Stage_y, heatStage.y_Sta) annotation (Line(points={{118,
          164},{48,164},{48,148},{-24,148},{-24,152.4}}, color={0,0,127}));
  connect(onOffConHea.y, conHea.trigger) annotation (Line(points={{-63,136},{
          -56,136},{-56,168}}, color={255,0,255}));
  connect(sigPI, sigPI)
    annotation (Line(points={{118,192},{118,192}}, color={0,0,127}));
    annotation (Line(points={{118,58},{118,58}},   color={0,0,127}),
              Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},
            {100,220}}),       graphics={
                                Rectangle(
        extent={{-100,0},{100,220}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid)}),                        Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{100,220}})),
    experiment(
      StopTime=2200,
      Interval=1,
      Tolerance=1e-06));
end RTU_control_FMU_Delay;
