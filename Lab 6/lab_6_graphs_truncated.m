clc
clear

% defining constants
henry = 1.3e-3; % [M/atm] (25C)
pO2 = 0.21; % [atm]

% defining data
m = readtable("exp_6_raw_data_truncated.csv");

times = strings(1, 7);
concentrations = strings(1, 7);
saturations = strings(1, 7);
temps = strings(1, 7);
trials = strings(1, 7);

for i = 1:7
    times{i} = strcat('t', num2str(i), 'time');
    concentrations{i} = strcat('t', num2str(i), 'concentration');
    saturations{i} = strcat('t', num2str(i), 'saturation');
    temps{i} = strcat('t', num2str(i), 'temp');
    trials{i} = strcat('t', num2str(i));
end

rpms = [297, 297, 297, 260, 312, 335, 255]; % [rpm]
flowrates = [2, 6, 12, 6, 6, 6, 6]; % [L/min]
power = [100, 100, 100, 108, 111, 114, 105] - 71.6; % [W]
A_i = (0.292/2)^2 * pi; % [m^2]
h = 0.298; % [m]
experimental_kLa_error = [1, 2, 3, 2, 10, 4, 3] .* 1e-5;

% LHS equation 6 vs. time regression
C_A = henry * pO2; % [M]
for i=1:7
    C_T = m.(concentrations{i}).*0.000031251171918947004; % convert mg -> mol
    t_trunc.(trials{i}) = m.(times{i}) - m.(times{i})(1);
    t_trunc.(trials{i}) = t_trunc.(trials{i})(~isnan(t_trunc.(trials{i})));...
        %remove NaN values
    LHS.(trials{i}) = log((C_A-C_T)./(C_A-C_T(1)));
    LHS.(trials{i}) = LHS.(trials{i})(~isnan(LHS.(trials{i})));
    fitz.(trials{i}) = polyfitZero(t_trunc.(trials{i}), -LHS.(trials{i}), 1);
    continue;
end

% constant RPM varying flowrates
figure(1)
hold on
plot(t_trunc.t1, -LHS.t1, '.r')
plot(t_trunc.t2, -LHS.t2, '.g')
plot(t_trunc.t3, -LHS.t3, '.b')
% plot(t_trunc.t1, polyval(fitz.t1, t_trunc.t1), '-r', 'LineWidth', 1)
% plot(t_trunc.t2, polyval(fitz.t2, t_trunc.t2), '-g', 'LineWidth', 1)
% plot(t_trunc.t3, polyval(fitz.t3, t_trunc.t3), '-b', 'LineWidth', 1)
xlabel('Time [s]', 'Interpreter', 'latex')
ylabel('$$-\frac{C^*_A-C_A(t)}{C^*_A-C_{A,0}}$$', 'Interpreter', 'latex')
legend({'2 L$\cdot$min$^{-1}$', '6 L$\cdot$min$^{-1}$', '12 L$\cdot$min$^{-1}$'},...
    'Interpreter', 'latex')

figure(2)
hold on
plot(t_trunc.t7, -LHS.t7, '.r')
plot(t_trunc.t4, -LHS.t4, '.g')
plot(t_trunc.t5, -LHS.t5, '.b')
plot(t_trunc.t6, -LHS.t6, '.m')
% plot(t_trunc.t7, polyval(fitz.t7, t_trunc.t7), '-r', 'LineWidth', 1)
% plot(t_trunc.t4, polyval(fitz.t4, t_trunc.t4), '-g', 'LineWidth', 1)
% plot(t_trunc.t5, polyval(fitz.t5, t_trunc.t5), '-b', 'LineWidth', 1)
% plot(t_trunc.t6, polyval(fitz.t6, t_trunc.t6), '-m', 'LineWidth', 1)
xlabel('Time [s]', 'Interpreter', 'latex')
ylabel('$$-\frac{C^*_A-C_A(t)}{C^*_A-C_{A,0}}$$', 'Interpreter', 'latex')
legend({'255 rpm', '297 rpm', '312 rpm', '335 rpm'}, 'Interpreter', 'latex')

% theoretical
for i=1:7
    VRC.(trials{i}) = 2.6e-2 .* (power(i)./(A_i*h)).^0.4 .* (flowrates(i) /...
        (A_i * 1000 * 60)).^0.5;
end
theoretical_curve_x = 0:0.1:14;
theoretical_curve_y = 2.6e-2 .* (power(1)./(A_i*h)).^0.4 .* (theoretical_curve_x /...
        (A_i * 1000 * 60)).^0.5;

% predicted vs. experimental k_L
% constant RPM varying flowrates
figure(3)
hold on
% experimental
LHS_1e = [fitz.(trials{1})(1), fitz.(trials{2})(1), fitz.(trials{3})(1)];
errorbar(flowrates(1:3), LHS_1e, experimental_kLa_error(1:3), '.b',...
    'MarkerSize', 15,  'LineWidth', 1)
% theoretical
plot(theoretical_curve_x, theoretical_curve_y, '-r', 'LineWidth', 1)
xlim([0, 14])
xlabel('Flowrate [L$\cdot$min$^{-1}$]', 'Interpreter', 'latex')
ylabel('$k_La$ [s$^{-1}$]', 'Interpreter', 'latex')
legend({'Experimental (297 rpm)', 'Theoretical (297 rpm)'}, 'Interpreter', 'latex')

% constant flowrate varying RPM
figure(4)
hold on
% experimental
LHS_2e = [fitz.t7(1), fitz.t4(1), fitz.t5(1), fitz.t6(1)];
flow = [rpms(7), rpms(4), rpms(5), rpms(6)];
exp_err = [experimental_kLa_error(7), experimental_kLa_error(4),...
    experimental_kLa_error(5), experimental_kLa_error(6)];
errorbar(flow, LHS_2e, exp_err, '.b', 'MarkerSize', 15, 'LineWidth', 1)
% theoretical
LHS_2t = [VRC.t7(1), VRC.t4(1), VRC.t5(1), VRC.t6(1)];
plot(flow, LHS_2t, '.r', 'MarkerSize', 15, 'LineWidth', 1)
xlim([245, 345])
xlabel('Rotation Speed [rpm]', 'Interpreter', 'latex')
ylabel('$k_La$ [s$^{-1}$]', 'Interpreter', 'latex')
legend({'Experimental (6 L$\cdot$min$^{-1}$)', 'Theoretical (6 L$\cdot$min$^{-1}$)'},...
    'Interpreter', 'latex')