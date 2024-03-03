within hil_flexlab_model.Examples;
model testHilParameterChange
  input Real resultNum=if cityNum.y==1 then 100
 else
     if cityNum.y==2 then 200
 else
     if cityNum.y==3 then 300
 else
     400
  "resultNum";

    // input String resultStr=Modelica.Utilities.Files.loadResource(if cityNum.y==1 then "modelica://hil_flexlab_model/Resources/weatherdata/US_Berkeley_20210913.mos" else if cityNum.y==2 then "modelica://hil_flexlab_model/Resources/weatherdata/USA_FL_Tampa.Intl.AP.722110_TMY3.mos" else if cityNum.y==3 then "modelica://hil_flexlab_model/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos" else if cityNum.y==4 then "modelica://hil_flexlab_model/Resources/weatherdata/USA_NY_New.York-Downtown.Manhattan.Heli.720553_TMYx.mos" else if cityNum.y==5 then "modelica://hil_flexlab_model/Resources/weatherdata/USA_CA_Victorville-George.AFB-So.California.Logistics.AP.723825_TMYx.mos" else "None")
  //"resultNum";

  Modelica.Blocks.Sources.IntegerConstant
                                   cityNum(final k=6)
    annotation (Placement(transformation(extent={{-74,34},{-54,54}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
        Modelica.Utilities.Files.loadResource("modelica://hil_flexlab_model/Resources/weatherdata/USA_FL_Tampa.Intl.AP.722110_TMY3.mos"))
    annotation (Placement(transformation(extent={{-40,-52},{-20,-32}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end testHilParameterChange;
