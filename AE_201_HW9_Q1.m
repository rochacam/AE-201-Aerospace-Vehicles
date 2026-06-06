% Description: Program designed to plot NACA Series 00xx airfoils for max
% thickness of 12, 15 and 18 of chord length.
% Author: Matheus Rocha Carlos
% Email: ROCHACAM@my.erau.edu
% Class: AE201 - Section 07DB
% Date: 04/089/2025
% Worked With: N/a

%Iniciation
clear;
clc;
close all;

% General Constants for all airfoils
c= 1; %define chord
x=0:0.001:1; %define number of points to 1000
Eq = [(0.2969*((x./c).^0.5))-(0.1260*(x./c))-(0.3516*((x./c).^2))+(0.2843*((x./c).^3))-(0.1015*((x./c).^4))]; % Upper and lower surfaces thickness envelopes equation
x_end_up = x(end);
x_end_low = x(end);
% NACA 0012 Airfoil Plot
t_12 = 0.12; %define t as 12
yup_12=(5*t_12)* Eq; % Equation multiplication by max thickness ratio
% Mirror airfoil about the x-axis for lower half of the airfoil
ylow_12=-yup_12;
% Close the trailing edge
y_end_up_12 = yup_12(end);
y_end_low_12 = ylow_12(end);
%plot the airfoil
figure(1)
subplot(3,1,1)
plot(x,yup_12,'r', 'LineWidth', 2)
hold on
plot(x,ylow_12,'r', 'LineWidth', 2)
plot([x_end_up,x_end_low],[y_end_up_12,y_end_low_12],'r','LineWidth', 2)
axis([-0.1 1.1 -0.1 0.1])
grid on
xlabel('x/c')
ylabel('y/c')
title(['NACA 00', num2str(round(t_12*100)), ' -Series Airfoil'])
hold on

% NACA 0015 Airfoil Plot
t_15=0.15; %define max thickness of the airfoil to 15
yup_15=(5*t_15)*Eq; % Equation multiplication by max thickness ratio
% Mirror airfoil about the x-axis for lower half of the airfoil
ylow_15=-yup_15;
% Close the trailing edge
y_end_up_15 = yup_15(end);
y_end_low_15 = ylow_15(end);
%plot the airfoil
figure(1)
subplot(3,1,2)
plot(x,yup_15,'g', 'LineWidth', 2)
hold on
plot(x,ylow_15,'g', 'LineWidth', 2)
plot([x_end_up,x_end_low],[y_end_up_15,y_end_low_15],'g','LineWidth', 2)
axis([-0.1 1.1 -0.1 0.1])
grid on
xlabel('x/c')
ylabel('y/c')
title(['NACA 00', num2str(round(t_15*100)), '-Series Airfoil'])
hold on

% NACA 0015 Airfoil Plot
t_18=0.18; %define max thickness of the airfoil to 15
yup_18=(5*t_18)*Eq; % Equation multiplication by max thickness ratio
% Mirror airfoil about the x-axis for lower half of the airfoil
ylow_18=-yup_18;
% Close the trailing edge
y_end_up_15 = yup_18(end);
y_end_low_15 = ylow_18(end);
%plot the airfoil
figure(1)
subplot(3,1,3)
plot(x,yup_18,'b', 'LineWidth', 2)
hold on
plot(x,ylow_18,'b', 'LineWidth', 2)
plot([x_end_up,x_end_low],[y_end_up_15,y_end_low_15],'b','LineWidth', 2)
grid on
xlabel('x/c')
ylabel('y/c')
axis([-0.1 1.1 -0.12 0.12])
title(['NACA 00', num2str(round(t_18*100)), '-Series Airfoil'])



