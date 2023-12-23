within hil_flexlab_model.Test1.ThermalZones;
model Floor "Model of a floor of the building"
  extends hil_flexlab_model.Test1.ThermalZones.PartialFloor(
    leaPle(s=6.49/9.33, azi=Buildings.Types.Azimuth.W),
    VRooCor=cor.V,
    VRooSou=sou.V,
    VRooNor=nor.V,
    VRooEas=ple.V,
    VRooWes=clo.V,
    VRooEle=ele.V,
    AFloCor=cor.AFlo,
    AFloSou=sou.AFlo,
    AFloNor=nor.AFlo,
    AFloEas=ple.AFlo,
    AFloWes=clo.AFlo,
    AFloEle=ele.AFlo,
    leaSou(s=6.49/3.05),
    leaNor(s=6.49/3.23));

  //final parameter Modelica.Units.SI.Area AFlo=AFloCor + AFloSou + AFloNor "Total floor area";
  final parameter Modelica.Units.SI.Area AFlo=AFloCor + AFloSou + AFloNor + AFloWes +AFloEle "Total floor area";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorSou
    "Heat port to air volume South"
    annotation (Placement(transformation(extent={{106,-46},{126,-26}}),iconTransformation(extent={{128,-36},{148,-16}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorEas
    "Heat port to air volume East"
    annotation (Placement(transformation(extent={{320,42},{340,62}}),iconTransformation(extent={{318,64},{338,84}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorNor
    "Heat port to air volume North"
    annotation (Placement(transformation(extent={{106,114},{126,134}}),iconTransformation(extent={{126,106},{146,126}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorWes
    "Heat port to air volume West"
    annotation (Placement(transformation(extent={{-40,56},{-20,76}}),iconTransformation(extent={{-36,64},{-16,84}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorCor
    "Heat port to air volume corridor"
    annotation (Placement(transformation(extent={{106,36},{126,56}}),iconTransformation(extent={{130,38},{150,58}})));
  Modelica.Units.SI.Temperature TAirCor=cor.TAir "Air temperature corridor";
  Modelica.Units.SI.Temperature TAirSou=sou.TAir "Air temperature south zone";
  Modelica.Units.SI.Temperature TAirNor=nor.TAir "Air temperature north zone";
  Modelica.Units.SI.Temperature TAirEas=ple.TAir "Air temperature east zone";
  Modelica.Units.SI.Temperature TAirWes=clo.TAir "Air temperature west zone";
  Buildings.ThermalZones.EnergyPlus_9_6_0.ThermalZone           sou(
    redeclare package Medium = Medium,
    nPorts=3,
    zoneName="FlexLab-X3-ZoneA-South-Zone Thermal Zone")
                               "South zone" annotation (Placement(
        transformation(extent={{144,-44},{184,-4}})));
  Buildings.ThermalZones.EnergyPlus_9_6_0.ThermalZone           ple(
    redeclare package Medium = Medium,
    nPorts=3,
    zoneName="FlexLab-X3-PlnmA Thermal Zone")
                               "East zone" annotation (Placement(
        transformation(extent={{300,68},{340,108}})));
  Buildings.ThermalZones.EnergyPlus_9_6_0.ThermalZone           nor(
    redeclare package Medium = Medium,
    nPorts=3,
    zoneName="FlexLab-X3-ZoneA-North-Zone Thermal Zone")
                               "North zone" annotation (Placement(
        transformation(extent={{144,116},{184,156}})));
  Buildings.ThermalZones.EnergyPlus_9_6_0.ThermalZone           clo(
    redeclare package Medium = Medium,
    nPorts=2,
    zoneName="FlexLab-X3-MechRoom-ZoneA Thermal Zone")
                               "West zone"
    annotation (Placement(transformation(extent={{12,58},{52,98}})));
  Buildings.ThermalZones.EnergyPlus_9_6_0.ThermalZone           cor(
    redeclare package Medium = Medium,
    nPorts=4,
    zoneName="FlexLab-X3-ZoneA-Core-Zone Thermal Zone")
                        "Core zone" annotation (Placement(
        transformation(extent={{144,60},{184,100}})));
  Buildings.ThermalZones.EnergyPlus_9_6_0.ThermalZone           ele(
    redeclare package Medium = Medium,
    zoneName="FlexLab-X3-ElecRoom-ZoneA Thermal Zone",
    T_start=275.15) "Attic zone" annotation (Placement(transformation(
          extent={{-108,116},{-68,156}})));

  parameter String idfName=Modelica.Utilities.Files.loadResource(
    "modelica://Buildings/Resources/Data/ThermalZones/EnergyPlus_9_6_0/Examples/RefBldgSmallOffice/RefBldgSmallOfficeNew2004_Chicago.idf")
    "Name of the IDF file";
  parameter String epwName=Modelica.Utilities.Files.loadResource(
    "modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.epw")
    "Name of the weather file";
  parameter String weaName=Modelica.Utilities.Files.loadResource(
    "modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos")
    "Name of the weather file";

  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C=18*
        51.0157*1005*1.225)
    annotation (Placement(transformation(extent={{202,-66},{222,-46}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C=18*
        51.0157*1005*1.225)
    annotation (Placement(transformation(extent={{186,26},{206,46}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor2(C=18*
        51.0157*1005*1.225)
    annotation (Placement(transformation(extent={{198,140},{218,160}})));
protected
  inner Buildings.ThermalZones.EnergyPlus_9_6_0.Building           building(
    idfName=idfName,
    epwName=epwName,
    weaName=weaName,
    computeWetBulbTemperature=false) "Building-level declarations"
    annotation (Placement(transformation(extent={{140,460},{160,480}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant qGai_flow[3](
    k={0,0,0})
    "Internal heat gain (computed already in EnergyPlus"
    annotation (Placement(transformation(extent={{-140,-40},{-120,-20}})));

initial equation
  assert(
    abs(
      cor.V-VRooCor) < 0.01,
    "Volumes don't match. These had to be entered manually to avoid using a non-literal value.");
  assert(
    abs(
      sou.V-VRooSou) < 0.01,
    "Volumes don't match. These had to be entered manually to avoid using a non-literal value.");
  assert(
    abs(
      nor.V-VRooNor) < 0.01,
    "Volumes don't match. These had to be entered manually to avoid using a non-literal value.");
  assert(
    abs(ple.V
           -VRooEas) < 0.01,
    "Volumes don't match. These had to be entered manually to avoid using a non-literal value.");
  assert(
    abs(clo.V
           -VRooWes) < 0.01,
    "Volumes don't match. These had to be entered manually to avoid using a non-literal value.");

  // Other models may override the assignment for AFlo. Hence we check below for consistency.
  assert(
    abs(
      cor.AFlo-AFloCor) < 0.01,
    "Areas don't match. Make sure model that overrides these parameter defaults uses the same values as the idf file uses.");
  assert(
    abs(
      sou.AFlo-AFloSou) < 0.01,
    "Areas don't match. Make sure model that overrides these parameter defaults uses the same values as the idf file uses.");
  assert(
    abs(
      nor.AFlo-AFloNor) < 0.01,
    "Areas don't match. Make sure model that overrides these parameter defaults uses the same values as the idf file uses.");
  assert(
    abs(ple.AFlo
              -AFloEas) < 0.01,
    "Areas don't match. Make sure model that overrides these parameter defaults uses the same values as the idf file uses.");
  assert(
    abs(clo.AFlo
              -AFloWes) < 0.01,
    "Areas don't match. Make sure model that overrides these parameter defaults uses the same values as the idf file uses.");

equation
  connect(sou.heaPorAir,temAirSou.port)
    annotation (Line(points={{164,-24},{224,-24},{224,100},{264,100},{264,350},{290,350}},color={191,0,0},smooth=Smooth.None));
  connect(ple.heaPorAir,temAirPle.port)
    annotation (Line(points={{320,88},{286,88},{286,320},{292,320}},color={191,0,0},smooth=Smooth.None));
  connect(nor.heaPorAir,temAirNor.port)
    annotation (Line(points={{164,136},{164,136},{164,290},{292,290}},color={191,0,0},smooth=Smooth.None));
  connect(clo.heaPorAir,temAirWes.port)
    annotation (Line(points={{32,78},{70,78},{70,114},{186,114},{186,258},{292,258}},color={191,0,0},smooth=Smooth.None));
  connect(cor.heaPorAir,temAirCor.port)
    annotation (Line(points={{164,80},{164,228},{294,228}},color={191,0,0},smooth=Smooth.None));
  connect(sou.ports[1],portsSou[1])
    annotation (Line(points={{162.667,-43.1},{164,-43.1},{164,-54},{86,-54},{86,
          -36},{85,-36}},                                                                    color={0,127,255},smooth=Smooth.None));
  connect(sou.ports[2],portsSou[2])
    annotation (Line(points={{164,-43.1},{166,-43.1},{166,-50},{88,-50},{88,-36},
          {95,-36}},                                                                          color={0,127,255},smooth=Smooth.None));
  connect(ple.ports[1],portsEas[1])
    annotation (Line(points={{318.667,68.9},{300,68.9},{300,36},{325,36}},
                                                                        color={0,127,255},smooth=Smooth.None,thickness=0.5));
  connect(ple.ports[2],portsEas[2])
    annotation (Line(points={{320,68.9},{300,68.9},{300,36},{335,36}},  color={0,127,255},smooth=Smooth.None,thickness=0.5));
  connect(nor.ports[1],portsNor[1])
    annotation (Line(points={{162.667,116.9},{164,116.9},{164,104},{88,104},{88,
          124},{85,124}},                                                                    color={0,127,255},smooth=Smooth.None));
  connect(nor.ports[2],portsNor[2])
    annotation (Line(points={{164,116.9},{164,116.9},{164,110},{88,110},{88,124},
          {95,124}},                                                                          color={0,127,255},smooth=Smooth.None));
  connect(clo.ports[1],portsWes[1])
    annotation (Line(points={{31,58.9},{30,58.9},{30,44},{-35,44}},  color={0,127,255},smooth=Smooth.None));
  connect(clo.ports[2],portsWes[2])
    annotation (Line(points={{33,58.9},{-2,58.9},{-2,44},{-25,44}},  color={0,127,255},smooth=Smooth.None));
  connect(cor.ports[1],portsCor[1])
    annotation (Line(points={{162.5,60.9},{164,60.9},{164,26},{90,26},{90,46},{
          85,46}},                                                                       color={0,127,255},smooth=Smooth.None));
  connect(cor.ports[2],portsCor[2])
    annotation (Line(points={{163.5,60.9},{164,60.9},{164,32},{90,32},{90,46},{
          95,46}},                                                                        color={0,127,255},smooth=Smooth.None));
  connect(leaSou.port_b,sou.ports[3])
    annotation (Line(points={{-22,400},{-2,400},{-2,-72},{134,-72},{134,-54},{
          165.333,-54},{165.333,-43.1}},                                                            color={0,127,255},smooth=Smooth.None,thickness=0.5));
  connect(leaPle.port_b,ple.ports[3])
    annotation (Line(points={{-22,360},{246,360},{246,68.9},{321.333,68.9}},
                                                                        color={0,127,255},smooth=Smooth.None,thickness=0.5));
  connect(leaNor.port_b,nor.ports[3])
    annotation (Line(points={{-20,320},{138,320},{138,116.9},{165.333,116.9}},
                                                                          color={0,127,255},smooth=Smooth.None,thickness=0.5));
  connect(cor.ports[4], senRelPre.port_a)
    annotation (Line(points={{165.5,60.9},{164,60.9},{164,24},{128,24},{128,250},
          {60,250}},                                                                         color={0,127,255},smooth=Smooth.None,thickness=0.5));
  connect(sou.qGai_flow,qGai_flow.y)
    annotation (Line(points={{142,-14},{64,-14},{64,-30},{-118,-30}},color={0,0,127}));
  connect(clo.qGai_flow,qGai_flow.y)
    annotation (Line(points={{10,88},{-60,88},{-60,-30},{-118,-30}},color={0,0,127}));
  connect(ple.qGai_flow,qGai_flow.y)
    annotation (Line(points={{298,98},{200,98},{200,110},{-60,110},{-60,-30},{-118,-30}},color={0,0,127}));
  connect(cor.qGai_flow,qGai_flow.y)
    annotation (Line(points={{142,90},{130,90},{130,110},{-60,110},{-60,-30},{-118,-30}},color={0,0,127}));
  connect(nor.qGai_flow,qGai_flow.y)
    annotation (Line(points={{142,146},{-60,146},{-60,-30},{-118,-30}},color={0,0,127}));
  connect(ele.qGai_flow,qGai_flow.y)
    annotation (Line(points={{-110,146},{-120,146},{-120,-12},{-118,-12},{-118,-30}},      color={0,0,127}));
  connect(sou.heaPorAir,heaPorSou)
    annotation (Line(points={{164,-24},{140,-24},{140,-36},{116,-36}},color={191,0,0}));
  connect(ple.heaPorAir,heaPorEas)
    annotation (Line(points={{320,88},{330,88},{330,52}},color={191,0,0}));
  connect(nor.heaPorAir,heaPorNor)
    annotation (Line(points={{164,136},{116,136},{116,124}},color={191,0,0}));
  connect(clo.heaPorAir,heaPorWes)
    annotation (Line(points={{32,78},{-30,78},{-30,66}},color={191,0,0}));
  connect(cor.heaPorAir,heaPorCor)
    annotation (Line(points={{164,80},{116,80},{116,46}},color={191,0,0}));
  connect(heatCapacitor.port, sou.heaPorAir) annotation (Line(points={{212,-66},
          {186,-66},{186,-22},{164,-22},{164,-24}}, color={191,0,0}));
  connect(heatCapacitor1.port, cor.heaPorAir) annotation (Line(points={{196,26},
          {196,24},{160,24},{160,52},{136,52},{136,80},{164,80}}, color={191,0,
          0}));
  connect(heatCapacitor2.port, nor.heaPorAir) annotation (Line(points={{208,140},
          {208,136},{192,136},{192,160},{184,160},{184,164},{164,164},{164,136}},
        color={191,0,0}));
  annotation (
    Diagram(
      coordinateSystem(
        preserveAspectRatio=true,
        extent={{-160,-100},{380,500}},
        initialScale=0.1)),
    Icon(
      coordinateSystem(
        preserveAspectRatio=true,
        extent={{-80,-80},{380,180}}),
      graphics={
        Rectangle(
          extent={{-80,-80},{380,180}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,160},{360,-60}},
          pattern=LinePattern.None,
          lineColor={117,148,176},
          fillColor={170,213,255},
          fillPattern=FillPattern.Sphere),
        Rectangle(
          extent={{0,-80},{294,-60}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{0,-74},{294,-66}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{8,8},{294,100}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{20,88},{280,22}},
          pattern=LinePattern.None,
          lineColor={117,148,176},
          fillColor={170,213,255},
          fillPattern=FillPattern.Sphere),
        Polygon(
          points={{-56,170},{20,94},{12,88},{-62,162},{-56,170}},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{290,16},{366,-60},{358,-66},{284,8},{290,16}},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{284,96},{360,168},{368,162},{292,90},{284,96}},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-80,120},{-60,-20}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-74,120},{-66,-20}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-64,-56},{18,22},{26,16},{-58,-64},{-64,-56}},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{360,122},{380,-18}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{366,122},{374,-18}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{2,170},{296,178}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{2,160},{296,180}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{2,166},{296,174}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Bitmap(
          extent={{192,-58},{342,-18}},
          fileName="modelica://Buildings/Resources/Images/ThermalZones/EnergyPlus/spawn_icon_darkbluetxmedres.png",
          visible=not usePrecompiledFMU)}),
    Documentation(
      info="<html>
<p>
Model of a floor that consists
of five thermal zones.
</p>
<p>
The five room model is representative of one floor of the
new construction small office building for Chicago, IL,
as described in the set of DOE Commercial Building Benchmarks
(Deru et al, 2009). There are four perimeter zones and one core zone.
The envelope thermal properties meet ASHRAE Standard 90.1-2004.
</p>
<p>
Each thermal zone can have air flow from the HVAC system,
through leakages of the building envelope (except for the core zone)
and through bi-directional air exchange through open doors that connect adjacent zones.
The bi-directional air exchange is modeled based on the differences in
static pressure between adjacent rooms at a reference height plus the
difference in static pressure across the door height as a function of the difference in air density.
Infiltration is a function of the
flow imbalance of the HVAC system.
</p>
<h4>Implementation</h4>
<p>
Compared to the base class, which has been built for the models in
<a href=\"modelica://Buildings.Examples.VAVReheat\">
Buildings.Examples.VAVReheat</a> which are for a larger building,
the instances of
<a href=\"modelica://Buildings.Airflow.Multizone.DoorOpen\">
Buildings.Airflow.Multizone.DoorOpen</a> are made smaller.
Their length has been reduced proportionally
to the difference in length of the walls of the core zone of the two buildings.
See also <a href=\"modelica://Buildings.ThermalZones.EnergyPlus_9_6_0.Examples.SmallOffice\">
Buildings.ThermalZones.EnergyPlus_9_6_0.Examples.SmallOffice</a>
for a description of the differences in these buildings.
</p>
<h4>References</h4>
<p>
Deru M., K. Field, D. Studer, K. Benne, B. Griffith, P. Torcellini,
 M. Halverson, D. Winiarski, B. Liu, M. Rosenberg, J. Huang, M. Yazdanian, and D. Crawley.
<i>DOE commercial building research benchmarks for commercial buildings</i>.
Technical report, U.S. Department of Energy, Energy Efficiency and
Renewable Energy, Office of Building Technologies, Washington, DC, 2009.
</p>
</html>",
      revisions="<html>
<ul>
<li>
February 16, 2022, by Michael Wetter:<br/>
Removed assertion on <code>opeWesCor.wOpe</code> as there is no need to enforce this width.
</li>
<li>
April 30, 2021, by Michael Wetter:<br/>
Reformulated replaceable class and introduced floor areas in base class
to avoid access of components that are not in the constraining type.<br/>
This is for <a href=\"https://github.com/lbl-srg/modelica-buildings/issues/2471\">issue #2471</a>.
</li>
<li>
November 15, 2019, by Milica Grahovac:<br/>
Added extend from a partial floor model.
</li>
<li>
May 1, 2013, by Michael Wetter:<br/>
Declared the parameter record to be a parameter, as declaring its elements
to be parameters does not imply that the whole record has the variability of a parameter.
</li>
</ul>
</html>"));
end Floor;
