clc
clear

diameter = 0.0174; % pipe diameter [m]
area = (diameter/2)^2*pi; % cross sectional area of pipe [m^2]
rho_water = 997; % density of water [kg/m^3]

%   key:
%   "45 degree fitting": A
%   "quarter bend":      B
%   "quarter knee bend": C
%   "gate valve 100%":   D
%   "gate valve 50%":    E
%   "globe valve":       F

pipe.A = 1;
pipe.B = 9;
pipe.C = 15;
pipe.D = 23;
pipe.E = 32;
pipe.F = 41;
pipe.G = 49;

% flowrates and std errors [m^3/s]
q  = [
    22.78 36.06 49.39 297.40 442.36 516.89 547.36 579.44 255.25 306.12 469.65 ...
    528.03 550.68 556.88 49.03 52.27 52.31 114.43 219.37 272.73 313.89 326.70 ...
    11.95 11.95 29.10 39.41 50.88 51.13 296.33 298.25 342.77 9.00 21.49 21.86 ...
    32.35 43.71 49.42 93.50 127.59 170.00 8.44 20.14 23.74 31.23 39.90 86.87 128.02 156.43
    0.18 0.27 1.87 6.78 38.82 27.53 14.70 23.40 127.84 15.94 29.50 19.88 20.84 ...
    22.08 0.87 1.32 0.81 4.93 8.53 15.36 12.70 46.44 0.08 0.08 0.59 0.64 1.00 ...
    1.87 40.28 15.34 8.95 0.13 0.44 0.30 0.39 0.53 0.94 3.20 6.49 4.80 0.07 ...
    0.69 0.27 1.39 5.40 12.67 8.22 12.80
] ./ 10^6;

% pressure drop [Pa]
p = [0.2 0.5 1 25 45 92 90 97 17 37 55 75 83 82 0.3 1.6 1.5 12 46 68 91 89 ...
    0.3 0.5 1 1.3 3 2.5 192 180 205 0.5 3 3.5 6.5 22 24 90 160 320 2 7 8 23 ...
    38 235 392 548] .* 9.80665;
Re = reynolds(q(1,:), diameter);
K = 2.*p./rho_water./(q(1, :)./area).^2;

%% combined plots
clc

% fittings
fig9 = figure(9);
x = 0:100:4.5e4;
hold on
x = 0:100:4.5e4;
plot(Re(pipe.A:pipe.B-1), K(pipe.A:pipe.B-1), '.r')
fitn(1) = polyfitn(Re(pipe.A:pipe.B-1), K(pipe.A:pipe.B-1), 1);
plot(Re(pipe.B:pipe.C-1), K(pipe.B:pipe.C-1), '.g')
fitn(2) = polyfitn(Re(pipe.B:pipe.C-1), K(pipe.B:pipe.C-1), 0);
plot(Re(pipe.C:pipe.D-1), K(pipe.C:pipe.D-1), '.b')
fitn(3) = polyfitn(Re(pipe.C:pipe.D-1), K(pipe.C:pipe.D-1), 1);
plot(x, polyval(fitn(1).Coefficients, x), '-r')
plot(x, polyval(fitn(2).Coefficients, x), '-g')
plot(x, polyval(fitn(3).Coefficients, x), '-b')
xlabel('Re')
ylabel('K')
legend('45 Degree Fitting', 'Quarter Bend', 'Quarter Knee Bend')

% valves
fig10 = figure(10);
hold on
plot(Re(pipe.D:pipe.E-1), K(pipe.D:pipe.E-1), '.r')
fitn(4) = polyfitn(Re(pipe.D:pipe.E-1), K(pipe.D:pipe.E-1), 0);
plot(Re(pipe.E:pipe.F-1), K(pipe.E:pipe.F-1), '.g')
fitn(5) = polyfitn(Re(pipe.E:pipe.F-1), K(pipe.E:pipe.F-1), 1);
plot(Re(pipe.F:pipe.G-1), K(pipe.F:pipe.G-1), '.b')
fitn(6) = polyfitn(Re(pipe.F:pipe.G-1), K(pipe.F:pipe.G-1), 0);
plot(x, polyval(fitn(4).Coefficients, x), '-r')
plot(x, polyval(fitn(5).Coefficients, x), '-g')
plot(x, polyval(fitn(6).Coefficients, x), '-b')
xlabel('Re')
ylabel('K')
legend('Gate Valve 100% Open', 'Gate Valve 50% Open', 'Globe Valve 100% Open')

disp('p')
for i = 1:6
    disp(fitn(i).p)
end
disp('c')
for i = 1:6
    disp(fitn(i).Coefficients)
end

%% laminar and turbulent separate regressions
clc
close all

% fittings
fig11 = figure(11);
xt = 4000:10:4.5e4;
hold on
plot_points(Re(pipe.A:pipe.B-1), K(pipe.A:pipe.B-1), 'r')
plot_points(Re(pipe.B:pipe.C-1), K(pipe.B:pipe.C-1), 'g')
plot_points(Re(pipe.C:pipe.D-1), K(pipe.C:pipe.D-1), 'b')

fitn_t(1) = polyfitn(Re(pipe.A+3:pipe.B-1), K(pipe.A+3:pipe.B-1), 0);
fitn_t(2) = polyfitn(Re(pipe.B:pipe.C-1), K(pipe.B:pipe.C-1), 0);
fitn_t(3) = polyfitn(Re(pipe.C+3:pipe.D-1), K(pipe.C+3:pipe.D-1), 0);
plot(xt, polyval(fitn_t(1).Coefficients, xt), '-r')
plot(xt, polyval(fitn_t(2).Coefficients, xt), '-g')
plot(xt, polyval(fitn_t(3).Coefficients, xt), '-b')

h1(1) = plot(NaN, NaN, 'sr', 'MarkerFaceColor', 'r');
h1(2) = plot(NaN, NaN, 'sg', 'MarkerFaceColor', 'g');
h1(3) = plot(NaN, NaN, 'sb', 'MarkerFaceColor', 'b');
h1(4) = plot(NaN, NaN, 'ok');
h1(5) = plot(NaN, NaN, '^k');
h1(6) = plot(NaN, NaN, '*k');
% leg1 = legend(h1, '45 Degree Fitting', 'Quarter Bend', 'Quarter Knee Bend', ...
%     'Laminar', 'Transitional', 'Turbulent');
xlabel('Re')
ylabel('K')

% valves
fig12 = figure(12);
xt = 4000:10:2.5e4;
xl = 0:10:2100;
hold on
plot_points(Re(pipe.D:pipe.E-1), K(pipe.D:pipe.E-1), 'r')
plot_points(Re(pipe.E:pipe.F-1), K(pipe.E:pipe.F-1), 'g')
plot_points(Re(pipe.F:pipe.G-1), K(pipe.F:pipe.G-1), 'b')

fitn_t(4) = polyfitn(Re(pipe.D+6:pipe.E-1), K(pipe.D+6:pipe.E-1), 0);
fitn_t(5) = polyfitn(Re(pipe.E+6:pipe.F-1), K(pipe.E+6:pipe.F-1), 0);
fitn_t(6) = polyfitn(Re(pipe.F+5:pipe.G-1), K(pipe.F+5:pipe.G-1), 0); % p value with slope is 0.1620
plot(xt, polyval(fitn_t(4).Coefficients, xt), '-r')
plot(xt, polyval(fitn_t(5).Coefficients, xt), '-g')
plot(xt, polyval(fitn_t(6).Coefficients, xt), '-b')

% for i = 1:3
%     disp(fitn_l(i).Coefficients)
%     disp(fitn_l(i).p)
% end

% for i = 1:6
%     disp(fitn_t(i).Coefficients)
%     disp(fitn_t(i).p)
% end

% plot(xl, polyval(fitn_l(1).Coefficients, xl), '--r')
% plot(xl, polyval(fitn_l(2).Coefficients, xl), '--g')
% plot(xl, polyval(fitn_l(3).Coefficients, xl), '--b')

h2(1) = plot(NaN, NaN, 'sr', 'MarkerFaceColor', 'r');
h2(2) = plot(NaN, NaN, 'sg', 'MarkerFaceColor', 'g');
h2(3) = plot(NaN, NaN, 'sb', 'MarkerFaceColor', 'b');
h2(4) = plot(NaN, NaN, 'ok');
h2(5) = plot(NaN, NaN, '^k');
h2(6) = plot(NaN, NaN, '*k');
h2(7) = plot(NaN, NaN, '-k');
h2(8) = plot(NaN, NaN, '--k');
% leg2 = legend(h2, 'Gate Valve 100% Open', 'Gate Valve 50% Open', 'Globe Valve 100% Open', ...
%     'Laminar', 'Transitional', 'Turbulent', 'Turbulent Regression', 'Laminar Regression');
xlabel('Re')
ylabel('K')

% laminar regressions for valves
figure(101)

fitn_l(1) = polyfitn(log(Re(pipe.D:pipe.D+2)), log(K(pipe.D:pipe.D+2)), 0);
fitn_l(2) = polyfitn(log(Re(pipe.E:pipe.E+2)), log(K(pipe.E:pipe.E+2)), 0);
fitn_l(3) = polyfitn(log(Re(pipe.F:pipe.F+2)), log(K(pipe.F:pipe.F+2)), 0);

hold on
plot(log(Re(pipe.D:pipe.D+2)), log(K(pipe.D:pipe.D+2)), 'r.')
plot(log(Re(pipe.E:pipe.E+2)), log(K(pipe.E:pipe.E+2)), 'g.')
plot(log(Re(pipe.F:pipe.F+2)), log(K(pipe.F:pipe.F+2)), 'b.')
xlabel('ln(Re)')
ylabel('ln(K)')
x = 6.2:0.1:7.8;
plot(x, polyval(fitn_l(1).Coefficients, x), 'r-')
plot(x, polyval(fitn_l(2).Coefficients, x), 'g-')
plot(x, polyval(fitn_l(3).Coefficients, x), 'b-')
legenw = legend('Gate Valve 100% Open', 'Gate Valve 50% Open', 'Globe Valve 100% Open');

for i = 1:3
    disp(fitn_l(i).Coefficients)
    disp(fitn_l(i).p)
end

%% bar clark
clc
y = [0.32 0.35; 0.32 0.45; 1.00 0.75; 2.21 0.17; 11.6 4.3; 29 9];
model_error = [0.02; 0.03; 0.02; 0.14; 0.04; 3];
b = barh(y);
xlim([0 40])
xlabel('K')
hold on
yticklabels({'45 Degree Fitting', 'Quarter Bend', 'Quarter Knee Bend', 'Gate Valve 100% Open', 'Gate Valve 50% Open', '    Globe Valve 100% Open'});

xtips1 = b(1).YEndPoints;
ytips1 = b(1).XEndPoints;
labels1 = ["0.32 "+char(177)+" 0.02", "0.32 "+char(177)+" 0.03", "1.00 "+char(177)+" 0.02", "2.21 "+char(177)+" 0.14", "11.6 "+char(177)+" 0.4", "29 "+char(177)+" 3"];
text(xtips1 + model_error' + 1, ytips1, labels1, 'VerticalAlignment', 'middle')

xtips2 = b(2).YEndPoints + 0.3;
ytips2 = b(2).XEndPoints;
labels2 = string(b(2).YData);
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xerr = xtips1';
yerr = ytips1';
errorbar(xerr, yerr, model_error, 'horizontal', 'k', 'linestyle', 'none', 'LineWidth', 1)
legend({'Experimental', 'Theoretical'}, 'Location', 'best')

%% bar


fig16 = figure(16);
K_exp = [0 0 0 0 0 0];
K_std = [0 0 0 0 0 0];
for i = 1:6
    K_exp(i) = fitn_t(i).Coefficients(1);
    K_std(i) = fitn_t(i).ParameterStd(1);
end
K_lit = [0.35, 0.45, 0.75, 0.17, 4.3, 9.0];
bar_x = categorical(["45 Degree Fitting", "Quarter Bend", "Quarter Knee Bend", ...
    "Gate Valve 100% Open", "Gate Valve 50% Open", "Globe Valve 100% Open"]);
bar_x = reordercats(bar_x, ["45 Degree Fitting", "Quarter Bend", "Quarter Knee Bend", ...
    "Gate Valve 100% Open", "Gate Valve 50% Open", "Globe Valve 100% Open"]);
bar_y = [
    K_exp(1), K_lit(1)
    K_exp(2), K_lit(2)
    K_exp(3), K_lit(3)
    K_exp(4), K_lit(4)
    K_exp(5), K_lit(5)
    K_exp(6), K_lit(6)
];
bar_y_error = [
    K_std(1), 0
    K_std(2), 0
    K_std(3), 0
    K_std(4), 0
    K_std(5), 0
    K_std(6), 0
];
bar_graph = bar(bar_x, bar_y);
ylim([0 50])
hold on
[ngroups, nbars] = size(bar_y);
x_bar = nan(nbars, ngroups);
for i = 1:nbars
    x_bar(i,:) = bar_graph(i).XEndPoints;
end
errorbar(x_bar(1,:)', bar_y(:,1), bar_y_error(:,1), 'k', 'LineStyle', 'None', 'LineWidth', 1)
% for i = 1:6
%     text(x_bar(1, i), (bar_y(i, 1) + bar_y_error(i, 1) + 1), (num2str(round(bar_y(i, 1), 2, ...
% 'significant'),'%.2g') + "$\pm$" + num2str(round(bar_y_error(i, 1), 2, 'significant'),'%.2g')), ...
% 'interpreter', 'latex', 'Rotation', 90)
% end
% for i = 1:6
%     text(x_bar(2, i), (bar_y(i, 2) + bar_y_error(i, 2) + 1), num2str(bar_y(i, 2)), ...
% 'interpreter', 'latex', 'Rotation', 90)
% end

angle = 60;

text(x_bar(1, 1), (bar_y(1, 1) + bar_y_error(1, 1) + 1), "0.32"+char(177)+"0.02", 'rotation', angle)
text(x_bar(1, 2), (bar_y(2, 1) + bar_y_error(2, 1) + 1), "0.32"+char(177)+"0.03", 'rotation', angle)
text(x_bar(1, 3), (bar_y(3, 1) + bar_y_error(3, 1) + 1), "1.00"+char(177)+"0.02", 'rotation', angle)
text(x_bar(1, 4), (bar_y(4, 1) + bar_y_error(4, 1) + 1), "2.21"+char(177)+"0.14", 'rotation', angle)
text(x_bar(1, 5), (bar_y(5, 1) + bar_y_error(5, 1) + 1), "11.6"+char(177)+"0.4" , 'rotation', angle)
text(x_bar(1, 6), (bar_y(6, 1) + bar_y_error(6, 1) + 1), "29"  +char(177)+"3"   , 'rotation', angle)

text(x_bar(2, 1), (bar_y(1, 2) + 1), "0.35", 'rotation', angle)
text(x_bar(2, 2), (bar_y(2, 2) + 1), "0.45", 'rotation', angle)
text(x_bar(2, 3), (bar_y(3, 2) + 1), "0.75", 'rotation', angle)
text(x_bar(2, 4), (bar_y(4, 2) + 1), "0.17", 'rotation', angle)
text(x_bar(2, 5), (bar_y(5, 2) + 1), "4.3",  'rotation', angle)
text(x_bar(2, 6), (bar_y(6, 2) + 1), "36",   'rotation', angle)

ylabel('K value')
leg3 = legend('Experimental', 'Literature');
leg3.set('Position', [0.1446 0.8194 0.2173 0.0837])

function fig = plot_points(Re, K, color)
    for i = 1:length(Re)
        if Re(i) < 2100
            plot(Re(i), K(i), 'o', 'Color', color)
        elseif Re(i) < 4000
            plot(Re(i), K(i), '^', 'Color', color)
        else
            plot(Re(i), K(i), '*', 'Color', color)
        end
    end
end
