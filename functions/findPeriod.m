function orbitPeriodArray = findPeriod(ECEFPos,timeArray)
% findPeriod - The goal of this function is to find the period of a
% satellite orbit based on range data

% Convert the ECEF coordinates from cartesian to polar 
ECEFPos_Pol = cartesian2polar(ECEFPos);

% Plot the range in the polar coordinates against time
% plot(timeArray,ECEFPos_Pol(1,:));

% Find the timevalues of the graph peaks
[PKS,LOCS]= findpeaks(ECEFPos_Pol(1,:));

% Find the period by calculating the differences between each of the peak
% timevalues 
orbitPeriodArray = diff(LOCS);

end