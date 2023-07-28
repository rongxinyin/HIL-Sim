within hil_flexlab_model.BaseClasses;
model addFive
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-60,-32},{-40,-12}})));
  Modelica.Blocks.Sources.Constant const(k=5)
    annotation (Placement(transformation(extent={{-90,-66},{-70,-46}})));
equation
  connect(u, add.u1) annotation (Line(points={{-120,0},{-90,0},{-90,-16},{-62,
          -16}}, color={0,0,127}));
  connect(add.y, y) annotation (Line(points={{-39,-22},{16,-22},{16,-14},{94,
          -14},{94,0},{110,0}}, color={0,0,127}));
  connect(const.y, add.u2) annotation (Line(points={{-69,-56},{-66,-56},{-66,
          -28},{-62,-28}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end addFive;
