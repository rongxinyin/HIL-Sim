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
 TSolCoo = 273.15+5,
 TLiqCoo = 273.15+8,
 LHeaCoo = 142500,
 cPCMCoo = 1950,
 dPCMCoo = 1400,
 kPCMCoo = 0.5);
extends hil_flexlab_model.Data.BaseClasses.OPCO(
 TSetSupCW = 281.15,
 TSetSupHW = 325.15,
 TSetSupAirCoo = 285.95,
 TSetSupAirHea = 313.15);
extends hil_flexlab_model.Data.BaseClasses.DELO(
 QCoo_flow_nominal = 4058.0,
 QHea_flow_nominal = 106850.0,
 dTCoo = 2,
 mAir_flow_nominal = 3.479,
 LTes_nominal = 35500000.0,
 CTes_nominal = 27190800.0,
 mSwec_flow_nominal = 0.0,
 dpFixed_nominal = 1000,
 dpValve_nominal = 1000);
parameter String weaDatImport = ModelicaServices.ExternalReferences.loadResource("modelica://RTUPCM/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos");
end BBR_3C_Med_downsized;
