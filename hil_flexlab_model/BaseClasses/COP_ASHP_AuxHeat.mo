within hil_flexlab_model.BaseClasses;
model COP_ASHP_AuxHeat
  "Calculates COP of an air-source heat pump including an auxiliary electric heater that provides a portion of the heating load"
  parameter Modelica.Units.SI.Power QHeaPum_flow_nominal
    "Nominal heat capacity of the heat pump";
  Modelica.Blocks.Interfaces.RealInput Q_flow "Load on heat pump"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Math.Division powHeaPum "Power of heat pump portion"
    annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  Modelica.Blocks.Interfaces.RealOutput PEle "Electrical power consumption"
    annotation (Placement(transformation(extent={{100,90},{120,110}})));
  Modelica.Blocks.Interfaces.RealInput copHeaPum "COP of heat pump"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Math.Division powAuxHea "Power of auxiliary heater portion"
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Blocks.Interfaces.RealOutput PEleHeaPum
    "Electrical power consumption of heat pump portion"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput PEleAuxHea
    "Electrical power consumption of auxiliary electric heater portion"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{20,70},{40,90}})));
  Modelica.Blocks.Sources.Constant copAuxHea(k=1)
    "COP of auxiliary electric heater"
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Blocks.Sources.RealExpression QHeaPum(y=min(Q_flow,
        QHeaPum_flow_nominal)) "Calculates portion of load on heat pump"
    annotation (Placement(transformation(extent={{-70,30},{-50,50}})));
  Modelica.Blocks.Sources.RealExpression QAuxHea(y=max(0, Q_flow -
        QHeaPum_flow_nominal)) "Calculates portion of load on auxiliary heater"
    annotation (Placement(transformation(extent={{-70,-30},{-50,-10}})));
  Modelica.Blocks.Math.Division div1
    annotation (Placement(transformation(extent={{70,-18},{90,2}})));
  Modelica.Blocks.Continuous.Integrator ene(y_start=1e-4) "Energy consumption"
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  Modelica.Blocks.Continuous.Integrator hea(y_start=1e-4) "Heating energy"
    annotation (Placement(transformation(extent={{40,-18},{60,2}})));
  Modelica.Blocks.Interfaces.RealOutput COPInt "Integrated COP"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Continuous.Integrator heaAux
    "Heating energy from aux electric heater"
    annotation (Placement(transformation(extent={{20,-90},{40,-70}})));
  Modelica.Blocks.Interfaces.RealOutput fraAuxHeaInt
    "Integrated fraction of heating from auxiliary electric heater"
    annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
  Modelica.Blocks.Math.Division div2
    annotation (Placement(transformation(extent={{60,-90},{80,-70}})));
equation
  connect(powHeaPum.y, PEleHeaPum) annotation (Line(points={{1,20},{6,20},{6,60},
          {110,60}},     color={0,0,127}));
  connect(powAuxHea.y, PEleAuxHea) annotation (Line(points={{1,-40},{8,-40},{8,
          20},{110,20}}, color={0,0,127}));
  connect(add.y, PEle) annotation (Line(points={{41,80},{92,80},{92,100},{110,
          100}},
        color={0,0,127}));
  connect(add.u1, PEleHeaPum) annotation (Line(points={{18,86},{6,86},{6,60},{
          110,60}},                 color={0,0,127}));
  connect(add.u2, PEleAuxHea) annotation (Line(points={{18,74},{8,74},{8,20},{
          110,20}},                   color={0,0,127}));
  connect(copHeaPum, powHeaPum.u2) annotation (Line(points={{-120,40},{-80,40},
          {-80,14},{-22,14}},
                            color={0,0,127}));
  connect(copAuxHea.y, powAuxHea.u2) annotation (Line(points={{-79,-50},{-40,
          -50},{-40,-46},{-22,-46}},
                             color={0,0,127}));
  connect(QHeaPum.y, powHeaPum.u1) annotation (Line(points={{-49,40},{-40,40},{
          -40,26},{-22,26}},
                    color={0,0,127}));
  connect(QAuxHea.y, powAuxHea.u1) annotation (Line(points={{-49,-20},{-30,-20},
          {-30,-34},{-22,-34}},
                          color={0,0,127}));
  connect(hea.y, div1.u1)
    annotation (Line(points={{61,-8},{68,-8},{68,-2}}, color={0,0,127}));
  connect(ene.y, div1.u2)
    annotation (Line(points={{61,-40},{68,-40},{68,-14}}, color={0,0,127}));
  connect(div1.y, COPInt) annotation (Line(points={{91,-8},{94,-8},{94,-40},{
          110,-40}}, color={0,0,127}));
  connect(Q_flow, hea.u) annotation (Line(points={{-120,80},{-26,80},{-26,-8},{
          38,-8}}, color={0,0,127}));
  connect(add.y, ene.u) annotation (Line(points={{41,80},{50,80},{50,28},{26,28},
          {26,-40},{38,-40}}, color={0,0,127}));
  connect(QAuxHea.y, heaAux.u) annotation (Line(points={{-49,-20},{-30,-20},{
          -30,-80},{18,-80}}, color={0,0,127}));
  connect(heaAux.y, div2.u1) annotation (Line(points={{41,-80},{50,-80},{50,-74},
          {58,-74}}, color={0,0,127}));
  connect(hea.y, div2.u2) annotation (Line(points={{61,-8},{64,-8},{64,-60},{52,
          -60},{52,-86},{58,-86}}, color={0,0,127}));
  connect(div2.y, fraAuxHeaInt)
    annotation (Line(points={{81,-80},{110,-80}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end COP_ASHP_AuxHeat;
