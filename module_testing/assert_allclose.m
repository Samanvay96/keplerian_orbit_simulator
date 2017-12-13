%% function 'assert_allclose'
%
% Checks if all elements of a and b are relatively close to each other
%
% Kelvin Hsu
% AERO4701, 2016

function assert_allclose(a, b, varargin)

    % Keyword Arguments
    tol = 1e-8;
    quantity1 = 'first quantity';
    quantity2 = 'second quantity';
    pass_msg = '';
    fail_msg = '';

    % Evaluate Keyword Arguments
    for karg = varargin
        evalc(karg{:});
    end
    
    % Test for all close
    if allclose(a, b, varargin{:})
        if isempty(pass_msg)
            fprintf('%s and %s are close to each other within tolerance level %g\n', quantity1, quantity2, tol);
        else
            fprintf('%s\n', pass_msg);
        end
    else
        if isempty(fail_msg)
            warning('%s and %s are not close to each other within tolerance level %g\n', quantity1, quantity2, tol);
        else
            warning('%s\n', fail_msg);
        end
    end
    
end