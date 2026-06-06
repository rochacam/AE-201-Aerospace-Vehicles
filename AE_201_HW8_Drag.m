% Description: Program designed to code to plot the drag on a 29 inch
% diameter sphere at diffrent wind conditions up to 145mph.
% Author: Matheus Rocha Carlos
% Email: ROCHACAM@my.erau.edu
% Class: AE201 - Section 07DB
% Date: 04/05/2025
% Worked With: N/a
clear
clc

% Define the wind speed range
v = linspace(0,4225,130);

% Define the givens
A = (pi/4)*(29*0.0254)^2;
d = 1.25;
cd1 = 0.42;
cd2 = 1.17;

%find drag at different speeds
drag1 = v*((cd1*d*A)/2);
drag2 = v*((cd2*d*A)/2);

% Plot the Drag versus the wind speed
figure(1);
plot(sqrt(v), drag1, 'r', sqrt(v), drag2, 'b', 'LineWidth', 3);
xlabel('Velocity of wind (m/s)');
ylabel('Drag on sphere [N]');
title('Drag on spehere for speeds up to 65 meters per second (145MPH)');
lg=legend('Drag based on frontal area of sphere','Drag based on rear area of sphere');
set(lg,'Location','NorthWest')
grid on;
hold on;


