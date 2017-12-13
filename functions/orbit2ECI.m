function ECIPos = orbit2ECI(orbitPos,Sat)
% orbit2ECI - This function converts orbital coordinates to 
% ECI frame coordinates

A = deg2rad(Sat.rascension);  % Right Ascension of node
B = deg2rad(Sat.AoP);         % Argument of Perigee
C = deg2rad(Sat.i);           % Inclination

% Delcaring the transformation matrixs
transformorbit2ECI(1,1) =  cos(A)*cos(B)-sin(A)*sin(B)*cos(C);
transformorbit2ECI(1,2) = -cos(A)*sin(B)-sin(A)*cos(B)*cos(C);
transformorbit2ECI(1,3) =  sin(A)*sin(C);
transformorbit2ECI(2,1) =  sin(A)*cos(B)+cos(A)*sin(B)*cos(C);
transformorbit2ECI(2,2) = -sin(A)*sin(B)+cos(A)*cos(B)*cos(C);
transformorbit2ECI(2,3) = -cos(A)*sin(C);
transformorbit2ECI(3,1) =  sin(B)*sin(C);
transformorbit2ECI(3,2) =  cos(B)*sin(C);
transformorbit2ECI(3,3) =  cos(C);

ECIPos = transformorbit2ECI*orbitPos; 

end

