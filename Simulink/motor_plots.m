%% ENGM3000 Mechatronics Design Project
% Report Plotter: H-Bridge Voltage & Motor Speed (Custom Axis Intervals)

clearvars -except out; % Preserve your simulation dataset
clc; 
close all;

%% 1. Unpack Workspace Signal Data
try
    % Extract from Timeseries shapes within the out structure
    t_hbridge = out.HBridgeVoltage.Time;   v_hbridge = out.HBridgeVoltage.Data;
    t_rpm     = out.rpm.Time;              v_rpm     = out.rpm.Data;
catch ME
    fprintf('The script could not locate "out.HBridgeVoltage" or "out.rpm".\n');
    error('Verify your block Variable Names match these exact case-sensitive names.');
end

%% 2. Generate Figure Window (Clean white background)
figure('Color', [1 1 1]); 

% Custom Colors matching your design theme
deep_blue   = [0.00, 0.45, 0.74]; % Sharp engineering blue
gold_yellow = [0.93, 0.69, 0.13]; % High-visibility yellow-gold

%% Subplot 1: H-Bridge Output Voltage Profile (Blue Trace)
subplot(2, 1, 1);
plot(t_hbridge, v_hbridge, 'Color', deep_blue, 'LineWidth', 1.8);
title('H-Bridge Voltage Output Profile', 'FontSize', 11, 'FontWeight', 'bold');
ylabel('Voltage (V)', 'FontSize', 10);
grid on;
grid minor;

% --- IMPROVED Y-AXIS NUMBERS ---
ylim([-60, 60]); 
yticks([-48, -24, 0, 24, 48]); % Explicit steps matching system architecture limits

%% Subplot 2: Motor Angular Velocity (Yellow/Gold Trace)
subplot(2, 1, 2);
plot(t_rpm, v_rpm, 'Color', gold_yellow, 'LineWidth', 1.8);
title('DC Motor Speed Profile', 'FontSize', 11, 'FontWeight', 'bold');
ylabel('Motor Speed (rpm)', 'FontSize', 10);
xlabel('Time (seconds)', 'FontSize', 10);
grid on;
grid minor;

% --- IMPROVED Y-AXIS NUMBERS ---
ylim([-2500, 2500]); 
yticks([-2500, -2000, -1500, -1000, -500, 0, 500, 1000, 1500, 2000, 2500]); % Precise 500 RPM tracking grid

%% 3. Global Scaling Adjustments
sgtitle('DC Motor Subsystem Performance Analysis', 'FontSize', 13, 'FontWeight', 'bold');