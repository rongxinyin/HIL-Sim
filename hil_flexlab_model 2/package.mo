within ;
package hil_flexlab_model "Variable air volume flow system with terminal reheat and five thermal zones"
  extends Modelica.Icons.ExamplesPackage;


annotation (uses(
    RTUPCM(version="2"),
    ModelicaServices(version="3.2.3"),
    AixLib(version="1.0.2"),
    Modelica(version="4.0.0"),
    Buildings(version="9.0.1")),
  version="2",
  conversion(from(
      version="1",
      script="ConvertFromhil_flexlab_model_1.mos",
      version="")));
end hil_flexlab_model;
