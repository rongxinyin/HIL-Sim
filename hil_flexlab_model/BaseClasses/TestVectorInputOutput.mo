within hil_flexlab_model.BaseClasses;
model TestVectorInputOutput
  addFive addFive1[3]
    annotation (Placement(transformation(extent={{-12,8},{8,28}})));
  Modelica.Blocks.Sources.Step step(
    height=11,
    offset=2,
    startTime=43200)
    annotation (Placement(transformation(extent={{-82,10},{-62,30}})));
  Modelica.Blocks.Sources.Step step1(
    height=21,
    offset=12,
    startTime=43200)
    annotation (Placement(transformation(extent={{-72,-30},{-52,-10}})));
  Modelica.Blocks.Sources.Step step2(
    height=31,
    offset=22,
    startTime=43200)
    annotation (Placement(transformation(extent={{-76,-76},{-56,-56}})));
equation
  connect(step.y, addFive1[1].u) annotation (Line(points={{-61,20},{-28,20},{
          -28,18},{-14,18}}, color={0,0,127}));
  connect(step1.y, addFive1[2].u) annotation (Line(points={{-51,-20},{-32.5,-20},
          {-32.5,18},{-14,18}}, color={0,0,127}));
  connect(step2.y, addFive1[3].u) annotation (Line(points={{-55,-66},{-55,-24},
          {-14,-24},{-14,18}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=86400,
      Interval=300,
      __Dymola_Algorithm="Dassl"));
end TestVectorInputOutput;
