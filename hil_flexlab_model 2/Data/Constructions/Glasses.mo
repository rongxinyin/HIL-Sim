within hil_flexlab_model.Data.Constructions;
package Glasses "Package with thermophysical properties for window glas"
    extends Modelica.Icons.MaterialPropertiesPackage;

  record ID104 = Buildings.HeatTransfer.Data.Glasses.Generic (
      x=0.003,
      k=0.92,
      tauSol={0.32},
      rhoSol_a={0.17},
      rhoSol_b={0.07},
      tauIR=0,
      absIR_a=0.58,
      absIR_b=0.84)
    "Generic Clear Glass 3.048mm with plexi film. Manufacturer: Generic. Original 3mm clear glass: absIR_a=0.58,
      absIR_b=0.84"
    annotation (
      defaultComponentPrefixes="parameter",
      defaultComponentName="datGla");
annotation(preferredView="info",
Documentation(info="<html>
<p>
This package implements thermophysical properties for window glass.
</p>
<p>
Since the infrared transmissivity is part of the Window 6 data and since
it depends on the glass thickness, the glass thickness is a parameter
that is set for all glass layers.
This configuration is different from the records for gas properties,
which do not yet set the value for the thickness of the gas gap.
</p>
<p>
The table below compares the data of this record with the variables used in the WINDOW 6 output file.
</p>
Note that
<ul>
<li>the surface <code>a</code> is usually the outside-facing surface, and the surface
<code>b</code> is usually the room-facing surface.
</li>
<li>by the term <i>solar</i>, we mean the whole solar spectrum.
Data in the solar spectrum are used for computing solar heat gains.
</li>
<li>by the term <i>infrared</i> (or <i>infrared</i>), we mean the infrared spectrum.
Data in the infrared spectrum are used for thermal radiation that is emitted by surfaces that are
around room or ambient temperature.
</li>
<li>WINDOW 6 uses spectral data in the calculation of optical properties of window systems,
whereas the model in this library uses averages over the whole solar or infrared spectrum.
</li>
</ul>

<table summary=\"summary\" border=\"1\" cellspacing=\"0\" cellpadding=\"2\" style=\"border-collapse:collapse;\">
<thead>
 <tr>
   <th>Buildings library variable name</th>
   <th>WINDOW 6 variable name</th>
 </tr>
</thead>
<tbody>
<tr>
  <td>tauSol</td>  <td>Tsol</td>
</tr>
<tr>
  <td>rhoSol_a</td>  <td>Rsol1</td>
</tr>
<tr>
  <td>rhoSol_b</td>  <td>Rsol2</td>
</tr>
<tr>
  <td>tauIR</td>  <td>Tir</td>
</tr>
<tr>
  <td>absIR_a</td>  <td>Emis1</td>
</tr>
<tr>
  <td>absIR_b</td>  <td>Emis2</td>
</tr>
</tbody>
</table>
<p>
The solar transmittance <code>tauSol</code> and the solar reflectances
<code>rhoSol_a</code> and <code>rhoSol_b</code> are vectors.
For regular glass, these vectors have only one element.
For electrochromic glass, users can enter an arbitrary number of elements,
where each element is for a particular window state.
The dimension of the three vectors <code>tauSol</code>,
<code>rhoSol_a</code> and <code>rhoSol_b</code> must be equal.
</p>
<p>
The example
<a href=\"modelica://Buildings.ThermalZones.Detailed.Examples.ElectroChromicWindow\">
Buildings.ThermalZones.Detailed.Examples.ElectroChromicWindow</a> shows
how these data can be used to darken the window.
A control signal of <code>uWin=0</code> in the room model corresponds
to the first entry of the data, which typically is the clear state,
whereas <code>uWin=1</code> corresponds to the last entry, which
typically is the dark states. For intermediate control signals,
the optical properties are interpolated using the
model
<a href=\"modelica://Buildings.HeatTransfer.Windows.BaseClasses.StateInterpolator\">
Buildings.HeatTransfer.Windows.BaseClasses.StateInterpolator</a>.
</p>
</html>",
revisions="<html>
<ul>
<li>
June 25, 2021, by Rongxin Yin
September 9, 2010, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end Glasses;
