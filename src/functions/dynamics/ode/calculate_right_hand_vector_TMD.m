function right_hand_vector = calculate_right_hand_vector_TMD(L2,L3,L4,L2_0,L3_0,L4_0,L2_dot,L3_dot,L4_dot,L_x,L_z,c2,c3,c4,k2,k3,k4,m2,m3,m4,theta,theta_dot)
%calculate_right_hand_vector_TMD
%    RIGHT_HAND_VECTOR = calculate_right_hand_vector_TMD(L2,L3,L4,L2_0,L3_0,L4_0,L2_dot,L3_dot,L4_dot,L_x,L_z,C2,C3,C4,K2,K3,K4,M2,M3,M4,THETA,THETA_DOT)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    07-Feb-2023 17:10:27

t2 = cos(theta);
t3 = sin(theta);
t4 = theta_dot.^2;
t5 = L_x.*t2;
t6 = L_z.*t2;
t7 = L_x.*t3;
t8 = L_z.*t3;
t9 = L2_dot.*t3.*theta_dot.*2.0;
t10 = L3_dot.*t3.*theta_dot.*2.0;
t11 = L4_dot.*t3.*theta_dot.*2.0;
t13 = L2_dot.*t2.*theta_dot.*2.0;
t14 = L3_dot.*t2.*theta_dot.*2.0;
t15 = L4_dot.*t2.*theta_dot.*2.0;
t16 = L2.*t2.*t4;
t17 = L3.*t2.*t4;
t18 = L4.*t2.*t4;
t21 = L2.*t3.*t4;
t22 = L3.*t3.*t4;
t23 = L4.*t3.*t4;
t12 = -t6;
t19 = t4.*t5;
t20 = t4.*t6;
t24 = t4.*t7;
t25 = t4.*t8;
t26 = -t14;
t33 = -t21;
t34 = -t23;
t27 = t19.*2.0;
t28 = t20.*2.0;
t29 = t24.*2.0;
t30 = t25.*2.0;
t31 = t4.*t12;
t36 = -t25;
t37 = t13+t19+t25+t33;
t39 = t15+t19+t25+t34;
t32 = -t28;
t35 = -t29;
t38 = t9+t16+t24+t31;
t40 = t11+t18+t24+t31;
t42 = t22+t26+t27+t36;
t41 = t10+t17+t31+t35;
mt1 = [(m3.*(t19.*4.0+t22.*2.0-t30-L3_dot.*t2.*theta_dot.*4.0))./2.0-(m2.*(t21.*-2.0+t27+t30+L2_dot.*t2.*theta_dot.*4.0))./2.0-(m4.*(t23.*-2.0+t27+t30+L4_dot.*t2.*theta_dot.*4.0))./2.0;m2.*(t16.*2.0+t29+t32+L2_dot.*t3.*theta_dot.*4.0).*(-1.0./2.0)-(m4.*(t18.*2.0+t29+t32+L4_dot.*t3.*theta_dot.*4.0))./2.0-(m3.*(t17.*2.0-t24.*4.0+t32+L3_dot.*t3.*theta_dot.*4.0))./2.0;-m3.*t41.*(t5.*2.0-t8+L3.*t3)+m3.*(t6+t7.*2.0-L3.*t2).*(t14-t22+t25-t27)+m2.*t38.*(t5+t8-L2.*t3)-m2.*t37.*(t7+t12+L2.*t2)+m4.*t40.*(t5+t8-L4.*t3)-m4.*t39.*(t7+t12+L4.*t2)];
mt2 = [-L2_dot.*c2-(k2.*(L2.*2.0-L2_0.*2.0))./2.0+m2.*t2.*t38-m2.*t3.*t37;-L3_dot.*c3-(k3.*(L3.*2.0-L3_0.*2.0))./2.0-m3.*t3.*(t14-t22+t25-t27)+m3.*t2.*t41;-L4_dot.*c4-(k4.*(L4.*2.0-L4_0.*2.0))./2.0+m4.*t2.*t40-m4.*t3.*t39];
right_hand_vector = [mt1;mt2];
