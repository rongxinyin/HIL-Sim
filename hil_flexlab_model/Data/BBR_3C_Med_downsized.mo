within hil_flexlab_model.Data;
record BBR_3C_Med_downsized
extends hil_flexlab_model.Data.BaseClasses.BBR(
 chargeStartMorn_CTes = 0,
 chargeEndMorn_CTes = 25200,
 dischargeStart_CTes = 57600.0,
 dischargeEnd_CTes = 72000,
 chargeStartNight_CTes = 82800,
 chargeEndNight_CTes = 86400);
extends hil_flexlab_model.Data.BaseClasses.MAPR(
 TSolCoo = 280.15,
 TLiqCoo = 282.15,
 LHeaCoo = 126000,
 cPCMCoo = 2050,
 dPCMCoo = 1125,
 kPCMCoo = 0.2);
extends hil_flexlab_model.Data.BaseClasses.OPCO(
 TSetSupCW = 277.15,
 TSetSupHW = 325.15,
 TSetSupAirCoo = 285.95,
 TSetSupAirHea = 313.15);
extends hil_flexlab_model.Data.BaseClasses.DELO(
 QCoo_flow_nominal = 2166.0,
 QHea_flow_nominal = 106850.0,
 dTCoo = 4,
 mAir_flow_nominal = 3.479,
 LTes_nominal = 35500000.0,
 CTes_nominal = 27190800.0,
 mSwec_flow_nominal = 0.0,
 dpFixed_nominal = 1000,
 dpValve_nominal = 1000);
parameter String weaDatImport = ModelicaServices.ExternalReferences.loadResource("modelica://RTUPCM/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos");
end BBR_3C_Med_downsized;
