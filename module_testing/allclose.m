%% function 'allclose'
%
% Checks if all elements of a and b are relatively close to each other
%
% Kelvin Hsu
% AERO4701, 2016

function close = allclose(a, b, varargin)

    % Keyword Arguments
    tol = 1e-8;

    % Evaluate Keyword Arguments
    for karg = varargin
        evalc(karg{:});
    end

    close = prod(abs(a - b) < tol) == 1;
end