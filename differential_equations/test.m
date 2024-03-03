f1 = @(t, y) y(2) + y(1) * (0.3 - y(1)^2 - y(2)^2);
f2 = @(t, y) - y(1) + y(2) * (0.3 - y(1)^2 - y(2)^2);

f = @(t, y) [f1(t, y); f2(t, y)];
tspan = [0 40];
y0 = [-0.01 -0.01];


tic
[xr,yr, h, delta] = RK2(f, tspan, y0, 0.1, 1e-5, 1e-5, 1e-5, 0.9);
tr = toc;

[xo, yo] = ode45(f, tspan, y0);

plot(yr(:, 1), yr(:, 2), '-o', yo(:, 1), yo(:, 2), '-o');

legend("rk2", "ode45");