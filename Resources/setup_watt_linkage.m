% Initialization script for Watt's 6-Bar Linkage Simscape Model
% Based on ENGM3000 Mechatronics Foundations Design Project 2026

clear; clc;

%% 1. Link Parameters
% Dimensions format: [Width(m), Height(m), Length(m)] 
% Mass in kg

% Link 2 (Driver)
L2_len = 1.0;
L2_width = 0.02;
L2_height = 0.02;
L2_mass = 2.0;

% Links 3 & 5
L35_len = 0.4;
L35_width = 0.02;
L35_height = 0.02;
L35_mass = 1.0;

% Links 4 & 6
L46_len = 0.5;
L46_width = 0.02;
L46_height = 0.02;
L46_mass = 1.2;

%% 2. World and Fixed Joint Parameters
% Distances between Fixed Joint 1 and Fixed Joint 2
FJ_dist_vertical = 0.4;   % Approx equal to b (0.4m)
FJ_dist_horizontal = 1.0; % Equal to a + a (1.0m)

% Distance to ground
FJ1_ground_clearance = 0.85; % m

%% 3. Joint Properties
% Apply to all revolute joints
joint_damping = 0.02; % N*m/(deg/s)
FJ1_initial_angle = -10; % degrees

%% 4. DC Motor Parameters (By rated load and speed)
motor_noload_speed = 2000; % rpm
motor_rated_speed = 1000;  % rpm
motor_rated_load = 750;    % W
motor_rated_voltage = 48;  % V
motor_rotor_inertia = 0.0002; % kg*m^2
motor_rotor_damping = 0.8e-5; % N*m*s/rad

%% 5. PWM and H-Bridge Parameters
pwm_freq = 4000; % Hz
hbridge_voltage_amp = 48; % V
hbridge_switch_freq = 0.1; % Hz (Switching direction every 5 seconds)

%% 6. Suspension and Contact Force Parameters
% Spatial Contact Force (Ground interaction)
contact_stiffness = 1e6; % N/m
contact_damping = 1e3;   % N/(m/s)

% Spring-Damper Force (Suspension case 1 defaults)
spring_natural_length = 0.3; % m
spring_stiffness = 1000;     % N/m
spring_damping = 0;          % N/(m/s)

disp('Watt''s Linkage Parameters Loaded Successfully!');
