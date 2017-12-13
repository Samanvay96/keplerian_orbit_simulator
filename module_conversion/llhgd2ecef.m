%% function 'llh_geocentric2ecef'
%
% Transforms coordinates in Geodetic LLH to coordinates in ECEF
% Geodetic LLH: Geodetic Longitude, Latitude, Height Frame
% ECEF: Earth Centered Earth Fixed Frame
%
% Input  : ???
% Output : ???
%
% Kelvin Hsu
% AERO4701, 2016

function pos_ecef = llhgd2ecef(pos_llhgd)
   
    % Semi-Major Axis of Earth
    global r_earth;
    
    % Eccentricity of Earth
    global e_earth;

    
% Initialising llh coordinates
lat  = pos_llhgd(1,:);
long = pos_llhgd(2,:);
h    = pos_llhgd(3,:);

% Finding N
N = r_earth./(sqrt(1 - e_earth.^2.*sin(lat).^2));

% Finding ECEF Coordinates
x = (N+h).*cos(lat).*cos(long);
y = (N+h).*cos(lat).*sin(long);
z = (N.*(1-e_earth.^2) + h).*sin(lat); 

% Returning ECEF Coordinates
pos_ecef = [x;y;z];


end