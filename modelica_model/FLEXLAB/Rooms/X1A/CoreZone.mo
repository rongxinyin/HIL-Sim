within FLEXLAB.Rooms.X1A;
model CoreZone "Model of LBNL User Test Facility Cell X1A Core Zone"
  extends Buildings.ThermalZones.Detailed.MixedAir(AFlo=19.79,
      nSurBou=1,
      nConPar=0,
      nConBou=4,
      nConExt=1,
      nConExtWin=0,
      hRoo=3.6576,
      surBou(
        A = {6.49*3.05},
        each absIR=0.9,
        each absSol=0.9,
        each til=Buildings.Types.Tilt.Floor),
      datConExt(
         layers={WestExt},
         A={3.05*2.74},
         til={Buildings.Types.Tilt.Wall},
         azi={Buildings.Types.Azimuth.W}),
      datConBou(
         layers = {celDiv, zonDiv, zonDiv, ceiling},
         A = {3.05*2.74, 6.49*2.74, 6.49*2.74, 6.49*3.05},
         til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall,Buildings.Types.Tilt.Ceiling},
         azi = {Buildings.Types.Azimuth.E, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.S},
         stateAtSurface_a = {false, false, true, true}),
      intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
      extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
      lat=0.66098585832754);

  replaceable parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.Construction10and23
                                                                     R16p8Wal
    annotation (Placement(transformation(extent={{410,-168},{430,-148}})));
  replaceable parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.CellAndElectricalDividingWall
                                                                      R52Wal
    annotation (Placement(transformation(extent={{410,-192},{430,-172}})));
  replaceable parameter Data.Constructions.OpaqueConstructions.Roofs.ASHRAE_901_1975Roof
                                                                   R20Wal
    annotation (Placement(transformation(extent={{410,-216},{430,-196}})));
  replaceable parameter Data.Constructions.GlazingSystems.ASHRAE901Gla glaSys
    annotation (Placement(transformation(extent={{436,-192},{456,-172}})));
  replaceable parameter
    Data.Constructions.OpaqueConstructions.PartitionConstructions.PartitionWall
    parCon
    annotation (Placement(transformation(extent={{436,-216},{456,-196}})));

  replaceable parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.TestCellDividngWall
                                                                         celDiv
    "Construction of wall connecting to cell UF90X3B"
    annotation (Placement(transformation(extent={{410,-144},{430,-124}})));
  replaceable parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.TestBedDividingWall
                                                                         bedDiv
    "Construction of wall connecting to cell UF90X2B"
    annotation (Placement(transformation(extent={{410,-120},{430,-100}})));
  replaceable parameter
    Data.Constructions.OpaqueConstructions.ExteriorConstructions.Construction1
                                                                        WestExt
    annotation (Placement(transformation(extent={{410,-94},{430,-74}})));
  replaceable parameter
    Data.Constructions.OpaqueConstructions.DividingWalls.TestZoneDividngWall
                                                                         zonDiv
    "Construction of wall connecting to vav zone"
    annotation (Placement(transformation(extent={{410,-68},{430,-48}})));
  replaceable parameter Data.Constructions.OpaqueConstructions.Roofs.CeilingTile ceiling
    annotation (Placement(transformation(extent={{384,-68},{404,-48}})));
  annotation(Documentation(info="<html>
<p>This is a model for test cell 3A in the LBNL User Facility. This model is intended to represent the main space in test cell 3A. This documentation describes the wall constructions used to model test cell X1A. Documentation describing how it is to be combined to other room models to create a model of the full test cell can be found in <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X1A\">Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X1A</a>. </p>
<p>There are 7 different wall sections described in the model. They are shown in the figure below. </p>
<p align=\"center\"><img src=\"modelica://Buildings/Resources/Images/ThermalZones/Detailed/FLEXLAB/Rooms/X1A/TestCell.png\" alt=\"Wall sections in test cell model\"/> </p>
<p>The different wall sections are entered into the model according to the following table. </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Wall Section Number</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
<td><p align=\"center\"><h4>Location in Model</h4></p></td>
<td><p align=\"center\"><h4>Corresponding Layer</h4></p></td>
</tr>
<tr>
<td><p>1</p></td>
<td><p>This is the west exterior wall of test cell X1A Core Zone, which is exposed to ambient conditions.</p></td>
<td><p>datConExt[2]</p></td>
<td><p>R16p8Wal</p></td>
</tr>
<tr>
<td><p>2</p></td>
<td><p>This is the north partition wall that connects to the south partition wall in X1A north zone.</p></td>
<td><p>datConBou[2]</p></td>
<td><p>parCon</p></td>
</tr>
<tr>
<td><p>3</p></td>
<td><p>This east wall connects to test cell X1B core Zone.</p></td>
<td><p>datConBou[1]</p></td>
<td><p><span style=\"font-family: Courier New;\">celDiv</span></p></td>
</tr>
<tr>
<td><p>4</p></td>
<td><p>This is the south partition wall that connects to the north partition wall in X1A south zone.</p></td>
<td><p>datConBou[3]</p></td>
<td><p>parCon</p></td>
</tr>
</table>
<p><br><br>An eigth construction, not shown in the figure, models the ceiling. It is modeled in datConExt[3] using the layer <span style=\"font-family: Courier New;\">R20Wal</span>. </p>
<p>The test cell can be configured with several different floor types. The options include radiant conditioning, a slab on grade floor with no conditioning, or a raised floor. Because of this uncertainty in floor design, a model of the floor itself is not included in this model. The user must include a model for the floor in any applications of this model. </p>
<p>Several of the connections in this model are intended to be connected to specific surfaces in other room models. The following table describes the connections to models outside of the X1A package. The connections in datConExt are not described in the table because they are connected to the external environment, and no additional heat port connections are necessary. A rationale for why the model is created this way is also provided if it is considered necessary. </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Location in TestCell</h4></p></td>
<td><p align=\"center\"><h4>Description of External Connection</h4></p></td>
<td><p align=\"center\"><h4>Location in External Model</h4></p></td>
<td><p align=\"center\"><h4>Rationale</h4></p></td>
</tr>
<tr>
<td><p>surf_conBou[1]</p></td>
<td><p>Temperature of test cell X2B</p></td>
<td><p>References a data table</p></td>
<td><p>A data table is used, instead of a model of test cell X2B, because the goal of this model is to be able to perform simulations of TestCellSouthZone with minimal complexity, by simplifying the neighboring test cells. The wall separating the test beds is highly insulated, and it is believed that the error in simulations caused by using a data table will be negligible.</p></td>
</tr>
<tr>
<td><p>surf_conBou[2]</p></td>
<td><p>Temperature of test cell X3B</p></td>
<td><p>References a data table</p></td>
<td><p>See rationale for surf_ConBou[1]</p></td>
</tr>
</table>
</html>",
  revisions="<html>
<ul>
<li>March 18, 2021 by Rongxin Yin:<br>First implementation. </li>
</ul>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},
            {200,200}}),       graphics={
        Bitmap(extent={{-160,164},{162,-166}}, fileName=
              "modelica://Buildings/Resources/Images/ThermalZones/Detailed/FLEXLAB/Rooms/icon.png"),
                Rectangle(
          extent={{-58,12},{-26,-8}},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-74,-26},{-22,-42}},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-108,-132},{-56,-148}},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-136,-82},{-84,-98}},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-60,12},{-22,-10}},
          lineColor={0,0,0},
          fillColor={61,61,61},
          fillPattern=FillPattern.Solid,
          textString="air"),
        Text(
          extent={{-72,-22},{-22,-50}},
          lineColor={0,0,0},
          fillColor={61,61,61},
          fillPattern=FillPattern.Solid,
          textString="radiation"),
        Text(
          extent={{-104,-124},{-54,-152}},
          lineColor={0,0,0},
          fillColor={61,61,61},
          fillPattern=FillPattern.Solid,
          textString="surface"),
        Text(
          extent={{-138,-82},{-96,-100}},
          lineColor={0,0,0},
          fillColor={61,61,61},
          fillPattern=FillPattern.Solid,
          textString="fluid")}));
end CoreZone;
