%Example of user input MATLAB file for post processing

close all;

%Plot heave response for body 1
time = output.bodies.time;
b1_heave = output.bodies(1).position(:,3);
b1_pitch = output.bodies(1).position(:,5);

figure(1)
plot(time,b1_heave-output.bodies(1).centerGravity(3))
xlabel('Time (s)')
ylabel('Heave (m)')
legend('Platform')

figure(2)
plot(time,b1_pitch)
xlabel('Time (s)')
ylabel('Pitch (rad)')

%Save waves and response as video
% output.saveViz(simu,body,waves,...
%     'timesPerFrame',5,'axisLimits',[-150 150 -150 150 -50 20],...
%     'startEndTime',[100 125]);
