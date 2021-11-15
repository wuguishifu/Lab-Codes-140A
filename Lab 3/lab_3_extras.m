%% constant drying rates
clc
clear
rates = [1.83, 2.16, 2.56, 1.63, 2.50, 6.09] .* 10^-6;
error = [5.56, 5.03, 6.23, 10.7, 5.81, 1.00] .* 10^-7;
trials = [0.9, 1.1, 1.3, 24.0, 29.6, 41.0];

figure(1)
bar(trials(1:3), rates(1:3))
hold on
errorbar(trials(1:3), rates(1:3), error(1:3), 'b', 'LineStyle', 'none')
xlabel('Air Velocity (m\cdots^{-1})')
ylabel('Drying Rate [g\cdotcm^{-2}s^{-1}]')

figure(2)
bar(trials(4:6), rates(4:6))
hold on
errorbar(trials(4:6), rates(4:6), error(4:6), 'b', 'LineStyle', 'none')
xlabel('Temperature (°C)')
ylabel('Drying Rate [g\cdotcm^{-2}s^{-1}]')
