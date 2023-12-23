within hil_flexlab_model.Test1.Plants1.Controls;
model OutdoorDamperPositionBlock
  Modelica.Blocks.Interfaces.RealInput ReturnDamperPosition
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput OutdoorDamperPosition
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=0.7, uMin=0)
    annotation (Placement(transformation(extent={{-78,-10},{-58,10}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{-40,-12},{-20,8}})));
  Modelica.Blocks.Sources.Constant const(k=0.7)
    annotation (Placement(transformation(extent={{-76,-60},{-56,-40}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{4,-2},{24,18}})));
  Modelica.Blocks.Sources.Constant const1(k=1)
    annotation (Placement(transformation(extent={{-50,46},{-30,66}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{48,-10},{68,10}})));
  Modelica.Blocks.Sources.Constant const2(k=0.7)
    annotation (Placement(transformation(extent={{2,-32},{22,-12}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{66,-46},{86,-26}})));
  Modelica.Blocks.Sources.Constant const3(k=0.3)
    annotation (Placement(transformation(extent={{16,-62},{36,-42}})));
equation
  connect(ReturnDamperPosition, limiter.u)
    annotation (Line(points={{-120,0},{-80,0}}, color={0,0,127}));
  connect(limiter.y, division.u1) annotation (Line(points={{-57,0},{-50,0},{-50,
          4},{-42,4}}, color={0,0,127}));
  connect(const.y, division.u2) annotation (Line(points={{-55,-50},{-50,-50},{
          -50,-8},{-42,-8}}, color={0,0,127}));
  connect(const1.y, add.u1) annotation (Line(points={{-29,56},{-14,56},{-14,14},
          {2,14}}, color={0,0,127}));
  connect(division.y, add.u2)
    annotation (Line(points={{-19,-2},{-8,-2},{-8,2},{2,2}}, color={0,0,127}));
  connect(add.y, product.u1)
    annotation (Line(points={{25,8},{36,8},{36,6},{46,6}}, color={0,0,127}));
  connect(const2.y, product.u2) annotation (Line(points={{23,-22},{23,-18},
          {46,-18},{46,-6}},
                         color={0,0,127}));
  connect(const3.y, add1.u2) annotation (Line(points={{37,-52},{56,-52},{56,
          -42},{64,-42}}, color={0,0,127}));
  connect(product.y, add1.u1) annotation (Line(points={{69,0},{74,0},{74,
          -22},{64,-22},{64,-30}}, color={0,0,127}));
  connect(add1.y, OutdoorDamperPosition) annotation (Line(points={{87,-36},
          {90,-36},{90,-14},{92,-14},{92,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end OutdoorDamperPositionBlock;
