%% function 'lg2ecef'
%
% Transforms coordinates in LG to coordinates in ECEF
% LG  : Local Geocentric Vertical Frame OR Local Geodetic Vertical Frame
% ECEF: Earth Centered Earth Fixed Frame
%
% Input  : ???
% Output : ???
%
% Kelvin Hsu
% AERO4701, 2016

function pos_ecef = lg2ecef(pos_lg, pos_llh_ground)

% Initiialising variables 
lat  = pos_llh_ground(1);
long = pos_llh_ground(2);
alt  = pos_llh_ground(3);

% Defining the transformation matrix
transform_LGV2ECEF = [-sin(lat)*cos(long) -sin(long) -cos(lat)*cos(long);
                      -sin(lat)*sin(long)  cos(long) -cos(lat)*sin(long);
                             cos(lat)          0          -sin(lat)];
                         
% Convert LG to ECEF 
% pos_ecef = transform_LGV2ECEF*pos_lg - llhgc2ecef([lat;long;alt]); 
% pos_ecef = bsxfun(@minus,transform_LGV2ECEF*pos_lg,llhgc2ecef([lat;long;alt]));
pos_ecef = transform_LGV2ECEF*pos_lg;
end