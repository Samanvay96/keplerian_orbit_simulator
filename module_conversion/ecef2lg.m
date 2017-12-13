%% function 'ecef2lg'
%
% Transforms coordinates in ECEF to coordinates in LG
% ECEF: Earth Centered Earth Fixed Frame
% LG  : Local Geocentric Vertical Frame OR Local Geodetic Vertical Frame
%
% Input  : pos_ecef = [x; y; z] | ECEF                     [m]
% Output : pos_lg   = [x; y; z] | LLHGCV/LLHGDV            [m]
%
% Kelvin Hsu
% AERO4701, 2016

function pos_lg = ecef2lg(pos_ecef, pos_llh_ground)
    
% Initiialising LLH Coordinates 
lat  = pos_llh_ground(1);
long = pos_llh_ground(2);

% Defining the cosine matrix 
transform_ECEF2LGV = [-sin(lat)*cos(long) -sin(long) -cos(lat)*cos(long);
                      -sin(lat)*sin(long)  cos(long) -cos(lat)*sin(long);
                             cos(lat)          0          -sin(lat)]';
                         
% Convert coordinates from ECEF to LG 
pos_lg = transform_ECEF2LGV*pos_ecef; 


end