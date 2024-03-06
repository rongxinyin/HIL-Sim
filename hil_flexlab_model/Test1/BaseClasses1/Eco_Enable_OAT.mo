within hil_flexlab_model.Test1.BaseClasses1;
model Eco_Enable_OAT
protected
  Modelica.Blocks.Logical.Hysteresis          hysteresis(final uLow=-1, final
      uHigh=0)
    "Outdoor air temperature hysteresis for both fixed and differential dry bulb temperature cutoff conditions"
    annotation (Placement(transformation(extent={{-66,6},{-46,26}})));
  Buildings.Controls.OBC.CDL.Logical.Not not1 "Logical nor"
    annotation (Placement(transformation(extent={{-12,6},{8,26}})));
  Modelica.Blocks.Math.Add                           add1(final k2=-1)
    "Add block determines difference between TOut and TOutCut"
    annotation (Placement(transformation(extent={{-82,46},{-62,66}})));
public
  Buildings.Controls.OBC.CDL.Logical.TrueFalseHold truFalHol(trueHoldDuration=
        600)              "10 min on/off delay"
    annotation (Placement(transformation(extent={{26,6},{46,26}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=0.96, realFalse=0.3)
    annotation (Placement(transformation(extent={{64,8},{84,28}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TOut(
    final unit="K",
    final displayUnit="degC",
    final quantity="ThermodynamicTemperature")
    "Outdoor air temperature"
    annotation (Placement(transformation(extent={{-142,36},{-102,76}}),
        iconTransformation(extent={{-140,80},{-100,120}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput TOutCut(
    final unit="K",
    final displayUnit="degC",
    final quantity="ThermodynamicTemperature")
    "OA temperature high limit cutoff. For differential dry bulb temeprature condition use return air temperature measurement"
    annotation (Placement(transformation(extent={{-142,-4},{-102,36}}),
        iconTransformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealOutput OutdoorDamperPosition
    annotation (Placement(transformation(extent={{100,8},{120,28}})));
equation
  connect(hysteresis.y, not1.u)
    annotation (Line(points={{-45,16},{-14,16}}, color={255,0,255}));
  connect(not1.y, truFalHol.u)
    annotation (Line(points={{10,16},{24,16}}, color={255,0,255}));
  connect(truFalHol.y, booleanToReal.u)
    annotation (Line(points={{48,16},{48,18},{62,18}}, color={255,0,255}));
  connect(TOut, add1.u1) annotation (Line(points={{-122,56},{-94,56},{-94,62},{
          -84,62}}, color={0,0,127}));
  connect(TOutCut, add1.u2) annotation (Line(points={{-122,16},{-92,16},{-92,50},
          {-84,50}}, color={0,0,127}));
  connect(add1.y, hysteresis.u) annotation (Line(points={{-61,56},{-52,56},{-52,
          30},{-78,30},{-78,16},{-68,16}}, color={0,0,127}));
  connect(booleanToReal.y, OutdoorDamperPosition)
    annotation (Line(points={{85,18},{110,18}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Eco_Enable_OAT;
