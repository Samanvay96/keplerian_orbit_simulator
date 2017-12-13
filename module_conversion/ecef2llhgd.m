%% function 'ecef2llh_geodetic'
%
% Transforms coordinates in ECEF to coordinates in LLHGD
% ECEF: Earth Centered Earth Fixed Frame
% LLHGD: Latitude, Longitude, Height Geodetic Frame
%
% Input  : [x;y;z]         | ECEF Coordinates nxm array
% Output : [lat;long;h]    | Longitude, Lattitude & Height 
%
% Kelvin Hsu
% AERO4701, 2016

function pos_llhgd = ecef2llhgd(pos_ecef)

    % Invoke global constants
    global r_earth;
    global e_earth;

    % Extract the position in Earth Centered Earth Fixed Frame
    x = pos_ecef(1, :);
    y = pos_ecef(2, :);
    z = pos_ecef(3, :);

    % Determine the number of positions we would like to convert
    n = length(x);

    % Initialise values
    h = zeros(1, n);
    N = r_earth * ones(1, n);
    p = sqrt(x.^2 + y.^2);
    lambda = 100 * ones(1, n);

    % Iterate to solve for LLH
    for i = 1:1000
        sinlambda = z./(N*(1 - e_earth^2) + h);
        lambda = atan((z + (e_earth^2)*N.*sinlambda)./p);
        N = r_earth./sqrt(1 - (e_earth^2)*(sin(lambda).^2));
        h = p./cos(lambda) - N;
    end

    % Position in Latitude, Longitude, Height Geodetic Frame
    pos_llhgd = [lambda; atan2(y, x); h];
    
end