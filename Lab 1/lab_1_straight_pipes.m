clc
clear

% pipe physical data
lengths = [1 1 1 1]; % pipes 1, 2, 3, 4 [m]
diameters = [0.004 0.0075 0.0168 0.0174]; % pipes 1, 2, 3, 4 [m]
areas = (diameters/2).^2 * pi; % pipes 1, 2, 3, 4 [m^2]
rho_water = 997; % [kg/m^3]
mu_water = 0.001787;

laminar_slopes_theoretical = 32.*0.001787./diameters.^2;
laminar_slopes_experimental = [1924.68, 635.31, 429.91, 172.00];

turbulent_slopes_theoretical = [0 0 0 0];
turbulent_intercepts_theoretical = [0 0 0 0];

%% laminar flow
clc

% pipe 1 laminar flow theoretical vs. experimental
fig1 = figure(1);
v = [6.57 2.35 5.46 1.15] .* 1e-6 ./ areas(1);
e = [0.08 0.01 0.06 0.01] .* 1e-6 ./ areas(1);
p = [105, 40, 80, 22] .* 9.80665;
hold on
x = 0:0.1:0.6;
errorbar(v, p, e, '.b', 'horizontal')
plot(x, polyval([1924.678 0], x), '-b')
text(0.3, 397.403, ["y = 1924.68x"; "R^2=0.9969"])
plot(x, polyval([32*0.001787/diameters(1)^2 0], x), '--r')
xlabel('Velocity [m s^{-1}]')
ylabel('\DeltaP [Pa]')
l = legend('Experimental', 'Regression', 'Theoretical');
set(l, 'Position', [0.1387 0.7929 0.2173 0.1214])

% pipe 2 laminar flow theoretical vs. experimental
fig2 = figure(2);
v = [12.85 11.93  6.60] .* 1e-6 ./ areas(2);
e = [ 0.22  0.18  0.02] .* 1e-6 ./ areas(2);
p = [22 15 8] .* 9.80665;
hold on
x = 0:0.1:0.4;
errorbar(v, p, e, '.b', 'horizontal')
plot(x, polyval([635.31 0], x), '-b')
text(0.3, 145, ["y = 635.31x"; "R^2=0.9755"])
plot(x, polyval([32*0.001787/diameters(2)^2 0], x), '--r')
xlabel('Velocity [m s^{-1}]')
ylabel('\DeltaP [Pa]')
l = legend('Experimental', 'Regression', 'Theoretical');
set(l, 'Position', [0.1387 0.7929 0.2173 0.1214])

% pipe 3 laminar flow theoretical vs. experimental
fig3 = figure(3);
v = [12.15 21.28 22.88] .* 1e-6 ./ areas(3);
e = [ 0.11  0.21  0.16] .* 1e-6 ./ areas(3);
p = [2, 5, 4] .* 9.80665;
hold on
x = 0:0.01:0.15;
errorbar(v, p, e, '.b', 'horizontal')
plot(x, polyval([429.91 0], x), '-b')
text(0.08, 30, ["y = 429.91x"; "R^2=0.9763"])
plot(x, polyval([32*0.001787/diameters(3)^2 0], x), '--r')
xlabel('Velocity [m s^{-1}]')
ylabel('\DeltaP [Pa]')
l = legend('Experimental', 'Regression', 'Theoretical');
set(l, 'Position', [0.1387 0.7929 0.2173 0.1214])

% pipe 4 laminar flow theoretical vs. experimental
fig4 = figure(4);
v = [9.22 12.83 28.25] .* 1e-6 ./ areas(4);
e = [0.15  0.36  0.28] .* 1e-6 ./ areas(4);
p = [1 2 1.5] .* 9.80665;
hold on
x = 0:0.01:0.15;
errorbar(v, p, e, '.b', 'horizontal')
plot(x, polyval([172.00 0], x), '-b')
text(0.08, 11.5, ["y = 172.00x"; "R^2=0.7857"])
plot(x, polyval([32*0.001787/diameters(4)^2 0], x), '--r')
xlabel('Velocity [m s^{-1}]')
ylabel('\DeltaP [Pa]')
l = legend('Experimental', 'Regression', 'Theoretical');
set(l, 'Position', [0.1387 0.7929 0.2173 0.1214])

%% turbulent flow
clc

f = [0 0 0];
r = @(u, fr, d) log(fr * rho_water * 0.5 / d) + 2*log(u);

% pipe 1 turbulent flow theoretical vs. experimental
fig5 = figure(5);
q = [13.72 14.28 15.92] .* 1e-6;
e = [ 0.30  0.23  0.13] .* 1e-6 ./ areas(1);
p = [625 600 725] .* 9.80665;
v = q./areas(1);
f = haaland(reynolds(q, diameters(1)), 0, diameters(1)); % f factor calc
x = 0.05:0.01:0.25;
hold on
errorbar(log(v), log(p), e./v, '.b', 'horizontal')
plot(x, polyval([1.153 8.582], x), '-b')
fitn = polyfitn(log(v), r(v, f, diameters(1)), 1);
plot(x, polyval(fitn.Coefficients, x), '--r')
text(0.17, 8.75, ["y = 1.153x + 8.582"; "R^2=0.7959"])
xlabel('ln(v)')
ylabel('ln(\DeltaP)')
l = legend('Experimental', 'Regression', 'Theoretical');
set(l, 'Position', [0.1387 0.7929 0.2173 0.1214])
turbulent_slopes_theoretical(1) = fitn.Coefficients(1);
turbulent_intercepts_theoretical(1) = fitn.Coefficients(2);
fitn_t(1) = fitn;

% pipe 2 turbulent flow theoretical vs. experimental
fig6 = figure(6);
q = [25.29  26.57  31.72] .* 1e-6;
e = [ 0.66   0.16   0.35] .* 1e-6 ./ areas(2);
p = [76.00  80.00 108.00] .* 9.80665;
v = q./ areas(2);
f = haaland(reynolds(q, diameters(2)), 0, diameters(2));
x = -0.6:0.01:-0.3;
hold on
errorbar(log(v), log(p), e./v, '.b', 'horizontal')
plot(x, polyval([1.589 7.489], x), '-b')
fitn = polyfitn(log(v), r(v, f, diameters(2)), 1);
plot(x, polyval(fitn.Coefficients, x), '--r')
text(-0.43, 6.75, ["y = 1.589x + 7.489"; "R^2=0.9945"])
xlabel('ln(v)')
ylabel('ln(\DeltaP)')
l = legend('Experimental', 'Regression', 'Theoretical');
set(l, 'Position', [0.1387 0.7929 0.2173 0.1214])
turbulent_slopes_theoretical(2) = fitn.Coefficients(1);
turbulent_intercepts_theoretical(2) = fitn.Coefficients(2);
fitn_t(2) = fitn;

% pipe 3 turbulent flow theoretical vs. experimental
fig7 = figure(7);
q = [164.85 127.44 283.07] .* 1e-6;
e = [  3.88   3.26   8.24] .* 1e-6 ./ areas(4);
p = [108.00  58.00 355.00] .* 9.80665;
v = q./ areas(4);
f = haaland(reynolds(q, diameters(4)), 0.0003, diameters(4));
x = -0.8:0.01:0.6;
hold on
errorbar(log(v), log(p), e./v, '.b', 'horizontal')
plot(x, polyval([2.181 7.729], x), '-b')
fitn = polyfitn(log(v), r(v, f, diameters(4)), 1);
plot(x, polyval(fitn.Coefficients, x), '--r')
text(-0.09, 7.1, ["y = 2.181x + 7.729"; "R^2=0.9987"])
xlabel('ln(v)')
ylabel('ln(\DeltaP)')
l = legend('Experimental', 'Regression', 'Theoretical');
set(l, 'Position', [0.1387 0.7929 0.2173 0.1214])
turbulent_slopes_theoretical(3) = fitn.Coefficients(1);
turbulent_intercepts_theoretical(3) = fitn.Coefficients(2);
fitn_t(3) = fitn;

% pipe 4 turbulent flow theoretical vs. experimental
fig8 = figure(8);
q = [187.76 294.40 835.59] .* 1e-6;
e = [  8.61  37.67 101.31] .* 1e-6 ./ areas(4);
p = [ 48.00 119.00 602.00] .* 9.80665;
v = q./ areas(4);
f = haaland(reynolds(q, diameters(4)), 0, diameters(4));
x = -0.4:0.01:1.4;
hold on
errorbar(log(v), log(p), e./v, '.b', 'horizontal')
plot(x, polyval([1.669 6.614], x), '-b')
fitn = polyfitn(log(v), r(v, f, diameters(4)), 1);
plot(x, polyval(fitn.Coefficients, x), '--r')
text(0.67, 7.4, ["y = 1.669x + 6.614"; "R^2=0.9959"])
xlabel('ln(v)')
ylabel('ln(\DeltaP)')
l = legend('Experimental', 'Regression', 'Theoretical');
set(l, 'Position', [0.1387 0.7929 0.2173 0.1214])
turbulent_slopes_theoretical(4) = fitn.Coefficients(1);
turbulent_intercepts_theoretical(4) = fitn.Coefficients(2);
fitn_t(4) = fitn;

%% error graphs
fig14 = figure(14);
xlim([0 4000])
ylim([0 4000])
hold on
plot(laminar_slopes_experimental(1), laminar_slopes_theoretical(1), 'ro', ...
    'MarkerFaceColor', 'r')
plot(laminar_slopes_experimental(2), laminar_slopes_theoretical(2), 'rp', ...
    'MarkerFaceColor', 'r')
plot(laminar_slopes_experimental(3), laminar_slopes_theoretical(3), 'rs', ...
    'MarkerFaceColor', 'r')
plot(laminar_slopes_experimental(4), laminar_slopes_theoretical(4), 'r^', ...
    'MarkerFaceColor', 'r')
plot(0:100:4000, polyval([1 0], 0:100:4000), 'k')
legend('Pipe 1', 'Pipe 2', 'Pipe 3', 'Pipe 4')
xlabel('Experimental')
ylabel('Theoretical')

fig15 = figure(15);
hold on
turbulent_slopes_experimental = [1.153 1.589 2.181 1.669];
plot(turbulent_slopes_experimental(1), turbulent_slopes_theoretical(1), 'go', ...
    'MarkerFaceColor', 'g')
plot(turbulent_slopes_experimental(2), turbulent_slopes_theoretical(2), 'gp', ...
    'MarkerFaceColor', 'g')
plot(turbulent_slopes_experimental(3), turbulent_slopes_theoretical(3), 'gs', ...
    'MarkerFaceColor', 'g')
plot(turbulent_slopes_experimental(4), turbulent_slopes_theoretical(4), 'g^', ...
    'MarkerFaceColor', 'g')
plot(1:0.1:2.5, polyval([1 0], 1:0.1:2.5), 'k')
legend('Pipe 1', 'Pipe 2', 'Pipe 3', 'Pipe 4')
xlabel('Experimental')
ylabel('Theoretical')

fig16 = figure(16);
hold on
turbulent_intercepts_experimental = [8.582 7.489 7.729 6.614];
plot(turbulent_intercepts_experimental(1), turbulent_intercepts_theoretical(1), ...
    'bo', 'MarkerFaceColor', 'b')
plot(turbulent_intercepts_experimental(2), turbulent_intercepts_theoretical(2), ...
    'bp', 'MarkerFaceColor', 'b')
plot(turbulent_intercepts_experimental(3), turbulent_intercepts_theoretical(3), ...
    'bs', 'MarkerFaceColor', 'b')
plot(turbulent_intercepts_experimental(4), turbulent_intercepts_theoretical(4), ...
    'b^', 'MarkerFaceColor', 'b')
plot(6:1:10, polyval([1 0], 6:1:10), 'k')
legend('Pipe 1', 'Pipe 2', 'Pipe 3', 'Pipe 4')
xlabel('Experimental')
ylabel('Theoretical')

%% pipe 3 roughness calculation
clc
clear

% pipe 3 physical data
length = 1; % [m]
diameter = 0.0174; % [m]
diameter_rough = 0.0168; % [m]
area = (diameter/2).^2 * pi; % [m^2]
rho_water = 997; % [kg/m^3]
mu_water = 0.001787;

q = [164.85 127.44 283.07] .* 1e-6;
p = [108.00  58.00 355.00] .* 9.80665;
v = q./ area;

% calculate friction factor using equation 5
f_experimental = p .* 2 .* diameter ./ v.^2 ./ rho_water;
f_theoretical = haaland(reynolds(q, diameter), 0.0003, diameter);
f_error = 100 * (f_experimental - f_theoretical) ./ f_theoretical;

epsilon = invHaaland(f_experimental, diameter, reynolds(q, diameter));
disp(epsilon)
