% Description: Program designed to plot NACA Series 231xx airfoils for max
% thickness of 12 and 18 of chord length.
% Author: Matheus Rocha Carlos
% Email: ROCHACAM@my.erau.edu
% Class: AE201 - Section 07DB
% Date: 04/09/2025
% Worked With: N/a

%Iniciation
clear;
clc;
close all;

% General Constants for all airfoils
t_12 = 0.12; %Maximum thickness to chord ratio for 23112 series airfoil
t_18 = 0.18; % Maximum thickness to chord ratio for 23118 series airfoil
m = 0.217; % location of maximum camber
k1 = 15.793; %constant
k2k1 = 0.006770; % constant ratio given
p = 0.15; % constant
r_12 = 1.1019.*(t_12^2); %radius of leading edge circle for 23112 series airfoil
r_18 = 1.1019.*(t_18^2); %radius of leading edge circle for 23118 series airfoil

% Constant Calculation for any 231xx series airfoil
x2 = linspace(m,1,round((1-m).*500)); %x coordinates m to 1
y_cam_2 = (k1./6).*((k2k1*(x2-m).^3)-((k2k1*(1-m).^3)*x2)-((m.^3)*x2)+(m.^3)); %camber line y coord m to 1
dy_cam_2 = (k1./6).*((3.*k2k1*(x2-m).^2)-k2k1.*(1-m).^3-m.^3).*ones(1,length(x2)); %derivative of camber line m to 1
dy_cam_005 = (1./6).*6*p*k1.*(3.*(0.005-m).^2)-k2k1*((1-m).^3-(m.^3)); % derivative of camber line at a point of 0.005 in the chord.
theta_005 = atan(dy_cam_005); % angle of cord at 0.005 of its length

% General coordinates for 231(18 series airfoils
x1_18 = linspace(r_18/(2.5+sqrt(t_18-p)),m,round(m.*500)); %x coordinates nose circle to m
y_cam_1_18 = (k1./6).*(((x1_18-m).^3)-k2k1*((1-m).^3)*x1_18-(m.^3)*x1_18+m.^3); %camber line y coord 0 to m
x_18 = [x1_18 x2]; %merged x coordinates
y_cam_18 = [y_cam_1_18 y_cam_2]; %merged y camber coordinates
dy_cam_1_18 = (k1./6).*((3.*(x1_18-m).^2)-k2k1*(1-m).^3-(m.^3)); %derivative of camber line 0 to m
dy_cam_18 = [dy_cam_1_18 dy_cam_2]; %merged derivative of camber line
theta_18 = atan(dy_cam_18); %slope of camber line
y_t_18 = 5.*t_18.*((0.29690.*sqrt(x_18))-(0.12600.*x_18)-(0.35160.*(x_18.^2)) +(0.28430.*(x_18.^3))-(0.10150.*(x_18.^4))); %thickness equation
x_upper_18 = x_18-(y_t_18.*sin(theta_18)); %x coordinates of upper surface
x_lower_18 = x_18+(y_t_18.*sin(theta_18)); %x coordinates of lower surface
y_upper_18 = y_cam_18+(y_t_18.*cos(theta_18)); %y coordinates of upper surface
y_lower_18 = y_cam_18-(y_t_18.*cos(theta_18)); %y coordinates of lower surface

% General Coodinates of 23112 airfoil series
x1_12 = linspace(r_12/(2+sqrt(t_12)),m,round(m.*500)); %x coordinates nose circle to m
y_cam_1_12 = (k1./6).*(((x1_12-m).^3)-k2k1*((1-m).^3)*x1_12-(m.^3)*x1_12+m.^3); %camber line y coord 0 to m
x_12 = [x1_12 x2]; %merged x coordinates
y_cam_12 = [y_cam_1_12 y_cam_2]; %merged y camber coordinates
dy_cam_1_12 = (k1./6).*((3.*(x1_12-m).^2)-k2k1*(1-m).^3-(m.^3)); %derivative of camber line 0 to m
dy_cam_12 = [dy_cam_1_12 dy_cam_2]; %merged derivative of camber line
theta_12 = atan(dy_cam_12); %slope of camber line
y_t_12 = 5.*t_12.*((0.29690.*sqrt(x_12))-(0.12600.*x_12)-(0.35160.*(x_12.^2)) +(0.28430.*(x_12.^3))-(0.10150.*(x_12.^4))); %thickness equation
x_upper_12 = x_12-(y_t_12.*sin(theta_12)); %x coordinates of upper surface
x_lower_12 = x_12+(y_t_12.*sin(theta_12)); %x coordinates of lower surface
y_upper_12 = y_cam_12+(y_t_12.*cos(theta_12)); %y coordinates of upper surface
y_lower_12 = y_cam_12-(y_t_12.*cos(theta_12)); %y coordinates of lower surface

%end points to close off trailing edge for 23118
x_end_up_18 = x_upper_18(end);
x_end_low_18 = x_lower_18(end);
y_end_up_18 = y_upper_18(end);
y_end_low_18 = y_lower_18(end);

%end points to close off trailing edge for 23111
x_end_up_12 = x_upper_12(end);
x_end_low_12 = x_lower_12(end);
y_end_up_12 = y_upper_12(end);
y_end_low_12 = y_lower_12(end);

% Leading Edge circle for 23118 airfoil
h_18 = (r_18-p/100)*cos(theta_005); %center of nose circle x direction
k_18 = (r_18-p/100)*sin(theta_005); %center of nose circle y direction
x_circ_18 = linspace(h_18-r_18,h_18+r_18,500); %x coordinates of nose circle
y_circ_upper_18 = sqrt((r_18.^2)-((x_circ_18-h_18).^2))+k_18; %y coordinates upper half circle
y_circ_lower_18 = -sqrt((r_18.^2)-((x_circ_18-h_18).^2))+k_18; %y coordinates lower half circle

% Leading Edge circle for 23112 airfoil
h_12 = (r_12-p/100)*cos(theta_005); %center of nose circle x direction
k_12 = (r_12-p/100)*sin(theta_005); %center of nose circle y direction
x_circ_12 = linspace(h_12-r_12,h_12+r_12,500); %x coordinates of nose circle
y_circ_upper_12 = sqrt((r_12.^2)-((x_circ_12-h_12).^2))+k_12; %y coordinates upper half circle
y_circ_lower_12 = -sqrt((r_12.^2)-((x_circ_12-h_12).^2))+k_12; %y coordinates lower half circle

%plot the airfoil
figure(1)
% plot 23112 Series Airfoil
subplot(2,1,1)
plot(x_upper_12,y_upper_12,'k', 'LineWidth', 2)
hold on
plot(x_lower_12,y_lower_12,'k', 'LineWidth', 2)
plot(x_12,dy_cam_005,'k', 'LineWidth', 2)
plot([x_end_up_12,x_end_low_12],[y_end_up_12,y_end_low_12],'k','LineWidth', 2)
plot(x_circ_12,y_circ_upper_12,'k-','LineWidth', 2)
plot(x_circ_12,y_circ_lower_12,'k-','LineWidth', 2)
grid on
xlabel('x/c')
ylabel('y/c')
axis([-0.1 1.1 -0.2 0.2])
title(['NACA 231', num2str(round(t_12*100)), '-Series Airfoil'])

% Plot 23118 Series Airfoil
subplot(2,1,2)
plot(x_upper_18,y_upper_18,'k', 'LineWidth', 2)
hold on
plot(x_lower_18,y_lower_18,'k', 'LineWidth', 2)
plot(x_18,dy_cam_005,'k', 'LineWidth', 2)
plot([x_end_up_18,x_end_low_18],[y_end_up_18,y_end_low_18],'k','LineWidth', 2)
plot(x_circ_18,y_circ_upper_18,'k-','LineWidth', 2)
plot(x_circ_18,y_circ_lower_18,'k-','LineWidth', 2)
grid on
xlabel('x/c')
ylabel('y/c')
axis([-0.1 1.1 -0.2 0.2])
title(['NACA 231', num2str(round(t_18*100)), '-Series Airfoil'])



