within FLEXLAB.Data.Constructions.OpaqueConstructions.DividingWalls;
record TestZoneDividngWall =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(final material={
    Buildings.HeatTransfer.Data.Solids.GypsumBoard(x=0.01588),
    Buildings.HeatTransfer.Data.Solids.Plywood(x=0.127),
    Buildings.HeatTransfer.Data.Solids.GypsumBoard(x=0.1588)},
    nLay = 3) "Wall separating test vav zones within a test cell"
    annotation (
defaultComponentPrefixes="parameter",
defaultComponentName="datOpaCon",
Documentation(info="<html>
    <p>
    This is a dividing wall used to separate test cells within a given
    test bed. For example, it is installed between test cells X3A and
    X3B.
    </p>
    </html>", revisions="<html>
<ul>
<li>
September 17, 2013, by Peter Grant:<br/>
First implementation.
</li>
</ul>
</html>"));
