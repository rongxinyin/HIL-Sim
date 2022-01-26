within hil_flexlab_model.BaseClasses;
model OccupancyLoad "A model for occupancy and resulting internal loads"
  parameter Modelica.SIunits.Power senPower "Sensible heat gain per person";
  parameter Modelica.SIunits.DimensionlessRatio radFraction "Fraction of sensible gain that is radiant";
  parameter Modelica.SIunits.Power latPower "Latent heat gain per person";
  parameter Modelica.SIunits.DimensionlessRatio occ_density "Number of occupants per m^2";
  Modelica.Blocks.Interfaces.RealOutput rad "Radiant load in W/m^2"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput con "Convective load in W/m^2"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput lat "Latent load in W/m^2"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Math.Gain gaiRad(k=senPower*radFraction*occ_density)
    annotation (Placement(transformation(extent={{40,30},{60,50}})));
  Modelica.Blocks.Math.Gain gaiCon(k=senPower*(1 - radFraction)*occ_density)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Math.Gain gaiLat(k=latPower*occ_density)
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  Modelica.Blocks.Sources.Constant conOne(k=1) "Constant 1"
    annotation (Placement(transformation(extent={{-74,-10},{-54,10}})));
equation
  connect(gaiRad.y, rad)
    annotation (Line(points={{61,40},{110,40}}, color={0,0,127}));
  connect(gaiCon.y, con)
    annotation (Line(points={{61,0},{110,0}}, color={0,0,127}));
  connect(gaiLat.y, lat)
    annotation (Line(points={{61,-40},{110,-40}}, color={0,0,127}));
  connect(conOne.y, gaiCon.u)
    annotation (Line(points={{-53,0},{38,0}}, color={0,0,127}));
  connect(conOne.y, gaiRad.u) annotation (Line(points={{-53,0},{-40,0},{-40,40},
          {38,40}}, color={0,0,127}));
  connect(conOne.y, gaiLat.u) annotation (Line(points={{-53,0},{-40,0},{-40,-40},
          {38,-40}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end OccupancyLoad;
