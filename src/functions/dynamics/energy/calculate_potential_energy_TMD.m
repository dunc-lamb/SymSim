function U = calculate_potential_energy_TMD(L2,L3,L4,L2_0,L3_0,L4_0,k2,k3,k4)
%calculate_potential_energy_TMD
%    U = calculate_potential_energy_TMD(L2,L3,L4,L2_0,L3_0,L4_0,K2,K3,K4)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    07-Feb-2023 17:10:31

U = (k2.*(L2-L2_0).^2)./2.0+(k3.*(L3-L3_0).^2)./2.0+(k4.*(L4-L4_0).^2)./2.0;