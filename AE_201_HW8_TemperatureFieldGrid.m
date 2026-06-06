% Description: Programm designed to code to plot isotherms and gradient vectors for T(x, y) = x^2 - y^2
% Author: Matheus Rocha Carlos
% Email: ROCHACAM@my.erau.edu
% Class: AE201 - Section 07DB
% Date: 02/23/2025
% Worked With: N/a

% Define the temperature field
T = @(x,y)x.^2 - y.^2;

% Define the range for x and y
x = linspace(-5, 5, 200);
y = linspace(-5, 5, 200);
[x, y] = meshgrid(x, y);

% Calculate the temperature values
Z = T(x,y);

% Define the isotherm levels
levels = [-4, 0, 4];

% Plot the isotherms
figure(1);
contour(x, y, Z, levels, 'LineWidth', 3);
xlabel('x');
ylabel('y');
title('Isotherms of T(x, y) = x^2 - y^2');
grid on;
hold on;

% Points for gradient vectors between limits of -4 and 4
x_grad = [-3, -2, -1, 0, 1, 2, 3];
y_grad = [-3, -2, -1, 0, 1, 2, 3];
[X_grad, Y_grad] = meshgrid(x_grad, y_grad);

% Calculated gradient vectors at the chosen points
U = 2 * X_grad;
V = -2 * Y_grad;

% Plot of gradient vectors
quiver(X_grad, Y_grad, U, V, 'r', 'LineWidth', 1.25);
hold off;
legend('Isotherms', 'Gradient Vectors');