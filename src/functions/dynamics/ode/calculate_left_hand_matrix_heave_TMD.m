function left_hand_matrix = calculate_left_hand_matrix_heave_TMD(A33,m1,m2,m3,m4)
%calculate_left_hand_matrix_heave_TMD
%    LEFT_HAND_MATRIX = calculate_left_hand_matrix_heave_TMD(A33,M1,M2,M3,M4)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    01-Feb-2023 15:09:06

t2 = -m2;
t3 = -m3;
t4 = -m4;
left_hand_matrix = reshape([A33+m1+m2+m3+m4,t2,t3,t4,t2,m2,0.0,0.0,t3,0.0,m3,0.0,t4,0.0,0.0,m4],[4,4]);