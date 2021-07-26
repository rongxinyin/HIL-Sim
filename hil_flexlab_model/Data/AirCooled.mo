within hil_flexlab_model.Data;
package AirCooled "Performance data for Air Cooled Chillers"
  extends Modelica.Icons.MaterialPropertiesPackage;

  record ElectricEIRChiller_York_YCAL0019EE_54_2kW_2_9COP_None =
    Buildings.Fluid.Chillers.Data.ElectricEIR.Generic (
      QEva_flow_nominal=-54160,
      COP_nominal=2.9,
      PLRMin=0.10,
      PLRMinUnl=0.10,
      PLRMax=1.15,
      mEva_flow_nominal=1000*0.0095,
      mCon_flow_nominal=1.293*5.11,
      TEvaLvg_nominal=273.15 + 6.67,
      TConEnt_nominal=273.15 + 35,
      TEvaLvgMin=273.15 + 4.44,
      TEvaLvgMax=273.15 + 10,
      TConEntMin=273.15 + 23.89,
      TConEntMax=273.15 + 51.67,
      capFunT={-0.4444262475, 0.1047270584,-0.0021697935, 0.0769278202,-0.0011992838,
          -0.0014306494},
      EIRFunT={-0.5031197853,0.0419759636,-0.0008110133, 0.0556014617,-0.0002121322,
          -0.0016587157},
      EIRFunPLR={0.0,1.0,0.0},
      etaMotor=1.0)
    "Min flow of chiller is 15.9 gpm, Data record for chiller ElectricEIRChiller York YCAL0019EE 54.2kW/2.9COP" annotation (
    defaultComponentName="datChi",
    defaultComponentPrefixes="parameter",
    Documentation(info=
                   "<html>
Performance data for chiller model.
This data corresponds to the following EnergyPlus model:
<pre>
! Manufacturer = York/Johnson Control Inc., Model Line = YCAL-XXXX-EE (Style E)
! Reference Capacity = 54.2 kW (15.4 tons)
! Compressor Type = Scroll, Condenser Type = Air-cooled
! Refrigerant = R410-A

  Chiller:Electric:EIR,
    ElectricEIRChiller York YCAL0019EE 54.2kW/2.9COP,  !- Name
    54160,                   !- Reference Capacity {W}
    2.9,                     !- Reference COP {W/W}
    6.67,                    !- Reference Leaving Chilled Water Temperature {C}
    35,                      !- Reference Entering Condenser Fluid Temperature {C}
    0.0023,                  !- Reference Chilled Water Flow Rate {m3/s}
    0.0011,                  !- Reference Condenser Fluid Flow Rate {m3/s}
    ElectricEIRChiller York YCAL0019EE 54.2kW/2.9COP CAPFT,  !- Cooling Capacity Function of Temperature Curve Name
    ElectricEIRChiller York YCAL0019EE 54.2kW/2.9COP EIRFT,  !- Electric Input to Cooling Output Ratio Function of Temperature Curve Name
    ElectricEIRChiller York YCAL0019EE 54.2kW/2.9COP EIRFPLR,  !- Electric Input to Cooling Output Ratio Function of Part Load Ratio Curve Name
    0.10,                    !- Minimum Part Load Ratio
    1.15,                    !- Maximum Part Load Ratio
    1.0,                     !- Optimum Part Load Ratio
    0.10,                    !- Minimum Unloading Ratio
    Chilled Water Side Inlet Node,  !- Chilled Water Inlet Node Name
    Chilled Water Side Outlet Node,  !- Chilled Water Outlet Node Name
    Condenser Side Inlet Node,  !- Condenser Inlet Node Name
    Condenser Side Outlet Node,  !- Condenser Outlet Node Name
    AirCooled,               !- Condenser Type
    ,                        !- Condenser Fan Power Ratio {W/W}
    1.0,                     !- Fraction of Compressor Electric Consumption Rejected by Condenser
    2.0,                     !- Leaving Chilled Water Lower Temperature Limit {C}
    ConstantFlow,            !- Chiller Flow Mode
    0.0;                     !- Design Heat Recovery Water Flow Rate {m3/s}
</pre>
</html>"));
 annotation(preferredView="info",
 Documentation(info="<html>
<p>
Package with performance data for absorption indirect chiller.
</p>
</html>",
revisions="<html>
<ul>
<li>
July 3, 2019, by Hagar Elarga:<br/>
First implementation.
</li>
</ul>
</html>"));
end AirCooled;
