within hil_flexlab_model.Data;
package BaseClasses
  "This package contains base classes for the case study records."
  record PSP "Portable (SW facing) Classroom"
    parameter Modelica.Units.SI.Area AFlo=99 "Floor area of zone"
      annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.DimensionlessRatio occ_density=25/100
      "Occupant density in ppl/m^2" annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.MassFlowRate minOAFlo=15/2118.88*occ_density*
        1.2*AFlo "Minimum outside air flowrate"
      annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.DimensionlessRatio ACH_infiltration=0.49
      "Infiltration ACH" annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.DimensionlessRatio COP_cooling=2.96
      "Heat pump coefficient of performance for cooling"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio COP_heating=3.17
      "Heat pump coefficient of performance for heating"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio effGas=0.8
      "Baseline gas heating efficiency"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.PressureDifference dp_nominal(displayUnit="Pa")=
         622 "Supply fan design pressure rise"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio hydraulicEfficiency=0.65
      "Supply fan hydraulic efficiency"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio motorEfficiency=0.855
      "Supply fan motor efficiency"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.Time chargeStartMorn_HTes=1*0*3600
      "Continue charging at 12am"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time chargeEndMorn_HTes=1*3*3600
      "Stop charging at 3am" annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time dischargeStart_HTes=1*8*3600
      "Begin discharging at 8:00am"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time dischargeEnd_HTes=1*21*3600
      "Stop discharging at 9:00pm"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time chargeStartNight_HTes=1*23*3600
      "Begin charging at 11:00pm"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time chargeEndNight_HTes=1*24*3600
      "Continue charging at 12am"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time chargeStart_CTes=1*3*3600
      "Continue charging at 3am"
      annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time chargeEnd_CTes=1*7.5*3600
      "Stop charging at 7:30am"
      annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time dischargeStart_CTes=1*12*3600
      "Begin discharging at 12pm"
      annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time dischargeEnd_CTes=1*20*3600
      "Stop discharging at 8pm"
      annotation (Dialog(group="State Schedule: Summer"));
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
          <p>This record contains the information for a primary school portable building.
</p>
</html>"));
  end PSP;

  record BBR "Big-Box (Core) Retail"
    parameter Modelica.Units.SI.Area AFlo=1600 "Floor area of zone"
      annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.DimensionlessRatio occ_density=15/100
      "Occupant density in ppl/m^2" annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.MassFlowRate minOAFlo=16/2118.88*occ_density*
        1.2*AFlo "Minimum outside air flowrate"
      annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.DimensionlessRatio ACH_infiltration=0.22
      "Infiltration ACH" annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.DimensionlessRatio COP_cooling=3.5
      "Heat pump coefficient of performance for cooling"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio COP_heating=4.5
      "Heat pump coefficient of performance for heating"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio effGas=0.8
      "Baseline gas heating efficiency"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.PressureDifference dp_nominal(displayUnit="Pa")=
         1100 "Supply fan design pressure rise"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio hydraulicEfficiency=0.59
      "Supply fan hydraulic efficiency"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio motorEfficiency=0.91
      "Supply fan motor efficiency"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.Time chargeStartMorn_HTes=1*0*3600
      "Continue charging at 12am"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time chargeEndMorn_HTes=1*6*3600
      "Stop charging at 6am" annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time dischargeStart_HTes=1*7.5*3600
      "Begin discharging at 7:30am"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time dischargeEnd_HTes=1*21*3600
      "Stop discharging at 9:00pm"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time chargeStartNight_HTes=1*23*3600
      "Begin charging at 11pm"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time chargeEndNight_HTes=1*24*3600
      "Continue charging at 12am"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time chargeStartMorn_CTes=1*0*3600
      "Continue charging at 12am"
      annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time chargeEndMorn_CTes=1*7*3600
      "Stop charging at 7am" annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time dischargeStart_CTes=1*12*3600
      "Begin discharging at 12pm"
      annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time dischargeEnd_CTes=1*20*3600
      "Stop discharging at 8pm"
      annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time chargeStartNight_CTes=1*21*3600
      "Begin charging at 9pm"
      annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time chargeEndNight_CTes=1*24*3600
      "Continue charging at 12am"
      annotation (Dialog(group="State Schedule: Summer"));
    /* ModelicaServices.ExternalReferences.loadResource("rtu-pcm/modelica-rtu-pcm/RTUPCM/Resources/Scripts/Dymola/HVAC/Examples/GSD10.txt") annotation(Dialog(group="Tariff Structure")) */
    /* ModelicaServices.ExternalReferences.loadResource("rtu-pcm/modelica-rtu-pcm/RTUPCM/Resources/weatherdata/USA_GA_Atlanta-Hartsfield-Jackson.Intl.AP.722190_TMY3.mos") annotation(Dialog(group="Climate Data")) */
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
          <p>This record contains the information for a big box retail building
</p>
</html>"));
  end BBR;

  record MFR "Multi-Family Residential (ground floor, N facing) apartment"
    parameter Modelica.Units.SI.Area AFlo=88 "Floor area of zone"
      annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.DimensionlessRatio occ_density=3/100
      "Occupant density in ppl/m^2" annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.MassFlowRate minOAFlo=1e-4
      "Minimum outside air flowrate" annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.MassFlowRate mDhw_flow_nominal=0.4144
      "Design domestic hot water flow"
      annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.Power QDhw_flow_nominal=2300
      "Design domestic hot water heater heating capacity"
      annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.Power QDhwHeaPum_flow_nominal=1769
      "Design domestic hot water heater heating capacity for heat pump only"
      annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.Temperature TCw=22 + 273.15
      "Domestic cold water inlet temperature"
      annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.Temperature THw=60 + 273.15
      "Domestic hot water heater outlet temperature"
      annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.Temperature TDhw=43 + 273.15
      "Desired tempered domestic hot water temperature"
      annotation (Dialog(group="Building Type"));
    parameter Modelica.Units.SI.DimensionlessRatio ACH_infiltration=0.14
      "Infiltration ACH";
    parameter Modelica.Units.SI.DimensionlessRatio COP_cooling=3.67
      "Heat pump coefficient of performance for cooling"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio COP_heating=4.67
      "Heat pump coefficient of performance for heating"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio effGas=0.8
      "Baseline gas heating efficiency"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.PressureDifference dp_nominal(displayUnit="Pa")=
         622 "Supply fan design pressure rise"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio hydraulicEfficiency=0.65
      "Supply fan hydraulic efficiency"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.DimensionlessRatio motorEfficiency=0.855
      "Supply fan motor efficiency"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.Time chargeStart_HTes=1*9*3600
      "Begin charging at 9am"
      annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time chargeEnd_HTes=1*15.5*3600
      "Stop charging at 3:30pm"
      annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time dischargeStart_HTes=1*16*3600
      "Begin discharging at 4pm"
      annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time dischargeEnd_HTes=1*20*3600
      "Stop discharging at 8pm"
      annotation (Dialog(group="State Schedule: Summer"));
    parameter Modelica.Units.SI.Time chargeStartMorn_LTes=1*0*3600
      "Continue charging at 12am"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time chargeEndMorn_LTes=1*5*3600
      "Stop charging at 5am" annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time dischargeStart_LTes=1*6*3600
      "Begin discharging at 6am"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time dischargeEnd_LTes=1*8*3600
      "Stop discharging at 8am"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time chargeStartNight_LTes=1*23.5*3600
      "Begin charging at 11:30pm"
      annotation (Dialog(group="State Schedule: Winter"));
    parameter Modelica.Units.SI.Time chargeEndNight_LTes=1*24*3600
      "Stop charging at 12am"
      annotation (Dialog(group="State Schedule: Winter"));
    /* ModelicaServices.ExternalReferences.loadResource("rtu-pcm/modelica-rtu-pcm/RTUPCM/Resources/Scripts/Dymola/HVAC/Examples/B2G2.txt") annotation(Dialog(group="Tariff Structure")) */
    /* ModelicaServices.ExternalReferences.loadResource("rtu-pcm/modelica-rtu-pcm/RTUPCM/Resources/weatherdata/USA_MA_Boston-Logan.Intl.AP.725090_TMY3.mos") annotation(Dialog(group="Climate Data")) */
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
This record contains the information for a multi-family residential building
</p>
</html>"));
  end MFR;

  record MAPR "Material Properties Record"
    parameter Modelica.Units.SI.Temperature TSolCoo=273.15 + 10
      "Solidus temperature, used only for cold PCM."
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.Temperature TLiqCoo=273.15 + 12
      "Liquidus temperature, used only for cold PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.Temperature TSolHig=273.15 + 55
      "Solidus temperature, used only for hot PCM."
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.Temperature TLiqHig=273.15 + 59
      "Liquidus temperature, used only for hot PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.Temperature TSolLow=273.15 + 42.5
      "Solidus temperature, used only for warm PCM."
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.Temperature TLiqLow=273.15 + 43.5
      "Liquidus temperature, used only for warm PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.Temperature TSolPas=273.15 + 22
      "Solidus temperature, used only for passive PCM."
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.Temperature TLiqPas=273.15 + 23
      "Liquidus temperature, used only for passive PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.SpecificEnthalpy LHeaCoo=126000
      "Latent heat of fusion of cold PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.SpecificEnthalpy LHeaHig=226000
      "Latent heat of fusion of hot PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.SpecificEnthalpy LHeaLow=153000
      "Latent heat of fusion of warm PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.SpecificEnthalpy LHeaPas=150000
      "Latent heat of fusion of passive PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.SpecificHeatCapacity cPCMCoo=2050
      "Specific heat capacity of cold PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.SpecificHeatCapacity cPCMHig=3150
      "Specific heat capacity of hot PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.SpecificHeatCapacity cPCMLow=1550
      "Specific heat capacity of warm PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.SpecificHeatCapacity cPCMPas=1450
      "Specific heat capacity of passive PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.Density dPCMCoo=1125
      "Average density of cold PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.Density dPCMHig=1360
      "Average density of hot PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.Density dPCMLow=1675
      "Average density of warm PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.Density dPCMPas=1620
      "Average density of passive PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.ThermalConductivity kPCMCoo=0.2
      "Thermal conductivity of cold PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.ThermalConductivity kPCMHig=0.584
      "Thermal conductivity of hot PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.ThermalConductivity kPCMLow=0.584
      "Thermal conductivity of warm PCM"
      annotation (Dialog(group="Material Properties"));
    parameter Modelica.Units.SI.ThermalConductivity kPCMPas=0.7
      "Thermal conductivity of passive PCM"
      annotation (Dialog(group="Material Properties"));
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
          <p>This record contains the material properties of the PCM.
</p>
</html>"));
  end MAPR;

  record OPCO "Operating Conditions Record"
    parameter Modelica.Units.SI.Temperature TSetSupCW=7 + 273.15
      "Supply chilled water temperature"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.Temperature TSetSupHW=52 + 273.15
      "Supply hot water temperature"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.Temperature TSetSupAirCoo=12.8 + 273.15
      "Cooling set point supply air temperature"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.Temperature TSetSupAirHea=40 + 273.15
      "Heating set point supply air temperature"
      annotation (Dialog(group="System Specifications"));
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
          <p>This record contains the operating conditions, namely the temperature set points, of the hybrid HVAC system.
</p>
</html>"));
  end OPCO;

  record DELO "Design Load Record"
    parameter Modelica.Units.SI.Power QCoo_flow_nominal=22000
      "Design cooling capacity" annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.Power QHea_flow_nominal=14000
      "Design heating capacity" annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.MassFlowRate mAir_flow_nominal=2.2
      "Design air flowrate of system"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.Energy HTes_nominal=3600000
      "Design hot storage capacity (factor * 1kWh)"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.Energy LTes_nominal=3600000
      "Design warm storage capacity (factor * 1kWh)"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.Energy CTes_nominal=3600000
      "Design cold storage capacity (factor * 1kWh)"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.DimensionlessRatio HTesScale=HTes_nominal/
        130000 "Scale factor for hot TES prototype size"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.DimensionlessRatio LTesScale=LTes_nominal/
        130000 "Scale factor for warm TES prototype size"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.DimensionlessRatio CTesScale=CTes_nominal/
        130000 "Scale factor for cold TES prototype size"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.TemperatureDifference dTCoo=11 - 7
      "Inlet temperature difference in cold TES rack"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.TemperatureDifference dTHea=52 - 43
      "Inlet temperature difference in hot TES rack"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.PressureDifference dpValve_nominal=1000
      "Nominal pressure drop of fully open valve";
    parameter Modelica.Units.SI.PressureDifference dpFixed_nominal=1000
      "pressure drop of pipe and other resistances that are in series"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.MassFlowRate mAWHP_flow_nominal=
        QCoo_flow_nominal/(4201*dTCoo)
      "Design water flowrate of cooling system"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.MassFlowRate mHeaWat_flow_nominal=
        QHea_flow_nominal/(4187*dTHea)
      "Design water flowrate of heating system"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.MassFlowRate mTes_flow_nominal=
        mAWHP_flow_nominal "Design water flowrate through TES"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.MassFlowRate mSwec_flow_nominal=
        mTes_flow_nominal "Design water flowrate through SWEC"
      annotation (Dialog(group="System Specifications"));
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
          <p>This record contains the design loads of the different climates and building types.
</p>
</html>"));
  end DELO;


  record PLNT "Plant (HP+TES)  Sizing Record"
    parameter Modelica.Units.SI.Power QCoo_flow_nominal=22000
      "Design cooling capacity" annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.Power QHea_flow_nominal=14000
      "Design heating capacity" annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.MassFlowRate mAir_flow_nominal=2.2
      "Design air flowrate of system"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.Energy HTes_nominal=3600000
      "Design hot storage capacity (factor * 1kWh)"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.Energy LTes_nominal=3600000
      "Design warm storage capacity (factor * 1kWh)"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.Energy CTes_nominal=3600000
      "Design cold storage capacity (factor * 1kWh)"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.DimensionlessRatio HTesScale=HTes_nominal/
        130000 "Scale factor for hot TES prototype size"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.DimensionlessRatio LTesScale=LTes_nominal/
        130000 "Scale factor for warm TES prototype size"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.DimensionlessRatio CTesScale=CTes_nominal/
        130000 "Scale factor for cold TES prototype size"
      annotation (Dialog(group="Climate Data"));
    parameter Modelica.Units.SI.TemperatureDifference dTCoo=11 - 7
      "Inlet temperature difference in cold TES rack"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.TemperatureDifference dTHea=52 - 43
      "Inlet temperature difference in hot TES rack"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.MassFlowRate mCooWat_flow_nominal=
        QCoo_flow_nominal/(4201*dTCoo)
      "Design water flowrate of cooling system"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.MassFlowRate mHeaWat_flow_nominal=
        QHea_flow_nominal/(4187*dTHea)
      "Design water flowrate of heating system"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.MassFlowRate mTes_flow_nominal=max(
        mCooWat_flow_nominal, mHeaWat_flow_nominal)
      "Design water flowrate through TES"
      annotation (Dialog(group="System Specifications"));
    parameter Modelica.Units.SI.MassFlowRate mSwec_flow_nominal=
        mTes_flow_nominal "Design water flowrate through SWEC"
      annotation (Dialog(group="System Specifications"));
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
          <p>This record contains the design loads of the different climates and building types.
</p>
</html>"));
  end PLNT;
end BaseClasses;
