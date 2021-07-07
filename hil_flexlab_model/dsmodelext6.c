#include <moutil.c>
PreNonAliasDef(31)
PreNonAliasDef(32)
PreNonAliasDef(33)
PreNonAliasDef(34)
PreNonAliasDef(35)
StartNonAlias(30)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 2, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].nSta", "Number of state variables [:#(type=Integer)]",\
 2, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].nR", "Number of thermal resistances [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].RNod[1]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[2].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[1].opa.lay[3].port_a.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[1].opa.lay[2].port_b.T", 1, 5, 38978, 1028)
DeclareAlias2("flo.cor.conBou[1].opa.lay[3].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[1].opa.Q_flow[5]", 1, 5, 13472, 1156)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2568)
DeclareAlias2("flo.cor.conBou[1].opa.lay[3].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[1].opa.Q_flow[7]", -1, 5, 13473, 1156)
DeclareState("flo.cor.conBou[1].opa.lay[3].T[1]", "Temperature at the states [K|degC]",\
 232, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[3].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[1].opa.lay[3].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[5]", 1, 5, 13472, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[3].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[7]", 1, 5, 13473, 1024)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.x", "Material thickness [m]",\
 0.0127, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.k", "Thermal conductivity [W/(m.K)]",\
 0.12, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.c", "Specific heat capacity [J/(kg.K)]",\
 1210.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.d", "Mass density [kg/m3|g/cm3]",\
 540.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.10583333333333333, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.piMat", "Ratio x/sqrt(alpha)",\
 29.634845199528208, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 1, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].nSta", "Number of state variables [:#(type=Integer)]",\
 1, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].nR", "Number of thermal resistances [:#(type=Integer)]",\
 2, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].RNod[1]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[3].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[1].opa.lay[4].port_a.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[1].opa.lay[3].port_b.T", 1, 5, 39039, 1028)
DeclareAlias2("flo.cor.conBou[1].opa.lay[4].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[1].opa.Q_flow[7]", 1, 5, 13473, 1156)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2568)
DeclareAlias2("flo.cor.conBou[1].opa.lay[4].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[1].opa.Q_flow[11]", -1, 5, 13476, 1156)
DeclareState("flo.cor.conBou[1].opa.lay[4].T[1]", "Temperature at the states [K|degC]",\
 233, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[4].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[1].opa.lay[4].T[2]", "Temperature at the states [K|degC]",\
 234, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[4].der(T[2])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[1].opa.lay[4].T[3]", "Temperature at the states [K|degC]",\
 235, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[4].der(T[3])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[1].opa.lay[4].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[7]", 1, 5, 13473, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[4].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[9]", 1, 5, 13474, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[4].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[10]", 1, 5, 13475, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[4].Q_flow[4]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[11]", 1, 5, 13476, 1024)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].u[3]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.x", "Material thickness [m]",\
 0.2032, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.k", "Thermal conductivity [W/(m.K)]",\
 0.03, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.c", "Specific heat capacity [J/(kg.K)]",\
 1200.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.d", "Mass density [kg/m3|g/cm3]",\
 40.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 6.773333333333333, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 3, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.piMat", "Ratio x/sqrt(alpha)",\
 257.0299282184859, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.nStaReal", \
"Number of states as a real number", 2.3267645885801382, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].nSta", "Number of state variables [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].nR", "Number of thermal resistances [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].RNod[1]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].RNod[4]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].m[3]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].mInv[3]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].C[3]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].CInv[3]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[4].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[1].opa.lay[5].port_a.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[1].opa.lay[4].port_b.T", 1, 5, 39094, 1028)
DeclareAlias2("flo.cor.conBou[1].opa.lay[5].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[1].opa.Q_flow[11]", 1, 5, 13476, 1156)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2568)
DeclareAlias2("flo.cor.conBou[1].opa.lay[5].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[1].opa.Q_flow[15]", -1, 5, 13479, 1156)
DeclareState("flo.cor.conBou[1].opa.lay[5].T[1]", "Temperature at the states [K|degC]",\
 236, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[5].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[1].opa.lay[5].T[2]", "Temperature at the states [K|degC]",\
 237, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[5].der(T[2])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[1].opa.lay[5].T[3]", "Temperature at the states [K|degC]",\
 238, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[5].der(T[3])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[1].opa.lay[5].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[11]", 1, 5, 13476, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[5].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[13]", 1, 5, 13477, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[5].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[14]", 1, 5, 13478, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[5].Q_flow[4]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[15]", 1, 5, 13479, 1024)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].u[3]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.x", "Material thickness [m]",\
 0.127, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.k", "Thermal conductivity [W/(m.K)]",\
 0.12, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.c", "Specific heat capacity [J/(kg.K)]",\
 1210.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.d", "Mass density [kg/m3|g/cm3]",\
 540.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 1.0583333333333333, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 3, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.piMat", "Ratio x/sqrt(alpha)",\
 296.3484519952821, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].nSta", "Number of state variables [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].nR", "Number of thermal resistances [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].RNod[1]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].RNod[4]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].m[3]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].mInv[3]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].C[3]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].CInv[3]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[5].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[1].opa.lay[6].port_a.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[1].opa.lay[5].port_b.T", 1, 5, 39161, 1028)
DeclareAlias2("flo.cor.conBou[1].opa.lay[6].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[1].opa.Q_flow[15]", 1, 5, 13479, 1156)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2568)
DeclareAlias2("flo.cor.conBou[1].opa.lay[6].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[1].opa.Q_flow[18]", -1, 5, 13481, 1156)
DeclareState("flo.cor.conBou[1].opa.lay[6].T[1]", "Temperature at the states [K|degC]",\
 239, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[6].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[1].opa.lay[6].T[2]", "Temperature at the states [K|degC]",\
 240, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[6].der(T[2])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[1].opa.lay[6].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[15]", 1, 5, 13479, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[6].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[17]", 1, 5, 13480, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[6].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[18]", 1, 5, 13481, 1024)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.x", "Material thickness [m]",\
 0.1016, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.k", "Thermal conductivity [W/(m.K)]",\
 0.03, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.c", "Specific heat capacity [J/(kg.K)]",\
 1200.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.d", "Mass density [kg/m3|g/cm3]",\
 40.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 3.3866666666666667, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 2, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.piMat", "Ratio x/sqrt(alpha)",\
 128.51496410924295, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.nStaReal", \
"Number of states as a real number", 1.1633822942900691, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 2, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].nSta", "Number of state variables [:#(type=Integer)]",\
 2, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].nR", "Number of thermal resistances [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].RNod[1]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[6].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[1].opa.lay[7].port_a.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[1].opa.lay[6].port_b.T", 1, 5, 39228, 1028)
DeclareAlias2("flo.cor.conBou[1].opa.lay[7].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[1].opa.Q_flow[18]", 1, 5, 13481, 1156)
DeclareAlias2("flo.cor.conBou[1].opa.lay[7].port_b.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[1].opa.lay[7].T[4]", 1, 1, 244, 1028)
DeclareAlias2("flo.cor.conBou[1].opa.lay[7].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[1].opa_b.Q_flow", 1, 5, 13448, 1156)
DeclareState("flo.cor.conBou[1].opa.lay[7].T[1]", "Temperature at the states [K|degC]",\
 241, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[7].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[1].opa.lay[7].T[2]", "Temperature at the states [K|degC]",\
 242, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[7].der(T[2])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[1].opa.lay[7].T[3]", "Temperature at the states [K|degC]",\
 243, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[7].der(T[3])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[1].opa.lay[7].T[4]", "Temperature at the states [K|degC]",\
 244, 293.15, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[1].opa.lay[7].der(T[4])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[1].opa.lay[7].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[18]", 1, 5, 13481, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[7].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[20]", 1, 5, 13482, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[7].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[21]", 1, 5, 13483, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[7].Q_flow[4]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa.Q_flow[22]", 1, 5, 13484, 1024)
DeclareAlias2("flo.cor.conBou[1].opa.lay[7].Q_flow[5]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[1].opa_b.Q_flow", -1, 5, 13448, 1024)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].u[3]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].u[4]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", true, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.x", "Material thickness [m]",\
 0.1588, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.9924999999999999, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 4, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.piMat", "Ratio x/sqrt(alpha)",\
 370.7223327505372, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].nSta", "Number of state variables [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].nR", "Number of thermal resistances [:#(type=Integer)]",\
 5, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].RNod[1]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].RNod[4]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].RNod[5]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].m[3]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].m[4]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].mInv[3]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].mInv[4]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].C[3]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].C[4]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].CInv[3]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].CInv[4]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[1].opa.lay[7].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].layers.material[1].x", "Material thickness [m]",\
 0.01588, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.09924999999999999, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[2].layers.material[1].nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[2].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 37.07223327505371, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[1].TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[1].TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[1].LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[1].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].layers.material[2].x", "Material thickness [m]",\
 0.127, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.12, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1210.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 540.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 1.0583333333333333, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[2].nStaRef", "Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[2].layers.material[2].nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 3, 1.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[2].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 296.3484519952821, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[2].TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[2].TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[2].LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[2].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].layers.material[3].x", "Material thickness [m]",\
 0.1588, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[3].k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[3].c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[3].d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[3].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.9924999999999999, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[3].nStaRef", "Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[2].layers.material[3].nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 4, 1.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[2].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].layers.material[3].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[3].piMat", "Ratio x/sqrt(alpha)",\
 370.7223327505372, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[3].TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[3].TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[3].LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].layers.material[3].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].x", "Material thickness [m]",\
 0.01588, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.09924999999999999, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].x", "Material thickness [m]",\
 0.127, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.12, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1210.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 540.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 1.0583333333333333, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].x", "Material thickness [m]",\
 0.1588, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.9924999999999999, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].opa.layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[2].opa.lay[1].port_a.T", "Port temperature [K|degC]",\
 "flo.nor.conBou[5].opa.lay[1].T[1]", 1, 1, 208, 1028)
DeclareAlias2("flo.cor.conBou[2].opa.lay[1].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.nor.surf_conBou[5].Q_flow", -1, 5, 10847, 1156)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2568)
DeclareAlias2("flo.cor.conBou[2].opa.lay[1].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[2].opa.Q_flow[3]", -1, 5, 13543, 1156)
DeclareAlias2("flo.cor.conBou[2].opa.lay[1].T[1]", "Temperature at the states [K|degC]",\
 "flo.nor.conBou[5].opa.lay[1].T[1]", 1, 1, 208, 1024)
DeclareState("flo.cor.conBou[2].opa.lay[1].T[2]", "Temperature at the states [K|degC]",\
 245, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[2].opa.lay[1].der(T[2])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[2].opa.lay[1].der(T[1])", "der(Temperature at the states) [K/s]",\
 "flo.nor.conBou[5].opa.lay[1].der(T[1])", 1, 6, 208, 1024)
DeclareAlias2("flo.cor.conBou[2].opa.lay[1].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.nor.surf_conBou[5].Q_flow", -1, 5, 10847, 1024)
DeclareAlias2("flo.cor.conBou[2].opa.lay[1].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[2].opa.Q_flow[2]", 1, 5, 13542, 1024)
DeclareAlias2("flo.cor.conBou[2].opa.lay[1].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[2].opa.Q_flow[3]", 1, 5, 13543, 1024)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", true, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.x", "Material thickness [m]",\
 0.01588, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.09924999999999999, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.piMat", "Ratio x/sqrt(alpha)",\
 37.07223327505371, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 1, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].nSta", "Number of state variables [:#(type=Integer)]",\
 2, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].nR", "Number of thermal resistances [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].RNod[1]", "Thermal resistance [K/W]",\
 0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[1].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[2].opa.lay[2].port_a.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[2].opa.lay[1].port_b.T", 1, 5, 39457, 1028)
DeclareAlias2("flo.cor.conBou[2].opa.lay[2].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[2].opa.Q_flow[3]", 1, 5, 13543, 1156)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2568)
DeclareAlias2("flo.cor.conBou[2].opa.lay[2].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[2].opa.Q_flow[6]", -1, 5, 13546, 1156)
DeclareState("flo.cor.conBou[2].opa.lay[2].T[1]", "Temperature at the states [K|degC]",\
 246, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[2].opa.lay[2].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[2].opa.lay[2].T[2]", "Temperature at the states [K|degC]",\
 247, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[2].opa.lay[2].der(T[2])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[2].opa.lay[2].T[3]", "Temperature at the states [K|degC]",\
 248, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[2].opa.lay[2].der(T[3])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[2].opa.lay[2].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[2].opa.Q_flow[3]", 1, 5, 13543, 1024)
DeclareAlias2("flo.cor.conBou[2].opa.lay[2].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[2].opa.Q_flow[4]", 1, 5, 13544, 1024)
DeclareAlias2("flo.cor.conBou[2].opa.lay[2].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[2].opa.Q_flow[5]", 1, 5, 13545, 1024)
DeclareAlias2("flo.cor.conBou[2].opa.lay[2].Q_flow[4]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[2].opa.Q_flow[6]", 1, 5, 13546, 1024)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].u[3]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.x", "Material thickness [m]",\
 0.127, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.k", "Thermal conductivity [W/(m.K)]",\
 0.12, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.c", "Specific heat capacity [J/(kg.K)]",\
 1210.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.d", "Mass density [kg/m3|g/cm3]",\
 540.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 1.0583333333333333, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 3, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.piMat", "Ratio x/sqrt(alpha)",\
 296.3484519952821, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].nSta", "Number of state variables [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].nR", "Number of thermal resistances [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].RNod[1]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].RNod[4]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].m[3]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].mInv[3]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].C[3]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].CInv[3]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[2].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[2].opa.lay[3].port_a.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[2].opa.lay[2].port_b.T", 1, 5, 39518, 1028)
DeclareAlias2("flo.cor.conBou[2].opa.lay[3].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[2].opa.Q_flow[6]", 1, 5, 13546, 1156)
DeclareAlias2("flo.cor.conBou[2].opa.lay[3].port_b.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[2].opa.lay[3].T[4]", 1, 1, 252, 1028)
DeclareAlias2("flo.cor.conBou[2].opa.lay[3].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[2].opa_b.Q_flow", 1, 5, 13527, 1156)
DeclareState("flo.cor.conBou[2].opa.lay[3].T[1]", "Temperature at the states [K|degC]",\
 249, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[2].opa.lay[3].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[2].opa.lay[3].T[2]", "Temperature at the states [K|degC]",\
 250, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[2].opa.lay[3].der(T[2])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[2].opa.lay[3].T[3]", "Temperature at the states [K|degC]",\
 251, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[2].opa.lay[3].der(T[3])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[2].opa.lay[3].T[4]", "Temperature at the states [K|degC]",\
 252, 293.15, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[2].opa.lay[3].der(T[4])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[2].opa.lay[3].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[2].opa.Q_flow[6]", 1, 5, 13546, 1024)
DeclareAlias2("flo.cor.conBou[2].opa.lay[3].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[2].opa.Q_flow[8]", 1, 5, 13547, 1024)
DeclareAlias2("flo.cor.conBou[2].opa.lay[3].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[2].opa.Q_flow[9]", 1, 5, 13548, 1024)
DeclareAlias2("flo.cor.conBou[2].opa.lay[3].Q_flow[4]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[2].opa.Q_flow[10]", 1, 5, 13549, 1024)
DeclareAlias2("flo.cor.conBou[2].opa.lay[3].Q_flow[5]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[2].opa_b.Q_flow", -1, 5, 13527, 1024)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].u[3]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].u[4]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", true, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.x", "Material thickness [m]",\
 0.1588, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.9924999999999999, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 4, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.piMat", "Ratio x/sqrt(alpha)",\
 370.7223327505372, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].nSta", "Number of state variables [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].nR", "Number of thermal resistances [:#(type=Integer)]",\
 5, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].RNod[1]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].RNod[4]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].RNod[5]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].m[3]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].m[4]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].mInv[3]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].mInv[4]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].C[3]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].C[4]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].CInv[3]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].CInv[4]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[2].opa.lay[3].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].layers.material[1].x", "Material thickness [m]",\
 0.01588, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.09924999999999999, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[3].layers.material[1].nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 1, 1.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[3].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 37.07223327505371, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[1].TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[1].TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[1].LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[1].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].layers.material[2].x", "Material thickness [m]",\
 0.127, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.12, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1210.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 540.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 1.0583333333333333, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[2].nStaRef", "Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[3].layers.material[2].nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 3, 1.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[3].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 296.3484519952821, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[2].TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[2].TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[2].LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[2].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].layers.material[3].x", "Material thickness [m]",\
 0.1588, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[3].k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[3].c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[3].d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[3].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.9924999999999999, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[3].nStaRef", "Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[3].layers.material[3].nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 4, 1.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[3].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].layers.material[3].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[3].piMat", "Ratio x/sqrt(alpha)",\
 370.7223327505372, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[3].TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[3].TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[3].LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].layers.material[3].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].x", "Material thickness [m]",\
 0.01588, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.09924999999999999, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].x", "Material thickness [m]",\
 0.127, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.12, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1210.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 540.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 1.0583333333333333, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].x", "Material thickness [m]",\
 0.1588, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.9924999999999999, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].opa.layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[3].opa.lay[1].port_a.T", "Port temperature [K|degC]",\
 "flo.sou.conBou[2].opa.lay[1].T[1]", 1, 1, 90, 1028)
DeclareAlias2("flo.cor.conBou[3].opa.lay[1].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.sou.surf_conBou[2].Q_flow", -1, 5, 3880, 1156)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2568)
DeclareAlias2("flo.cor.conBou[3].opa.lay[1].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[3].opa.Q_flow[3]", -1, 5, 13600, 1156)
DeclareAlias2("flo.cor.conBou[3].opa.lay[1].T[1]", "Temperature at the states [K|degC]",\
 "flo.sou.conBou[2].opa.lay[1].T[1]", 1, 1, 90, 1024)
DeclareState("flo.cor.conBou[3].opa.lay[1].T[2]", "Temperature at the states [K|degC]",\
 253, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[3].opa.lay[1].der(T[2])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[3].opa.lay[1].der(T[1])", "der(Temperature at the states) [K/s]",\
 "flo.sou.conBou[2].opa.lay[1].der(T[1])", 1, 6, 90, 1024)
DeclareAlias2("flo.cor.conBou[3].opa.lay[1].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.sou.surf_conBou[2].Q_flow", -1, 5, 3880, 1024)
DeclareAlias2("flo.cor.conBou[3].opa.lay[1].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[3].opa.Q_flow[2]", 1, 5, 13599, 1024)
DeclareAlias2("flo.cor.conBou[3].opa.lay[1].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[3].opa.Q_flow[3]", 1, 5, 13600, 1024)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", true, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.x", "Material thickness [m]",\
 0.01588, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.09924999999999999, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 1, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.piMat", "Ratio x/sqrt(alpha)",\
 37.07223327505371, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 1, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].nSta", "Number of state variables [:#(type=Integer)]",\
 2, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].nR", "Number of thermal resistances [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].RNod[1]", "Thermal resistance [K/W]",\
 0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[1].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[3].opa.lay[2].port_a.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[3].opa.lay[1].port_b.T", 1, 5, 39753, 1028)
DeclareAlias2("flo.cor.conBou[3].opa.lay[2].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[3].opa.Q_flow[3]", 1, 5, 13600, 1156)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2568)
DeclareAlias2("flo.cor.conBou[3].opa.lay[2].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[3].opa.Q_flow[6]", -1, 5, 13603, 1156)
DeclareState("flo.cor.conBou[3].opa.lay[2].T[1]", "Temperature at the states [K|degC]",\
 254, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[3].opa.lay[2].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[3].opa.lay[2].T[2]", "Temperature at the states [K|degC]",\
 255, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[3].opa.lay[2].der(T[2])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[3].opa.lay[2].T[3]", "Temperature at the states [K|degC]",\
 256, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[3].opa.lay[2].der(T[3])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[3].opa.lay[2].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[3].opa.Q_flow[3]", 1, 5, 13600, 1024)
DeclareAlias2("flo.cor.conBou[3].opa.lay[2].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[3].opa.Q_flow[4]", 1, 5, 13601, 1024)
DeclareAlias2("flo.cor.conBou[3].opa.lay[2].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[3].opa.Q_flow[5]", 1, 5, 13602, 1024)
DeclareAlias2("flo.cor.conBou[3].opa.lay[2].Q_flow[4]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[3].opa.Q_flow[6]", 1, 5, 13603, 1024)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].u[3]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.x", "Material thickness [m]",\
 0.127, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.k", "Thermal conductivity [W/(m.K)]",\
 0.12, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.c", "Specific heat capacity [J/(kg.K)]",\
 1210.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.d", "Mass density [kg/m3|g/cm3]",\
 540.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 1.0583333333333333, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 3, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.piMat", "Ratio x/sqrt(alpha)",\
 296.3484519952821, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].nSta", "Number of state variables [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].nR", "Number of thermal resistances [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].RNod[1]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].RNod[4]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].m[3]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].mInv[3]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].C[3]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].CInv[3]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[2].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[3].opa.lay[3].port_a.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[3].opa.lay[2].port_b.T", 1, 5, 39814, 1028)
DeclareAlias2("flo.cor.conBou[3].opa.lay[3].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[3].opa.Q_flow[6]", 1, 5, 13603, 1156)
DeclareAlias2("flo.cor.conBou[3].opa.lay[3].port_b.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[3].opa.lay[3].T[4]", 1, 1, 260, 1028)
DeclareAlias2("flo.cor.conBou[3].opa.lay[3].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.cor.conBou[3].opa_b.Q_flow", 1, 5, 13584, 1156)
DeclareState("flo.cor.conBou[3].opa.lay[3].T[1]", "Temperature at the states [K|degC]",\
 257, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[3].opa.lay[3].der(T[1])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[3].opa.lay[3].T[2]", "Temperature at the states [K|degC]",\
 258, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[3].opa.lay[3].der(T[2])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[3].opa.lay[3].T[3]", "Temperature at the states [K|degC]",\
 259, 0.0, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[3].opa.lay[3].der(T[3])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.conBou[3].opa.lay[3].T[4]", "Temperature at the states [K|degC]",\
 260, 293.15, 0.0,1E+100,300.0,0,2592)
DeclareDerivative("flo.cor.conBou[3].opa.lay[3].der(T[4])", "der(Temperature at the states) [K/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[3].opa.lay[3].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[3].opa.Q_flow[6]", 1, 5, 13603, 1024)
DeclareAlias2("flo.cor.conBou[3].opa.lay[3].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[3].opa.Q_flow[8]", 1, 5, 13604, 1024)
DeclareAlias2("flo.cor.conBou[3].opa.lay[3].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[3].opa.Q_flow[9]", 1, 5, 13605, 1024)
DeclareAlias2("flo.cor.conBou[3].opa.lay[3].Q_flow[4]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[3].opa.Q_flow[10]", 1, 5, 13606, 1024)
DeclareAlias2("flo.cor.conBou[3].opa.lay[3].Q_flow[5]", "Heat flow rates to each state [W]",\
 "flo.cor.conBou[3].opa_b.Q_flow", -1, 5, 13584, 1024)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].u[3]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].u[4]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", true, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.x", "Material thickness [m]",\
 0.1588, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.k", "Thermal conductivity [W/(m.K)]",\
 0.16, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.c", "Specific heat capacity [J/(kg.K)]",\
 1090.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.d", "Mass density [kg/m3|g/cm3]",\
 800.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.9924999999999999, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 4, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.piMat", "Ratio x/sqrt(alpha)",\
 370.7223327505372, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].nSta", "Number of state variables [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].nR", "Number of thermal resistances [:#(type=Integer)]",\
 5, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].RNod[1]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].RNod[4]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].RNod[5]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].m[3]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].m[4]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].mInv[3]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].mInv[4]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].C[3]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].C[4]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].CInv[3]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].CInv[4]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[3].opa.lay[3].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].layers.material[1].x", "Material thickness [m]",\
 0.178, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 0.059, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 1307.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 1480.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 3.016949152542373, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[1].nStaRef", "Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[4].layers.material[1].nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 3, 1.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[4].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].layers.material[1].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[1].piMat", "Ratio x/sqrt(alpha)",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[1].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[1].TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[1].TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[1].LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[1].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].layers.material[2].x", "Material thickness [m]",\
 0.0191, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.057, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1331.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 288.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.3350877192982456, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[2].nStaRef", "Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[4].layers.material[2].nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 3, 1.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[4].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].layers.material[2].piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[2].piMat", "Ratio x/sqrt(alpha)",\
 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[2].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[2].TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[2].TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[2].LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].layers.material[2].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].x", "Material thickness [m]",\
 0.178, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].k", "Thermal conductivity [W/(m.K)]",\
 0.059, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].c", "Specific heat capacity [J/(kg.K)]",\
 1307.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].d", "Mass density [kg/m3|g/cm3]",\
 1480.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 3.016949152542373, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].x", "Material thickness [m]",\
 0.0191, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].k", "Thermal conductivity [W/(m.K)]",\
 0.057, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].c", "Specific heat capacity [J/(kg.K)]",\
 1331.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].d", "Mass density [kg/m3|g/cm3]",\
 288.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.3350877192982456, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 331.4, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].opa.layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[4].opa.lay[1].port_a.T", "Port temperature [K|degC]",\
 "flo.ple.surf_conBou[5].T", 1, 5, 7495, 1028)
DeclareAlias2("flo.cor.conBou[4].opa.lay[1].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.ple.surf_conBou[5].Q_flow", -1, 5, 7496, 1156)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].port_b.T", "Port temperature [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2568)
DeclareAlias2("flo.cor.conBou[4].opa.lay[1].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.ple.surf_conBou[5].Q_flow", 1, 5, 7496, 1156)
DeclareAlias2("flo.cor.conBou[4].opa.lay[1].T[1]", "Temperature at the states [K|degC]",\
 "flo.ple.surf_conBou[5].T", 1, 5, 7495, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[1].T[2]", "Temperature at the states [K|degC]",\
 "flo.cor.conBou[4].opa.T[2]", 1, 5, 13653, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[1].T[3]", "Temperature at the states [K|degC]",\
 "flo.cor.conBou[4].opa.T[3]", 1, 5, 13654, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[1].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.ple.surf_conBou[5].Q_flow", -1, 5, 7496, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[1].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.ple.surf_conBou[5].Q_flow", -1, 5, 7496, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[1].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.ple.surf_conBou[5].Q_flow", -1, 5, 7496, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[1].Q_flow[4]", "Heat flow rates to each state [W]",\
 "flo.ple.surf_conBou[5].Q_flow", -1, 5, 7496, 1024)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].u[3]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", true, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.x", "Material thickness [m]",\
 0.178, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.k", "Thermal conductivity [W/(m.K)]",\
 0.059, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.c", "Specific heat capacity [J/(kg.K)]",\
 1307.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.d", "Mass density [kg/m3|g/cm3]",\
 1480.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 3.016949152542373, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 3, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.piMat", "Ratio x/sqrt(alpha)",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].nSta", "Number of state variables [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].nR", "Number of thermal resistances [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].RNod[1]", "Thermal resistance [K/W]",\
 0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].RNod[4]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].m[3]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].mInv[3]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].C[3]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].CInv[3]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[1].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].A", "Heat transfer area [m2]", 0.0,\
 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].U", "U-value (without surface heat transfer coefficients) [W/(m2.K)]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].UA", "Thermal conductance of construction (without surface heat transfer coefficients) [W/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].R", "Thermal resistance of construction [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].dT", "port_a.T - port_b.T [K,]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.conBou[4].opa.lay[2].port_a.T", "Port temperature [K|degC]",\
 "flo.cor.conBou[4].opa.lay[1].port_b.T", 1, 5, 40017, 1028)
DeclareAlias2("flo.cor.conBou[4].opa.lay[2].port_a.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.ple.surf_conBou[5].Q_flow", -1, 5, 7496, 1156)
DeclareAlias2("flo.cor.conBou[4].opa.lay[2].port_b.T", "Port temperature [K|degC]",\
 "flo.cor.irRadGai.conBou[4].T", 1, 5, 14443, 1028)
DeclareAlias2("flo.cor.conBou[4].opa.lay[2].port_b.Q_flow", "Heat flow rate (positive if flowing from outside into the component) [W]",\
 "flo.ple.surf_conBou[5].Q_flow", 1, 5, 7496, 1156)
DeclareAlias2("flo.cor.conBou[4].opa.lay[2].T[1]", "Temperature at the states [K|degC]",\
 "flo.cor.conBou[4].opa.T[4]", 1, 5, 13655, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[2].T[2]", "Temperature at the states [K|degC]",\
 "flo.cor.conBou[4].opa.T[5]", 1, 5, 13656, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[2].T[3]", "Temperature at the states [K|degC]",\
 "flo.cor.irRadGai.conBou[4].T", 1, 5, 14443, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[2].Q_flow[1]", "Heat flow rates to each state [W]",\
 "flo.ple.surf_conBou[5].Q_flow", -1, 5, 7496, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[2].Q_flow[2]", "Heat flow rates to each state [W]",\
 "flo.ple.surf_conBou[5].Q_flow", -1, 5, 7496, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[2].Q_flow[3]", "Heat flow rates to each state [W]",\
 "flo.ple.surf_conBou[5].Q_flow", -1, 5, 7496, 1024)
DeclareAlias2("flo.cor.conBou[4].opa.lay[2].Q_flow[4]", "Heat flow rates to each state [W]",\
 "flo.ple.surf_conBou[5].Q_flow", -1, 5, 7496, 1024)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].u[1]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].u[2]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].u[3]", "Definition of specific internal energy [J/kg]",\
 0.0, 0.0,0.0,270000.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].stateAtSurface_a", \
"=true, a state will be at the surface a [:#(type=Boolean)]", false, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].stateAtSurface_b", \
"=true, a state will be at the surface b [:#(type=Boolean)]", true, 0.0,0.0,0.0,\
0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.x", "Material thickness [m]",\
 0.0191, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.k", "Thermal conductivity [W/(m.K)]",\
 0.057, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.c", "Specific heat capacity [J/(kg.K)]",\
 1331.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.d", "Mass density [kg/m3|g/cm3]",\
 288.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.R", "Thermal resistance of a unit area of material [m2.K/W]",\
 0.3350877192982456, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.nSta", "Actual number of state variables in material [:#(type=Integer)]",\
 3, 1.0,1E+100,0.0,0,2565)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.piRef", "Ratio x/sqrt(alpha) for reference material of 0.2 m concrete",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.piMat", "Ratio x/sqrt(alpha)",\
 331.4, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.TSol", "Solidus temperature, used only for PCM. [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.TLiq", "Liquidus temperature, used only for PCM [K|degC]",\
 293.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.LHea", "Latent heat of phase change [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.ensureMonotonicity", \
"Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].material.phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].steadyStateInitial", \
"=true initializes dT(0)/dt=0, false initializes T(0) at fixed temperature using T_a_start and T_b_start [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].T_a_start", "Initial temperature at port_a, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].T_b_start", "Initial temperature at port_b, used if steadyStateInitial = false [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].nSta2", "Number of states in a material (do not overwrite, used to work around Dymola 2017 bug) [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,1541)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].nSta", "Number of state variables [:#(type=Integer)]",\
 3, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].nR", "Number of thermal resistances [:#(type=Integer)]",\
 4, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].RNod[1]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].RNod[2]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].RNod[3]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].RNod[4]", "Thermal resistance [K/W]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].m[1]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].m[2]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].m[3]", "Mass associated with the temperature state [kg]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].mInv[1]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].mInv[2]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].mInv[3]", "Inverse of the mass associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].C[1]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].C[2]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].C[3]", "Heat capacity associated with the temperature state [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].CInv[1]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].CInv[2]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].CInv[3]", "Inverse of heat capacity associated with the temperature state",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].ud[1]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].ud[2]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].ud[3]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].ud[4]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].ud[5]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].ud[6]", "Support points for derivatives (used for PCM) [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].Td[1]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].Td[2]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].Td[3]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].Td[4]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].Td[5]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].Td[6]", "Support points for derivatives (used for PCM) [K|degC]",\
 288.15, 0.0,1E+100,300.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].dT_du[1]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].dT_du[2]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].dT_du[3]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].dT_du[4]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].dT_du[5]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.conBou[4].opa.lay[2].dT_du[6]", "Derivatives dT/du at the support points (used for PCM) [kg.K2/J]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 4.233333333333333, \
0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 160.64370513655368, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4542278678625862, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].x", \
"Material thickness [m]", 0.2032, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 6.773333333333333, \
0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 257.0299282184859, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].nStaReal", \
"Number of states as a real number", 2.3267645885801382, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[4].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,517)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,517)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.bouConExt.conPar[1].layers.material[5].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,515)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 4.233333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 160.64370513655368, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4542278678625862, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].x", \
"Material thickness [m]", 0.2032, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 6.773333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 257.0299282184859, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].nStaReal", \
"Number of states as a real number", 2.3267645885801382, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[4].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExt[1].layers.material[5].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].x", \
"Material thickness [m]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.89, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 790.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1920.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.1348314606741573, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 156.65721542931692, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4181401517439673, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExtWin[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.glass[1].x", "Thickness [m]",\
 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.glass[1].k", \
"Thermal conductivity [W/(m.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.glass[1].tauSol[1]", \
"Solar transmittance [1]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.glass[1].rhoSol_a[1]", \
"Solar reflectance of surface a (usually outside-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.glass[1].rhoSol_b[1]", \
"Solar reflectance of surface b (usually room-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.glass[1].tauIR", \
"Infrared transmissivity of glass [1]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.glass[1].absIR_a", \
"Infrared absorptivity of surface a (usually outside-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.glass[1].absIR_b", \
"Infrared absorptivity of surface b (usually room-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.gas[1].x", "Gas layer thickness [m]",\
 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.gas[1].a_k", \
"Constant coefficient for thermal conductivity [W/(m.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.gas[1].b_k", \
"Temperature dependent coefficient for thermal conductivity [W/(m.K2)]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.gas[1].a_mu", \
"Constant coefficient for dynamic viscosity [Pa.s]", 0.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.gas[1].b_mu", \
"Temperature dependent coefficient for dynamic viscosity [N.s/(m2.K)]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.gas[1].a_c", \
"Constant coefficient for specific heat capacity [J/(kg.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.gas[1].b_c", \
"Temperature dependent coefficient for specific heat capacity [J/(kg.K2)]", 0.0,\
 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.gas[1].MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConExtWin[1].glaSys.gas[1].P0", "Normal pressure [Pa|bar]",\
 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].x", \
"Material thickness [m]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.89, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 790.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1920.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.1348314606741573, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 156.65721542931692, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4181401517439673, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConPar[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].x", \
"Material thickness [m]", 0.1016, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.3866666666666667, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 128.51496410924295, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].nStaReal", \
"Number of states as a real number", 1.1633822942900691, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].x", \
"Material thickness [m]", 0.2032, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 6.773333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].piMat", \
"Ratio x/sqrt(alpha)", 257.0299282184859, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].nStaReal", \
"Number of states as a real number", 2.3267645885801382, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[4].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[5].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].x", \
"Material thickness [m]", 0.1016, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.3866666666666667, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].piMat", \
"Ratio x/sqrt(alpha)", 128.51496410924295, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].nStaReal", \
"Number of states as a real number", 1.1633822942900691, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[6].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[1].layers.material[7].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[2].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[3].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].x", \
"Material thickness [m]", 0.178, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.059, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1307.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1480.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.016949152542373, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].x", \
"Material thickness [m]", 0.0191, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.057, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1331.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 288.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.3350877192982456, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.datConBou[4].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.vol.dynBal.energyDynamics", "Type of energy balance: dynamic (3 initialization options) or steady state [:#(type=Modelica.Fluid.Types.Dynamics)]",\
 2, 1.0,4.0,0.0,0,2565)
DeclareVariable("flo.cor.air.vol.dynBal.massDynamics", "Type of mass balance: dynamic (3 initialization options) or steady state [:#(type=Modelica.Fluid.Types.Dynamics)]",\
 2, 1.0,4.0,0.0,0,2565)
DeclareVariable("flo.cor.air.vol.dynBal.substanceDynamics", "Type of independent mass fraction balance: dynamic (3 initialization options) or steady state [:#(type=Modelica.Fluid.Types.Dynamics)]",\
 2, 1.0,4.0,0.0,0,2565)
DeclareVariable("flo.cor.air.vol.dynBal.traceDynamics", "Type of trace substance balance: dynamic (3 initialization options) or steady state [:#(type=Modelica.Fluid.Types.Dynamics)]",\
 2, 1.0,4.0,0.0,0,2565)
DeclareVariable("flo.cor.air.vol.dynBal.p_start", "Start value of pressure [Pa|bar]",\
 101325, 0.0,100000000.0,100000.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.T_start", "Start value of temperature [K|degC]",\
 293.15, 1.0,10000.0,300.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.X_start[1]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.X_start[2]", "Start value of mass fractions m_i/m [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.mSenFac", "Factor for scaling the sensible thermal mass of the volume",\
 1.0, 1.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.initialize_p", "= true to set up initial equations for pressure [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.air.vol.dynBal.simplify_mWat_flow", "Set to true to cause port_a.m_flow + port_b.m_flow = 0 even if mWat_flow is non-zero. Used only if Medium.nX > 1 [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.air.vol.dynBal.nPorts", "Number of ports [:#(type=Integer)]",\
 10, 0.0,0.0,0.0,0,2565)
DeclareVariable("flo.cor.air.vol.dynBal.use_mWat_flow", "Set to true to enable input connector for moisture mass flow rate [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.air.vol.dynBal.use_C_flow", "Set to true to enable input connector for trace substance [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareAlias2("flo.cor.air.vol.dynBal.Q_flow", "Sensible plus latent heat flow rate transferred into the medium [W]",\
 "flo.cor.air.vol.heatPort.Q_flow", 1, 5, 14127, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.mWat_flow", "Moisture mass flow rate added to the medium [kg/s]",\
 "flo.cor.air.vol.mWat_flow", 1, 5, 14126, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.hOut", "Leaving specific enthalpy of the component [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.XiOut[1]", "Leaving species concentration of the component [1]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.UOut", "Internal energy of the component [J]",\
 "flo.cor.air.vol.dynBal.U", 1, 1, 261, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.mXiOut[1]", "Species mass of the component [kg]",\
 "flo.cor.air.vol.dynBal.mXi[1]", 1, 1, 262, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.mOut", "Mass of the component [kg]", \
"flo.cor.air.vol.dynBal.m", 1, 5, 40624, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[1].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "cor.port_a.m_flow", 1, 5, 2295, 1156)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[1].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[1].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[1].Xi_outflow[1]", "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0 [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[2].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "splRetCor.port_3.m_flow", -1, 5, 2840, 1156)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[2].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[2].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[2].Xi_outflow[1]", "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0 [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[3].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "flo.sou.ports[4].m_flow", -1, 5, 3450, 1156)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[3].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[3].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[3].Xi_outflow[1]", "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0 [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[4].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "flo.sou.ports[5].m_flow", -1, 5, 3451, 1156)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[4].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[4].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[4].Xi_outflow[1]", "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0 [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[5].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "flo.ple.ports[4].m_flow", -1, 5, 6915, 1156)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[5].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[5].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[5].Xi_outflow[1]", "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0 [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[6].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "flo.ple.ports[5].m_flow", -1, 5, 6916, 1156)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[6].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[6].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[6].Xi_outflow[1]", "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0 [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[7].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "flo.nor.ports[4].m_flow", -1, 5, 10310, 1156)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[7].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[7].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[7].Xi_outflow[1]", "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0 [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[8].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 "flo.nor.ports[5].m_flow", -1, 5, 10311, 1156)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[8].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[8].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[8].Xi_outflow[1]", "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0 [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1028)
DeclareVariable("flo.cor.air.vol.dynBal.ports[9].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 0.0, -100000.0,100000.0,0.0,0,2825)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[9].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[9].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[9].Xi_outflow[1]", "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0 [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1028)
DeclareVariable("flo.cor.air.vol.dynBal.ports[10].m_flow", "Mass flow rate from the connection point into the component [kg/s]",\
 0.0, -100000.0,100000.0,0.0,0,2825)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[10].p", "Thermodynamic pressure in the connection point [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[10].h_outflow", "Specific thermodynamic enthalpy close to the connection point if m_flow < 0 [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.ports[10].Xi_outflow[1]", "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0 [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1028)
DeclareAlias2("flo.cor.air.vol.dynBal.medium.p", "Absolute pressure of medium [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.medium.Xi[1]", "Structurally independent mass fractions [1]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.medium.h", "Specific enthalpy of medium [J/kg]",\
 "flo.portsCor[1].h_outflow", 1, 5, 15195, 1024)
DeclareVariable("flo.cor.air.vol.dynBal.medium.d", "Density of medium [kg/m3|g/cm3]",\
 0.0, 0.0,100000.0,1.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.medium.T", "Temperature of medium [K|degC]",\
 300.0, 1.0,10000.0,300.0,0,2560)
DeclareAlias2("flo.cor.air.vol.dynBal.medium.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1024)
DeclareVariable("flo.cor.air.vol.dynBal.medium.X[2]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.medium.u", "Specific internal energy of medium [J/kg]",\
 0.0, -100000000.0,100000000.0,1000000.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.medium.R", "Gas constant (of mixture if applicable) [J/(kg.K)]",\
 1000.0, 0.0,10000000.0,1000.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.medium.MM", "Molar mass (of mixture or single fluid) [kg/mol]",\
 0.032, 0.001,0.25,0.032,0,2560)
DeclareAlias2("flo.cor.air.vol.dynBal.medium.state.p", "Absolute pressure of medium [Pa|bar]",\
 "dpRetDuc.port_a.p", 1, 1, 5, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.medium.state.T", "Temperature of medium [K|degC]",\
 "flo.cor.air.vol.dynBal.medium.T", 1, 5, 40611, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.medium.state.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1024)
DeclareAlias2("flo.cor.air.vol.dynBal.medium.state.X[2]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 "flo.cor.air.vol.dynBal.medium.X[2]", 1, 5, 40612, 1024)
DeclareVariable("flo.cor.air.vol.dynBal.medium.preferredMediumStates", \
"= true if StateSelect.prefer shall be used for the independent property variables of the medium [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.air.vol.dynBal.medium.standardOrderComponents", \
"If true, and reducedX = true, the last element of X will be computed from the other ones [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.air.vol.dynBal.medium.T_degC", "Temperature of medium in [degC] [degC;]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.medium.p_bar", "Absolute pressure of medium in [bar] [bar]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.medium.MMX[1]", "Molar masses of components [kg/mol]",\
 0.01801528, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.medium.MMX[2]", "Molar masses of components [kg/mol]",\
 0.0289651159, 0.0,1E+100,0.0,0,2561)
DeclareAlias2("flo.cor.air.vol.dynBal.medium.X_steam", "Mass fraction of steam water [kg/kg]",\
 "cor.port_a.Xi_outflow[1]", 1, 5, 2297, 1024)
DeclareVariable("flo.cor.air.vol.dynBal.medium.X_air", "Mass fraction of air [kg/kg]",\
 0.0, 0.0,1.0,0.1,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.medium.dT", "Temperature difference used to compute enthalpy [K,]",\
 20.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.air.vol.dynBal.U", "Internal energy of fluid [J]", 261, \
0.0, 0.0,0.0,100000.0,0,2592)
DeclareDerivative("flo.cor.air.vol.dynBal.der(U)", "der(Internal energy of fluid) [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.m", "Mass of fluid [kg]", 0.0, 0.0,\
1E+100,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.der(m)", "der(Mass of fluid) [kg/s]", \
0.0, 0.0,0.0,0.0,0,2560)
DeclareState("flo.cor.air.vol.dynBal.mXi[1]", "Masses of independent components in the fluid [kg]",\
 262, 0.0, 0.0,1E+100,0.0,0,2592)
DeclareDerivative("flo.cor.air.vol.dynBal.der(mXi[1])", "der(Masses of independent components in the fluid) [kg/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("flo.cor.air.vol.dynBal.mb_flow", "Mass flows across boundaries [kg/s]",\
 "flo.cor.air.vol.dynBal.der(m)", 1, 5, 40625, 1024)
DeclareVariable("flo.cor.air.vol.dynBal.mbXi_flow[1]", "Substance mass flows across boundaries [kg/s]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.Hb_flow", "Enthalpy flow across boundaries or energy source/sink [W]",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.fluidVolume", "Volume [m3]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.CSen", "Aditional heat capacity for implementing mFactor [J/K]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.ports_H_flow[1]", "[W]", 0.0, \
-100000000.0,100000000.0,1000.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_H_flow[2]", "[W]", 0.0, \
-100000000.0,100000000.0,1000.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_H_flow[3]", "[W]", 0.0, \
-100000000.0,100000000.0,1000.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_H_flow[4]", "[W]", 0.0, \
-100000000.0,100000000.0,1000.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_H_flow[5]", "[W]", 0.0, \
-100000000.0,100000000.0,1000.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_H_flow[6]", "[W]", 0.0, \
-100000000.0,100000000.0,1000.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_H_flow[7]", "[W]", 0.0, \
-100000000.0,100000000.0,1000.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_H_flow[8]", "[W]", 0.0, \
-100000000.0,100000000.0,1000.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_H_flow[9]", "[W]", 0.0, \
-100000000.0,100000000.0,1000.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.ports_H_flow[10]", "[W]", 0.0, \
-100000000.0,100000000.0,1000.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.ports_mXi_flow[1, 1]", "[kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_mXi_flow[2, 1]", "[kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_mXi_flow[3, 1]", "[kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_mXi_flow[4, 1]", "[kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_mXi_flow[5, 1]", "[kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_mXi_flow[6, 1]", "[kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_mXi_flow[7, 1]", "[kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_mXi_flow[8, 1]", "[kg/s]", 0.0, \
0.0,0.0,0.0,0,2560)
DeclareVariable("flo.cor.air.vol.dynBal.ports_mXi_flow[9, 1]", "[kg/s]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.ports_mXi_flow[10, 1]", "[kg/s]", 0.0, \
0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.cp_default", "Heat capacity, to compute additional dry mass [J/(kg.K)]",\
 1014.54, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.rho_start", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 0.0, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.computeCSen", "[:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,2563)
DeclareVariable("flo.cor.air.vol.dynBal.state_default.p", "Absolute pressure of medium [Pa|bar]",\
 101325.0, 0.0,100000000.0,100000.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.state_default.T", "Temperature of medium [K|degC]",\
 293.15, 1.0,10000.0,300.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.state_default.X[1]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 0.01, 0.0,1.0,0.1,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.state_default.X[2]", "Mass fractions (= (component mass)/total mass  m_i/m) [kg/kg]",\
 0.99, 0.0,1.0,0.1,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.rho_default", "Density, used to compute fluid mass [kg/m3|g/cm3]",\
 1.2, 0.0,1E+100,0.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.s[1]", "Vector with zero everywhere except where species is",\
 1, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal.hStart", "Start value for specific enthalpy [J/kg]",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("flo.cor.air.vol.dynBal._simplify_mWat_flow", "If true, then port_a.m_flow + port_b.m_flow = 0 even if mWat_flow is non-zero, and equations are simplified [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,2563)
DeclareAlias2("flo.cor.air.vol.dynBal.mWat_flow_internal", "Needed to connect to conditional connector [kg/s]",\
 "flo.cor.air.vol.mWat_flow", 1, 5, 14126, 1024)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 4.233333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 160.64370513655368, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4542278678625862, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].x", \
"Material thickness [m]", 0.2032, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 6.773333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 257.0299282184859, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].nStaReal", \
"Number of states as a real number", 2.3267645885801382, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[4].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExt[1].layers.material[5].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].x", \
"Material thickness [m]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.89, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 790.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1920.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.1348314606741573, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].steadyState",\
 "Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 156.65721542931692, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4181401517439673, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].layers.material[1].phasechange",\
 "Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.glass[1].x", \
"Thickness [m]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.glass[1].k", \
"Thermal conductivity [W/(m.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.glass[1].tauSol[1]", \
"Solar transmittance [1]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.glass[1].rhoSol_a[1]", \
"Solar reflectance of surface a (usually outside-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.glass[1].rhoSol_b[1]", \
"Solar reflectance of surface b (usually room-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.glass[1].tauIR", \
"Infrared transmissivity of glass [1]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.glass[1].absIR_a", \
"Infrared absorptivity of surface a (usually outside-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.glass[1].absIR_b", \
"Infrared absorptivity of surface b (usually room-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.gas[1].x", \
"Gas layer thickness [m]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.gas[1].a_k", \
"Constant coefficient for thermal conductivity [W/(m.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.gas[1].b_k", \
"Temperature dependent coefficient for thermal conductivity [W/(m.K2)]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.gas[1].a_mu", \
"Constant coefficient for dynamic viscosity [Pa.s]", 0.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.gas[1].b_mu", \
"Temperature dependent coefficient for dynamic viscosity [N.s/(m2.K)]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.gas[1].a_c", \
"Constant coefficient for specific heat capacity [J/(kg.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.gas[1].b_c", \
"Temperature dependent coefficient for specific heat capacity [J/(kg.K2)]", 0.0,\
 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.gas[1].MM", \
"Molar mass (of mixture or single fluid) [kg/mol]", 0.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConExtWin[1].glaSys.gas[1].P0", \
"Normal pressure [Pa|bar]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].x", \
"Material thickness [m]", 0.12, 0.0,0.0,0.0,0,1537)
EndNonAlias(30)
PreNonAliasNew(31)
StartNonAlias(31)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.89, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 790.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1920.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.1348314606741573, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 156.65721542931692, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4181401517439673, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConPar[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].x", \
"Material thickness [m]", 0.1016, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.3866666666666667, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 128.51496410924295, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].nStaReal", \
"Number of states as a real number", 1.1633822942900691, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].x", \
"Material thickness [m]", 0.2032, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 6.773333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].piMat", \
"Ratio x/sqrt(alpha)", 257.0299282184859, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].nStaReal", \
"Number of states as a real number", 2.3267645885801382, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[4].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[5].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].x", \
"Material thickness [m]", 0.1016, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.3866666666666667, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].piMat", \
"Ratio x/sqrt(alpha)", 128.51496410924295, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].nStaReal", \
"Number of states as a real number", 1.1633822942900691, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[6].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[1].layers.material[7].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[2].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[3].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].x", \
"Material thickness [m]", 0.178, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.059, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1307.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1480.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.016949152542373, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].x", \
"Material thickness [m]", 0.0191, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.057, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1331.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 288.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.3350877192982456, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadGai.datConBou[4].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 4.233333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 160.64370513655368, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4542278678625862, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].x", \
"Material thickness [m]", 0.2032, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 6.773333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 257.0299282184859, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].nStaReal", \
"Number of states as a real number", 2.3267645885801382, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[4].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExt[1].layers.material[5].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].x", \
"Material thickness [m]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.89, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 790.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1920.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.1348314606741573, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].steadyState",\
 "Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 156.65721542931692, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4181401517439673, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].layers.material[1].phasechange",\
 "Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.glass[1].x", \
"Thickness [m]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.glass[1].k", \
"Thermal conductivity [W/(m.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.glass[1].tauSol[1]", \
"Solar transmittance [1]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.glass[1].rhoSol_a[1]", \
"Solar reflectance of surface a (usually outside-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.glass[1].rhoSol_b[1]", \
"Solar reflectance of surface b (usually room-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.glass[1].tauIR", \
"Infrared transmissivity of glass [1]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.glass[1].absIR_a", \
"Infrared absorptivity of surface a (usually outside-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.glass[1].absIR_b", \
"Infrared absorptivity of surface b (usually room-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.gas[1].x", \
"Gas layer thickness [m]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.gas[1].a_k", \
"Constant coefficient for thermal conductivity [W/(m.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.gas[1].b_k", \
"Temperature dependent coefficient for thermal conductivity [W/(m.K2)]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.gas[1].a_mu", \
"Constant coefficient for dynamic viscosity [Pa.s]", 0.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.gas[1].b_mu", \
"Temperature dependent coefficient for dynamic viscosity [N.s/(m2.K)]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.gas[1].a_c", \
"Constant coefficient for specific heat capacity [J/(kg.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.gas[1].b_c", \
"Temperature dependent coefficient for specific heat capacity [J/(kg.K2)]", 0.0,\
 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.gas[1].MM", \
"Molar mass (of mixture or single fluid) [kg/mol]", 0.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConExtWin[1].glaSys.gas[1].P0", \
"Normal pressure [Pa|bar]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].x", \
"Material thickness [m]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.89, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 790.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1920.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.1348314606741573, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 156.65721542931692, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4181401517439673, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConPar[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].x", \
"Material thickness [m]", 0.1016, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.3866666666666667, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 128.51496410924295, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].nStaReal", \
"Number of states as a real number", 1.1633822942900691, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].x", \
"Material thickness [m]", 0.2032, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 6.773333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].piMat", \
"Ratio x/sqrt(alpha)", 257.0299282184859, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].nStaReal", \
"Number of states as a real number", 2.3267645885801382, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[4].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[5].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].x", \
"Material thickness [m]", 0.1016, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.3866666666666667, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].piMat", \
"Ratio x/sqrt(alpha)", 128.51496410924295, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].nStaReal", \
"Number of states as a real number", 1.1633822942900691, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[6].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[1].layers.material[7].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[2].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[3].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].x", \
"Material thickness [m]", 0.178, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.059, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1307.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1480.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.016949152542373, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].x", \
"Material thickness [m]", 0.0191, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.057, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1331.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 288.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.3350877192982456, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.irRadExc.datConBou[4].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 4.233333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 160.64370513655368, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4542278678625862, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].x", \
"Material thickness [m]", 0.2032, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 6.773333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 257.0299282184859, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].nStaReal", \
"Number of states as a real number", 2.3267645885801382, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[4].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExt[1].layers.material[5].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].x", \
"Material thickness [m]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.89, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 790.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1920.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.1348314606741573, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].steadyState",\
 "Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 156.65721542931692, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4181401517439673, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExtWin[1].layers.material[1].phasechange",\
 "Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.glass[1].x", \
"Thickness [m]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.glass[1].k", \
"Thermal conductivity [W/(m.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.glass[1].tauSol[1]", \
"Solar transmittance [1]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.glass[1].rhoSol_a[1]", \
"Solar reflectance of surface a (usually outside-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.glass[1].rhoSol_b[1]", \
"Solar reflectance of surface b (usually room-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.glass[1].tauIR", \
"Infrared transmissivity of glass [1]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.glass[1].absIR_a", \
"Infrared absorptivity of surface a (usually outside-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.glass[1].absIR_b", \
"Infrared absorptivity of surface b (usually room-facing surface) [1]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.gas[1].x", \
"Gas layer thickness [m]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.gas[1].a_k", \
"Constant coefficient for thermal conductivity [W/(m.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.gas[1].b_k", \
"Temperature dependent coefficient for thermal conductivity [W/(m.K2)]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.gas[1].a_mu", \
"Constant coefficient for dynamic viscosity [Pa.s]", 0.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.gas[1].b_mu", \
"Temperature dependent coefficient for dynamic viscosity [N.s/(m2.K)]", 0.0, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.gas[1].a_c", \
"Constant coefficient for specific heat capacity [J/(kg.K)]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.gas[1].b_c", \
"Temperature dependent coefficient for specific heat capacity [J/(kg.K2)]", 0.0,\
 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.gas[1].MM", \
"Molar mass (of mixture or single fluid) [kg/mol]", 0.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConExtWin[1].glaSys.gas[1].P0", \
"Normal pressure [Pa|bar]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].x", \
"Material thickness [m]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.89, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 790.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1920.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.1348314606741573, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 156.65721542931692, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].nStaReal", \
"Number of states as a real number", 1.4181401517439673, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConPar[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].x", \
"Material thickness [m]", 0.1016, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.3866666666666667, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 128.51496410924295, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].nStaReal", \
"Number of states as a real number", 1.1633822942900691, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].x", \
"Material thickness [m]", 0.0127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.10583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 29.634845199528208, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].nStaReal", \
"Number of states as a real number", 0.2682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].x", \
"Material thickness [m]", 0.2032, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 6.773333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].piMat", \
"Ratio x/sqrt(alpha)", 257.0299282184859, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].nStaReal", \
"Number of states as a real number", 2.3267645885801382, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[4].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[5].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].x", \
"Material thickness [m]", 0.1016, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].k", \
"Thermal conductivity [W/(m.K)]", 0.03, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].c", \
"Specific heat capacity [J/(kg.K)]", 1200.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].d", \
"Mass density [kg/m3|g/cm3]", 40.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.3866666666666667, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 2, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].piMat", \
"Ratio x/sqrt(alpha)", 128.51496410924295, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].nStaReal", \
"Number of states as a real number", 1.1633822942900691, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[6].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[1].layers.material[7].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[2].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].x", \
"Material thickness [m]", 0.01588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.09924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 1, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 37.07223327505371, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].nStaReal", \
"Number of states as a real number", 0.3355965595207035, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].x", \
"Material thickness [m]", 0.127, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.12, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1210.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 540.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 1.0583333333333333, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 296.3484519952821, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].nStaReal", \
"Number of states as a real number", 2.682695703035143, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].x", \
"Material thickness [m]", 0.1588, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].k", \
"Thermal conductivity [W/(m.K)]", 0.16, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].c", \
"Specific heat capacity [J/(kg.K)]", 1090.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].d", \
"Mass density [kg/m3|g/cm3]", 800.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.9924999999999999, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 4, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].piMat", \
"Ratio x/sqrt(alpha)", 370.7223327505372, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].nStaReal", \
"Number of states as a real number", 3.355965595207036, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[3].layers.material[3].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].x", \
"Material thickness [m]", 0.178, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].k", \
"Thermal conductivity [W/(m.K)]", 0.059, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].c", \
"Specific heat capacity [J/(kg.K)]", 1307.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].d", \
"Mass density [kg/m3|g/cm3]", 1480.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 3.016949152542373, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].piMat", \
"Ratio x/sqrt(alpha)", 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[1].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].x", \
"Material thickness [m]", 0.0191, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].k", \
"Thermal conductivity [W/(m.K)]", 0.057, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].c", \
"Specific heat capacity [J/(kg.K)]", 1331.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].d", \
"Mass density [kg/m3|g/cm3]", 288.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].R", \
"Thermal resistance of a unit area of material [m2.K/W]", 0.3350877192982456, \
0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].nStaRef", \
"Number of state variables in a reference material of 0.2 m concrete [:#(type=Integer)]",\
 3, 0.0,1E+100,0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].nSta", \
"Actual number of state variables in material [:#(type=Integer)]", 3, 1.0,1E+100,\
0.0,0,1541)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].steadyState", \
"Flag, if true, then material is computed using steady-state heat conduction [:#(type=Boolean)]",\
 true, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].piRef", \
"Ratio x/sqrt(alpha) for reference material of 0.2 m concrete", 331.4, 0.0,0.0,\
0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].piMat", \
"Ratio x/sqrt(alpha)", 331.4, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].nStaReal", \
"Number of states as a real number", 3.0, 0.0,1E+100,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].TSol", \
"Solidus temperature, used only for PCM. [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].TLiq", \
"Liquidus temperature, used only for PCM [K|degC]", 293.15, 0.0,1E+100,300.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].LHea", \
"Latent heat of phase change [J/kg]", 0.0, 0.0,0.0,0.0,0,1537)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].ensureMonotonicity",\
 "Set to true to force derivatives dT/du to be monotone [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("flo.cor.radTem.datConBou[4].layers.material[2].phasechange", \
"Flag, true if the material is a phase change material [:#(type=Boolean)]", \
false, 0.0,0.0,0.0,0,1539)
DeclareVariable("conVAVNor.damVal.conVal.I.u", "Connector of Real input signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareState("conVAVNor.damVal.conVal.I.y", "Connector of Real output signal", 263,\
 0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conVAVNor.damVal.conVal.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conVAVNor.damVal.conVal.I.k", "Integrator gain [1]", 0.0, \
0.0,0.0,0.0,0,513)
DeclareVariable("conVAVNor.damVal.conVal.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conVAVNor.damVal.conVal.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,517)
DeclareVariable("conVAVNor.damVal.conVal.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conVAVNor.damVal.conVal.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conVAVNor.damVal.conVal.addRes.y", 1, 5, 17417, 0)
DeclareAlias2("conVAVNor.damVal.conVal.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conVAVNor.damVal.not5.y", 1, 5, 17527, 65)
DeclareAlias2("conVAVNor.damVal.conVal.I.y_reset_internal", "Internal connector for integrator reset",\
 "conVAVNor.damVal.conVal.addRes.y", 1, 5, 17417, 1024)
DeclareAlias2("conVAVNor.damVal.conVal.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conVAVNor.damVal.not5.y", 1, 5, 17527, 1089)
DeclareAlias2("conVAVNor.damVal.conVal.errI1.u1", "Connector of Real input signal 1",\
 "conVAVNor.damVal.conVal.uS_revAct.y", 1, 5, 17401, 0)
DeclareAlias2("conVAVNor.damVal.conVal.errI1.u2", "Connector of Real input signal 2",\
 "conVAVNor.damVal.conVal.errP.u2", 1, 5, 17390, 0)
DeclareVariable("conVAVNor.damVal.conVal.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conVAVNor.damVal.conVal.errI2.u1", "Connector of Real input signal 1",\
 "conVAVNor.damVal.conVal.errI1.y", 1, 5, 41773, 0)
DeclareAlias2("conVAVNor.damVal.conVal.errI2.u2", "Connector of Real input signal 2",\
 "conVAVNor.damVal.conVal.antWinGai.y", 1, 5, 17413, 0)
DeclareAlias2("conVAVNor.damVal.conVal.errI2.y", "Connector of Real output signal",\
 "conVAVNor.damVal.conVal.I.u", 1, 5, 41768, 0)
DeclareVariable("conVAVNor.conHeaLoo.I.u", "Connector of Real input signal", 0.0,\
 0.0,0.0,0.0,0,512)
DeclareState("conVAVNor.conHeaLoo.I.y", "Connector of Real output signal", 264, \
0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conVAVNor.conHeaLoo.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conVAVNor.conHeaLoo.I.k", "Integrator gain [1]", 0.0, 0.0,0.0,\
0.0,0,513)
DeclareVariable("conVAVNor.conHeaLoo.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conVAVNor.conHeaLoo.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,517)
DeclareVariable("conVAVNor.conHeaLoo.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conVAVNor.conHeaLoo.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conVAVNor.conHeaLoo.addRes.y", 1, 5, 17808, 0)
DeclareAlias2("conVAVNor.conHeaLoo.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conVAVNor.isNotUn.y", 1, 5, 17857, 65)
DeclareAlias2("conVAVNor.conHeaLoo.I.y_reset_internal", "Internal connector for integrator reset",\
 "conVAVNor.conHeaLoo.addRes.y", 1, 5, 17808, 1024)
DeclareAlias2("conVAVNor.conHeaLoo.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conVAVNor.isNotUn.y", 1, 5, 17857, 1089)
DeclareAlias2("conVAVNor.conHeaLoo.errI1.u1", "Connector of Real input signal 1",\
 "conVAVNor.conHeaLoo.uS_revAct.y", 1, 5, 17792, 0)
DeclareAlias2("conVAVNor.conHeaLoo.errI1.u2", "Connector of Real input signal 2",\
 "conVAVNor.conHeaLoo.errP.u2", 1, 5, 17781, 0)
DeclareVariable("conVAVNor.conHeaLoo.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conVAVNor.conHeaLoo.errI2.u1", "Connector of Real input signal 1",\
 "conVAVNor.conHeaLoo.errI1.y", 1, 5, 41779, 0)
DeclareAlias2("conVAVNor.conHeaLoo.errI2.u2", "Connector of Real input signal 2",\
 "conVAVNor.conHeaLoo.antWinGai.y", 1, 5, 17804, 0)
DeclareAlias2("conVAVNor.conHeaLoo.errI2.y", "Connector of Real output signal", \
"conVAVNor.conHeaLoo.I.u", 1, 5, 41774, 0)
DeclareVariable("conVAVNor.conCooLoo.I.u", "Connector of Real input signal", 0.0,\
 0.0,0.0,0.0,0,512)
DeclareState("conVAVNor.conCooLoo.I.y", "Connector of Real output signal", 265, \
0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conVAVNor.conCooLoo.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conVAVNor.conCooLoo.I.k", "Integrator gain [1]", 0.0, 0.0,0.0,\
0.0,0,513)
DeclareVariable("conVAVNor.conCooLoo.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conVAVNor.conCooLoo.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,517)
DeclareVariable("conVAVNor.conCooLoo.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conVAVNor.conCooLoo.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conVAVNor.conCooLoo.addRes.y", 1, 5, 17849, 0)
DeclareAlias2("conVAVNor.conCooLoo.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conVAVNor.isNotUn.y", 1, 5, 17857, 65)
DeclareAlias2("conVAVNor.conCooLoo.I.y_reset_internal", "Internal connector for integrator reset",\
 "conVAVNor.conCooLoo.addRes.y", 1, 5, 17849, 1024)
DeclareAlias2("conVAVNor.conCooLoo.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conVAVNor.isNotUn.y", 1, 5, 17857, 1089)
DeclareAlias2("conVAVNor.conCooLoo.errI1.u1", "Connector of Real input signal 1",\
 "conVAVNor.conCooLoo.uS_revAct.y", 1, 5, 17833, 0)
DeclareAlias2("conVAVNor.conCooLoo.errI1.u2", "Connector of Real input signal 2",\
 "conVAVNor.conCooLoo.errP.u2", 1, 5, 17822, 0)
DeclareVariable("conVAVNor.conCooLoo.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conVAVNor.conCooLoo.errI2.u1", "Connector of Real input signal 1",\
 "conVAVNor.conCooLoo.errI1.y", 1, 5, 41785, 0)
DeclareAlias2("conVAVNor.conCooLoo.errI2.u2", "Connector of Real input signal 2",\
 "conVAVNor.conCooLoo.antWinGai.y", 1, 5, 17845, 0)
DeclareAlias2("conVAVNor.conCooLoo.errI2.y", "Connector of Real output signal", \
"conVAVNor.conCooLoo.I.u", 1, 5, 41780, 0)
DeclareVariable("conVAVCor.damVal.conVal.I.u", "Connector of Real input signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareState("conVAVCor.damVal.conVal.I.y", "Connector of Real output signal", 266,\
 0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conVAVCor.damVal.conVal.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conVAVCor.damVal.conVal.I.k", "Integrator gain [1]", 0.0, \
0.0,0.0,0.0,0,513)
DeclareVariable("conVAVCor.damVal.conVal.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conVAVCor.damVal.conVal.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,517)
DeclareVariable("conVAVCor.damVal.conVal.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conVAVCor.damVal.conVal.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conVAVCor.damVal.conVal.addRes.y", 1, 5, 18081, 0)
DeclareAlias2("conVAVCor.damVal.conVal.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conVAVCor.damVal.not5.y", 1, 5, 18191, 65)
DeclareAlias2("conVAVCor.damVal.conVal.I.y_reset_internal", "Internal connector for integrator reset",\
 "conVAVCor.damVal.conVal.addRes.y", 1, 5, 18081, 1024)
DeclareAlias2("conVAVCor.damVal.conVal.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conVAVCor.damVal.not5.y", 1, 5, 18191, 1089)
DeclareAlias2("conVAVCor.damVal.conVal.errI1.u1", "Connector of Real input signal 1",\
 "conVAVCor.damVal.conVal.uS_revAct.y", 1, 5, 18065, 0)
DeclareAlias2("conVAVCor.damVal.conVal.errI1.u2", "Connector of Real input signal 2",\
 "conVAVCor.damVal.conVal.errP.u2", 1, 5, 18054, 0)
DeclareVariable("conVAVCor.damVal.conVal.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conVAVCor.damVal.conVal.errI2.u1", "Connector of Real input signal 1",\
 "conVAVCor.damVal.conVal.errI1.y", 1, 5, 41791, 0)
DeclareAlias2("conVAVCor.damVal.conVal.errI2.u2", "Connector of Real input signal 2",\
 "conVAVCor.damVal.conVal.antWinGai.y", 1, 5, 18077, 0)
DeclareAlias2("conVAVCor.damVal.conVal.errI2.y", "Connector of Real output signal",\
 "conVAVCor.damVal.conVal.I.u", 1, 5, 41786, 0)
DeclareVariable("conVAVCor.conHeaLoo.I.u", "Connector of Real input signal", 0.0,\
 0.0,0.0,0.0,0,512)
DeclareState("conVAVCor.conHeaLoo.I.y", "Connector of Real output signal", 267, \
0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conVAVCor.conHeaLoo.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conVAVCor.conHeaLoo.I.k", "Integrator gain [1]", 0.0, 0.0,0.0,\
0.0,0,513)
DeclareVariable("conVAVCor.conHeaLoo.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conVAVCor.conHeaLoo.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,517)
DeclareVariable("conVAVCor.conHeaLoo.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conVAVCor.conHeaLoo.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conVAVCor.conHeaLoo.addRes.y", 1, 5, 18472, 0)
DeclareAlias2("conVAVCor.conHeaLoo.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conVAVCor.isNotUn.y", 1, 5, 18521, 65)
DeclareAlias2("conVAVCor.conHeaLoo.I.y_reset_internal", "Internal connector for integrator reset",\
 "conVAVCor.conHeaLoo.addRes.y", 1, 5, 18472, 1024)
DeclareAlias2("conVAVCor.conHeaLoo.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conVAVCor.isNotUn.y", 1, 5, 18521, 1089)
DeclareAlias2("conVAVCor.conHeaLoo.errI1.u1", "Connector of Real input signal 1",\
 "conVAVCor.conHeaLoo.uS_revAct.y", 1, 5, 18456, 0)
DeclareAlias2("conVAVCor.conHeaLoo.errI1.u2", "Connector of Real input signal 2",\
 "conVAVCor.conHeaLoo.errP.u2", 1, 5, 18445, 0)
DeclareVariable("conVAVCor.conHeaLoo.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conVAVCor.conHeaLoo.errI2.u1", "Connector of Real input signal 1",\
 "conVAVCor.conHeaLoo.errI1.y", 1, 5, 41797, 0)
DeclareAlias2("conVAVCor.conHeaLoo.errI2.u2", "Connector of Real input signal 2",\
 "conVAVCor.conHeaLoo.antWinGai.y", 1, 5, 18468, 0)
DeclareAlias2("conVAVCor.conHeaLoo.errI2.y", "Connector of Real output signal", \
"conVAVCor.conHeaLoo.I.u", 1, 5, 41792, 0)
DeclareVariable("conVAVCor.conCooLoo.I.u", "Connector of Real input signal", 0.0,\
 0.0,0.0,0.0,0,512)
DeclareState("conVAVCor.conCooLoo.I.y", "Connector of Real output signal", 268, \
0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conVAVCor.conCooLoo.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conVAVCor.conCooLoo.I.k", "Integrator gain [1]", 0.0, 0.0,0.0,\
0.0,0,513)
DeclareVariable("conVAVCor.conCooLoo.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conVAVCor.conCooLoo.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,517)
DeclareVariable("conVAVCor.conCooLoo.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conVAVCor.conCooLoo.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conVAVCor.conCooLoo.addRes.y", 1, 5, 18513, 0)
DeclareAlias2("conVAVCor.conCooLoo.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conVAVCor.isNotUn.y", 1, 5, 18521, 65)
DeclareAlias2("conVAVCor.conCooLoo.I.y_reset_internal", "Internal connector for integrator reset",\
 "conVAVCor.conCooLoo.addRes.y", 1, 5, 18513, 1024)
DeclareAlias2("conVAVCor.conCooLoo.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conVAVCor.isNotUn.y", 1, 5, 18521, 1089)
DeclareAlias2("conVAVCor.conCooLoo.errI1.u1", "Connector of Real input signal 1",\
 "conVAVCor.conCooLoo.uS_revAct.y", 1, 5, 18497, 0)
DeclareAlias2("conVAVCor.conCooLoo.errI1.u2", "Connector of Real input signal 2",\
 "conVAVCor.conCooLoo.errP.u2", 1, 5, 18486, 0)
DeclareVariable("conVAVCor.conCooLoo.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conVAVCor.conCooLoo.errI2.u1", "Connector of Real input signal 1",\
 "conVAVCor.conCooLoo.errI1.y", 1, 5, 41803, 0)
DeclareAlias2("conVAVCor.conCooLoo.errI2.u2", "Connector of Real input signal 2",\
 "conVAVCor.conCooLoo.antWinGai.y", 1, 5, 18509, 0)
DeclareAlias2("conVAVCor.conCooLoo.errI2.y", "Connector of Real output signal", \
"conVAVCor.conCooLoo.I.u", 1, 5, 41798, 0)
DeclareVariable("conVAVSou.damVal.conVal.I.u", "Connector of Real input signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareState("conVAVSou.damVal.conVal.I.y", "Connector of Real output signal", 269,\
 0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conVAVSou.damVal.conVal.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conVAVSou.damVal.conVal.I.k", "Integrator gain [1]", 0.0, \
0.0,0.0,0.0,0,513)
DeclareVariable("conVAVSou.damVal.conVal.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conVAVSou.damVal.conVal.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,517)
DeclareVariable("conVAVSou.damVal.conVal.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conVAVSou.damVal.conVal.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conVAVSou.damVal.conVal.addRes.y", 1, 5, 18745, 0)
DeclareAlias2("conVAVSou.damVal.conVal.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conVAVSou.damVal.not5.y", 1, 5, 18855, 65)
DeclareAlias2("conVAVSou.damVal.conVal.I.y_reset_internal", "Internal connector for integrator reset",\
 "conVAVSou.damVal.conVal.addRes.y", 1, 5, 18745, 1024)
DeclareAlias2("conVAVSou.damVal.conVal.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conVAVSou.damVal.not5.y", 1, 5, 18855, 1089)
DeclareAlias2("conVAVSou.damVal.conVal.errI1.u1", "Connector of Real input signal 1",\
 "conVAVSou.damVal.conVal.uS_revAct.y", 1, 5, 18729, 0)
DeclareAlias2("conVAVSou.damVal.conVal.errI1.u2", "Connector of Real input signal 2",\
 "conVAVSou.damVal.conVal.errP.u2", 1, 5, 18718, 0)
DeclareVariable("conVAVSou.damVal.conVal.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conVAVSou.damVal.conVal.errI2.u1", "Connector of Real input signal 1",\
 "conVAVSou.damVal.conVal.errI1.y", 1, 5, 41809, 0)
DeclareAlias2("conVAVSou.damVal.conVal.errI2.u2", "Connector of Real input signal 2",\
 "conVAVSou.damVal.conVal.antWinGai.y", 1, 5, 18741, 0)
DeclareAlias2("conVAVSou.damVal.conVal.errI2.y", "Connector of Real output signal",\
 "conVAVSou.damVal.conVal.I.u", 1, 5, 41804, 0)
DeclareVariable("conVAVSou.conHeaLoo.I.u", "Connector of Real input signal", 0.0,\
 0.0,0.0,0.0,0,512)
DeclareState("conVAVSou.conHeaLoo.I.y", "Connector of Real output signal", 270, \
0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conVAVSou.conHeaLoo.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conVAVSou.conHeaLoo.I.k", "Integrator gain [1]", 0.0, 0.0,0.0,\
0.0,0,513)
DeclareVariable("conVAVSou.conHeaLoo.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conVAVSou.conHeaLoo.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,517)
DeclareVariable("conVAVSou.conHeaLoo.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conVAVSou.conHeaLoo.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conVAVSou.conHeaLoo.addRes.y", 1, 5, 19136, 0)
DeclareAlias2("conVAVSou.conHeaLoo.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conVAVSou.isNotUn.y", 1, 5, 19185, 65)
DeclareAlias2("conVAVSou.conHeaLoo.I.y_reset_internal", "Internal connector for integrator reset",\
 "conVAVSou.conHeaLoo.addRes.y", 1, 5, 19136, 1024)
DeclareAlias2("conVAVSou.conHeaLoo.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conVAVSou.isNotUn.y", 1, 5, 19185, 1089)
DeclareAlias2("conVAVSou.conHeaLoo.errI1.u1", "Connector of Real input signal 1",\
 "conVAVSou.conHeaLoo.uS_revAct.y", 1, 5, 19120, 0)
DeclareAlias2("conVAVSou.conHeaLoo.errI1.u2", "Connector of Real input signal 2",\
 "conVAVSou.conHeaLoo.errP.u2", 1, 5, 19109, 0)
DeclareVariable("conVAVSou.conHeaLoo.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conVAVSou.conHeaLoo.errI2.u1", "Connector of Real input signal 1",\
 "conVAVSou.conHeaLoo.errI1.y", 1, 5, 41815, 0)
DeclareAlias2("conVAVSou.conHeaLoo.errI2.u2", "Connector of Real input signal 2",\
 "conVAVSou.conHeaLoo.antWinGai.y", 1, 5, 19132, 0)
DeclareAlias2("conVAVSou.conHeaLoo.errI2.y", "Connector of Real output signal", \
"conVAVSou.conHeaLoo.I.u", 1, 5, 41810, 0)
DeclareVariable("conVAVSou.conCooLoo.I.u", "Connector of Real input signal", 0.0,\
 0.0,0.0,0.0,0,512)
DeclareState("conVAVSou.conCooLoo.I.y", "Connector of Real output signal", 271, \
0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conVAVSou.conCooLoo.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conVAVSou.conCooLoo.I.k", "Integrator gain [1]", 0.0, 0.0,0.0,\
0.0,0,513)
DeclareVariable("conVAVSou.conCooLoo.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conVAVSou.conCooLoo.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,517)
DeclareVariable("conVAVSou.conCooLoo.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conVAVSou.conCooLoo.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conVAVSou.conCooLoo.addRes.y", 1, 5, 19177, 0)
DeclareAlias2("conVAVSou.conCooLoo.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conVAVSou.isNotUn.y", 1, 5, 19185, 65)
DeclareAlias2("conVAVSou.conCooLoo.I.y_reset_internal", "Internal connector for integrator reset",\
 "conVAVSou.conCooLoo.addRes.y", 1, 5, 19177, 1024)
DeclareAlias2("conVAVSou.conCooLoo.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conVAVSou.isNotUn.y", 1, 5, 19185, 1089)
DeclareAlias2("conVAVSou.conCooLoo.errI1.u1", "Connector of Real input signal 1",\
 "conVAVSou.conCooLoo.uS_revAct.y", 1, 5, 19161, 0)
DeclareAlias2("conVAVSou.conCooLoo.errI1.u2", "Connector of Real input signal 2",\
 "conVAVSou.conCooLoo.errP.u2", 1, 5, 19150, 0)
DeclareVariable("conVAVSou.conCooLoo.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conVAVSou.conCooLoo.errI2.u1", "Connector of Real input signal 1",\
 "conVAVSou.conCooLoo.errI1.y", 1, 5, 41821, 0)
DeclareAlias2("conVAVSou.conCooLoo.errI2.u2", "Connector of Real input signal 2",\
 "conVAVSou.conCooLoo.antWinGai.y", 1, 5, 19173, 0)
DeclareAlias2("conVAVSou.conCooLoo.errI2.y", "Connector of Real output signal", \
"conVAVSou.conCooLoo.I.u", 1, 5, 41816, 0)
DeclareVariable("conAHU.supFan.conSpe.I.u", "Connector of Real input signal", \
0.0, 0.0,0.0,0.0,0,512)
DeclareState("conAHU.supFan.conSpe.I.y", "Connector of Real output signal", 272,\
 0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conAHU.supFan.conSpe.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conAHU.supFan.conSpe.I.k", "Integrator gain [1]", 0.0, 0.0,0.0,\
0.0,0,513)
DeclareVariable("conAHU.supFan.conSpe.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conAHU.supFan.conSpe.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,517)
DeclareVariable("conAHU.supFan.conSpe.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conAHU.supFan.conSpe.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conAHU.supFan.conSpe.addRes.y", 1, 5, 20753, 0)
DeclareAlias2("conAHU.supFan.conSpe.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conAHU.supFan.staPreSetRes.tim.u", 1, 5, 20666, 65)
DeclareAlias2("conAHU.supFan.conSpe.I.y_reset_internal", "Internal connector for integrator reset",\
 "conAHU.supFan.conSpe.addRes.y", 1, 5, 20753, 1024)
DeclareAlias2("conAHU.supFan.conSpe.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conAHU.supFan.staPreSetRes.tim.u", 1, 5, 20666, 1089)
DeclareAlias2("conAHU.supFan.conSpe.errI1.u1", "Connector of Real input signal 1",\
 "conAHU.supFan.conSpe.uS_revAct.y", 1, 5, 20737, 0)
DeclareAlias2("conAHU.supFan.conSpe.errI1.u2", "Connector of Real input signal 2",\
 "conAHU.supFan.conSpe.errP.u2", 1, 5, 20726, 0)
DeclareVariable("conAHU.supFan.conSpe.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conAHU.supFan.conSpe.errI2.u1", "Connector of Real input signal 1",\
 "conAHU.supFan.conSpe.errI1.y", 1, 5, 41827, 0)
DeclareAlias2("conAHU.supFan.conSpe.errI2.u2", "Connector of Real input signal 2",\
 "conAHU.supFan.conSpe.antWinGai.y", 1, 5, 20749, 0)
DeclareAlias2("conAHU.supFan.conSpe.errI2.y", "Connector of Real output signal",\
 "conAHU.supFan.conSpe.I.u", 1, 5, 41822, 0)
DeclareVariable("conAHU.eco.damLim.damLimCon.I.u", "Connector of Real input signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareState("conAHU.eco.damLim.damLimCon.I.y", "Connector of Real output signal",\
 273, 0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conAHU.eco.damLim.damLimCon.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conAHU.eco.damLim.damLimCon.I.k", "Integrator gain [1]", \
0.0008333333333333334, 0.0,0.0,0.0,0,513)
DeclareVariable("conAHU.eco.damLim.damLimCon.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conAHU.eco.damLim.damLimCon.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,517)
DeclareVariable("conAHU.eco.damLim.damLimCon.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conAHU.eco.damLim.damLimCon.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conAHU.eco.damLim.damLimCon.addRes.y", 1, 5, 21096, 0)
DeclareAlias2("conAHU.eco.damLim.damLimCon.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conAHU.supFan.staPreSetRes.tim.u", 1, 5, 20666, 65)
DeclareAlias2("conAHU.eco.damLim.damLimCon.I.y_reset_internal", "Internal connector for integrator reset",\
 "conAHU.eco.damLim.damLimCon.addRes.y", 1, 5, 21096, 1024)
DeclareAlias2("conAHU.eco.damLim.damLimCon.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conAHU.supFan.staPreSetRes.tim.u", 1, 5, 20666, 1089)
DeclareAlias2("conAHU.eco.damLim.damLimCon.errI1.u1", "Connector of Real input signal 1",\
 "conAHU.eco.damLim.damLimCon.uS_revAct.y", 1, 5, 21080, 0)
DeclareAlias2("conAHU.eco.damLim.damLimCon.errI1.u2", "Connector of Real input signal 2",\
 "conAHU.eco.damLim.damLimCon.errP.u2", 1, 5, 21069, 0)
DeclareVariable("conAHU.eco.damLim.damLimCon.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conAHU.eco.damLim.damLimCon.errI2.u1", "Connector of Real input signal 1",\
 "conAHU.eco.damLim.damLimCon.errI1.y", 1, 5, 41833, 0)
DeclareAlias2("conAHU.eco.damLim.damLimCon.errI2.u2", "Connector of Real input signal 2",\
 "conAHU.eco.damLim.damLimCon.antWinGai.y", 1, 5, 21092, 0)
DeclareAlias2("conAHU.eco.damLim.damLimCon.errI2.y", "Connector of Real output signal",\
 "conAHU.eco.damLim.damLimCon.I.u", 1, 5, 41828, 0)
DeclareVariable("conAHU.eco.freProTMix.con.I.u", "Connector of Real input signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareState("conAHU.eco.freProTMix.con.I.y", "Connector of Real output signal",\
 274, 0.0, 0.0,0.0,0.0,0,544)
DeclareDerivative("conAHU.eco.freProTMix.con.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareVariable("conAHU.eco.freProTMix.con.I.k", "Integrator gain [1]", 0.0, \
0.0,0.0,0.0,0,513)
DeclareVariable("conAHU.eco.freProTMix.con.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareVariable("conAHU.eco.freProTMix.con.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 1, 1.0,3.0,0.0,0,517)
DeclareVariable("conAHU.eco.freProTMix.con.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("conAHU.eco.freProTMix.con.I.y_reset_internal", "Internal connector for integrator reset",\
 "conAHU.eco.freProTMix.con.I.y_reset", 1, 5, 41838, 1024)
DeclareVariable("conAHU.eco.freProTMix.con.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 false, 0.0,0.0,0.0,0,2563)
DeclareAlias2("conAHU.eco.freProTMix.con.errI1.u1", "Connector of Real input signal 1",\
 "conAHU.eco.freProTMix.con.uS_revAct.y", 1, 5, 21209, 0)
DeclareAlias2("conAHU.eco.freProTMix.con.errI1.u2", "Connector of Real input signal 2",\
 "conAHU.eco.freProTMix.con.errP.u2", 1, 5, 21198, 0)
DeclareVariable("conAHU.eco.freProTMix.con.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,512)
DeclareAlias2("conAHU.eco.freProTMix.con.errI2.u1", "Connector of Real input signal 1",\
 "conAHU.eco.freProTMix.con.errI1.y", 1, 5, 41840, 0)
DeclareAlias2("conAHU.eco.freProTMix.con.errI2.u2", "Connector of Real input signal 2",\
 "conAHU.eco.freProTMix.con.antWinGai.y", 1, 5, 21221, 0)
DeclareAlias2("conAHU.eco.freProTMix.con.errI2.y", "Connector of Real output signal",\
 "conAHU.eco.freProTMix.con.I.u", 1, 5, 41834, 0)
DeclareVariable("conAHU.val.conTSup.I.u", "Connector of Real input signal", 0.0,\
 0.0,0.0,0.0,0,2560)
DeclareState("conAHU.val.conTSup.I.y", "Connector of Real output signal", 275, \
0.0, 0.0,0.0,0.0,0,2592)
DeclareDerivative("conAHU.val.conTSup.I.der(y)", "der(Connector of Real output signal)",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareVariable("conAHU.val.conTSup.I.k", "Integrator gain [1]", 0.0, 0.0,0.0,\
0.0,0,2561)
DeclareVariable("conAHU.val.conTSup.I.y_start", "Initial or guess value of output (= state)",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareVariable("conAHU.val.conTSup.I.reset", "Type of integrator reset [:#(type=Buildings.Controls.OBC.CDL.Types.Reset)]",\
 3, 1.0,3.0,0.0,0,2565)
DeclareVariable("conAHU.val.conTSup.I.y_reset", "Value to which integrator is reset, used if reset = Types.Reset.Parameter",\
 0.0, 0.0,0.0,0.0,0,2561)
DeclareAlias2("conAHU.val.conTSup.I.y_reset_in", "Input signal for state to which integrator is reset, enabled if reset = Types.Reset.Input",\
 "conAHU.val.conTSup.errP.y", -1, 5, 21254, 1024)
DeclareAlias2("conAHU.val.conTSup.I.trigger", "Resets the integrator output when trigger becomes true [:#(type=Boolean)]",\
 "conAHU.supFan.staPreSetRes.tim.u", 1, 5, 20666, 1089)
DeclareAlias2("conAHU.val.conTSup.I.y_reset_internal", "Internal connector for integrator reset",\
 "conAHU.val.conTSup.errP.y", -1, 5, 21254, 1024)
DeclareAlias2("conAHU.val.conTSup.I.trigger_internal", "Needed to use conditional connector trigger [:#(type=Boolean)]",\
 "conAHU.supFan.staPreSetRes.tim.u", 1, 5, 20666, 1089)
DeclareAlias2("conAHU.val.conTSup.errI1.u1", "Connector of Real input signal 1",\
 "conAHU.TSupSet", -1, 5, 20633, 1024)
DeclareAlias2("conAHU.val.conTSup.errI1.u2", "Connector of Real input signal 2",\
 "TSup.T", -1, 1, 10, 1024)
DeclareVariable("conAHU.val.conTSup.errI1.y", "Connector of Real output signal",\
 0.0, 0.0,0.0,0.0,0,2560)
DeclareAlias2("conAHU.val.conTSup.errI2.u1", "Connector of Real input signal 1",\
 "conAHU.val.conTSup.errI1.y", 1, 5, 41846, 1024)
DeclareAlias2("conAHU.val.conTSup.errI2.u2", "Connector of Real input signal 2",\
 "conAHU.val.conTSup.antWinGai.y", 1, 5, 21275, 1024)
DeclareAlias2("conAHU.val.conTSup.errI2.y", "Connector of Real output signal", \
"conAHU.val.conTSup.I.u", 1, 5, 41841, 1024)
DeclareAlias2("amb.weaBus.TDryBul", "Needed to connect to conditional connector [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("amb.weaBus.relHum", "Relative humidity (0...1)", "weaBus.relHum", 1,\
 3, 15, 4)
DeclareAlias2("amb.weaBus.pAtm", "Needed to connect to conditional connector [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("weaDat.weaBus.TDryBul", "Dry bulb temperature [K|degC]", \
"weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("weaDat.weaBus.TDewPoi", "Dew point temperature [K|degC]", \
"weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("weaDat.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("weaDat.weaBus.relHum", "Relative humidity [1]", "weaBus.relHum", 1,\
 3, 15, 4)
DeclareAlias2("weaDat.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("weaDat.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("weaDat.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("weaDat.weaBus.TBlaSky", "Black-body sky temperature [K|degC]", \
"weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("weaDat.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]", \
"weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("weaDat.weaBus.winSpe", "Wind speed [m/s]", "weaBus.winSpe", 1, 3,\
 22, 4)
DeclareAlias2("weaDat.weaBus.winDir", "Wind direction [rad]", "weaBus.winDir", 1,\
 3, 21, 4)
DeclareAlias2("weaDat.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("weaDat.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1, 3, 13,\
 4)
DeclareAlias2("weaDat.weaBus.nOpa", "Opaque sky cover [1]", "weaBus.nOpa", 1, 3,\
 12, 4)
DeclareAlias2("weaDat.weaBus.cloTim", "Model time", "weaBus.cloTim", 1, 3, 9, 4)
DeclareAlias2("weaDat.weaBus.solTim", "Solar time [s|s]", "weaBus.solTim", 1, 3,\
 19, 4)
DeclareAlias2("weaDat.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("weaDat.weaBus.solZen", "Zenith angle [rad|deg]", "weaBus.solZen", 1,\
 3, 20, 4)
DeclareAlias2("weaDat.weaBus.solDec", "Solar declination angle [rad|deg]", \
"weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("weaDat.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareVariable("weaDat.weaBus.lon", "Longitude of the location [rad|deg]", \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareVariable("weaDat.weaBus.lat", "Latitude of the location [rad|deg]", \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareAlias2("weaDat.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.HDirNor", "Direct normal radiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.solZen", "Zenith angle of the sun beam [rad|degreeC]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.HGloHor", "Horizontal global solar radiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.HDifHor", "Horizontal diffuse solar radiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.TDryBul", "Connector of Real input signal",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.TBlaSky", "Black body sky temperature [K]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.winDir", "Connector of Real input signal",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.winSpe", "Connector of Real input signal",\
 "weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.HDirNor", "Direct normal radiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.solZen", "Zenith angle of the sun beam [rad|degreeC]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.HGloHor", "Horizontal global solar radiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.HDifHor", "Horizontal diffuse solar radiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.TDryBul", "Connector of Real input signal",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.TBlaSky", "Black body sky temperature [K]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.winDir", "Connector of Real input signal",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.winSpe", "Connector of Real input signal",\
 "weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.HDirNor", "Direct normal radiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.HDirNor", "Direct normal radiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.HDirNor", "Direct normal radiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.HDirNor", "Direct normal radiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.solZen", "Zenith angle of the sun beam [rad|degreeC]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.HGloHor", "Horizontal global solar radiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.HDifHor", "Horizontal diffuse solar radiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.solZen", "Zenith angle of the sun beam [rad|degreeC]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.HGloHor", "Horizontal global solar radiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.HDifHor", "Horizontal diffuse solar radiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.solZen", "Zenith angle of the sun beam [rad|degreeC]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.HGloHor", "Horizontal global solar radiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.HDifHor", "Horizontal diffuse solar radiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.solZen", "Zenith angle of the sun beam [rad|degreeC]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.HGloHor", "Horizontal global solar radiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.HDifHor", "Horizontal diffuse solar radiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.TDryBul", "Connector of Real input signal",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.TBlaSky", "Black body sky temperature [K]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.winDir", "Connector of Real input signal",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.winSpe", "Connector of Real input signal",\
 "weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.HDirNor", "Direct normal radiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.HDirNor", "Direct normal radiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.HDirNor", "Direct normal radiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.solZen", "Zenith angle of the sun beam [rad|degreeC]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.HGloHor", "Horizontal global solar radiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.HDifHor", "Horizontal diffuse solar radiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.solZen", "Zenith angle of the sun beam [rad|degreeC]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.HGloHor", "Horizontal global solar radiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.HDifHor", "Horizontal diffuse solar radiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.solZen", "Zenith angle of the sun beam [rad|degreeC]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.HGloHor", "Horizontal global solar radiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.HDifHor", "Horizontal diffuse solar radiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.TDryBul", "Connector of Real input signal",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.TBlaSky", "Black body sky temperature [K]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.winDir", "Connector of Real input signal",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.winSpe", "Connector of Real input signal",\
 "weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.HDirNor", "Direct normal radiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.cloTim", \
"Day number with units of seconds [s]", "weaBus.cloTim", 1, 3, 9, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.solTim", \
"Solar time [s]", "weaBus.solTim", 1, 3, 19, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.solZen", "Zenith angle of the sun beam [rad|degreeC]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.HGloHor", "Horizontal global solar radiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.HDifHor", "Horizontal diffuse solar radiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.TDryBul", "Connector of Real input signal",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.TBlaSky", "Black body sky temperature [K]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.winDir", "Connector of Real input signal",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.winSpe", "Connector of Real input signal",\
 "weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.TDryBul", "Needed to connect to conditional connector [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.relHum", "Relative humidity (0...1)", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.winDir", "Wind direction from weather bus [rad|deg]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.winSpe", "Wind speed from weather bus [m/s]",\
 "weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.pAtm", "Pressure from weather bus [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.TDryBul", "Needed to connect to conditional connector [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.relHum", "Relative humidity (0...1)", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.winDir", "Wind direction from weather bus [rad|deg]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.winSpe", "Wind speed from weather bus [m/s]",\
 "weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.pAtm", "Pressure from weather bus [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.TDryBul", "Needed to connect to conditional connector [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.relHum", "Relative humidity (0...1)", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.winDir", "Wind direction from weather bus [rad|deg]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.winSpe", "Wind speed from weather bus [m/s]",\
 "weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.pAtm", "Pressure from weather bus [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.out.weaBus.TDryBul", "Needed to connect to conditional connector [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.out.weaBus.relHum", "Relative humidity (0...1)", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.out.weaBus.pAtm", "Needed to connect to conditional connector [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareOutput("weaBus.TDryBul", "Connector of Real input signal", 0, 293.15, 0.0,\
1E+100,300.0,0,520)
DeclareAlias2("amb.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("amb.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]", \
"weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("amb.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("amb.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]", \
"weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("amb.weaBus.TBlaSky", "Black-body sky temperature [K|degC]", \
"weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("amb.weaBus.TDewPoi", "Dew point temperature [K|degC]", \
"weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("amb.weaBus.TWetBul", "Wet bulb temperature [K]", "weaBus.TWetBul", 1,\
 3, 7, 4)
DeclareAlias2("amb.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("amb.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("amb.weaBus.lat", "Latitude of the location [rad|deg]", \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("amb.weaBus.lon", "Longitude of the location [rad|deg]", \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("amb.weaBus.nOpa", "Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12,\
 4)
DeclareAlias2("amb.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1, 3, 13,\
 4)
DeclareAlias2("amb.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("amb.weaBus.solDec", "Solar declination angle [rad|deg]", \
"weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("amb.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("amb.weaBus.solTim", "Solar time [s|s]", "weaBus.solTim", 1, 3, 19,\
 4)
DeclareAlias2("amb.weaBus.solZen", "Zenith angle [rad|deg]", "weaBus.solZen", 1,\
 3, 20, 4)
DeclareAlias2("amb.weaBus.winDir", "Wind direction [rad]", "weaBus.winDir", 1, 3,\
 21, 4)
DeclareAlias2("amb.weaBus.winSpe", "Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22,\
 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.cor.bouConExt.HDifTil[1].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.cor.bouConExt.HDifTil[1].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.cor.bouConExt.HDifTil[1].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.cor.bouConExt.HDirTil[1].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.cor.bouConExt.HDirTil[1].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.solZen", "Zenith angle [rad|deg]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.cor.bouConExt.HDirTil[1].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.cor.bouConExt.weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.cor.bouConExt.weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.cor.bouConExt.weaBus.nOpa", "Opaque sky cover [1]", \
"weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.nTot", "Total sky cover [1]", \
"weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.relHum", "Relative humidity [1]", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.cor.bouConExt.weaBus.solZen", "Zenith angle [rad|deg]", \
"weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.cor.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.cor.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.cor.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.cor.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.cor.weaBus.TBlaSky", "Black-body sky temperature [K|degC]", \
"weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.cor.weaBus.TDewPoi", "Dew point temperature [K|degC]", \
"weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.cor.weaBus.TDryBul", "Dry bulb temperature [K|degC]", \
"weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.cor.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.cor.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.cor.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1, 3, 9,\
 4)
DeclareVariable("flo.cor.weaBus.lat", "Latitude of the location [rad|deg]", \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.cor.weaBus.lon", "Longitude of the location [rad|deg]", \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.cor.weaBus.nOpa", "Opaque sky cover [1]", "weaBus.nOpa", 1, 3,\
 12, 4)
DeclareAlias2("flo.cor.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1, 3,\
 13, 4)
DeclareAlias2("flo.cor.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.cor.weaBus.relHum", "Relative humidity [1]", "weaBus.relHum", 1,\
 3, 15, 4)
DeclareAlias2("flo.cor.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.cor.weaBus.solDec", "Solar declination angle [rad|deg]", \
"weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.cor.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.cor.weaBus.solTim", "Solar time [s|s]", "weaBus.solTim", 1, 3,\
 19, 4)
DeclareAlias2("flo.cor.weaBus.solZen", "Zenith angle [rad|deg]", "weaBus.solZen", 1,\
 3, 20, 4)
DeclareAlias2("flo.cor.weaBus.winDir", "Wind direction [rad]", "weaBus.winDir", 1,\
 3, 21, 4)
DeclareAlias2("flo.cor.weaBus.winSpe", "Wind speed [m/s]", "weaBus.winSpe", 1, 3,\
 22, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1,\
 3, 9, 4)
DeclareVariable("flo.leaNor.amb.weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.leaNor.amb.weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.leaNor.amb.weaBus.nOpa", "Opaque sky cover [1]", \
"weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1,\
 3, 13, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.leaNor.amb.weaBus.solZen", "Zenith angle [rad|deg]", \
"weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.leaNor.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.leaNor.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.leaNor.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.leaNor.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.leaNor.weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.leaNor.weaBus.TDewPoi", "Dew point temperature [K|degC]", \
"weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.leaNor.weaBus.TDryBul", "Dry bulb temperature [K|degC]", \
"weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.leaNor.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.leaNor.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.leaNor.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1, 3,\
 9, 4)
DeclareVariable("flo.leaNor.weaBus.lat", "Latitude of the location [rad|deg]", \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.leaNor.weaBus.lon", "Longitude of the location [rad|deg]", \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.leaNor.weaBus.nOpa", "Opaque sky cover [1]", "weaBus.nOpa", 1,\
 3, 12, 4)
DeclareAlias2("flo.leaNor.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1,\
 3, 13, 4)
DeclareAlias2("flo.leaNor.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.leaNor.weaBus.relHum", "Relative humidity [1]", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.leaNor.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.leaNor.weaBus.solDec", "Solar declination angle [rad|deg]", \
"weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.leaNor.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.leaNor.weaBus.solTim", "Solar time [s|s]", "weaBus.solTim", 1,\
 3, 19, 4)
DeclareAlias2("flo.leaNor.weaBus.solZen", "Zenith angle [rad|deg]", \
"weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.leaNor.weaBus.winDir", "Wind direction [rad]", \
"weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.leaNor.weaBus.winSpe", "Wind speed [m/s]", "weaBus.winSpe", 1,\
 3, 22, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1,\
 3, 9, 4)
DeclareVariable("flo.leaPle.amb.weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.leaPle.amb.weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.leaPle.amb.weaBus.nOpa", "Opaque sky cover [1]", \
"weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1,\
 3, 13, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.leaPle.amb.weaBus.solZen", "Zenith angle [rad|deg]", \
"weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.leaPle.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.leaPle.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.leaPle.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.leaPle.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.leaPle.weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.leaPle.weaBus.TDewPoi", "Dew point temperature [K|degC]", \
"weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.leaPle.weaBus.TDryBul", "Dry bulb temperature [K|degC]", \
"weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.leaPle.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.leaPle.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.leaPle.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1, 3,\
 9, 4)
DeclareVariable("flo.leaPle.weaBus.lat", "Latitude of the location [rad|deg]", \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.leaPle.weaBus.lon", "Longitude of the location [rad|deg]", \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.leaPle.weaBus.nOpa", "Opaque sky cover [1]", "weaBus.nOpa", 1,\
 3, 12, 4)
DeclareAlias2("flo.leaPle.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1,\
 3, 13, 4)
DeclareAlias2("flo.leaPle.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.leaPle.weaBus.relHum", "Relative humidity [1]", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.leaPle.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.leaPle.weaBus.solDec", "Solar declination angle [rad|deg]", \
"weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.leaPle.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.leaPle.weaBus.solTim", "Solar time [s|s]", "weaBus.solTim", 1,\
 3, 19, 4)
DeclareAlias2("flo.leaPle.weaBus.solZen", "Zenith angle [rad|deg]", \
"weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.leaPle.weaBus.winDir", "Wind direction [rad]", \
"weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.leaPle.weaBus.winSpe", "Wind speed [m/s]", "weaBus.winSpe", 1,\
 3, 22, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1,\
 3, 9, 4)
DeclareVariable("flo.leaSou.amb.weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.leaSou.amb.weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.leaSou.amb.weaBus.nOpa", "Opaque sky cover [1]", \
"weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1,\
 3, 13, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.leaSou.amb.weaBus.solZen", "Zenith angle [rad|deg]", \
"weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.leaSou.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.leaSou.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.leaSou.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.leaSou.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.leaSou.weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.leaSou.weaBus.TDewPoi", "Dew point temperature [K|degC]", \
"weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.leaSou.weaBus.TDryBul", "Dry bulb temperature [K|degC]", \
"weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.leaSou.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.leaSou.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.leaSou.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1, 3,\
 9, 4)
DeclareVariable("flo.leaSou.weaBus.lat", "Latitude of the location [rad|deg]", \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.leaSou.weaBus.lon", "Longitude of the location [rad|deg]", \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.leaSou.weaBus.nOpa", "Opaque sky cover [1]", "weaBus.nOpa", 1,\
 3, 12, 4)
DeclareAlias2("flo.leaSou.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1,\
 3, 13, 4)
DeclareAlias2("flo.leaSou.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.leaSou.weaBus.relHum", "Relative humidity [1]", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.leaSou.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.leaSou.weaBus.solDec", "Solar declination angle [rad|deg]", \
"weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.leaSou.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.leaSou.weaBus.solTim", "Solar time [s|s]", "weaBus.solTim", 1,\
 3, 19, 4)
DeclareAlias2("flo.leaSou.weaBus.solZen", "Zenith angle [rad|deg]", \
"weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.leaSou.weaBus.winDir", "Wind direction [rad]", \
"weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.leaSou.weaBus.winSpe", "Wind speed [m/s]", "weaBus.winSpe", 1,\
 3, 22, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.nor.bouConExt.HDifTil[1].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.nor.bouConExt.HDifTil[1].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[1].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.nor.bouConExt.HDifTil[2].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.nor.bouConExt.HDifTil[2].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[2].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.nor.bouConExt.HDifTil[3].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.nor.bouConExt.HDifTil[3].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.nor.bouConExt.HDifTil[3].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.nor.bouConExt.HDirTil[1].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.nor.bouConExt.HDirTil[1].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.solZen", "Zenith angle [rad|deg]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[1].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.nor.bouConExt.HDirTil[2].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.nor.bouConExt.HDirTil[2].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.solZen", "Zenith angle [rad|deg]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[2].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.nor.bouConExt.HDirTil[3].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.nor.bouConExt.HDirTil[3].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.solZen", "Zenith angle [rad|deg]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.nor.bouConExt.HDirTil[3].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.nor.bouConExt.weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.nor.bouConExt.weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.nor.bouConExt.weaBus.nOpa", "Opaque sky cover [1]", \
"weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.nTot", "Total sky cover [1]", \
"weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.relHum", "Relative humidity [1]", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.nor.bouConExt.weaBus.solZen", "Zenith angle [rad|deg]", \
"weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.nor.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.nor.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.nor.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.nor.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.nor.weaBus.TBlaSky", "Black-body sky temperature [K|degC]", \
"weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.nor.weaBus.TDewPoi", "Dew point temperature [K|degC]", \
"weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.nor.weaBus.TDryBul", "Dry bulb temperature [K|degC]", \
"weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.nor.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.nor.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.nor.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1, 3, 9,\
 4)
DeclareVariable("flo.nor.weaBus.lat", "Latitude of the location [rad|deg]", \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.nor.weaBus.lon", "Longitude of the location [rad|deg]", \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.nor.weaBus.nOpa", "Opaque sky cover [1]", "weaBus.nOpa", 1, 3,\
 12, 4)
DeclareAlias2("flo.nor.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1, 3,\
 13, 4)
DeclareAlias2("flo.nor.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.nor.weaBus.relHum", "Relative humidity [1]", "weaBus.relHum", 1,\
 3, 15, 4)
DeclareAlias2("flo.nor.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.nor.weaBus.solDec", "Solar declination angle [rad|deg]", \
"weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.nor.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.nor.weaBus.solTim", "Solar time [s|s]", "weaBus.solTim", 1, 3,\
 19, 4)
DeclareAlias2("flo.nor.weaBus.solZen", "Zenith angle [rad|deg]", "weaBus.solZen", 1,\
 3, 20, 4)
DeclareAlias2("flo.nor.weaBus.winDir", "Wind direction [rad]", "weaBus.winDir", 1,\
 3, 21, 4)
DeclareAlias2("flo.nor.weaBus.winSpe", "Wind speed [m/s]", "weaBus.winSpe", 1, 3,\
 22, 4)
DeclareAlias2("flo.out.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.out.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.out.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.out.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.out.weaBus.TBlaSky", "Black-body sky temperature [K|degC]", \
"weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.out.weaBus.TDewPoi", "Dew point temperature [K|degC]", \
"weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.out.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.out.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.out.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1, 3, 9,\
 4)
DeclareVariable("flo.out.weaBus.lat", "Latitude of the location [rad|deg]", \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.out.weaBus.lon", "Longitude of the location [rad|deg]", \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.out.weaBus.nOpa", "Opaque sky cover [1]", "weaBus.nOpa", 1, 3,\
 12, 4)
DeclareAlias2("flo.out.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1, 3,\
 13, 4)
DeclareAlias2("flo.out.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.out.weaBus.solDec", "Solar declination angle [rad|deg]", \
"weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.out.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.out.weaBus.solTim", "Solar time [s|s]", "weaBus.solTim", 1, 3,\
 19, 4)
DeclareAlias2("flo.out.weaBus.solZen", "Zenith angle [rad|deg]", "weaBus.solZen", 1,\
 3, 20, 4)
DeclareAlias2("flo.out.weaBus.winDir", "Wind direction [rad]", "weaBus.winDir", 1,\
 3, 21, 4)
DeclareAlias2("flo.out.weaBus.winSpe", "Wind speed [m/s]", "weaBus.winSpe", 1, 3,\
 22, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.ple.bouConExt.HDifTil[1].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.ple.bouConExt.HDifTil[1].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[1].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
EndNonAlias(31)
PreNonAliasNew(32)
StartNonAlias(32)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.ple.bouConExt.HDifTil[2].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.ple.bouConExt.HDifTil[2].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[2].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.ple.bouConExt.HDifTil[3].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.ple.bouConExt.HDifTil[3].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[3].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.ple.bouConExt.HDifTil[4].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.ple.bouConExt.HDifTil[4].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.ple.bouConExt.HDifTil[4].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.ple.bouConExt.HDirTil[1].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.ple.bouConExt.HDirTil[1].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.solZen", "Zenith angle [rad|deg]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[1].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.ple.bouConExt.HDirTil[2].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.ple.bouConExt.HDirTil[2].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.solZen", "Zenith angle [rad|deg]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[2].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.ple.bouConExt.HDirTil[3].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.ple.bouConExt.HDirTil[3].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.solZen", "Zenith angle [rad|deg]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[3].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.ple.bouConExt.HDirTil[4].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.ple.bouConExt.HDirTil[4].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.solZen", "Zenith angle [rad|deg]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.ple.bouConExt.HDirTil[4].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.ple.bouConExt.weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.ple.bouConExt.weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.ple.bouConExt.weaBus.nOpa", "Opaque sky cover [1]", \
"weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.nTot", "Total sky cover [1]", \
"weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.relHum", "Relative humidity [1]", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.ple.bouConExt.weaBus.solZen", "Zenith angle [rad|deg]", \
"weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.ple.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.ple.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.ple.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.ple.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.ple.weaBus.TBlaSky", "Black-body sky temperature [K|degC]", \
"weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.ple.weaBus.TDewPoi", "Dew point temperature [K|degC]", \
"weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.ple.weaBus.TDryBul", "Dry bulb temperature [K|degC]", \
"weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.ple.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.ple.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.ple.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1, 3, 9,\
 4)
DeclareVariable("flo.ple.weaBus.lat", "Latitude of the location [rad|deg]", \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.ple.weaBus.lon", "Longitude of the location [rad|deg]", \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.ple.weaBus.nOpa", "Opaque sky cover [1]", "weaBus.nOpa", 1, 3,\
 12, 4)
DeclareAlias2("flo.ple.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1, 3,\
 13, 4)
DeclareAlias2("flo.ple.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.ple.weaBus.relHum", "Relative humidity [1]", "weaBus.relHum", 1,\
 3, 15, 4)
DeclareAlias2("flo.ple.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.ple.weaBus.solDec", "Solar declination angle [rad|deg]", \
"weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.ple.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.ple.weaBus.solTim", "Solar time [s|s]", "weaBus.solTim", 1, 3,\
 19, 4)
DeclareAlias2("flo.ple.weaBus.solZen", "Zenith angle [rad|deg]", "weaBus.solZen", 1,\
 3, 20, 4)
DeclareAlias2("flo.ple.weaBus.winDir", "Wind direction [rad]", "weaBus.winDir", 1,\
 3, 21, 4)
DeclareAlias2("flo.ple.weaBus.winSpe", "Wind speed [m/s]", "weaBus.winSpe", 1, 3,\
 22, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.sou.bouConExt.HDifTil[1].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.sou.bouConExt.HDifTil[1].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.sou.bouConExt.HDifTil[1].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.sou.bouConExt.HDirTil[1].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.sou.bouConExt.HDirTil[1].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.solZen", "Zenith angle [rad|deg]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.sou.bouConExt.HDirTil[1].weaBus.winSpe", "Wind speed [m/s]", \
"weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.sou.bouConExt.weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.sou.bouConExt.weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.sou.bouConExt.weaBus.nOpa", "Opaque sky cover [1]", \
"weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.nTot", "Total sky cover [1]", \
"weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.relHum", "Relative humidity [1]", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.sou.bouConExt.weaBus.solZen", "Zenith angle [rad|deg]", \
"weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.cloTim", "Model time [s]",\
 "weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.sou.bouConExtWin.HDifTil[1].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.sou.bouConExtWin.HDifTil[1].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.solTim", "Solar time [s|s]",\
 "weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDifTil[1].weaBus.winSpe", "Wind speed [m/s]",\
 "weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.HDifHor", \
"Diffuse horizontal solar irradiation [W/m2]", "weaBus.HDifHor", 1, 3, 1, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.HDirNor", \
"Direct normal solar irradiation [W/m2]", "weaBus.HDirNor", 1, 3, 2, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.HGloHor", \
"Global horizontal solar irradiation [W/m2]", "weaBus.HGloHor", 1, 3, 3, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.HHorIR", \
"Horizontal infrared irradiation [W/m2]", "weaBus.HHorIR", 1, 3, 4, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.TBlaSky", \
"Black-body sky temperature [K|degC]", "weaBus.TBlaSky", 1, 3, 5, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.TDewPoi", \
"Dew point temperature [K|degC]", "weaBus.TDewPoi", 1, 3, 6, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.TDryBul", \
"Dry bulb temperature [K|degC]", "weaBus.TDryBul", 1, 3, 0, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "weaBus.TWetBul", 1, 3, 7, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.ceiHei", \
"Cloud cover ceiling height [m]", "weaBus.ceiHei", 1, 3, 8, 1028)
DeclareVariable("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.lat", \
"Latitude of the location [rad|deg]", 0.6579891280018623, 0.0,0.0,0.0,0,2569)
DeclareVariable("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.lon", \
"Longitude of the location [rad|deg]", -2.1327923459370703, 0.0,0.0,0.0,0,2569)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.nOpa", \
"Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.nTot", \
"Total sky cover [1]", "weaBus.nTot", 1, 3, 13, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1, 5, 3173, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "weaBus.relHum", 1, 3, 15, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.solAlt", \
"Solar altitude angle [rad|deg]", "weaBus.solAlt", 1, 3, 16, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.solDec", \
"Solar declination angle [rad|deg]", "weaBus.solDec", 1, 3, 17, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "weaBus.solZen", 1, 3, 20, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.winDir", \
"Wind direction [rad]", "weaBus.winDir", 1, 3, 21, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22, 1028)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.TBlaSky", "Black-body sky temperature [K|degC]",\
 "weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.TDryBul", "Dry bulb temperature [K|degC]",\
 "weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.cloTim", "Model time [s]",\
 "weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.sou.bouConExtWin.HDirTil[1].weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.sou.bouConExtWin.HDirTil[1].weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.nOpa", "Opaque sky cover [1]",\
 "weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.nTot", "Total sky cover [1]",\
 "weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.relHum", "Relative humidity [1]",\
 "weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.solTim", "Solar time [s|s]",\
 "weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.solZen", "Zenith angle [rad|deg]",\
 "weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.winDir", "Wind direction [rad]",\
 "weaBus.winDir", 1, 3, 21, 4)
DeclareAlias2("flo.sou.bouConExtWin.HDirTil[1].weaBus.winSpe", "Wind speed [m/s]",\
 "weaBus.winSpe", 1, 3, 22, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.TDewPoi", "Dew point temperature [K|degC]",\
 "weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.TWetBul", "Wet bulb temperature [K]",\
 "weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.ceiHei", "Cloud cover ceiling height [m]",\
 "weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.cloTim", "Model time [s]", \
"weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.sou.bouConExtWin.weaBus.lat", "Latitude of the location [rad|deg]",\
 0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.sou.bouConExtWin.weaBus.lon", "Longitude of the location [rad|deg]",\
 -2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.nOpa", "Opaque sky cover [1]", \
"weaBus.nOpa", 1, 3, 12, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.nTot", "Total sky cover [1]", \
"weaBus.nTot", 1, 3, 13, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.relHum", "Relative humidity [1]", \
"weaBus.relHum", 1, 3, 15, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.solAlt", "Solar altitude angle [rad|deg]",\
 "weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.solDec", "Solar declination angle [rad|deg]",\
 "weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.solTim", "Solar time [s|s]", \
"weaBus.solTim", 1, 3, 19, 4)
DeclareAlias2("flo.sou.bouConExtWin.weaBus.solZen", "Zenith angle [rad|deg]", \
"weaBus.solZen", 1, 3, 20, 4)
DeclareAlias2("flo.sou.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.sou.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]",\
 "weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.sou.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.sou.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]",\
 "weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.sou.weaBus.TBlaSky", "Black-body sky temperature [K|degC]", \
"weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.sou.weaBus.TDewPoi", "Dew point temperature [K|degC]", \
"weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.sou.weaBus.TDryBul", "Dry bulb temperature [K|degC]", \
"weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.sou.weaBus.TWetBul", "Wet bulb temperature [K]", \
"weaBus.TWetBul", 1, 3, 7, 4)
DeclareAlias2("flo.sou.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.sou.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1, 3, 9,\
 4)
DeclareVariable("flo.sou.weaBus.lat", "Latitude of the location [rad|deg]", \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.sou.weaBus.lon", "Longitude of the location [rad|deg]", \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.sou.weaBus.nOpa", "Opaque sky cover [1]", "weaBus.nOpa", 1, 3,\
 12, 4)
DeclareAlias2("flo.sou.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1, 3,\
 13, 4)
DeclareAlias2("flo.sou.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtmSel.p", 1, 5, 3173, 4)
DeclareAlias2("flo.sou.weaBus.relHum", "Relative humidity [1]", "weaBus.relHum", 1,\
 3, 15, 4)
DeclareAlias2("flo.sou.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.sou.weaBus.solDec", "Solar declination angle [rad|deg]", \
"weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.sou.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.sou.weaBus.solTim", "Solar time [s|s]", "weaBus.solTim", 1, 3,\
 19, 4)
DeclareAlias2("flo.sou.weaBus.solZen", "Zenith angle [rad|deg]", "weaBus.solZen", 1,\
 3, 20, 4)
DeclareAlias2("flo.sou.weaBus.winDir", "Wind direction [rad]", "weaBus.winDir", 1,\
 3, 21, 4)
DeclareAlias2("flo.sou.weaBus.winSpe", "Wind speed [m/s]", "weaBus.winSpe", 1, 3,\
 22, 4)
DeclareAlias2("flo.weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]",\
 "weaBus.HDifHor", 1, 3, 1, 4)
DeclareAlias2("flo.weaBus.HDirNor", "Direct normal solar irradiation [W/m2]", \
"weaBus.HDirNor", 1, 3, 2, 4)
DeclareAlias2("flo.weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]",\
 "weaBus.HGloHor", 1, 3, 3, 4)
DeclareAlias2("flo.weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]", \
"weaBus.HHorIR", 1, 3, 4, 4)
DeclareAlias2("flo.weaBus.TBlaSky", "Black-body sky temperature [K|degC]", \
"weaBus.TBlaSky", 1, 3, 5, 4)
DeclareAlias2("flo.weaBus.TDewPoi", "Dew point temperature [K|degC]", \
"weaBus.TDewPoi", 1, 3, 6, 4)
DeclareAlias2("flo.weaBus.TDryBul", "Dry bulb temperature [K|degC]", \
"weaBus.TDryBul", 1, 3, 0, 4)
DeclareAlias2("flo.weaBus.TWetBul", "Wet bulb temperature [K]", "weaBus.TWetBul", 1,\
 3, 7, 4)
DeclareAlias2("flo.weaBus.ceiHei", "Cloud cover ceiling height [m]", \
"weaBus.ceiHei", 1, 3, 8, 4)
DeclareAlias2("flo.weaBus.cloTim", "Model time [s]", "weaBus.cloTim", 1, 3, 9, 4)
DeclareVariable("flo.weaBus.lat", "Latitude of the location [rad|deg]", \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareVariable("flo.weaBus.lon", "Longitude of the location [rad|deg]", \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareAlias2("flo.weaBus.nOpa", "Opaque sky cover [1]", "weaBus.nOpa", 1, 3, 12,\
 4)
DeclareAlias2("flo.weaBus.nTot", "Total sky cover [1]", "weaBus.nTot", 1, 3, 13,\
 4)
DeclareAlias2("flo.weaBus.pAtm", "Atmospheric pressure [Pa]", "weaDat.pAtmSel.p", 1,\
 5, 3173, 4)
DeclareAlias2("flo.weaBus.relHum", "Relative humidity [1]", "weaBus.relHum", 1, 3,\
 15, 4)
DeclareAlias2("flo.weaBus.solAlt", "Solar altitude angle [rad|deg]", \
"weaBus.solAlt", 1, 3, 16, 4)
DeclareAlias2("flo.weaBus.solDec", "Solar declination angle [rad|deg]", \
"weaBus.solDec", 1, 3, 17, 4)
DeclareAlias2("flo.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"weaBus.solHouAng", 1, 3, 18, 4)
DeclareAlias2("flo.weaBus.solTim", "Solar time [s|s]", "weaBus.solTim", 1, 3, 19,\
 4)
DeclareAlias2("flo.weaBus.solZen", "Zenith angle [rad|deg]", "weaBus.solZen", 1,\
 3, 20, 4)
DeclareAlias2("flo.weaBus.winDir", "Wind direction [rad]", "weaBus.winDir", 1, 3,\
 21, 4)
DeclareAlias2("flo.weaBus.winSpe", "Wind speed [m/s]", "weaBus.winSpe", 1, 3, 22,\
 4)
DeclareOutput("weaBus.HDifHor", "Diffuse horizontal solar irradiation [W/m2]", 1,\
 0.0, 0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.HDirNor", "Direct normal solar irradiation [W/m2]", 2, 0.0,\
 0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.HGloHor", "Global horizontal solar irradiation [W/m2]", 3,\
 0.0, 0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.HHorIR", "Horizontal infrared irradiation [W/m2]", 4, 0.0,\
 0.0,1E+100,100.0,0,520)
DeclareOutput("weaBus.TBlaSky", "Black-body sky temperature [K|degC]", 5, 0.0, \
0.0,1E+100,0.0,0,520)
DeclareOutput("weaBus.TDewPoi", "Dew point temperature [K|degC]", 6, 0.0, \
0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.TWetBul", "Wet bulb temperature [K]", 7, 291.15, 0.0,\
1E+100,0.0,0,584)
DeclareOutput("weaBus.ceiHei", "Cloud cover ceiling height [m]", 8, 0.0, \
0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.cloTim", "Model time [s]", 9, 0.0, 0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.lat", "Latitude of the location [rad|deg]", 10, \
0.6579891280018623, 0.0,0.0,0.0,0,521)
DeclareOutput("weaBus.lon", "Longitude of the location [rad|deg]", 11, \
-2.1327923459370703, 0.0,0.0,0.0,0,521)
DeclareOutput("weaBus.nOpa", "Opaque sky cover [1]", 12, 0.0, 0.0,1.0,0.0,0,520)
DeclareOutput("weaBus.nTot", "Total sky cover [1]", 13, 0.0, 0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.pAtm", "Atmospheric pressure [Pa]", 14, 0.0, 0.0,0.0,0.0,0,521)
DeclareOutput("weaBus.relHum", "Relative humidity [1]", 15, 0.0, 0.0,1.0,0.0,0,520)
DeclareOutput("weaBus.solAlt", "Solar altitude angle [rad|deg]", 16, 0.0, \
0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.solDec", "Solar declination angle [rad|deg]", 17, 0.0, \
0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.solHouAng", "Solar hour angle [rad|deg]", 18, 0.0, \
0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.solTim", "Solar time [s|s]", 19, 0.0, 0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.solZen", "Zenith angle [rad|deg]", 20, 0.0, 0.0,0.0,0.0,0,520)
DeclareOutput("weaBus.winDir", "Wind direction [rad]", 21, 0.0, 0.0,\
6.283185307179586,0.0,0,520)
DeclareOutput("weaBus.winSpe", "Wind speed [m/s]", 22, 0.0, 0.0,0.0,0.0,0,520)
EndNonAlias(32)
PreNonAliasNew(33)
