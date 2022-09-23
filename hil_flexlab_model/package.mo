within ;
package hil_flexlab_model "Variable air volume flow system with terminal reheat and five thermal zones"
  extends Modelica.Icons.ExamplesPackage;


annotation (uses(Modelica(version="3.2.3"),
    ModelicaServices(version="3.2.3"),
    AixLib(version="1.0.2"),
    IDEAS(version="2.1.0"),
    RTUPCM(version="3"),
    Buildings(version="8.0.0")),
  version="2",
  conversion(from(
      version="1",
      script="ConvertFromhil_flexlab_model_1.mos",
      version="")));
end hil_flexlab_model;
