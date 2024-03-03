f = @(x) x^4 + 0.9 * x^3 - 6 * x^2 + 3 * x -1;

x = linspace(-4, 3, 100000);
y = zeros(100000, 1);

for i=1:100000
    y(i) = f(x(i));
end

yline(0);
hold on;
xlabel("x");
hold on;
ylabel("f(x)", "Rotation", 0);
hold on;
plot(x, y);
hold on;

[x, t] = mullerMM2(f, -4, 4);

str = [num2str(real(x(1)))];
text(real(x(1))+0.05, 3, str);

str = [num2str(real(x(4)))];
text(real(x(4))+0.05, -3, str);

scatter(x(1), 0);
scatter(x(4), 0);

% e = zeros(1, 4);
% for i=1:4
%     e(i) = abs(f(x(i)) - 0);
% end
% yline(0);
% hold on;
% xline(0);
% hold on;
% xlabel("Real");
% ylabel("Imaginary");
% 
% for i=1:4
%     str = [num2str(real(x(i)), 3) num2str(imag(x(i)), 3)];
%     text(real(x(i))+0.05, imag(x(i))+0.03, str);
% end
% scatter(real(x), imag(x));