% Orbit Simulator
% Input: Satellite TLE Data
% Output: 3D Plot & Ground Trace of Satelite Orbit 
% Author: Samanvay Karambhe 2016

% Clear everything
clc;
clear;
close all;

%% Initialisation

% Add other folders to path
addpath('./module_conversion', './module_testing','./TLE_data',...
          './functions_q1');

% Load constants
constants()

% Deconstruting TLE Data
satTLE = deconstruct_TLE('OrbocommTLE.txt');

% Define Sim Time (1 Day)
simTime = 86400;

%% Simulating the orbit

% Obtain the Position and Velocity array for the LEO Satellite over 5900s
[ECIPos,ECIVel,trueAnomaly] = orbitSimulate(satTLE,simTime);

% Print Orbital period
fprintf('The orbital Period of the LEO Satellite is %.0f seconds \n',...
         satTLE.orbitPeriod);

% Convert ECI Coordinates to ECEF Coordinates
ECEFPos  = eci2ecef(ECIPos, 1:simTime);

% Convert Satellite Coordintes from ECEF to LLHLD
LLHGDPos = ecef2llhgd(ECEFPos);

%% Find the simulated period of the satellite
% orbitPeriodArray = findPeriod(ECEFPos,1:simTime);


%% Plot ground trace and 3D plots
makePlot(ECIPos,LLHGDPos)

% Export ECEF Data for Satellite
% save('ECIPos.mat','ECIPos')

%% Export Classic Parameters vector
% Export the orbitParameters
% save('trueAnomaly.mat','trueAnomaly')
