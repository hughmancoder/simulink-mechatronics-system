% Define data for x and y axes:
% Ensure your Simulink model is named exactly 'four_bar_linkage' or update 'out' accordingly
t = out.crank_angle.time; 
theta = out.crank_angle.signals.values; 

%% Figure 1: Basic Plot
fig1 = figure;
ax1 = axes;
plot(ax1, t, theta(:,1)); 
ylabel(ax1,'Angle \theta [deg]')
xlabel(ax1,'Time [s]')
title('Crank angle')
legend('Crank angle')

%% Figure 2: Enhanced Plot with Custom Colours and Linewidth
% Colours in Matlab are an RGB triple scaled to 0 to 1 (opposed to 0 to 255)
colArr = [ 26  27 219; ...  % Blue
          137  37 219; ...  % Purple
          224 178  61; ...  % Yellow
          219  25  15; ...  % Red
            0 106  78]/255; % Green 

fig2 = figure;
% fig2.Theme.BaseColorStyle = 'light'; 
ax2 = axes;

% Using the 'line' function as per the screenshot
p2 = line(ax2, t, theta(:,1)); 

% Enhancing visual properties
p2.LineWidth = 1.5;            % Make line thicker
p2.Color = colArr(5,:);        % Set line colour to green 

% Labelling using dot notation
ax2.XLabel.String = 'Time [s]';
ax2.YLabel.String = '\theta [deg]';
title(ax2, 'Enhanced Crank Angle Plot');
grid(ax2, 'on');               