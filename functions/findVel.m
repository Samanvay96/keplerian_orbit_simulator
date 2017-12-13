function orbitVel = findVel(p,e,theta)
% findVel - Finding the velocity matrix 
% Input  ---> p,e,theta
% Output ---> [vx,vy,vz]

% Load constant 
constants()

% Calculate velocity parameters 
vx = -sqrt(mu_earth/p).*sin(theta);
vy = sqrt(mu_earth/p).*(e + cos(theta));
vz = zeros(1,size(theta,2));

orbitVel = [vx;vy;vz];

end

