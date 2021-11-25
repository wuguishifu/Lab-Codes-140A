clc
clear

kLa = [295, 421, 421, 404, 642, 550, 423] .* 1e-5; % [s^-1]
kLa_errors = [1, 2, 3, 2, 10, 4, 3] .* 1e-5; % [s^-1]
rpms = [297, 297, 297, 260, 312, 335, 255]; % [rpm]
flowrates = [2, 6, 12, 6, 6, 6, 6]; % [L/min]
power = [100, 100, 100, 108, 111, 114, 105] - 71.6; % [W]
A_i = (0.292/2)^2 * pi; % [m^2]
h = 0.298; % [m]

% constant RPM
figure(5)
hold on
fitn.constant_rpm = polyfitn(log(flowrates(1:3)), log(kLa(1:3)), 1);
plot(log(flowrates(1:3)), log(kLa(1:3)), 'or')
plot(0.5:2.5, polyval(fitn.constant_rpm.Coefficients, 0.5:2.5), '-r')
xlabel('$\ln\left(u_{gs}\right)$', 'Interpreter', 'latex')
ylabel('$\ln\left(k_La\right)$', 'Interpreter', 'latex')
disp(['kLa slope for constant RPM = ', num2str(fitn.constant_rpm.Coefficients(1))])
disp(['Error = ', num2str(fitn.constant_rpm.ParameterStd(1))])
disp(['P Value = ', num2str(fitn.constant_rpm.p(1))])

% constant flowrate
figure(6)
hold on
fitn.constant_flowrate = polyfitn(log(power(4:7)./(A_i*h)), log(kLa(4:7)), 1);
plot(log(power(4:7)./(A_i*h)), log(kLa(4:7)), 'bo')
plot(7.4:0.1:7.7, polyval(fitn.constant_flowrate.Coefficients, 7.4:0.1:7.7), '-b')
xlabel('$$\ln\left(\frac{P_g}{V}\right)$$', 'Interpreter', 'latex')
ylabel('$\ln\left(k_La\right)$', 'Interpreter', 'latex')
disp(['kLa slope for constant flowrate = ', num2str(fitn.constant_flowrate.Coefficients(1))])
disp(['Error = ', num2str(fitn.constant_flowrate.ParameterStd(1))])
disp(['P Value = ', num2str(fitn.constant_flowrate.p(1))])
