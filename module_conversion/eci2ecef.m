%% function 'eci2ecef_multitime'
%
% Transforms coordinates in ECI to coordinates in ECEF
% ECI : Earth Centered Inertial Frame
% ECEF: Earth Centered Earth Fixed Frame
%
% Input  : pos_eci  = [x; y; z] | ECI                      [m]
%          times    = times since vernal equinox alignment [s]
% Output : pos_ecef = [x; y; z] | ECEF                     [m]
%
% Kelvin Hsu
% AERO4701, 2016

function pos_ecef = eci2ecef(pos_eci, times)

    % This is the rotation rate of Earth (rad/s)
    global w_earth;

% Initialise varibles
angles = w_earth*times;
c      = cos(angles);
s      = sin(angles);

% % Tranformation Matrix
% eci2ecefTranform = [c s 0; -s c 0; 0 0 1];
% 
% % Final Transformation 
% pos_ecef = eci2ecefTranform * pos_eci;

% Find ECI Coordinates
pos_ecef(1,:) =  pos_eci(1,:).*c + pos_eci(2,:).*s; 
pos_ecef(2,:) = -pos_eci(1,:).*s + pos_eci(2,:).*c;
pos_ecef(3,:) =  pos_eci(3,:);

end