within hil_flexlab_model.Examples;
model testSpawnNoAhu

    package MediumA = Buildings.Media.Air "Medium model for air";
  package MediumW = Buildings.Media.Water "Medium model for water";
  ThermalZones.Floor_withAuxRooms
                                flo(
    nor(T_start=294.96),
    cor(T_start=294.96),
    sou(T_start=294.96),
    idfName=Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/Data/ThermalZones/EnergyPlus_9_6_0/Examples/energyPlusFiles/X1-2021-V8_v2_correctedInternalGain.idf"),
    epwName=Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/weatherdata/US_Berkeley_2021.epw"),
    weaName=Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/weatherdata/US_Berkeley_2021.mos"),
    ele(T_start=294.96),
    clo(T_start=294.96),
    ple(T_start=294.96),
    redeclare final package Medium = MediumA,
    final use_windPressure=true)
    "Model of a floor of the building that is served by this VAV system"
    annotation (Placement(transformation(extent={{110,-116},{424,62}})));

  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
        Modelica.Utilities.Files.loadResource(
        "modelica://Buildings/Resources/weatherdata/US_Berkeley_2021.mos"))
    annotation (Placement(transformation(extent={{-72,-76},{-52,-56}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather Data Bus"
    annotation (Placement(transformation(extent={{-42,-76},{-22,-56}}),
        iconTransformation(extent={{-360,170},{-340,190}})));
equation
  connect(weaDat.weaBus,weaBus)  annotation (Line(
      points={{-52,-66},{-32,-66}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaBus, flo.weaBus) annotation (Line(
      points={{-32,-66},{46,-66},{46,89.3846},{307.957,89.3846}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-360},
            {460,100}})), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-360},{460,100}})));
end testSpawnNoAhu;
