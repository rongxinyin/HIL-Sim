within hil_flexlab_model.Data.Constructions.OpaqueConstructions.Roofs;
record CeilingTile =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (final material={
    Data.Solids.CottonBatt(x=0.178),
    Data.Solids.AcousTile(x=0.0191)},
    final nLay=2) "Construction model for a ceiling.
      Used in test cells X1A"
    annotation (
defaultComponentPrefixes="parameter",
defaultComponentName="datOpaCon",
Documentation(info="<html>
    <p>
    This is a model of a roof construction which is minimally compliant with
    CA Title 24-2013. It is used in test bed 90X2.
    </p>
    <p>
    Note: This model is currently a work in progress. For more information see
    the documentation available at
    <a href=\"modelica://Buildings.ThermalZones.Detailed.FLEXLAB.UsersGuide\">
    Buildings.ThermalZones.Detailed.FLEXLAB.UsersGuide</a>.
    </p>
    </html>", revisions="<html>
<ul>
<li>
September 17, 2013, by Peter Grant:<br/>
First implementation.
</li>
</ul>
</html>"));
