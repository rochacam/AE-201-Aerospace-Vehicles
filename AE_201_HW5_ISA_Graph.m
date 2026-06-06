% Description: Programm designed to calculate and plot the ISA Properties
% of air in the Troposphere of Earth.
% Author: Matheus Rocha Carlos
% Email: ROCHACAM@my.erau.edu
% Class: AE201 - Section 07DB
% Date: 02/23/2025
% Worked With: N/a

% Iniciation
clear %clear command window
clc % clear the variables

% Constants
g = 9.832; % Gravity acceleration average in the Equator in m/s^2
R = 287.058; % Gas constant, J/(KgK)
gamma = 1.4; % Ratio of Specific Heats

% ISA inital parameters
T0 = 288.15; % sea level avergae earth temperature in K, 15 degrees Celcius
P0 = 101325; % Sea level average standard pressure in Pascal
d0 = 1.225; % Sea level average standard density of air in Kg/m^3
h0 = 0; %Sea level altitude assummed to be intial position, in meters
a = (-1.98/304.8); % Temperature lapse rate, converted from C/1000ft to K/m
V0 = 340.3; % Speed of sound average at sea level in m/s
mule0 = 1.789e-5; % Viscosity average at sea level in Kg/ms


% Tropopause parameters
Tmax = 216.944; % Tropopause end altitude (FL 360) average temperature in the equator in K
Pmax = 22700; % Tropopause end altitude (FL 360) average pressure in Pa
dmax = 0.365; % Tropopause end altitude (FL 360) avergae density in Kg/m^3
hmax = 11000; % Tropopause end altitude (FL 360) in meters


% Calculations
h = h0:1000:hmax; %altidude Array, in meters
T = zeros(size(h)); % Temperature array, in Kevin
P = zeros(size(h)); % Pressure array, in Pa
d = zeros(size(h)); % Density array, kg/m^3
Vs = zeros(size(h)); % Velocity of Sound Array, in m/s
mule = zeros(size(h)); % Viscosity array, unitless


for k = 1:length(h)
    if h(k) <= hmax
        T(k) = T0 + a*h(k); %Temperature at that altidude, in K
        P(k) = P0*(T(k)/T0)^(-g/(a*R)); % Pressure at that altitude, in Pa
        d(k) = d0*(T(k)/T0)^(-(g/(a*R)+1)); % Density at that altitude, in Kg/m^3
        Vs(k) = sqrt(gamma*R*T(k)); % Speed of Sound at that altitude, in m/s
        mule(k) = 1.458e-6*(sqrt(T(k))/(1+110.4/T(k))); % Sutherland's Law for Viscosity as temperautre changes, in kg/ms
    else
        T(k) = Tmax; % Temperature at above troposphere altitude, in K
        P(k) = Pmax*exp(-g*(h(k)-hmax)/(R*Tmax)); % Pressure at above troposphere atltide, in Pa
        d(k) = dmax*exp(-g*(h(k)-hmax)/(R*Tmax)); % desnity above troposphere in Kg/m^3
    end
end

% Plotting
figure(1)
subplot(5,1,1)
plot(h,T,'r','LineWidth',3)
xlabel('Altitude (km)')
ylabel('Temperature (K)')
title('Temperature altitude realation in the Troposphere')
grid on

subplot(5,1,2)
plot(h,P/1000,'g','LineWidth',3)
xlabel('Altitude (m)')
ylabel('Pressure (KPa)')
title('Pressure altitude relation in the Troposphere')
grid on

subplot(5,1,3)
plot(h,d,'b','LineWidth',3)
xlabel('Altitude (m)')
ylabel('Density (kg/m^3)')
title('Desnity altitude realtion in the Troposphere')
grid on

subplot(5,1,4)
plot(h,Vs,'Color','#FFFF00','LineWidth',3)
xlabel('Altitude (m)')
ylabel('Speed of Sound (m/s)')
title('Speed of Sound altitude realtion in the Troposphere')
grid on

subplot(5,1,5)
plot(h,mule,'Color','#964B00','LineWidth',3)
xlabel('Altitude (m)')
ylabel('Viscosity (kg/ms')
title('Viscosity altitude relation in the Troposphere based on Sutherland’s law')
grid on

figure(2)
plot(T/T0,h,'r',P/P0,h,'g',d/d0,h,'b',Vs/V0,h,'y',mule/mule0,h,'k')
title('All variabelas as altitudes changes in the Troposphere')
lg=legend('Temperautre change over sea level temperature','Pressure change over sea level Pressure','Density change over sea level Density','Speed of Sound change over sea level Speed of Sound','Viscosity chnage over sea level Viscosity');
set(lg,'Location','SouthWest')
ylabel('Altitude in m')
grid on
