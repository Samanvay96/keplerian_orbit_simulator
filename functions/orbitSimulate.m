function [ECIPos,ECIVel,trueAnomaly] = orbitSimulate(Satdata,simTime)
% orbitSimulate - The purpose of this function is to calculate the orbital 
% position and velocities
%
% Author   : Samanvay Karambhe 2016
% Question : 1
% Input  ----> Satellite data and simulation time (in seconds)
% Output ----> Satellite Position and Velocity data

% Load Constants
constants

% Find Mean Anomaly
n  = sqrt(mu_earth/Satdata.a^3);
t0 = Satdata.EpochDay*24*60*60; 

% Create a time value array for simulation
t  = 1:simTime;
t  = t0 + t; 

% Calculate M (Radians)
M  = deg2rad(Satdata.meanAnomaly) + n*(t-t0);

% Find E
E  = findE(M,Satdata.e);

% Find true anomaly 
A     = sqrt((1+Satdata.e)./(1- Satdata.e)).*tan(E./2);
theta = 2*atan2(A,1); 

% Find distance 
p = Satdata.a*(1 - Satdata.e^2);
r = p./(1 + Satdata.e.*cos(theta));

% Find Position & Velocity of Satellite
orbitPos    = findPos(r,theta);
orbitVel    = findVel(p,Satdata.e,theta);

% Convert satellite coordinates from Orbit to ECI frame
ECIPos      = orbit2ECI(orbitPos,Satdata);
ECIVel      = orbit2ECI(orbitVel,Satdata);

% Save true anomaly array
trueAnomaly = theta;


end

