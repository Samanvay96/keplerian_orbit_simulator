%% function 'llh_geocentric2ecef'
%
% Transforms coordinates in Geocentric LLH to coordinates in ECEF
% Geocentric LLH: Geocentric Latitude, Longitude, Height Frame
% ECEF: Earth Centered Earth Fixed Frame
%
% Input  : [lat_c;long;alt]  | LLHGC            [rad,rad,m]
% Output : [x; y; z] | ECEF                     [m]
%
% Kelvin Hsu
% AERO4701, 2016

function pos_ecef = llhgc2ecef(pos_llhgc)
    
    % Earth's radius
    global r_earth;
    
% Initialising LLH Variables 
lat_c = pos_llhgc(1,:);
long  = pos_llhgc(2,:);
alt   = pos_llhgc(3,:);

% Vector Magnitude
R = alt + r_earth;

% Finding the ECEF Vector 
rx = R.*cos(lat_c).*cos(long);
ry = R.*cos(lat_c).*sin(long);
rz = R.*sin(lat_c);

% Returning ECEF Coordinates 
pos_ecef = [rx;ry;rz];

end