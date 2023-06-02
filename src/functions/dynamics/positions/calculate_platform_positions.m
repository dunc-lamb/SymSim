function out1 = calculate_platform_positions(L_x,L_z,theta,x1,z1)
%CALCULATE_PLATFORM_POSITIONS
%    OUT1 = CALCULATE_PLATFORM_POSITIONS(L_x,L_z,THETA,X1,Z1)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    07-Feb-2023 17:11:04

t2 = cos(theta);
t3 = sin(theta);
t4 = L_x.*t2;
t5 = L_z.*t2;
t6 = L_x.*t3;
t7 = L_z.*t3;
t8 = -t4;
t9 = -t6;
t10 = -t7;
t11 = t5+t9+z1;
t12 = t8+t10+x1;
out1 = [t12,t4.*2.0+t10+x1,t12,t11,t5+t6.*2.0+z1,t11];