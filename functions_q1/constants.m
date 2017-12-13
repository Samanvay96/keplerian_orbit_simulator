%% Script 'constants'
%
%  --Description--
%  This script defines all the global constants used for all the scripts,
%  functions, and programs involved in this module. These values are never
%  to be modified anywhere else, so that all references to these variables
%  will always return the same values everytime as defined here.

% This is mu = GM for the Earth (m^3/s^2)
global mu_earth;
mu_earth = 398600.4418e9;

% This is the eccentricity of Earth (unitless)
global e_earth;
e_earth =  0.08181919;

% This is the J2 correction constant
global J2;
J2 = 0.00108262668;

% This is the radius of the Earth (m)
global r_earth;
r_earth = 6378137;

% This is a constant that appears in the perturbation model
% We can compute it now and save it just so that we save a few cycles of
% computations later, and also to avoid typos
global mu_J2_r_sq;
mu_J2_r_sq = mu_earth * J2 * r_earth^2;

% This is the rotation rate of earth (rad/s);
global w_earth;
w_earth = 7.292115e-5;

% This is the number of seconds per day
global secs_per_day;
secs_per_day = 24 * 60 * 60;

% This is the number of seconds per minute
global secs_per_min;
secs_per_min = 60;

% This is the amount of radians per revolution
global rads_per_rev;
rads_per_rev = 2 * pi;
