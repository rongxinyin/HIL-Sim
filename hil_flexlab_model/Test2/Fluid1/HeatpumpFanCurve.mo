within hil_flexlab_model.Test2.Fluid1;
model HeatpumpFanCurve "heatpump fan power curve"
  parameter Real a = 102 "Fan power curve coefficient a";
  parameter Real b = 906 "Fan power curve coefficient b";
  parameter Real c = -1062 "Fan power curve coefficient c";
  Modelica.Blocks.Interfaces.RealInput m_flow( unit="kg/s")
    annotation (Placement(transformation(extent={{-140,0},{-100,40}})));
  Modelica.Blocks.Interfaces.RealOutput p_fan( unit="W")
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
equation
  p_fan = a + b * m_flow + c * m_flow * m_flow;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-100,80},{100,-40}}, lineColor={28,108,200}),
          Text(
          extent={{-62,38},{68,-2}},
          lineColor={0,0,0},
          textString="Fan Power Curve",
          textStyle={TextStyle.Bold})}),                         Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HeatpumpFanCurve;
