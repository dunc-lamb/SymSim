% Define all shared variables

clc; clear;

% Wave Data 
T_wave = 6/sqrt(50);
f = 1/T_wave;
w_wave = f*2*pi;
h_wave = 2/50;

waveData = struct();

waveData.h_wave = h_wave;
waveData.w_wave = w_wave;

% Body
load("../examples/OC4/bodies/SmallScale/body.mat")

% Mass Ratio
mu = 0.02;
body.m = body.m1*mu;


% Tuned Parameters
k = 10;

c = 0;

k_i = 10;

b = 10;

tmd_TMD = [k c];
tmd_TID = [k c k_i b];

% Length of simulation
t = 0:0.01:120;

% Run Read_AQWA and process_hydro
hydro = struct();
hydro = Read_AQWA2(hydro,'../examples/OC4/BEMData/SmallScale/ANALYSIS.ah1','../examples/OC4/BEMData/SmallScale/ANALYSIS.lis');
BEM = process_hydro(hydro,T_wave);

% Set certain values to zero for energy tests
BEM.C = zeros(3,3);

BEM.A = zeros(3,3);

%% Test 1: Preprocessing: Read_AQWA
cond = isfield(hydro,'w');
assert(cond);

%% Test 2: Preprocessing: process_hydro
cond = isfield(BEM,'K') && isfield(BEM,'A') && isfield(BEM,'C');
assert(cond)

%% Test 3: Solver: TMD energy: Pitch
r0_TMD = [0 0 deg2rad(5) body.L2_0 body.L3_0 body.L4_0];
v0_TMD = [0 0 0 0 0 0];
y0_TMD = [r0_TMD v0_TMD];

[t, x] = run_dynamic_study(t,body,BEM,y0_TMD,tmd_TMD,'PTO','TMD','waveType','No Wave');

totalEnergy = calculate_total_energy(t,x,body,BEM,tmd_TMD,'TMD');

diff = totalEnergy(1) - totalEnergy(end);
cond = round(diff,2) == 0;
assert(cond)

%% Test 4: Solver: TMD energy: Heave
r0_TMD = [0 0.1 0 body.L2_0 body.L3_0 body.L4_0];
v0_TMD = [0 0 0 0 0 0];
y0_TMD = [r0_TMD v0_TMD];

[t, x] = run_dynamic_study(t,body,BEM,y0_TMD,tmd_TMD,'PTO','TMD','waveType','No Wave');

totalEnergy = calculate_total_energy(t,x,body,BEM,tmd_TMD,'TMD');

diff = totalEnergy(1) - totalEnergy(end);
cond = round(diff,0) == 0;
assert(cond)

%% Test 5: Solver: TMD energy: Mass
r0_TMD = [0 0 0 body.L2_0+0.1 body.L3_0 body.L4_0];
v0_TMD = [0 0 0 0 0 0];
y0_TMD = [r0_TMD v0_TMD];

[t, x] = run_dynamic_study(t,body,BEM,y0_TMD,tmd_TMD,'PTO','TMD','waveType','No Wave');

totalEnergy = calculate_total_energy(t,x,body,BEM,tmd_TMD,'TMD');

diff = totalEnergy(1) - totalEnergy(end);
cond = round(diff,2) == 0;
assert(cond)

%% Test 6: Solver: TMD (Heave only) energy: Heave
r0_TMD = [0.1 body.L2_0 body.L3_0 body.L4_0];
v0_TMD = [0 0 0 0];
y0_TMD = [r0_TMD v0_TMD];

[t, x] = ode45(@(t,x) odefun_TMD_heave_noWave(t,x,body,BEM,tmd_TMD),t,y0_TMD);

totalEnergy = calculate_total_energy(t,x,body,BEM,tmd_TMD,'Heave_TM');

diff = totalEnergy(1) - totalEnergy(end);
cond = round(diff,0) == 0;
assert(cond)

%% Test 7: Solver: TID energy: Pitch
r0_TID = [0 0 deg2rad(5) body.L2_0 body.L3_0 body.L4_0 body.L5_0 body.L6_0 body.L7_0];
v0_TID = [0 0 0 0 0 0 0 0 0];
y0_TID = [r0_TID v0_TID];

[t, x] = run_dynamic_study(t,body,BEM,y0_TID,tmd_TID,'PTO','TID','waveType','No Wave');

totalEnergy = calculate_total_energy(t,x,body,BEM,tmd_TID,'TID');

diff = totalEnergy(1) - totalEnergy(end);
cond = round(diff,1) == 0;
assert(cond)

%% Test 8: Solver: TID energy: Heave
r0_TID = [0 0.1 deg2rad(0) body.L2_0 body.L3_0 body.L4_0 body.L5_0 body.L6_0 body.L7_0];
v0_TID = [0 0 0 0 0 0 0 0 0];
y0_TID = [r0_TID v0_TID];

[t, x] = run_dynamic_study(t,body,BEM,y0_TID,tmd_TID,'PTO','TID','waveType','No Wave');

totalEnergy = calculate_total_energy(t,x,body,BEM,tmd_TID,'TID');

diff = totalEnergy(1) - totalEnergy(end);
cond = round(diff,0) == 0;
assert(cond)

%% Test 9: Solver: TID energy: Mass
r0_TID = [0 0 deg2rad(5) body.L2_0 body.L3_0 body.L4_0+0.1 body.L5_0 body.L6_0 body.L7_0];
v0_TID = [0 0 0 0 0 0 0 0 0];
y0_TID = [r0_TID v0_TID];

[t, x] = run_dynamic_study(t,body,BEM,y0_TID,tmd_TID,'PTO','TID','waveType','No Wave');

totalEnergy = calculate_total_energy(t,x,body,BEM,tmd_TID,'TID');

diff = totalEnergy(1) - totalEnergy(end);
cond = round(diff,0) == 0;
assert(cond)

%% Test 8: Solver: TID energy (heave only): Heave
r0_TID = [0.1 body.L2_0 body.L3_0 body.L4_0 body.L5_0 body.L6_0 body.L7_0];
v0_TID = [0 0 0 0 0 0 0];
y0_TID = [r0_TID v0_TID];

[t, x] = ode45(@(t,x) odefun_TID_heave_noWave(t,x,body,BEM,tmd_TID),t,y0_TID);

totalEnergy = calculate_total_energy(t,x,body,BEM,tmd_TID,'Heave_TI');

diff = totalEnergy(1) - totalEnergy(end);
cond = round(diff,0) == 0;
assert(cond)

%% Test 8: Solver: No PTO energy: Pitch
r0_TID = [0 0 deg2rad(5)];
v0_TID = [0 0 0];
y0_TID = [r0_TID v0_TID];

[t, x] = run_dynamic_study(t,body,BEM,y0_TID,'PTO','No PTO','waveType','No Wave');

totalEnergy = calculate_total_energy(t,x,body,BEM,0,'No PTO');

diff = totalEnergy(1) - totalEnergy(end);
cond = round(diff,0) == 0;
assert(cond)

%% Test 10: Solver: No PTO energy: Heave
r0_TID = [0 0.1 0];
v0_TID = [0 0 0];
y0_TID = [r0_TID v0_TID];

[t, x] = run_dynamic_study(t,body,BEM,y0_TID,'PTO','No PTO','waveType','No Wave');

[totalEnergy,T,U] = calculate_total_energy(t,x,body,BEM,0,'No PTO');

diff = totalEnergy(1) - totalEnergy(end);
cond = round(diff,0) == 0;
assert(cond)