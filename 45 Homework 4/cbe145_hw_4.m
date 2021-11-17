t = 0:0.1:10;
y1 = 12+t+t.^2./3+0.5.*heaviside(t);
y2 = 12+t+t.^2./3;
plot(t, y1)
hold on
plot(t, y2)
legend('(a)', '(b)')
xlabel('t')
ylabel('p(t)')