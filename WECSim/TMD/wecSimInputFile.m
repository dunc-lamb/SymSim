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
simu.simMechanicsFile = 'OC4_ThreeMasses_PTOActuated.slx';                         
simu.solver = 'ode45';                   % simu.solver = 'ode4' for fixed step & simu.solver = 'ode45' for variable step 
% simu.mode = 'rapid-accelerator';        % Specify Simulation Mode ('normal','accelerator','rapid-accelerator')
simu.explorer='off';                    % Turn SimMechanics Explorer (on/off)
simu.startTime = 0;                    % Simulation Start Time [s]
simu.rampTime = 60;                     % Wave Ramp Time Length [s]
simu.endTime = 150;                       % Simulation End Time [s]
simu.dt = 0.05;
simu.domainSize = 100;

%% Wave Information 
waves = waveClass('regular');        % Initialize Wave Class and Specify Type 
waves.height = 3;
waves.period = 6;
waves.waterDepth = 200;

%% Body Data
% TMD Values
m = 250000;
I = 1.5e6;

% Float
body(1) = bodyClass('FullScale/ANALYSIS.h5'); 
body(1).geometryFile = 'geometry/PlatformFullScale_Rotated.stl';     
body(1).mass = 13831300 - 3*m;
body(1).inertia = [0 6.827e9 0];
body(1).viz.opacity = 0.5;

% TMD 1
body(2) = bodyClass('');  
body(2).geometryFile = 'geometry/mass.stl'; 
body(2).nonHydro = 1;
body(2).mass = m;
body(2).inertia = [0 I 0];
body(2).volume = 0;
body(2).viz.color = [0 0 1];

% TMD 2
body(3) = bodyClass('');  
body(3).geometryFile = 'geometry/mass.stl'; 
body(3).nonHydro = 1;
body(3).mass = m;
body(3).inertia = [0 I 0];
body(3).volume = 0;
body(3).viz.color = [0 0 1];

% TMD 3
body(4) = bodyClass('');  
body(4).geometryFile = 'geometry/mass.stl'; 
body(4).nonHydro = 1;
body(4).mass = m;
body(4).inertia = [0 I 0];
body(4).volume = 0;
body(4).viz.color = [0 0 1];

%% Resolve initial conditions
theta = deg2rad(0);
disp = [0 0 0];
R = [cos(-theta) 0 -sin(-theta);
              0 1 0;
     sin(-theta) 0  cos(-theta)];

r_10 = [0;0;-13.46];
r_21 = [-14.435;25;12.85];
r_31 = [28.87;0;12.85];
r_41 = [-14.435;-25;12.85];

r_20 = r_10 + R*r_21;
r_30 = r_10 + R*r_31;
r_40 = r_10 + R*r_41;

body(1).centerGravity = r_10';
body(1).initial.axis = [0 1 0];
body(1).initial.angle = theta;
body(1).initial.displacement = disp;

body(2).centerGravity = r_20';
body(2).initial.axis = [0 1 0];
body(2).initial.angle = theta;
body(2).initial.displacement = disp;

body(3).centerGravity = r_30';
body(3).initial.axis = [0 1 0];
body(3).initial.angle = theta;
body(3).initial.displacement = disp;

body(4).centerGravity = r_40';
body(4).initial.axis = [0 1 0];
body(4).initial.angle = theta;
body(4).initial.displacement = disp;

%% Sort out constraint and pto orientations
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

%% Translational PTO
k = 280000;
c = 100;

pto(1) = ptoClass('PTO1');           	% Initialize PTO Class for PTO1
pto(1).location = r_20';  % PTO Location [m]
pto(1).stiffness = k;
pto(1).damping = c;
pto(1).orientation.x = x_R';
pto(1).orientation.z = z_R';

pto(2) = ptoClass('PTO2');           	% Initialize PTO Class for PTO2
pto(2).location =  r_30';   % PTO Location [m]
pto(2).stiffness = k;
pto(2).damping = c;
pto(2).orientation.x = x_R';
pto(2).orientation.z = z_R';

pto(3) = ptoClass('PTO2');           	% Initialize PTO Class for PTO2
pto(3).location =  r_40';   % PTO Location [m]
pto(3).stiffness = k;
pto(3).damping = c;
pto(3).orientation.x = x_R';
pto(3).orientation.z = z_R';