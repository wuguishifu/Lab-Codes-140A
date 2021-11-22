clc
clear

% defining constants
henry = 1.3e-3; % [M/atm] (25C)
pO2 = 0.21; % [atm]

% defining data
m = readtable("exp_6_raw_data.csv");

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

rpms = [297, 297, 297, 260, 312, 335, 255]; % rpm
flowrate = [2, 6, 12, 6, 6, 6, 6]; % L/min
power = [100, 100, 100, 108, 111, 114, 105] - 71.6;
A_i = (0.292/2)^2 * pi;
h = 0.298;

%%
figure(2)
plot(m.(times{4}) - m.(times{4})(1), m.(concentrations{4}))
C_A = henry * pO2; % [M]
c = m.(concentrations{4}).*0.000031251171918947004;
LHS.(trials{4}) = log((C_A-c)./(C_A-c(1)));
figure(3)
plot(m.(times{4}) - m.(times{4})(1), -LHS.(trials{4}))

%% plot LHS equation 6 vs. time
clc

for i=1:7
    % calculate C*_A using henry's law
    C_A = henry * pO2; % [M]
    c = m.(concentrations{i}).*0.000031251171918947004;
    LHS.(trials{i}) = log((C_A-c)./(C_A-c(1)));
    figure(i)
    plot(m.(times{i}) - m.(times{i})(1), -LHS.(trials{i}))

    
end

%% theoretical
for i=1:7
    VNC.(trials{i}) = 2.6e-2 .* (power(i)./(A_i*h)).^0.4 .* (flowrate(i) / (A_i * 1000 * 60)).^0.5;
%     figure(i)
%     plot(m.(times{i}), polyval([VNC.(trials{i}) 0], m.(times{i})));
end

%% time v conc
for i=1:7
    figure(i)
    plot(m.(times{i}), m.(concentrations{i}))
end
