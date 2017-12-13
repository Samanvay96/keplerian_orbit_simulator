function  makePlot(ECIPos,LLHGDPos)
% plotQ1 - The aim of this function is to plot the necessary graphs for
% question 1. This includes the ground trace of both orbits and the 3D ECI
% orbital plots
% Author : Samanvay Karambhe 2016

%% Initialisation
sat_lat  = rad2deg(LLHGDPos(1,:));
sat_long = rad2deg(LLHGDPos(2,:));

screen1 = [0.0 0.5 0.5 0.5];
screen2 = [0.5 0.5 0.5 0.5];

%% 3D Plot Set-up
% Create a sphere, make it earth sized (in meters)
fig.globe = figure(1);
set(fig.globe, 'Units', 'normalized', 'Position', screen2);

% Create figure and load topographical Earth map
load('topo.mat','topo');

% Create a sphere, make it earth sized (in meters)
[x,y,z] = sphere(50);
x = -x.*6378000;
y = -y.*6378000;
z = z.*6378000;

props.FaceColor= 'texture';
props.EdgeColor = 'none';
props.FaceLighting = 'phong';
props.Cdata = topo;

% Plot Earth
axes('dataaspectratio',[1 1 1],'visible','on')
hold on
globe = surface(x,y,z,props);
hold on
whitebg(1, 'k')

% Plot the 3D orbit lines
plt.orbits = plot3(ECIPos(1,:),ECIPos(2,:),ECIPos(3,:));
hold on

% Save LEO points for the 3D plots
plt.sats = scatter3(NaN, NaN, NaN,'r', 'filled', ...
                    'XDataSource', 'ECIPos(1,i)', ...
                    'YDataSource', 'ECIPos(2,i)', ...
                    'ZDataSource', 'ECIPos(3,i)');


%% 2D Ground Trace Setup
fig.map = figure(2);
set(fig.map, 'Units', 'normalized', 'Position', screen1);
map = imread('earth2D.jpg');
image([-180 180],[90 -90], map);
axis xy 
hold on;
grid on;
scatter(sat_long, sat_lat,1);
hold on
title('Ground Trace of LEO Satellite');
ylabel('Lattitude (deg)');
xlabel('Longitude (deg)');
legend('LEO Satellite');

% Save scatter points for LEO ground trace
plt.ground_trace  = scatter(NaN, NaN,'r', 'filled', ...
                           'XDataSource', 'sat_long(i)', ...
                           'YDataSource', 'sat_lat(i)');

% Initialise the angular rate of earth
omega_earth = 7.2921159e-5;

% Initialise timestep
timeStep = 100;

% Initialise earth rotation angle
angleRotate = rad2deg(omega_earth*timeStep);

% Run a loop to animate the 3D plots and ground trace
for i = 1:86400

    if mod(i,timeStep) == 0;
        refreshdata(plt.sats, 'caller');
        refreshdata(plt.ground_trace, 'caller');
        rotate(globe,[0 0 1],angleRotate);
        drawnow();
    end
end

% Command for saving the ground trace
% print -depsc GroundTrace


end

