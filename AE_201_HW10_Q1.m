% Description: Program designed to plot drag polars for specific finite wings.
% Author: Matheus Rocha Carlos
% Email: ROCHACAM@my.erau.edu
% Class: AE201 - Section 07DB
% Date: 04/25/2025
% Worked With: N/a

%Basic Iniciation
clear;
clc;
close all;

%% Part A
%Iniciation
clear;
clc;
close all;
% Define the constants
B = 1.4;
AR = 8;

% Define the values of A
A_values = [0.01, 0.02, 0.03];

% Create a range of CL values up to 1.7
CL = linspace(0.0,1.7,100);

% Initialize best CL and CD variables to store the best CL/CD values
best_CL_CD = zeros(length(A_values), 1);
best_CL_values = zeros(length(A_values), 1);

% Loop through each value of A
for i = 1:length(A_values)
    A = A_values(i);
    CD = A + (B / (pi * AR)) * CL.^2;
    plot(CD, CL, 'DisplayName', sprintf('A = %.2f', A));
    hold on;
    % Calculate CL/CD ratio
    ratio = CL ./ CD;

    % Find the maximum CL/CD ratio and the corresponding CL value
    [max_ratio, max_index] = max(ratio);
    best_CL_CD(i) = max_ratio;
    best_CL_values(i) = CL(max_index);

    % Display the result for current A
    fprintf('For A = %.2f:\n', A);
    fprintf('  Best CL/CD ratio: %.4f\n', max_ratio);
    fprintf('  Corresponding CL: %.4f\n', CL(max_index));
end
% Label and Ajust Graph
xlabel('Lift Coefficient (CL)');
ylabel('Drag Coefficient (CD)');
title('Drag Coefficient vs. Lift Coefficient for Different Values of A');
legend('show');
grid on; 
hold off;

%% Part B
%Iniciation
clear;
clc;
close all;
% Define the constants
A = 0.03;
AR = 8;

% Define the values of A
B_values = [1.2, 1.4, 1.6];

% Create a range of CL values for analysis
CL = linspace(0.0,1.7,100);

% Initialize variables to store the best CL/CD values
best_CL_CD = zeros(length(B_values), 1);
best_CL_values = zeros(length(B_values), 1);

% Loop through each value of A
for i = 1:length(B_values)
    B = B_values(i);
    CD = A + (B / (pi * AR)) * CL.^2;
    plot(CD, CL, 'DisplayName', sprintf('B = %.2f', B));
    hold on;

    % Calculate CL/CD ratio
    ratio = CL ./ CD;

    % Find the maximum CL/CD ratio and the corresponding CL value
    [max_ratio, max_index] = max(ratio);
    best_CL_CD(i) = max_ratio;
    best_CL_values(i) = CL(max_index);

    % Display the result for the current value of A
    fprintf('For B = %.2f:\n', B);
    fprintf('  Best CL/CD ratio: %.4f\n', max_ratio);
    fprintf('  Corresponding CL: %.4f\n', CL(max_index));
end
% Label and Ajust Graph
axis([0.0 0.3 0.0 2.0])
xlabel('Lift Coefficient (CL)');
ylabel('Drag Coefficient (CD)');
title('Drag Coefficient vs. Lift Coefficient for Different Values of B');
legend('show');
grid on; 
hold off;

%% Part C
%Iniciation
clear;
clc;
close all;
% Define the constants
A = 0.03;
B = 1.4;

% Define the values of A
AR_values = [5, 10, 15];

% Create a range of CL values for analysis
CL = linspace(0.0,1.7,100);

% Initialize variables to store the best CL/CD values
best_CL_CD = zeros(length(AR_values), 1);
best_CL_values = zeros(length(AR_values), 1);

% Loop through each value of AR
for i = 1:length(AR_values)
    AR = AR_values(i);
    CD = A + (B / (pi * AR)) * CL.^2;
    plot(CD, CL, 'DisplayName', sprintf('AR = %.2f', AR));
    hold on;

    % Calculate CL/CD ratio
    ratio = CL ./ CD;

    % Find the maximum CL/CD ratio and the corresponding CL value
    [max_ratio, max_index] = max(ratio);
    best_CL_CD(i) = max_ratio;
    best_CL_values(i) = CL(max_index);

    % Display the result for the current value of A
    fprintf('For AR = %.2f:\n', AR);
    fprintf('  Best CL/CD ratio: %.4f\n', max_ratio);
    fprintf('  Corresponding CL: %.4f\n', CL(max_index));
end
% Label and Ajust Graph
axis([0.0 0.3 0.0 2.0])
xlabel('Lift Coefficient (CL)');
ylabel('Drag Coefficient (CD)');
title('Drag Coefficient vs. Lift Coefficient for Different Values of AR');
legend('show');
grid on; 
hold off;
