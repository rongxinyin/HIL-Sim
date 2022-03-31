within hil_flexlab_model.BaseClasses;
package Functions "Contains functions for plants"
  function COP_ASHP
    "This function calculates the COP of an air source heat pump as a function of temperature difference"
    input Modelica.SIunits.TemperatureDifference dT "Temperature difference between condenser and evaporator";
    output Modelica.SIunits.DimensionlessRatio COP "Coefficient of performance";
  protected
    Real deltax = 1 "Delta x parameter for splice function";
    Real y1 "Intermediate variable";
  algorithm
    y1:=Buildings.Utilities.Math.Functions.spliceFunction(
                                              pos=6.81-0.121*dT + 0.000630*dT^2, neg=5.13675, x=dT-15, deltax=deltax);
    COP:=Buildings.Utilities.Math.Functions.spliceFunction(
                                              pos=1.818, neg=y1, x=dT-60, deltax=deltax);
  annotation (
  Documentation(info="<html>
<p>
This simple function calculates the average heating coefﬁcient of performance for an air source heat pump based on data taken from industrial surveys and ﬁeld trials.<br>
<b> It is only applicable for dT between 15 and 60 [K]. </b> <br>
See Staffel et al. (2012).

<h4>References</h4>
Staffel, Iain et al. <i>A review of domestic heat pumps.</i> Energy & Environmental Science, 2012.
</html>"));
  end COP_ASHP;

  function QFra_ASHP
    "This function calculates the fraction of thermal energy that can be recovered for DHW from of an air source heat pump operating in cooling mode"
    input Real Twi "Inlet water temperature [K] to desuperheater";
    output Real QFra "fraction of thermal energy that can be recovered";
  protected
    Real deltax = 1 "Delta x parameter for splice function";
    Real y1 "Intermediate variable";
    Real TwiC "Inlet water temperature [C] to desuperheater";
  algorithm
    TwiC := Twi - 273.15;
    y1:=Buildings.Utilities.Math.Functions.spliceFunction(
                                              pos=36.547-1.0546*TwiC + 0.0089*TwiC^2, neg=30, x=TwiC-6.57261, deltax=deltax);
    QFra:=Buildings.Utilities.Math.Functions.spliceFunction(
                                              pos=5.3065, neg=y1, x=TwiC-59, deltax=deltax);
  annotation (
  Documentation(info="<html>
<p>
This function calculates the percent of air source heat pump output that can be recovered 
by a desuperheater based on data from the Nordic IFM-48 desuperheater.<br>
<b> It is most appropriate for entering water temperatures (EWT) between 21 and 43 [C] but can be extended 
to EWT between 7 and 59 [C]. </b><br> The maximum thermal energy can be recovered 
when the desuperheater inlet water is at its coldest, thus providing the largest temperature difference.<br>
See Maritime Geothermal Ltd. IFM-Series Installation and Service Manual (2015) and Yrjölä et al. (2015).

<h4>References</h4>
Yrjölä, Jukka et al. <i>Domestic Hot Water Production with Ground Source Heat Pump in Apartment Buildings.</i> Energies, 2015.
</html>"));
  end QFra_ASHP;

  function Evap_Effectiveness
    "Calculates the evaporative effectiveness of media as a function of wetbulb depression"
    input Modelica.SIunits.Temperature TDry "Drybulb temperature";
    input Modelica.SIunits.Temperature TWet "Wetbulb temperature";
    output Modelica.SIunits.DimensionlessRatio eff "Coefficient of performance";
  protected
    Real dep "Wetbulb depression";
  algorithm
    dep:=TDry-TWet;
    eff:=max(Buildings.Utilities.Math.Functions.polynomial(
          x=dep,
          a={0,1.05E-01,-5.70E-03,1.42E-04,-1.34E-06}),0);
  annotation (
  Documentation(
  info="<html>
<p>
This function calculates the effectivess of evaporative media as a 
function of wetbulb depression in degC.  It is based on data from a number 
of field trials conducted by the UC Davis Western Cooling Efficiency Center.
</p>
</html>"));
  end Evap_Effectiveness;

  package Examples "Contains examples of functions"
  extends Modelica.Icons.ExamplesPackage;
    model COP_ASHP "Example for COP_ASHP function"
      extends Modelica.Icons.Example;
      Modelica.Blocks.Sources.Ramp ramDt(
        height=60,
        duration=3600,
        offset=7) "Ramp for dT input"
        annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

      Modelica.Blocks.Interfaces.RealOutput COP "COP output"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Sources.RealExpression calCOP(y=
            hil_flexlab_model.BaseClasses.Functions.COP_ASHP( ramDt.y))
        "Calculate the COP"
        annotation (Placement(transformation(extent={{60,-10},{80,10}})));
    equation

      connect(calCOP.y, COP)
        annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
      annotation (
        __Dymola_Commands(file="/home/dhbubu18/git/rtu-pcm/rtu-pcm/modelica-rtu-pcm/RTUPCM/Resources/Scripts/Dymola/HVAC/Plants/BaseClasses/Functions/Examples/COP_ASHP.mos"
            "Simulate and plot"),
        experiment(
          StopTime=3600,
          Interval=1,
          Tolerance=1e-06));
    end COP_ASHP;

    model QFra_ASHP "Example for QFra_ASHP function"
      extends Modelica.Icons.Example;
      Modelica.Blocks.Sources.Ramp ramTwi(
        duration=3600,
        offset=273.15,
        height=75) "Ramp for Twi input"
        annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
      Modelica.Blocks.Interfaces.RealOutput QFra "QFra output"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Sources.RealExpression calQFra(y=
            hil_flexlab_model.BaseClasses.Functions.QFra_ASHP( ramTwi.y))
        "Calculate the QFra"
        annotation (Placement(transformation(extent={{60,-10},{80,10}})));
    equation
      connect(calQFra.y, QFra)
        annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
      annotation (
        experiment(
          StopTime=3600,
          Interval=1,
          Tolerance=1e-06));
    end QFra_ASHP;

    model Evap_Effectiveness "Example for Evap_Effectiveness function"
      extends Modelica.Icons.Example;
      Modelica.Blocks.Sources.Ramp TDry(
        height=35,
        duration=3600,
        offset=0) "Drybulb temperature"
        annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

      Modelica.Blocks.Interfaces.RealOutput eff "Effectiveness"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Sources.RealExpression calEff(y=
            hil_flexlab_model.BaseClasses.Functions.Evap_Effectiveness( TDry.y,
            TWet.y)) "Calculate the effectiveness"
        annotation (Placement(transformation(extent={{60,-10},{80,10}})));
      Modelica.Blocks.Sources.Constant TWet(k=0) "Wetbulb temperature"
        annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
    equation

      connect(calEff.y,eff)
        annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
      annotation (
        __Dymola_Commands(file="/home/dhbubu18/git/rtu-pcm/rtu-pcm/modelica-rtu-pcm/RTUPCM/Resources/Scripts/Dymola/HVAC/Plants/BaseClasses/Functions/Examples/Evap_Effectiveness.mos"
            "Simulate and plot"),
        experiment(
          StopTime=3600,
          Interval=10,
          Tolerance=1e-06,
          __Dymola_Algorithm="Dassl"));
    end Evap_Effectiveness;
  end Examples;
end Functions;
