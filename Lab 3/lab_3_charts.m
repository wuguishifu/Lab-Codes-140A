clc
clear

dry_mass = 40.0; % [g]
areas = [197.92, 197.92, 197.92, 122.5, 122.5, 122.5]; % cm^2

% time data with all values such that X2-X1=0 removed
times.t1 = [0, 162, 310, 402, 548, 688, 830, 974, 1122, 1264, 1414, 1558, 1704, 1860, 2008, 2156, 2300, 2444, 2592, 2738, 2894];
times.t2 = [0, 54, 134, 274, 420, 564, 710, 844, 998, 1152, 1280, 1424, 1566, 1708, 1860, 2012, 2176];
times.t3 = [0, 146, 308, 454, 604, 746, 890, 1034, 1178, 1334, 1484, 1506, 1638];
times.t4 = [0, 60, 120, 240, 482, 638, 780, 928, 1072, 1222, 1368, 1520, 1668, 1812, 1956, 2098, 2240, 2388, 2436, 2736, 2874, 3018, 3236, 3386, 3546, 3700, 3864, 4012, 4156, 4302, 4460, 4760, 4908, 5048, 5202, 5360, 5504];
times.t5 = [0, 120, 212, 352, 480, 624, 772, 918, 1054, 1220, 1360, 1508, 1656, 1810, 1948, 2102, 2246, 2382, 2526, 2668, 2806, 2950, 3098, 3236];
times.t6 = [0, 77, 154, 302, 456, 612, 758, 882, 1030, 1166, 1306, 1450];
trials = fieldnames(times);

% mass data with all values such that X2-X1=0 removed
masses.t1 = [42, 41.8, 41.7, 41.5, 41.5, 41.3, 41.2, 41.1, 40.9, 40.8, 40.7, 40.6, 40.5, 40.5, 40.3, 40.3, 40.2, 40.1, 40.1, 40.1, 40];
masses.t2 = [42, 41.8, 41.7, 41.4, 41.3, 41.2, 41, 40.9, 40.8, 40.7, 40.6, 40.4, 40.3, 40.2, 40.2, 40.2, 40];
masses.t3 = [42, 41.6, 41.4, 41.2, 41, 40.9, 40.8, 40.6, 40.5, 40.3, 40.3, 40.1, 40];
masses.t4 = [42, 42, 42, 41.9, 41.8, 41.7, 41.6, 41.6, 41.6, 41.5, 41.4, 41.3, 41.2, 41.2, 41.1, 40.9, 40.9, 40.8, 40.8, 40.7, 40.7, 40.7, 40.7, 40.6, 40.5, 40.5, 40.5, 40.4, 40.4, 40.3, 40.3, 40.2, 40.2, 40.2, 40.1, 40.1, 40];
masses.t5 = [42, 41.9, 41.8, 41.6, 41.5, 41.5, 41.3, 41.1, 41.1, 40.9, 40.9, 40.8, 40.7, 40.6, 40.5, 40.5, 40.3, 40.3, 40.2, 40.2, 40.2, 40.2, 40.1, 40];
masses.t6 = [42, 41.7, 41.5, 41.3, 41, 40.8, 40.6, 40.4, 40.3, 40.2, 40.1, 40];

for i = 1:length(trials)
    moisture_content.(trials{i}) = (masses.(trials{i}) - dry_mass) ./ dry_mass;
    for j = 2:1:length(masses.(trials{i}))
        drying_rate.(trials{i})(j) = (areas(i)/dry_mass) * (moisture_content.(trials{i})(j) - moisture_content.(trials{i})(j-1));% / (times.(trials{i})(j) - times.(trials{i})(j-1));
    end
end

% moisture content vs. time 
figure(1)
hold on
for i = 1:length(trials)
    y = moisture_content.(trials{i});
    x = times.(trials{i});
    plot(x, y, '.')
end
xlabel('Time [s]')
ylabel('Moisture Content')
legend('Trial 1', 'Trial 2', 'Trial 3', 'Trial 4', 'Trial 5', 'Trial 6')
title('Moisture Content vs. Time')

% drying rate vs. time
figure(2)
hold on
for i = 1:length(trials)
    y = drying_rate.(trials{i});
    x = times.(trials{i});
    plot(x, y, '.')
end
xlabel('Time [s]')
ylabel('Drying Rate [g/cm^2\cdots]')
legend('Trial 1', 'Trial 2', 'Trial 3', 'Trial 4', 'Trial 5', 'Trial 6')
title('Drying Rate vs. Time')

% drying rate vs. moisture content
figure(3)
hold on
for i = 1:length(trials)
    y = flip(drying_rate.(trials{i}), 2);
    x = flip(moisture_content.(trials{i}), 2);
    plot(x, y, '.')
end
xlabel('Moisture Content')
ylabel('Drying Rate [g/cm^2\cdots]')
legend('Trial 1', 'Trial 2', 'Trial 3', 'Trial 4', 'Trial 5', 'Trial 6')
title('Drying Rate vs. Moisture Content')
