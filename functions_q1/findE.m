function E = findE(M,e)

% Tolerance = 1% 
tol   = 0.005;

% Error in E
err   = ones(1,size(M,2));

% Initial guess for E
E_old = ones(1,size(M,2)).*pi;

while max(err) > tol
     
    % Find f(E)
    fE     = E_old - e*sin(E_old) - M;
    
    % Find f'(E)
    fE_derivative = 1 - e.*cos(E_old);
    
    % Find delta E
    dE     = fE./fE_derivative;

    % Calculate new E
    E_new  = E_old - dE;

    % Calculate % error in E
    err    = abs(E_new-E_old)./abs(E_old);
    
    % Update old value for E
    E_old  = E_new;
    
end

% Return E
E = E_new;

end