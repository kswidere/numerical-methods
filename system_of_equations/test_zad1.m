n = [5 25 50 100 250 500 1000];
times = zeros(length(n), 1);
epsilons = zeros(length(n), 1);

for i=1:length(n)
    [A, b] = make_equations_1(n(i));
    [~, times(i), epsilons(i)] = cholesky_banachiewicz(A, b);
    disp(['Time: ' num2str(times(i))]);
    disp(['Epsilon: ' num2str(epsilons(i))]);
end

plot(n, times);
xlabel('n');
ylabel('time [s]');