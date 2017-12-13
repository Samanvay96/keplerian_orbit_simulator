
%% function 'ecef2eci'
%
% Transforms coordinates in ECEF to coordinates in ECI
% ECEF: Earth Centered Earth Fixed Frame
% ECI : Earth Centered Inertial Frame
%
% Input  : pos_ecef = [x; y; z] | ECEF                     [m]
%          times    = times since vernal equinox alignment [s]
%          times is an array of time
% Output : pos_eci  = [x; y; z] | ECI                      [m]
%
% Kelvin Hsu
% AERO4701, 2016

function pos_eci = ecef2eci(pos_ecef, times)

    % This is the rotation rate of Earth (rad/s)
    global w_earth;

% Initialise varibles
angles = w_earth*times;
c      = cos(angles);
s      = sin(angles);

% % DEfining Cosine Transformation Matrix
% ecef2eciTranform = [c s 0; -s c 0; 0 0 1]';
% 
% % Converting coordinates from ECEF to ECI
% pos_eci = ecef2eciTranform * pos_ecef;

% Find ECI Coordinates
pos_eci(1,:) =  pos_ecef(1,:).*c + pos_ecef(2,:).*s; 
pos_eci(2,:) = -pos_ecef(1,:).*s + pos_ecef(2,:).*c;
pos_eci(3,:) =  pos_ecef(3,:);

end