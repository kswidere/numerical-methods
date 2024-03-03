f = @(x) -1.65+0.3*x-x*exp(-0.5*x);
x = linspace(-4, 10);
y = zeros(100, 1);
for i=1:100
    y(i) = f(x(i));
end

start = -4;
stop = 10;
x_regulafalsi = zeros(10, 1);
f_regulafalsi = zeros(10, 1);
i_regulafalsi = zeros(10, 1);
t_regulafalsi = zeros(10, 1);
x_newton = zeros(10, 1);
f_newton = zeros(10, 1);
i_newton = zeros(10, 1);
t_newton = zeros(10, 1);
i = 1;
while (1)
    [a, b] = find_root_isolation_interval(f, start);
    if b > stop
        break
    end
    disp(a);
    disp(b);
    [x_regulafalsi(i), f_regulafalsi(i), i_regulafalsi(i), t_regulafalsi(i)] = regula_falsi(f, a, b);
    [x_newton(i), f_newton(i), i_newton(i), t_newton(i)] = newton(f, b, 100 * eps, 1000);
    start = b;
    i = i + 1;
end

yline(0);
hold on;
plot(x, y);
hold on;
str = ["x_1 = " num2str(x_regulafalsi(1))]
text(x_regulafalsi(1), f(x_regulafalsi(1)), str)
scatter(x_regulafalsi(1), f(x_regulafalsi(1)));

str = ["x_2 = " num2str(x_regulafalsi(2))]
text(x_regulafalsi(2), f(x_regulafalsi(2)), str)
scatter(x_regulafalsi(2), f(x_regulafalsi(2)));