within hil_flexlab_model.ThermalZones;
package XRA "Models of rooms in test cell XRA"
extends Modelica.Icons.Package;

  model Closet "Model of the closet connected to test cell X3A"
    extends Buildings.ThermalZones.Detailed.MixedAir(
    hRoo = 3.6576,
    AFlo = 3.93,
    lat = 0.66098585832754,
    nConExt = 2,
    nConBou = 3,
    nSurBou = 2,
    nConExtWin = 0,
    nConPar = 0,
    surBou(
      A = {3.6576 * 2.886075 - 2.39*1.22, 2.39 * 1.22},
      each absIR = 0.9,
      each absSol = 0.9,
      each til=Buildings.Types.Tilt.Wall),
    datConExt(
      layers = {higIns, roo},
      A = {3.6576 * 1.667, AFlo},
      til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling},
      azi = {Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.N}),
    datConBou(
      layers = {higIns, celDiv, slaCon},
      A = {3.6576*1.524, 3.6576 * 1.524, 3.93},
      til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Floor},
      azi = {Buildings.Types.Azimuth.W, Buildings.Types.Azimuth.E, Buildings.Types.Azimuth.N},
      stateAtSurface_a = {true, false, false}));

    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.DividingWalls.CellAndElectricalDividingWall
      higIns
      "High insulation wall. Between X3A closet and exterior, X3A closet and electrical room"
      annotation (Placement(transformation(extent={{430,-208},{450,-188}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.DividingWalls.TestCellDividngWall
      celDiv "Wall dividing the X3A closet and the X3B closet"
      annotation (Placement(transformation(extent={{430,-178},{450,-158}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.Roofs.ASHRAE_901_2010Roof
      roo "Construction of the roof of the closet in X3A"
      annotation (Placement(transformation(extent={{430,-148},{450,-128}})));

    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic slaCon(nLay=3,
        material={Buildings.HeatTransfer.Data.Solids.Generic(
            x=0.1524,
            k=1.13,
            c=1000,
            d=1400,
            nSta=5),Buildings.HeatTransfer.Data.Solids.Generic(
            x=0.127,
            k=0.036,
            c=1200,
            d=40),Buildings.HeatTransfer.Data.Solids.Generic(
            x=0.2,
            k=1.8,
            c=1100,
            d=2400)}) "Construction of the slab"
      annotation (Placement(transformation(extent={{432,-118},{452,-98}})));
      annotation (Documentation(info="<html>
    <p>
    This is a model for the closet attached to test cell 3A in the LBNL User Facility.
    This documentation describes the wall constructions used in the closet. Documentation
    describing how it should be connected to other models in the package to form a
    complete model of test cell X3A can be found in
    <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A\">
    Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A</a>.
    </p>
    <p>
    There are four different wall sections connected to the closet modeled here. They are shown
    in the figure below.
    </p>
    <p align=\"center\">
    <img src=\"modelica://Buildings/Resources/Images/ThermalZones/Detailed/FLEXLAB/Rooms/X3A/Closet.png\" border=\"1\" alt=\"Wall sections in Closet model\"/>
    </p>
    <p>
    The different wall sections are represented in the model according to the following table.
    </p>
    <table border = \"1\" summary = \"Wall sections in Closet model\">
    <tr>
    <th>Wall Section Number</th>
    <th>Description</th>
    <th>Location in Model</th>
    <th>Corresponding Layer</th>
    </tr>
    <tr>
    <td>1</td>
    <td>North wall on the exterior of the buildings</td>
    <td>datConExt[1]</td>
    <td>higIns</td>
    </tr>
    <tr>
    <td>2</td>
    <td>East wall connected to ThermalZones.Detailed.FLEXLAB.Rooms.X3B.Closet</td>
    <td>datConBou[2]</td>
    <td>celDiv</td>
    </tr>
    <tr>
    <td>3</td>
    <td>Air space connected to partition wall and door in TestCell model</td>
    <td>Wall: datSurBou[1]<br/>
    Door: datSurBou[2]</td>
    </tr>
    <tr>
    <td>4</td>
    <td>West wall connected to Electrical</td>
    <td>datConBou[1]</td>
    <td>higIns</td>
    </tr>
    </table>
    <p>
    There are two additional surfaces which are not included in the diagram. One is the model of the roof. It is
    modeled in datConExt[2] using the layer <code>roo</code>. The other is the floor, which is modeled in
    datConBou[1] using the layer <code>slaCon</code>.
    </p>
    <p>
    Several of the connections in this model are intended to be connected to specific surfaces in other room models.
    The following table describes the connections to models outside of the X3A package.. The connections in datConExt
    are not described in the table because they are connected to the external environment, and no additional heat
    port connections are necessary. A rationale for why the model is created this way is also provided if it is
    considered necessary.
    </p>
    <table border =\"1\" summary=\"Intended connections including the Closet model\">
    <tr>
    <th>Location in Closet</th>
    <th>Description of External Connection</th>
    <th>Location in External Model</th>
    <th>Rationale</th>
    </tr>
    <tr>
    <td>surf_conBou[2]</td>
    <td>X3B.Closet</td>
    <td>References a data table</td>
    <td>A data table is used, instead of a model of ThermalZones.Detailed.FLEXLAB.Rooms.X3B.Closet, because the goal of this model is to be able to perform
    simulations of TestCell with minimal complexity, by simplifying the neighboring test cells. The wall separating the
    test cells is highly insulated, and it is believed that the error in simulations caused by using a data table will
    be negligible.</td>
    </tr>
    <tr>
    <td>surf_conBou[3]</td>
    <td>Ground temperature</td>
    <td></td>
    <td>There is no specific connection which is appropriate connection for this construction. surf_conBou[3] represents
    the floor of the room, and must be connected to a heat port representing the ground temperature.</td>
    </tr>
    </table>
    </html>",
      revisions = "<html>
    <ul>
    <li>Jan 25, 2022 by Rongxin:<br/>
    Modified XR testing cell a.</li>
    <li>Sept 16, 2013 by Peter Grant:<br/>
    Added a model representing the floor.</li>
    <li>July 26, 2013 by Peter Grant:<br/>
    First implementation.</li>
    </ul>
    </html>"),   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,
              -200},{200,200}}), graphics={
          Bitmap(extent={{-160,164},{162,-166}}, fileName=
                "modelica://Buildings/Resources/Images/ThermalZones/Detailed/FLEXLAB/Rooms/icon.png"),
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
          Rectangle(
            extent={{-74,-26},{-22,-42}},
            pattern=LinePattern.None,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-58,12},{-26,-8}},
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
  end Closet;

  model ClosetFullBed
    "Model of the closet connected to test cell X3A intended to be connected to ThermalZones.Detailed.FLEXLAB.Rooms.X3B.Closet"
    extends Buildings.ThermalZones.Detailed.MixedAir(
    hRoo = 3.6576,
    AFlo = 3.93,
    lat = 0.66098585832754,
    nConExt = 2,
    nConBou = 2,
    nSurBou = 3,
    nConExtWin = 0,
    nConPar = 0,
    surBou(
      A = {3.6576 * 2.886075 - 2.39*1.22, 2.39 * 1.22, 3.6576 * 1.524},
      each absIR = 0.9,
      each absSol = 0.9,
      each til=Buildings.Types.Tilt.Wall),
    datConExt(
      layers = {higIns, roo},
      A = {3.6576 * 1.667, AFlo},
      til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling},
      azi = {Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.N}),
    datConBou(
      layers = {higIns, slaCon},
      A = {3.6576*1.524, 3.93},
      til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Floor},
      azi = {Buildings.Types.Azimuth.W, Buildings.Types.Azimuth.N},
      stateAtSurface_a = {true, false}));

    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.DividingWalls.CellAndElectricalDividingWall
      higIns
      "High insulation wall. Between X3A closet and exterior, X3A closet and electrical room"
      annotation (Placement(transformation(extent={{430,-208},{450,-188}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.DividingWalls.TestCellDividngWall
      celDiv "Wall dividing the X3A closet and the X3B closet"
      annotation (Placement(transformation(extent={{430,-178},{450,-158}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.Roofs.ASHRAE_901_2010Roof
      roo "Construction of the roof of the closet in X3A"
      annotation (Placement(transformation(extent={{430,-148},{450,-128}})));

    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic slaCon(nLay=3,
        material={Buildings.HeatTransfer.Data.Solids.Generic(
            x=0.1524,
            k=1.13,
            c=1000,
            d=1400,
            nSta=5),Buildings.HeatTransfer.Data.Solids.Generic(
            x=0.127,
            k=0.036,
            c=1200,
            d=40),Buildings.HeatTransfer.Data.Solids.Generic(
            x=0.2,
            k=1.8,
            c=1100,
            d=2400)}) "Construction of the slab"
      annotation (Placement(transformation(extent={{432,-118},{452,-98}})));
      annotation (Documentation(info="<html>
    <p>
    This is a duplicate model of <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.Closet\">
    Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.Closet</a> with the wall separating this model and
    <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3B.Closet\">
    Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3B.Closet</a> removed. It is intended for use in simulations
    which include both room models to simulate the whole test bed. If the regular models are used
    the wall separating the closets will be modeled twice, so one model must have the wall removed.
    This documentation only describes the walls and connections which are different from
    <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.Closet\">
    Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.Closet</a>. For information on the rest of the walls
    and connections see that documentation.
    </p>
    <p>
    There are four different wall sections connected to the closet modeled here. They are shown
    in the figure below. Only wall section 2 is described in this documentation.
    </p>
    <p align=\"center\">
    <img src=\"modelica://Buildings/Resources/Images/ThermalZones/Detailed/FLEXLAB/Rooms/X3A/Closet.png\" border=\"1\" alt=\"Wall sections in Closet model\"/>
    </p>
    <p>
    The different wall sections are represented in the model according to the following table.
    </p>
    <table border = \"1\" summary = \"Wall sections in Closet model\">
    <tr>
    <th>Wall Section Number</th>
    <th>Description</th>
    <th>Location in Model</th>
    <th>Corresponding Layer</th>
    </tr>
    <tr>
    <td>2</td>
    <td>Dividing wall modeled in ThermalZones.Detailed.FLEXLAB.Rooms.X3B.Closet</td>
    <td>surBou[3]</td>
    </tr>
    </table>
    <p>
    As a result of removing the dividing wall construction, the location of the construction of the floor has changed.
    The following table shows the old and new location of this wall construction.
    </p>
    <table border =\"1\" summary=\"Changes to construction locations\">
    <tr>
    <th>Physical Description</th>
    <th>Location in Closet</th>
    <th>Location in ClosetNoCelDiv</th>
    </tr>
    <tr>
    <td>Construction modeling the floor</td>
    <td>datConBou[3]</td>
    <td>datConBou[2]</td>
    </tr>
    </table>
    <p>
    Several of the connections in this model are intended to be connected to specific surfaces in other room models.
    The following table describes the connections to models outside of the X3A package. The connections in datConExt
    are not described in the table because they are connected to the external environment, and no additional heat
    port connections are necessary. A rationale for why the model is created this way is also provided if it is
    considered necessary.
    </p>
    <table border =\"1\" summary=\"Intended connections including the Closet model\">
    <tr>
    <th>Location in Closet</th>
    <th>Description of External Connection</th>
    <th>Location in External Model</th>
    <th>Rationale</th>
    </tr>
    <tr>
    <td>surf_surBou[3]</td>
    <td>X3B.Closet</td>
    <td>X3B.Closet.surf_conBou[2]</td>
    <td>X3B.Closet.surf_conBou[2] is the location of the cell dividing wall in the neighboring closet. Connecting
    X3A.ClosetNoCelDiv.surf_surBou[3] to this port models heat transfer from the wall in ThermalZones.Detailed.FLEXLAB.Rooms.X3B.Closet to the air in this
    space.</td>
    </tr>
    </table>
    </html>",
      revisions = "<html>
    <ul>
    <li>Sep 18, 2013 by Peter Grant:<br/>
    First implementation.</li>
    </ul>
    </html>"),   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,
              -200},{200,200}}), graphics={
          Bitmap(extent={{-160,164},{162,-166}}, fileName=
                "modelica://Buildings/Resources/Images/ThermalZones/Detailed/FLEXLAB/Rooms/icon.png"),
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
          Rectangle(
            extent={{-74,-26},{-22,-42}},
            pattern=LinePattern.None,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-58,12},{-26,-8}},
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
  end ClosetFullBed;

  model Electrical "Model of the electrical room attached to test cell X3A"
    extends Buildings.ThermalZones.Detailed.MixedAir(
    hRoo = 3.6576,
    AFlo = 2.39,
    lat = 0.66098585832754,
    nSurBou = 2,
    nConExt=4,
    nConExtWin=0,
    nConPar=0,
    nConBou=1,
    surBou(
      A = {3.6576 * 1.2641, 3.6576 * 1.524},
      each absIR = 0.9,
      each absSol = 0.9,
      each til = Buildings.Types.Tilt.Wall),
    datConExt(
      layers = {eleExt, eleExt, extDooUn, roo},
      A = {3.6576 * 1.26413, 3.6576 * 1.524 - 2.38658 * 1.524, 2.38658*1.524, 2.39},
      til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling},
      azi = {Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.W, Buildings.Types.Azimuth.W, Buildings.Types.Azimuth.N}),
     datConBou(
       layers = {slaCon},
       A = {2.39},
       til = {Buildings.Types.Tilt.Floor},
       azi = {Buildings.Types.Azimuth.N},
       each stateAtSurface_a = false));
    replaceable
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.ExteriorConstructions.Construction3
      eleExt
      "Construction describing the exterior walls in the electrical room"
      annotation (Placement(transformation(extent={{430,-210},{450,-190}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.ExteriorConstructions.ExteriorDoorUninsulated
      extDooUn "Construction describing the door in the electrical room"
      annotation (Placement(transformation(extent={{430,-178},{450,-158}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.Roofs.ASHRAE_901_2010Roof
      roo "Construction describing the roof of the electrical room"
      annotation (Placement(transformation(extent={{430,-148},{450,-128}})));
    parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic slaCon(nLay=3,
        material={Buildings.HeatTransfer.Data.Solids.Generic(
            x=0.1524,
            k=1.13,
            c=1000,
            d=1400,
            nSta=5),Buildings.HeatTransfer.Data.Solids.Generic(
            x=0.127,
            k=0.036,
            c=1200,
            d=40),Buildings.HeatTransfer.Data.Solids.Generic(
            x=0.2,
            k=1.8,
            c=1100,
            d=2400)}) "Construction of the slab"
      annotation (Placement(transformation(extent={{428,-118},{448,-98}})));
    annotation(Documentation(info="<html>
  <p>
  This is a model for the electrical room connected to test cell 3A in the LBNL User Facility.
  Other models are provided for the main space of the test cell and the connected closet. This
  documentation describes the wall constructions used in the electrical room model. For
  documentation describing how the room models are to be connected to develop a model of the
  entire X3A test cell see
  <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A\">
  Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A</a>.
  </p>
  <p>
  There are 4 different wall sections described in the model. They are shown in the figure below.
  </p>
  <p align=\"center\">
  <img src=\"modelica://Buildings/Resources/Images/ThermalZones/Detailed/FLEXLAB/Rooms/X3A/Electrical.png\" border=\"1\" alt=\"Wall sections in TestCell model\"/>
  </p>
  <p>
  The different wall sections are entered into the model according to the following table.
  </p>
  <table border=\"1\" summary=\"Description of wall sections in EF90Electrical\">
  <tr>
  <th>Wall Section Number</th>
  <th>Description</th>
  <th>Location in Model</th>
  <th>Corresponding Layer</th>
  </tr>
  <tr>
  <td>1</td>
  <td>North exterior wall</td>
  <td>datConExt[1]</td>
  <td>eleExt</td>
  </tr>
  <tr>
  <td>2</td>
  <td>East air space connecting to Closet</td>
  <td>surBou[2]</td>
  </tr>
  <tr>
  <td>3</td>
  <td>South air space connecting to TestCell</td>
  <td>surBou[1]</td>
  </tr>
  <tr>
  <td>4</td>
  <td>West exterior door and wall</td>
  <td>Door: datConExt[3]<br/>
  Wall: datConExt[2]</td>
  <td>  Door: eleExt<br/>
  Wall: extDooUn</td>
  </tr>
  </table>
  <p>
  There are two additional surfaces which are not included in the diagram. One is the model of the roof. It is
  modeled in datConExt[4] using the layer <code>roo</code>. The other is the floor, which is modeled in
  datConBou[1] using the layer <code>slaCon</code>.
  </p>
  <p>
  Several of the connections in this model are intended to be connected to specific surfaces in other room models.
  The following table describes the connections to rooms which are not in the X3A package. The constructions in
  datConExt are not described in the table because they are connected to the external environment, and no
  additional heat port connections are necessary. A rationale for why the model is created this way is also
  provided if it is considered necessary.
  </p>
  <table border =\"1\" summary = \"Description of intended connections including Electrical model\">
  <tr>
  <th>Location in Electrical</th>
  <th>Description of External Connection</th>
  <th>Rationale</th>
  </tr>
  <tr>
  <td>surf_conBou[1]</td>
  <td>Connection to ground temperature model</td>
  <td>This port represents the bottom of the floor in the space. It is to be connected to a heat port representing
  the temperature of the ground.</td>
  </tr>
  </table>
  </html>",
    revisions = "<html>
  <ul>
  <li>Setp 16, 2013 by Peter Grant:<br/>
  Added a model representing the floor.</li>
  <li>July 26, 2013 by Peter Grant:<br/>
  First implementation.</li>
  </ul>
  </html>"),   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,
              -200},{200,200}}), graphics={
          Bitmap(extent={{-160,164},{162,-166}}, fileName=
                "modelica://Buildings/Resources/Images/ThermalZones/Detailed/FLEXLAB/Rooms/icon.png"),
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
          Rectangle(
            extent={{-74,-26},{-22,-42}},
            pattern=LinePattern.None,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-58,12},{-26,-8}},
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
  end Electrical;

  model TestCell "Model of LBNL User Test Facility Cell XRA"
    extends Buildings.ThermalZones.Detailed.MixedAir(AFlo=60.97,
        nSurBou=4,
        nConPar=0,
        nConBou=5,
        nConExt=4,
        nConExtWin=1,
        hRoo=3.6576,
        surBou(
          A = {6.645*3.09, 6.645*1.51, 6.645*0.91, 6.645*3.65},
          each absIR=0.9,
          each absSol=0.9,
          each til=Buildings.Types.Tilt.Floor),
        datConExt(
           layers={extDoo,
           R16p8Wal,
           R20Wal,
           bedDiv},
           A={1.3716 * 2.39, 3.6576*2.52-2.39*1.3716, 6.6675*9.144, 3.6576 * 1.524},
           til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Wall},
           azi={Buildings.Types.Azimuth.N,Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.W}),
        datConBou(
           layers = {bedDiv,celDiv, parCon, parDoo, R52Wal},
           A = {3.6576 * 7.62, 3.6576 * 9.144, 3.6576*2.886075-2.39*1.22, 2.39*1.22, 3.6576*1.2614},
           til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
           azi = {Buildings.Types.Azimuth.W, Buildings.Types.Azimuth.E, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.N},
           stateAtSurface_a = {false, false, true, true, true}),
        datConExtWin(
          layers={R16p8Wal},
          A={6.6675*3.6576},
          glaSys={glaSys},
          hWin={1.8288},
          wWin={5.88},
          til={Buildings.Types.Tilt.Wall},
          azi={Buildings.Types.Azimuth.S}),
        intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
        extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
        lat=0.66098585832754);

    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.ExteriorConstructions.Construction10and23
      R16p8Wal
      annotation (Placement(transformation(extent={{410,-168},{430,-148}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.DividingWalls.CellAndElectricalDividingWall
      R52Wal
      annotation (Placement(transformation(extent={{410,-192},{430,-172}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.Roofs.ASHRAE_901_2010Roof
      R20Wal
      annotation (Placement(transformation(extent={{410,-216},{430,-196}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.PartitionConstructions.PartitionWall
      parCon
      annotation (Placement(transformation(extent={{436,-216},{456,-196}})));

    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.DividingWalls.TestCellDividngWall
      celDiv "Construction of wall connecting to cell UF90X3B"
      annotation (Placement(transformation(extent={{410,-144},{430,-124}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.DividingWalls.TestBedDividingWall
      bedDiv "Construction of wall connecting to cell UF90X2B"
      annotation (Placement(transformation(extent={{410,-120},{430,-100}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.PartitionConstructions.PartitionDoor
      parDoo "Door used in partition walls in FLEXLAB test cells"
      annotation (Placement(transformation(extent={{410,-96},{430,-76}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.ExteriorConstructions.ExteriorDoorInsulated
      extDoo "Construction of an exterior door"
      annotation (Placement(transformation(extent={{410,-72},{430,-52}})));
    parameter
      Data.Constructions.GlazingSystems.SingleClear3
      glaSys(haveInteriorShade=false)
      annotation (Placement(transformation(extent={{346,-152},{366,-132}})));
    annotation(Documentation(info="<html>
  <p>
  This is a model for test cell 3A in the LBNL User Facility. This model is intended to represent
  the main space in test cell 3A. This documentation describes the wall constructions used to model
  test cell X3A. Documentation describing how it is to be combined to other room models to create
  a model of the full test cell can be found in
  <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A\">Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A</a>.
  </p>
  <p>
  There are 7 different wall sections described in the model. They are shown in the figure below.
  </p>
  <p align=\"center\">
  <img src=\"modelica://Buildings/Resources/Images/ThermalZones/Detailed/FLEXLAB/Rooms/X3A/TestCell.png\" border=\"1\" alt=\"Wall sections in test cell model\"/>
  </p>
  <p>
  The different wall sections are entered into the model according to the following table.
  </p>
  <table border = \"1\" summary=\"Description of walls in test cell room model\">
  <tr>
  <th>Wall Section Number</th>
  <th>Description</th>
  <th>Location in Model</th>
  <th>Corresponding Layer</th>
  </tr>
  <tr>
  <td>1</td>
  <td>The west wall is modeled in two parts. One part represents the dividing wall between test cells X3A
  and X2B. The other part represents a portion of the wall exposed to the ambient conditions. Wall
  1 is the section of wall connected to test cell X2B.</td>
  <td>datConBou[1]</td>
  <td>bedDiv</td>
  </tr>
  <tr>
  <td>2</td>
  <td>The west wall is modeled in two parts. One part represents the dividing wall between test cell X3A
  and test cell X2B. The other part represents a portion of the wall exposed to the ambient conditions. Wall
  2 is the section of wall exposed to ambient conditions.</td>
  <td>datConExt[4]</td>
  <td>bedDiv</td>
  </tr>
  <tr>
  <td>3</td>
  <td>This is the north exterior wall of test cell X3A. There are actually two constructions
  used here. One construction models the wall, the other construction models a door. The area
  calculation for the wall in the model shows the calculation of the total wall area minus the door area.</td>
  <td>Door: datConExt[1]; Wall: datConExt[2]</td>
  <td>Door: extDoo; Wall: R16p8Wal</td>
  </tr>
  <tr>
  <td>4</td>
  <td>This north wall borders an electrical room. It models the heat transfer between test cell
  X3A and the externally modeled electrical room. For an example see
  <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.Examples.X3AWithRadiantFloor\">
  Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.Examples.X3AWithRadiantFloor</a>.</td>
  <td>datConBou[5]</td>
  <td>R52Wal</td>
  </tr>
  <tr>
  <td>5</td>
  <td>This north wall borders an externally modeled closet. For an example see
  <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.Examples.X3AWithRadiantFloor\">
  Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.Examples.X3AWithRadiantFloor</a>. Similar to wall section
  3 this wall section contains both a wall construction and a door construction. The wall area
  calculation shows the total wall area minus the door area.</td>
  <td>Door: datConBou[4]; Wall: datConBou[3]</td>
  <td>Door: parDoo; Wall: parCon</td>
  </tr>
  <tr>
  <td>6</td>
  <td>This east wall connects to test cell UF90X3B. This wall is removable, but this model was
  developed assuming that the wall is installed.</td>
  <td>datConBou[2]</td>
  <td>celDiv</td>
  </tr>
  <tr>
  <td>7</td>
  <td>This is the south wall of test cell X3A. It includes both a wall construction and
  windows. The bottoms of the windows are 3 ft above the floor.</td>
  <td>datConExtWin[1]</td>
  <td>Window: glaSys; Wall: R16p8Wal</td>
  </tr>
  </table>
  <p>
  An eigth construction, not shown in the figure, models the ceiling. It is modeled in datConExt[3] using
  the layer <code>R20Wal</code>.
  </p>
  <p>
  The test cell can be configured with several different floor types. The options include radiant conditioning,
  a slab on grade floor with no conditioning, or a raised floor. Because of this uncertainty in floor design, a
  model of the floor itself is not included in this model. The user must include a model for the floor in any
  applications of this model.
  </p>
  <p>
  Several of the connections in this model are intended to be connected to specific surfaces in other room models.
  The following table describes the connections to models outside of the X3A package. The connections in datConExt
  are not described in the table because they are connected to the external environment, and no additional heat
  port connections are necessary. A rationale for why the model is created this way is also provided if it is
  considered necessary.
  </p>
  <table border =\"1\" summary=\"Description of intended connections including TestCell model\">
  <tr>
  <th>Location in TestCell</th>
  <th>Description of External Connection</th>
  <th>Location in External Model</th>
  <th>Rationale</th>
  </tr>
  <tr>
  <td>surf_conBou[1]</td>
  <td>Temperature of test cell X2B</td>
  <td>References a data table</td>
  <td>A data table is used, instead of a model of test cell X2B, because the goal of this model is to be able to perform
  simulations of TestCell with minimal complexity, by simplifying the neighboring test cells. The wall separating the
  test beds is highly insulated, and it is believed that the error in simulations caused by using a data table will
  be negligible.</td>
  </tr>
  <tr>
  <td>surf_conBou[2]</td>
  <td>Temperature of test cell X3B</td>
  <td>References a data table</td>
  <td>See rationale for surf_ConBou[1]</td>
  </tr>
  </table>
  </html>",
    revisions = "<html>
  <ul>
  <li>Jun 10, 2013 by Peter Grant:<br/>
  First implementation.</li>
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
  end TestCell;

  model TestCellFullBed
    "Model of LBNL User Test Facility Cell X3A intended for connection with ThermalZones.Detailed.FLEXLAB.Rooms.X3B.TestCell"
    extends Buildings.ThermalZones.Detailed.MixedAir(AFlo=60.97,
        nSurBou=5,
        nConPar=0,
        nConBou=4,
        nConExt=4,
        nConExtWin=1,
        hRoo=3.6576,
        surBou(
          A = {6.645*3.09, 6.645*1.51, 6.645*0.91, 6.645*3.65, 3.6575 * 9.144},
          each absIR=0.9,
          each absSol=0.9,
          til={Buildings.Types.Tilt.Floor, Buildings.Types.Tilt.Floor, Buildings.Types.Tilt.Floor, Buildings.Types.Tilt.Floor, Buildings.Types.Tilt.Wall}),
        datConExt(
           layers={extDoo,
           R16p8Wal,
           R20Wal,
           bedDiv},
           A={1.3716 * 2.39, 3.6576*2.52-2.39*1.3716, 6.6675*9.144, 3.6576 * 1.524},
           til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Wall},
           azi={Buildings.Types.Azimuth.N,Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.W}),
        datConBou(
           layers = {bedDiv, parCon, parDoo, R52Wal},
           A = {3.6576 * 7.62, 3.6576*2.886075-2.39*1.22, 2.39*1.22, 3.6576*1.2614},
           til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
           azi = {Buildings.Types.Azimuth.W, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.N, Buildings.Types.Azimuth.N},
           stateAtSurface_a = {false, true, true, true}),
        datConExtWin(
          layers={R16p8Wal},
          A={6.6675*3.6576},
          glaSys={glaSys},
          hWin={1.8288},
          wWin={5.88},
          til={Buildings.Types.Tilt.Wall},
          azi={Buildings.Types.Azimuth.S}),
        intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
        extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
        lat=0.66098585832754);

    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.ExteriorConstructions.Construction10and23
      R16p8Wal
      annotation (Placement(transformation(extent={{410,-168},{430,-148}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.DividingWalls.CellAndElectricalDividingWall
      R52Wal
      annotation (Placement(transformation(extent={{410,-192},{430,-172}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.Roofs.ASHRAE_901_2010Roof
      R20Wal
      annotation (Placement(transformation(extent={{410,-216},{430,-196}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.GlazingSystems.ASHRAE901Gla
      glaSys
      annotation (Placement(transformation(extent={{436,-192},{456,-172}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.PartitionConstructions.PartitionWall
      parCon
      annotation (Placement(transformation(extent={{436,-216},{456,-196}})));

    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.DividingWalls.TestCellDividngWall
      celDiv "Construction of wall connecting to cell UF90X3B"
      annotation (Placement(transformation(extent={{410,-144},{430,-124}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.DividingWalls.TestBedDividingWall
      bedDiv "Construction of wall connecting to cell UF90X2B"
      annotation (Placement(transformation(extent={{410,-120},{430,-100}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.PartitionConstructions.PartitionDoor
      parDoo "Door used in partition walls in FLEXLAB test cells"
      annotation (Placement(transformation(extent={{410,-96},{430,-76}})));
    replaceable parameter
      Buildings.ThermalZones.Detailed.FLEXLAB.Data.Constructions.OpaqueConstructions.ExteriorConstructions.ExteriorDoorInsulated
      extDoo "Construction of an exterior door"
      annotation (Placement(transformation(extent={{410,-72},{430,-52}})));
    annotation(Documentation(info="<html>
  <p>
  This is a duplicate model of <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.TestCell\">
  Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.TestCell</a> with the wall separating X3A and X3B removed.
  It is designed for simulations where both X3A and X3B are used in the simulation to model the
  whole test bed. If a simulation is created using TestCell from both packages the dividing wall
  will be modeled twice, so one of the two models used must be created without the dividing wall
  in the model.
  </p>
  <p>
  This documentation states only the items which are different from the
  <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.TestCell\">
  Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.TestCell</a> model. For documentation on the rest of the
  walls and connections see that documentation instead.
  </p>
  <p>
  There are 7 different wall sections described in the model. They are shown in the figure below.
  This documentation only describes wall section 6.
  </p>
  <p align=\"center\">
  <img src=\"modelica://Buildings/Resources/Images/ThermalZones/Detailed/FLEXLAB/Rooms/X3A/TestCell.png\" border=\"1\" alt=\"Wall sections in test cell model\"/>
  </p>
  <p>
  The different wall sections are entered into the model according to the following table.
  </p>
  <table border = \"1\" summary=\"Description of walls in test cell room model\">
  <tr>
  <th>Wall Section Number</th>
  <th>Description</th>
  <th>Location in Model</th>
  <th>Corresponding Layer</th>
  </tr>
  <tr>
  <td>6</td>
  <td>This east wall connects to test cell X3B. This model contains an air gap instead of a model
  of the wall. It is intended to be connected to the wall model in X3B.</td>
  <td>surBou[2]</td>
  <td></td>
  </tr>
  </table>
  <p>
  Because wall section 6 was moved from datConBou[2] to surBou[2] the reference for other constructions in
  datConBou have changed as well. These changes are documented in the following table.
  </p>
  <table border =\"1\" summary=\"Description of changes to construction locations\">
  <tr>
  <th>Wall Section Number</th>
  <th>Physical Description</th>
  <th>Location in TestCell</th>
  <th>Location in TestCelNoDiv</th>
  </tr>
  <tr>
  <td>4</td>
  <td>Insulated wall separating the test cell and the electrical room</td>
  <td>datConBou[5]</td>
  <td>datConBou[4]</td>
  </tr>
  <tr>
  <td>5</td>
  <td>Partition wall and door separating the test cell and the closet</td>
  <td>Wall: datConBou[3]<br/>
  Door: datConBou[4]</td>
  <td>Wall: datConBou[2]<br/>
  Door: datConBou[3]</td>
  </tr>
  </table>
  <p>
  Several of the connections in this model are intended to be connected to specific surfaces in other room models.
  The following table describes the connections to models outside of the X3A package. The connections in datConExt
  are not described in the table because they are connected to the external environment, and no additional heat
  port connections are necessary. A rationale for why the model is created this way is also provided if it is
  considered necessary.
  </p>
  <table border =\"1\" summary=\"Description of intended connections including TestCell model\">
  <tr>
  <th>Location in TestCell</th>
  <th>Description of External Connection</th>
  <th>Location in External Model</th>
  <th>Rationale</th>
  </tr>
  <tr>
  <td>surf_surBou[2]</td>
  <td>Dividing wall modeled in ThermalZones.Detailed.FLEXLAB.Rooms.X3B.TestCell</td>
  <td>X3B.TestCell.surf_conBou[1]</td>
  <td>X3B.TestCell.surf_conBou[1] is the location of the cell dividing wall in the neighboring test cell. Connecting
  X3A.TestCellNoCelDiv.surf_surBou[2] to this port models heat transfer from the wall in ThermalZones.Detailed.FLEXLAB.Rooms.X3B.TestCell to the air in this
  space.</td>
  </tr>
  </table>
  </html>",
    revisions = "<html>
  <ul>
  <li>Sept 18, 2013 by Peter Grant:<br/>
  First implementation.</li>
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
  end TestCellFullBed;
  annotation(Documentation(info="<html>
  <p>
  This package contains models of rooms in test cell X3A of the FLEXLAB at LBNL. The following image is a drawing
  of test cell X3A. It shows how the different rooms in this example are connected, as well as providing the names
  used in this example for each of the rooms.
  </p>
  <p align=\"center\">
  <img src=\"modelica://Buildings/Resources/Images/ThermalZones/Detailed/FLEXLAB/Rooms/X3A.png\"border=\"1\" alt=\"Room locations and names in X3AWithRadiantFloor\"/>
  </p>
  <p>
  There are separate models for each room in test cell X3A. The model for the test cell itself is located in
  <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.TestCell\">
  Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.TestCell</a>, the model for the connected closet is located at
  <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.Closet\">
  Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.Closet</a>, and the model for the connected electrical room is located at
  <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.Electrical\">
  Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.X3A.Electrical</a>. Each of the models were developed using construction and
  parameter information taken from architectural drawings. Accurate use of the models will likely require
  combining all three room models to each other.
  </p>
  <p>
  The models in this package are intended to be connected to each other to develop a model of the entirety
  of test cell X3A. Several of the connections are to be made between walls connecting the two spaces to each
  other. Detailed information on the wall in each test cell can be found in the documentation for that test cell.
  The connections between each room in the test cell are described below.
  </p>
  <table border =\"1\" summary = \"Summary of connections between X3A spaces\">
  <tr>
  <th>Physical significance of connection</th>
  <th>Port 1</th>
  <th>Port 2</th>
  </tr>
  <tr>
  <td>Heat transfer through the partition wall between the test cell and the closet</td>
  <td>TestCell.surf_conBou[3]</td>
  <td>Closet.surf_surBou[1]</td>
  </tr>
  <tr>
  <td>Heat transfer through the door in the partition wall between the test cell and the closet</td>
  <td>TestCell.surf_conBou[4]</td>
  <td>Closet.surf_surBou[2]</td>
  </tr>
  <tr>
  <td>Heat transfer through the wall separating the test cell and the electrical room</td>
  <td>TestCell.surf_conBou[5]</td>
  <td>Electrical.surf_surBou[1]</td>
  </tr>
  <tr>
  <td>Heat transfer through the wall separating the closet and the electrical room</td>
  <td>Closet.surf_conBou[1]</td>
  <td>Electrical.surf_surBou[2]</td>
  </tr>
  </table>
  <p>
  An example of how these room models are connected to create full test cell model can be found in
  <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.Examples.X3AWithRadiantFloor\">
  Buildings.ThermalZones.Detailed.FLEXLAB.Rooms.Examples.X3AWithRadiantFloor</a>.
  </p>
  </html>"));
end XRA;
