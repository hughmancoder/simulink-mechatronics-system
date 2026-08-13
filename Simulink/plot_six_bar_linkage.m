% 1. Define Modern Colour Palette
cBlue   = '#0072BD'; % Input Torque
cOrange = '#E65C00'; % Spring/Damper Force
cRed    = '#D95319'; % Red/Orange for Normal Force Spikes
cDark   = '#2F3E46'; % Muted Dark Grey for Distance

% 2. Extract Data from Simulation Output
t = out.tout;
torque_input  = out.InputTorque.Data;
spring_force  = out.SpringForce.Data;
normal_force  = out.NormalForce.Data; % Fixed assignment
separation    = out.SeparationDistance.Data;

% 3. Create Figure with Enhanced Styles
fig = figure('Name', 'Suspension Analysis', 'Color', 'w', 'Position', [100 100 900 750]);
tlo = tiledlayout(3, 1, 'Padding', 'compact', 'TileSpacing', 'tight');

% --- Subplot 1: Input Torque ---
ax1 = nexttile;
plot(t, torque_input, 'Color', cBlue, 'LineWidth', 2);
title('Input Torque at Fixed Joint 1', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Torque (Nm)');
grid on; ax1.GridAlpha = 0.3;

% --- Subplot 2: Force Profile (DUAL AXIS FIX) ---
ax2 = nexttile;
hold on;

% Left Y-Axis: Spring/Damper Forces
yyaxis left
p1 = plot(t, spring_force, 'Color', cOrange, 'LineWidth', 1.8, 'DisplayName', 'Spring/Damper Force');
ylabel('Suspension Force (N)');
ax2.YColor = cOrange; % Color-code the axis text

% Right Y-Axis: Massive Ground Impact Normal Forces
yyaxis right
p2 = plot(t, normal_force, 'Color', cDark, 'LineWidth', 1.5, 'LineStyle', '-', 'DisplayName', 'Normal Contact Force');
ylabel('Ground Normal Force (N)');
ax2.YColor = cDark; % Color-code the axis text

title('Force Profile Analysis', 'FontSize', 12, 'FontWeight', 'bold');
legend([p1, p2], 'Location', 'best');
grid on; ax2.GridAlpha = 0.3;

% --- Subplot 3: Separation Distance ---
ax3 = nexttile;
plot(t, separation, 'Color', cDark, 'LineWidth', 2);
title('Separation Distance (Ground Clearance)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Distance (m)');
xlabel('Time (s)', 'FontWeight', 'bold');
grid on; ax3.GridAlpha = 0.3;

% Link axes so zooming in on time zooms all subplots simultaneously
linkaxes([ax1, ax2, ax3], 'x');

% Apply clean font globally
set(findall(fig, '-property', 'FontName'), 'FontName', 'Segoe UI');