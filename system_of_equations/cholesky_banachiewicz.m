% ZADANIE 1.

function [x, t, e]=cholesky_banachiewicz(A, b)
    % PARAMETRY WYJŚCIOWE:
    % x - rozwiązanie
    % t - czas wykonywania
    % e - błąd

    tic

    n = width(A);
    L = zeros(n);
    y = zeros(n, 1);
    x = zeros(n, 1);
    
    % Wyznaczenie macierzy L
    for i=1:n
        L(i, i) = sqrt(A(i, i) - sum(L(i, 1:(i-1)).^2));
        for j=(i+1):n
            L(j, i) = (A(j, i) - sum(L(j, 1:(i-1)) .* L(i, 1:(i-1))))/L(i, i);
        end
    end

    % Wyznaczenie rozwiązania y równania Ly = b
    for i=1:n
        cur_val = L(i, :) * y;
        y(i) = (b(i) - cur_val)/L(i, i);
    end
    
    % Wyznaczenie rozwiązania x równania L'x = y
    LT = L';
    for i=n:-1:1
        cur_val = LT(i, :) * x;
        x(i) = (y(i) - cur_val)/LT(i, i);
    end

    t = toc;
    e = norm(A*x - b);
end
