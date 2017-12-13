%% function 'cartesian2polar'
%
% Transforms coordinates in cartesian coordinates [x, y, z]' 
% into polar coordinates [R, az, el]'
%
% Input  : pos_cartesian = [x,  y,  z]' in cartesian coordinates [m, m, m]
% Output : pos_polar     = [R, az, el]' in polar coordinates [m, rad, rad]
%
% Kelvin Hsu
% AERO4701, 2016

function pos_polar = cartesian2polar(pos_cartesian)

% Initialising cartesian coordinates
x = pos_cartesian(1,:);
y = pos_cartesian(2,:);
z = pos_cartesian(3,:);

% Converting cartesian coordinates to polar coordinates
R  = sqrt(x.^2+y.^2+z.^2);
az = atan(y./x);
el = atan2(-z,sqrt(x.^2 + y.^2));

% Returning polar coordinates
pos_polar = [R;az;el];


end