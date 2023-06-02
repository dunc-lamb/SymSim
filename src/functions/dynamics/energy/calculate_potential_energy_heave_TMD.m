function U = calculate_potential_energy_heave_TMD(K33,L2,L3,L4,L2_0,L3_0,L4_0,k2,k3,k4,z1)
%calculate_potential_energy_heave_TMD
%    U = calculate_potential_energy_heave_TMD(K33,L2,L3,L4,L2_0,L3_0,L4_0,K2,K3,K4,Z1)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    01-Feb-2023 15:09:10

U = (k2.*(L2-L2_0).^2)./2.0+(k3.*(L3-L3_0).^2)./2.0+(k4.*(L4-L4_0).^2)./2.0+(K33.*z1.^2)./2.0;
