function out1 = calculate_mass_positions(L2,L3,L4,L_x,L_z,theta,x1,z1)
%CALCULATE_MASS_POSITIONS
%    OUT1 = CALCULATE_MASS_POSITIONS(L2,L3,L4,L_x,L_z,THETA,X1,Z1)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    07-Feb-2023 17:11:05

t2 = cos(theta);
t3 = sin(theta);
t4 = L_x.*t2;
t5 = L_z.*t2;
t6 = L_x.*t3;
t7 = L_z.*t3;
t8 = -t4;
t9 = -t6;
t10 = -t7;
out1 = [t8+t10+x1+L2.*t3,t4.*2.0+t10+x1+L3.*t3,t8+t10+x1+L4.*t3,t5+t9+z1-L2.*t2,t5+t6.*2.0+z1-L3.*t2,t5+t9+z1-L4.*t2];
