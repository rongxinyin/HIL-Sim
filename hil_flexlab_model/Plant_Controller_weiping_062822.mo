within hil_flexlab_model;
model Plant_Controller_weiping_062822
  parameter Real table[:, :]
    "Table matrix (time = first column; e.g., table=[0, 0; 1, 1; 2, 4])";
  parameter Real TSolCoo;
   parameter Real TLiqCoo;


  Modelica.Blocks.Sources.Constant conTesCha(k=-0.5)
    "Control signal for TES charging"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-34,-66})));
  Modelica.Blocks.Math.RealToInteger intRea "Integer to real"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={74,-42})));
  Modelica.Blocks.Sources.CombiTimeTable SchTes(
    table=table,
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    "TES charging and discharging schedule"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={116,-18})));
hil_flexlab_model.Plants.Controls.Controller4
                                 C4Coo(
    TLimCha=TSolCoo - 1,
    deadbandCha=1,
    TLimDis=TLiqCoo + 1,
    deadbandDis=1,
    Cold=true) "Controller to enable charging and discharging"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={18,-10})));
  Modelica.Blocks.Logical.Switch swiTes "TES charging and discharging switch"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-62,10})));
                           hil_flexlab_model.Plants.Controls.Controller1Cooling_old
                                        C1Coo "C1 controller for cooling"
    annotation (Placement(transformation(extent={{10,-16},{-10,16}},
        rotation=0,
        origin={-24,74})));
  Modelica.Blocks.Interfaces.RealOutput yTES
    "Temperature of return water to ASHP" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-72,110})));
  Modelica.Blocks.Interfaces.RealInput uTSet
    "Control signal discharge limit for TES" annotation (Placement(
        transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={97,-115}), iconTransformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={96,-116})));
  Modelica.Blocks.Interfaces.BooleanInput enaChi
    "Control signal discharge limit for TES" annotation (Placement(
        transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={33,-115}), iconTransformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={0,-116})));
  Modelica.Blocks.Interfaces.RealInput uTMea
    "Supply temp feedback to controller"     annotation (Placement(
        transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={55,-115}), iconTransformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={32,-116})));
  Modelica.Blocks.Interfaces.RealOutput yASHP
    "Temperature of return water to ASHP" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,110})));
  Modelica.Blocks.Interfaces.RealInput uTTes
    "TES temp feedback to controller" annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={77,-115}), iconTransformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={64,-116})));
  Modelica.Blocks.Sources.Constant conTesChiDisLim(k=1.0)
    "Constant for cold TES discharge limit"
    annotation (Placement(transformation(extent={{74,38},{54,58}})));
equation
  connect(conTesCha.y,swiTes. u1) annotation (Line(points={{-45,-66},{4,-66},
          {4,18},{-50,18}},color={0,0,127}));
  connect(C4Coo.enaDis, C1Coo.enaTesDis) annotation (Line(points={{7,-14},{
          -6,-14},{-6,78},{-12,78}},    color={255,0,255}));
  connect(C4Coo.enaCha,swiTes. u2) annotation (Line(points={{7,-6},{8,-6},{
          8,10},{-50,10}}, color={255,0,255}));
  connect(C1Coo.yTesDis, swiTes.u3) annotation (Line(points={{-36,80},{-36,
          2},{-50,2}},     color={0,0,127}));
  connect(C4Coo.mode, intRea.y) annotation (Line(points={{30,-2},{60,-2},{60,
          -42},{63,-42}},
                     color={255,127,0}));
  connect(SchTes.y[1], intRea.u)
    annotation (Line(points={{105,-18},{86,-18},{86,-42}},
                                                  color={0,0,127}));
  connect(swiTes.y, yTES)
    annotation (Line(points={{-73,10},{-72,10},{-72,110}}, color={0,0,127}));
  connect(C1Coo.TSet, uTSet) annotation (Line(points={{-12,88},{96,88},{96,
          -115},{97,-115}},
                     color={0,0,127}));
  connect(C1Coo.enaCoo, enaChi) annotation (Line(points={{-12,58},{34,58},{
          34,-115},{33,-115}},
                      color={255,0,255}));
  connect(uTMea, C1Coo.TMea) annotation (Line(points={{55,-115},{55,-30.5},{-24,
          -30.5},{-24,56}}, color={0,0,127}));
  connect(C1Coo.enaASHP, enaChi) annotation (Line(points={{-12,70},{34,70},
          {34,-115},{33,-115}},color={255,0,255}));
  connect(C1Coo.yASHP, yASHP) annotation (Line(points={{-36,68},{-48,68},{
          -48,110}}, color={0,0,127}));
  connect(uTTes, C4Coo.Ttes) annotation (Line(points={{77,-115},{77,-62.5},
          {30,-62.5},{30,-10}}, color={0,0,127}));
  connect(conTesChiDisLim.y, C1Coo.uTesLim) annotation (Line(points={{53,48},{
          30,48},{30,82},{-12,82}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Plant_Controller_weiping_062822;
