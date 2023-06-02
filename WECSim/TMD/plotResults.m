%Example of user input MATLAB file for post processing

close all; clear;

%Plot heave response for body 1
load('output\OC4_ThreeMasses_PTOActuated_matlabWorkspace.mat')
time = output.bodies.time;
b1_heave_TMD = output.bodies(1).position(:,3);
b1_pitch_TMD = output.bodies(1).position(:,5);
b2_heave_TMD = output.bodies(2).position(:,3);

load('../NoTMD/output/OC4_noTMD_matlabWorkspace.mat')
b1_heave_noPTO = output.bodies(1).position(:,3);
b1_pitch_noPTO = output.bodies(1).position(:,5);

figure(1)
plot(time,b1_heave_noPTO-output.bodies(1).centerGravity(3),'k','LineWidth',2)
hold on
plot(time,b1_heave_TMD-output.bodies(1).centerGravity(3),'b','LineWidth',2)
set(gca,'FontSize',12)
xlabel('Time (s)')
ylabel('Heave (m)')
legend('Baseline','TMD')
hold off

figure(2)
plot(time,b1_pitch_noPTO*(180/pi),'k','LineWidth',2)
hold on
plot(time,b1_pitch_TMD*(180/pi),'b','LineWidth',2)
set(gca,'FontSize',12)
xlabel('Time (s)')
ylabel('Pitch (deg)')
legend('Baseline','TMD')
hold off

figure(3)
plot(time,b1_heave_TMD-output.bodies(1).centerGravity(3),'b','LineWidth',2)
set(gca,'FontSize',12)
xlabel('Time (s)')
ylabel('Heave (m)')
legend('TMD')
hold off