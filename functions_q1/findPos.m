function orbitPos = findPos(r,theta)
% findPos - The aim of this function is calculate the position of a
% Satellite at any instant.
% Input  ---> r,theta
% Output ---> [x,y,z]

x = r.*cos(theta); 
y = r.*sin(theta);
z = zeros(1,size(theta,2));

orbitPos = [x;y;z];

end

