within hil_flexlab_model.Data.Constructions.GlazingSystems;
record SingleClear3 =
    Buildings.HeatTransfer.Data.GlazingSystems.Generic (
       glass={Buildings.HeatTransfer.Data.Glasses.ID102()},
       UFra=3) "Single pane, clear glass 3mm"
  annotation (
    defaultComponentPrefixes="parameter",
    defaultComponentName="datGlaSys");
