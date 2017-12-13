%% function 'ecef2llh_geocentric'
%
% Transforms coordinates in ECEF to Geocentric LLH
% ECEF: Earth Centered Earth Fixed Frame
% Geocentric LLH: Geocentric Longitude, Latitude, Height Frame
%
% Input  : [x; y; z] | ECEF                     [m]
% Output : [lat_c;long;alt]  | LLHGC            [rad,rad,m]
%
% Kelvin Hsu
% AERO4701, 2016

function pos_llhgc = ecef2llhgc(pos_ecef)

    % Earth's radius
    global r_earth;
    
% Initialise ECEF Coordinates
x = pos_ecef(1,:);
y = pos_ecef(2,:);
z = pos_ecef(3,:);

% Finding vector magnitutde
R  =  sqrt(x.^2 + y.^2 + z.^2);

% Calculate geocentric lattitude
lat_c = asin(z./R);

% Calculate geocentric longitude 
long     = atan2(y,x);

% Calculate altitude 
alt = R - r_earth;

% Return geocentric coordinates
pos_llhgc = [lat_c;long;alt];

end