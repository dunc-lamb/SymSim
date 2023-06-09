function right_hand_vector = calculate_right_hand_vector_heave_TMD(C33,K33,L2,L3,L4,L2_0,L3_0,L4_0,L2_dot,L3_dot,L4_dot,c2,c3,c4,k2,k3,k4,z1,z1_dot)
%calculate_right_hand_vector_heave_TMD
%    RIGHT_HAND_VECTOR = calculate_right_hand_vector_heave_TMD(C33,K33,L2,L3,L4,L2_0,L3_0,L4_0,L2_dot,L3_dot,L4_dot,C2,C3,C4,K2,K3,K4,Z1,Z1_DOT)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    01-Feb-2023 15:09:07

right_hand_vector = [-C33.*z1_dot-K33.*z1;-L2_dot.*c2-(k2.*(L2.*2.0-L2_0.*2.0))./2.0;-L3_dot.*c3-(k3.*(L3.*2.0-L3_0.*2.0))./2.0;-L4_dot.*c4-(k4.*(L4.*2.0-L4_0.*2.0))./2.0];
