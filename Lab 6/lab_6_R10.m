clc
clear

temps = [22.4, 22.4, 22.5, 22.1, 22.2, 22.3, 22.3]; % [C]
rpms = [297, 297, 297, 260, 312, 335, 255]; % [rpm]
flowrates = [2, 6, 12, 6, 6, 6, 6]; % [L/min]
kLa = [295, 421, 421, 404, 642, 550, 423] .* 1e-5; % [s^-1]

A_i = (0.292/2)^2 * pi; % [m^2]
h = 0.298; % [m]

C_A = 11.3 / 0.000017760790568309997 * 1000;

F = lerp(temps, 22, 24, 0.788, 0.758);
R = kLa .* F .* (A_i .* h);

figure(7)
plot(flowrates(1:3), R(1:3), '.r', 'MarkerSize', 20)
xlim([1, 13])
ylim([4.5e-5, 6.7e-5])
xlabel('Flowrate [L\cdotmin^{-1}]')
ylabel('R [mol\cdots^{-1}]')

figure(8)
plot(rpms(4:7), R(4:7), '.b', 'MarkerSize', 20)
xlabel('Rotational Speed [rpm]')
ylabel('R [mol\cdots^{-1}]')

for i=1:7
    disp([num2str(rpms(i)), ' & ', num2str(flowrates(i)), ' & ', num2str(R(i)), '\\\hline'])
end