within hil_flexlab_model.Data.Constructions.GlazingSystems;
record SingleClear3 =
    Buildings.HeatTransfer.Data.GlazingSystems.Generic (
       glass={Data.Constructions.Glasses.ID104()},
       UFra=1.4,
       haveInteriorShade=true) "Single pane, clear glass 3mm with plexi film"
  annotation (
    defaultComponentPrefixes="parameter",
    defaultComponentName="datGlaSys");
