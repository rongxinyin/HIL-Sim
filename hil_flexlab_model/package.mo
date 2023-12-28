within ;
package hil_flexlab_model "Variable air volume flow system with terminal reheat and five thermal zones"
  extends Modelica.Icons.ExamplesPackage;


annotation (uses(
    RTUPCM(version="2"),
    AixLib(version="1.0.2"),
    Modelica(version="4.0.0"),
      ModelicaServices(version="4.0.0"),
      Buildings(version="10.0.0")),
  version="3",
  conversion(from(
      version="1",
      script="ConvertFromhil_flexlab_model_1.mos",
      version="",
        to="2"), from(version="2", script=
            "modelica://hil_flexlab_model/Resources/ConvertFromhil_flexlab_model_2.mos")));
end hil_flexlab_model;
