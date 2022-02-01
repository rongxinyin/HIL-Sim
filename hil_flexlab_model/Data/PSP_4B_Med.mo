within hil_flexlab_model.Data;
record PSP_4B_Med "Portable (SW facing) Classroom in Albuquerque, New Mexico"
  extends hil_flexlab_model.Data.BaseClasses.PSP;
  extends hil_flexlab_model.Data.BaseClasses.MAPR;
  extends hil_flexlab_model.Data.BaseClasses.OPCO(
      TSetSupAirCoo = 12.8 + 273.15,
      TSetSupAirHea = 50 + 273.15);
  extends hil_flexlab_model.Data.BaseClasses.DELO(
      QCoo_flow_nominal = 6506,
      QHea_flow_nominal = 6535,
      mAir_flow_nominal = 0.3304,
      LTes_nominal = 19.9*3600000,
      CTes_nominal = 59.6*3600000);
  extends hil_flexlab_model.Data.BaseClasses.BATT(
      BatteryUsableSizeSma = 4.6,
      BatteryUsableSizeMed = 23.8,
      BatteryUsableSizeLar = 47.5,
      chargeStartMornS_batt = 1*0*3600,
      chargeEndMornS_batt = 1*9*3600,
      dischargeStartS_batt = 1*9*3600,
      dischargeEndS_batt = 1*19*3600,
      chargeStartNightS_batt = 1*19*3600,
      chargeEndNightS_batt = 1*24*3600,
      chargeStartMornW_batt = 1*0*3600,
      chargeEndMornW_batt = 1*8*3600,
      dischargeStartW_batt = 1*8*3600,
      dischargeEndW_batt = 1*21*3600,
      chargeStartNightW_batt = 1*21*3600,
      chargeEndNightW_batt = 1*24*3600);
  parameter String weaDatImport = ModelicaServices.ExternalReferences.loadResource("modelica://RTUPCM/Resources/weatherdata/USA_NM_Albuquerque.Intl.AP.723650_TMY3.mos") annotation(Dialog(group="Climate Data"));
  /* ModelicaServices.ExternalReferences.loadResource("rtu-pcm/modelica-rtu-pcm/RTUPCM/Resources/Scripts/Dymola/HVAC/Examples/3B.txt") annotation(Dialog(group="Tariff Structure")) */
  /* ModelicaServices.ExternalReferences.loadResource("rtu-pcm/modelica-rtu-pcm/RTUPCM/Resources/weatherdata/USA_NM_Albuquerque.Intl.AP.723650_TMY3.mos") annotation(Dialog(group="Climate Data")) */
   annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Text(
          lineColor={0,0,255},
          extent={{-150,60},{150,100}},
          textString="%name"),
        Rectangle(
          origin={0.0,-25.0},
          lineColor={64,64,64},
          fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-100.0,-75.0},{100.0,75.0}},
          radius=25.0),
        Line(
          points={{-100.0,0.0},{100.0,0.0}},
          color={64,64,64}),
        Line(
          origin={0.0,-50.0},
          points={{-100.0,0.0},{100.0,0.0}},
          color={64,64,64}),
        Line(
          origin={0.0,-25.0},
          points={{0.0,75.0},{0.0,-75.0}},
          color={64,64,64})}), Documentation(info="<html>
<p>
<b>Peak cooling time of day (Summer)</b>: 4:00 pm <br>
<b>Recommended cold TES discharge duration</b>: 2-9 hours (11:00 am - 8:00 pm) <br>
<b>Recommended cold TES charge duration</b>: 4-11 hours (9:00 pm - 8:00 am) <br><br>

<b>Peak heating time of day (Winter)</b>: 7:00 am <br>
<b>Recommended hot TES discharge duration</b>: 2-4 hours (7:00 am - 11:00 am) <br>
<b>Recommended hot TES charge duration</b>: 4-8 hours (10:00 pm - 6:00 am) <br><br>

<i>may need to modify to account for 0 occupancy on Sundays</i>
</p>
</html>"));
end PSP_4B_Med;
