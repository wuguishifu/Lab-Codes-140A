clc
clear

% defining data
m = readtable("exp_6_raw_data.csv");

times = strings(1, 7);
concentrations = strings(1, 7);
saturations = strings(1, 7);
temps = strings(1, 7);

for i = 1:7
    times{i} = strcat('t', num2str(i), 'time');
    concentrations{i} = strcat('t', num2str(i), 'concentration');
    saturations{i} = strcat('t', num2str(i), 'saturation');
    temps{i} = strcat('t', num2str(i), 'temp');
end

rpms = [297, 297, 297, 260, 312, 335, 255]; % rpm
flowrate = [2, 6, 12, 6, 6, 6, 6]; % L/min

%% plot LHS equation 6 vs. time
clc
for i=1:7
    LHS.(i) = 
end
