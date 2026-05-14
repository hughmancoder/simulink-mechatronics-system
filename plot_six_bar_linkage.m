
% 1. Define Modern Colour Palette (Hex Codes)
cBlue   = '#0072BD'; % Professional Blue
cOrange = '#D95319'; % Vibrant Orange
cYellow = '#EDB120'; % Deep Yellow/Gold
cDark   = '#2F3E46'; % Muted Dark Grey for Distance

% 2. Extract Data
t = out.tout;
torque_input = out.InputTorque.Data;
spring_force = out.SpringForce.Data;
contact_force = out.ContactForce.Data;
separation = out.SeparationDistance.Data;

% 3. Create Figure with Enhanced Styles
fig = figure('Name', 'Suspension Analysis', 'Color', 'w', 'Position', [100 100 900 700]);
tlo = tiledlayout(3, 1, 'Padding', 'compact', 'TileSpacing', 'tight');

% --- Subplot 1: Input Torque ---
ax1 = nexttile;
plot(t, torque_input, 'Color', cBlue, 'LineWidth', 2);
title('Input Torque at Fixed Joint 1', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Torque (Nm)');
grid on; ax1.GridAlpha = 0.3; % Subtle grid

% --- Subplot 2: Force Profile ---
ax2 = nexttile;
hold on;
plot(t, spring_force, 'Color', cOrange, 'LineWidth', 1.8);
plot(t, contact_force, 'Color', cYellow, 'LineWidth', 1.5, 'LineStyle', '--');
title('Force Profile Analysis', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Force (N)');
legend('Spring/Damper', 'Ground Contact', 'Location', 'best');
grid on; ax2.GridAlpha = 0.3;

% --- Subplot 3: Separation Distance ---
ax3 = nexttile;
plot(t, separation, 'Color', cDark, 'LineWidth', 2);
title('Separation Distance', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Distance (m)');
xlabel('Time (s)', 'FontWeight', 'bold');
grid on; ax3.GridAlpha = 0.3;

% --- Global Aesthetics ---
% title(tlo, '6-Bar Linkage Suspension Case Study', 'FontSize', 14, 'FontWeight', 'bold');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Segoe UI'); % Modern Font