within hil_flexlab_model.Test2;
model HeatStage

  parameter Real kSta1 = kSta1 "PI center line to activate stage 1";
  parameter Real kSta2 = kSta2 "PI center line to activate stage 2";
  parameter Real banSta1 = banSta1 "PI band to activate stage 1";
  parameter Real banSta2 = banSta2 "PI band to activate stage 2";

  Modelica.Blocks.Math.RealToBoolean realToBoolean1(threshold=0.001)
    annotation (Placement(transformation(extent={{-8,30},{12,50}})));
  Modelica.Blocks.Math.Add         add         annotation (Placement(
        transformation(
        extent={{12,-12},{-12,12}},
        rotation=180,
        origin={40,-20})));
  Modelica.Blocks.Logical.Switch switch4
    annotation (Placement(transformation(extent={{64,30},{84,50}})));
  Modelica.Blocks.Sources.Constant const7(k=0) annotation (Placement(
        transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={36,20})));
  Modelica.Blocks.Interfaces.RealInput uHea "Zone temperature measurement"
  annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        origin={-120,0})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal
    annotation (Placement(transformation(extent={{-2,-10},{18,10}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal1
    annotation (Placement(transformation(extent={{-2,-50},{18,-30}})));
  Modelica.Blocks.Interfaces.RealOutput y_Sta "Zone temperature measurement"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}}, origin={120,0})));
  Modelica.Blocks.Sources.Constant const1(k=kSta1)
                                               annotation (Placement(
        transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-68,20})));
  Modelica.Blocks.Logical.OnOffController onOffSta1(bandwidth=banSta1)
    "Enable stage 1 heating"
    annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));

  Modelica.Blocks.Sources.Constant const2(k=kSta2)
                                               annotation (Placement(
        transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-68,-20})));
  Modelica.Blocks.Logical.OnOffController onOffSta2(bandwidth=banSta2)
    "Enable stage 2 heating"
    annotation (Placement(transformation(extent={{-46,-50},{-26,-30}})));
  Modelica.Blocks.MathBoolean.Not    not1
    annotation (Placement(transformation(extent={{-18,-4},{-10,4}})));
  Modelica.Blocks.MathBoolean.Not    not2
    annotation (Placement(transformation(extent={{-18,-44},{-10,-36}})));
equation
  connect(realToBoolean1.y,switch4. u2)
    annotation (Line(points={{13,40},{62,40}},       color={255,0,255}));
  connect(const7.y,switch4. u3) annotation (Line(points={{44.8,20},{50,20},{
          50,32},{62,32}},                 color={0,0,127}));
  connect(uHea, realToBoolean1.u) annotation (Line(points={{-120,0},{-84,0},{
          -84,40},{-10,40}}, color={0,0,127}));
  connect(booleanToReal.y, add.u2) annotation (Line(points={{19,0},{20,0},{20,-14},
          {25.6,-14},{25.6,-12.8}},   color={0,0,127}));
  connect(booleanToReal1.y, add.u1) annotation (Line(points={{19,-40},{20,-40},{
          20,-27.2},{25.6,-27.2}},  color={0,0,127}));
  connect(add.y, switch4.u1) annotation (Line(points={{53.2,-20},{56,-20},{56,
          48},{62,48}},       color={0,0,127}));
  connect(switch4.y, y_Sta) annotation (Line(points={{85,40},{92,40},{92,0},{
          120,0}}, color={0,0,127}));
  connect(const2.y, onOffSta2.reference) annotation (Line(points={{-59.2,-20},{-54,
          -20},{-54,-34},{-48,-34}}, color={0,0,127}));
  connect(const1.y, onOffSta1.reference) annotation (Line(points={{-59.2,20},{-54,
          20},{-54,6},{-48,6}}, color={0,0,127}));
  connect(onOffSta1.u, uHea) annotation (Line(points={{-48,-6},{-84,-6},{-84,0},
          {-120,0}}, color={0,0,127}));
  connect(onOffSta2.u, uHea) annotation (Line(points={{-48,-46},{-84,-46},{-84,0},
          {-120,0}}, color={0,0,127}));
  connect(onOffSta1.y, not1.u)
    annotation (Line(points={{-25,0},{-19.6,0}}, color={255,0,255}));
  connect(booleanToReal.u, not1.y)
    annotation (Line(points={{-4,0},{-9.2,0}}, color={255,0,255}));
  connect(booleanToReal1.u, not2.y)
    annotation (Line(points={{-4,-40},{-9.2,-40}}, color={255,0,255}));
  connect(onOffSta2.y, not2.u)
    annotation (Line(points={{-25,-40},{-19.6,-40}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Line(
          points={{-58,-84},{-58,12},{4,12},{4,74},{82,74}},
          color={0,0,0},
          thickness=1), Rectangle(extent={{-100,100},{100,-102}}, lineColor={
              0,0,0})}),                                         Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HeatStage;
