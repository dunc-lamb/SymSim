%%
rho = 1000;
g = 9.81;

%% Create h5 file
% hydro = struct();
% hydro = readAQWA(hydro,'FullScale/ANALYSIS.ah1','FullScale/ANALYSIS.lis');
% hydro = radiationIRF(hydro,60,6000,880,0.2,9);
% hydro = excitationIRF(hydro,60,6000,880,0.2,9);
% writeBEMIOH5(hydro);
% plotBEMIO(hydro)
%% Simulation Data
simu = simulationClass();               % Initialize Simulation Class
simu.simMechanicsFile = 'OC4_noTMD.slx';                         
simu.solver = 'ode45';                   % simu.solver = 'ode4' for fixed step & simu.solver = 'ode45' for variable step 
% simu.mode = 'rapid-accelerator';        % Specify Simulation Mode ('normal','accelerator','rapid-accelerator')
simu.explorer='on';                    % Turn SimMechanics Explorer (on/off)
simu.startTime = 0;                    % Simulation Start Time [s]
simu.rampTime = 60;                     % Wave Ramp Time Length [s]
simu.endTime = 150;                       % Simulation End Time [s]
simu.dt = 0.05;
simu.domainSize = 100;

%% Wave Information 
waves = waveClass('regular');        % Initialize Wave Class and Specify Type 
waves.period = 6;
waves.height = 3;
waves.waterDepth = 200;
%% Body Data
% Float
body(1) = bodyClass('FullScale/ANALYSIS.h5'); 
body(1).geometryFile = 'geometry/PlatformFullScale_Rotated.stl';     
body(1).mass = 13831300;
body(1).inertia = [0 6.827e9 0];
body(1).viz.opacity = 1;

%% Resolve initial conditions
theta = deg2rad(0);
disp = [0 0 0];

R = [cos(-theta) 0 -sin(-theta);
              0 1 0;
     sin(-theta) 0  cos(-theta)];

body(1).initial.axis = [0 1 0];
body(1).initial.angle = theta;
body(1).initial.displacement = disp;

%% Sort out constraint
x = [1; 0; 0];
z = [0; 0; 1];

x_R = R*x;
z_R = R*z;

%% Constraint Parameters
% Floating (3DOF) Joint
constraint(1) = constraintClass('Constraint1'); 
constraint(1).location = [0 0 -13.46];   
constraint(1).orientation.x = x_R';
constraint(1).orientation.z = z_R'; 