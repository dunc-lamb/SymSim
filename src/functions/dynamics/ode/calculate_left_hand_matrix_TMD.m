function left_hand_matrix = calculate_left_hand_matrix_TMD(A11,A13,A15,A31,A33,A35,A51,A53,A55,J1,J2,J3,J4,L2,L3,L4,L_x,L_z,m1,m2,m3,m4,theta)
%calculate_left_hand_matrix_TMD
%    LEFT_HAND_MATRIX = calculate_left_hand_matrix_TMD(A11,A13,A15,A31,A33,A35,A51,A53,A55,J1,J2,J3,J4,L2,L3,L4,L_x,L_z,M1,M2,M3,M4,THETA)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    07-Feb-2023 17:10:26

t2 = cos(theta);
t3 = sin(theta);
t4 = t2.^2;
t5 = t3.^2;
t6 = L2.*t2;
t7 = L3.*t2;
t8 = L4.*t2;
t9 = L_x.*t2;
t10 = L_z.*t2;
t11 = L2.*t3;
t12 = L3.*t3;
t13 = L4.*t3;
t14 = L_x.*t3;
t15 = L_z.*t3;
t16 = m2.*t2;
t17 = m3.*t2;
t18 = m4.*t2;
t19 = m2.*t3;
t20 = m3.*t3;
t21 = m4.*t3;
t22 = t9.*2.0;
t23 = t10.*2.0;
t24 = t14.*2.0;
t25 = t15.*2.0;
t26 = -t7;
t27 = -t10;
t29 = -t11;
t30 = -t13;
t31 = -t15;
t32 = -t16;
t33 = -t17;
t34 = -t18;
t28 = -t23;
t35 = t9+t15+t29;
t36 = t9+t15+t30;
t37 = t6+t14+t27;
t38 = t8+t14+t27;
t39 = t12+t22+t31;
t40 = t10+t24+t26;
t41 = t16.*t35;
t42 = t19.*t37;
t43 = t18.*t36;
t44 = t21.*t38;
t45 = t17.*t39;
t46 = t20.*t40;
t47 = t33.*t39;
t48 = -t46;
t49 = t41+t42;
t50 = t43+t44;
t51 = t47+t48;
mt1 = [A11+m1+m2+m3+m4,A31,A51+m2.*t37+m4.*t38-m3.*t40,t19,t20,t21,A13,A33+m1+m2+m3+m4,A53-m2.*t35-m4.*t36+m3.*t39,t32,t33,t34,A15-(m3.*(t7.*-2.0+t14.*4.0+t23))./2.0+(m2.*(t6.*2.0+t24+t28))./2.0+(m4.*(t8.*2.0+t24+t28))./2.0,A35+(m3.*(t9.*4.0+t12.*2.0-t25))./2.0-(m2.*(t11.*-2.0+t22+t25))./2.0-(m4.*(t13.*-2.0+t22+t25))./2.0,A55+J1+J2+J3+J4+m2.*t35.^2+m2.*t37.^2+m4.*t36.^2+m3.*t39.^2+m4.*t38.^2+m3.*t40.^2,t49,t51,t50,t19,t32,t49,m2.*t4+m2.*t5,0.0,0.0,t20,t33,t51,0.0,m3.*t4+m3.*t5,0.0,t21,t34,t50,0.0,0.0];
mt2 = [m4.*t4+m4.*t5];
left_hand_matrix = reshape([mt1,mt2],6,6);
