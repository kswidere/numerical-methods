% ZADANIE 1.

function [x0, fx, i, t] = regula_falsi(f, a, b)
    % PARAMETRY WEJŚCIOWE:
    % f - funkcja anonimowa wyrażająca f(x)
    % a - początek przedziału izolacji pierwiastka
    % b - koniec przedziału izolacji pierwiastka

    % PARAMETRY WYJŚCIOWE:
    % x0 - pierwiastek funkcji
    % fx - wartość funkcji f(x0)
    % i - liczba iteracji
    % t - czas wykonywania

    tic;

    x0 = (a+b)/2;

    last_a_change = 0; % za każdym razem, gdy a się nie zmienia dodawane jeden;
                       % przy każdej zmianie zerowane
    last_b_change = 0;

    i = 0;

    % Jeśli w przedziale nie ma pierwiastka, rzucany wyjątek
    if f(a)*f(b) > 0
        ME = MException("RegulaFalsi:NoRoot", "Invalid interval: f(a)*f(b) > 0");
        throw(ME);
    end

    while (abs(f(x0)) > 100 * eps)
        i = i + 1;
        % Wyznaczenie c
        if (last_a_change < 2 && last_b_change < 2)
            c = (a * f(b) - b * f(a))/(f(b) - f(a));
        elseif (last_a_change >= 2)
            c = (a * f(b) - b * (f(a)/2))/(f(b) - (f(a)/2));
        else
            c = (a * (f(b)/2) - b * f(a))/((f(b)/2) - f(a));
        end

        % Wyznaczenie nowego przedziału
        if (f(a)*f(c) < 0)
            b = c;
            last_a_change = last_a_change + 1;
            last_b_change = 0;
        else
            a = c;
            last_a_change = 0;
            last_b_change = last_b_change + 1;
        end

        x0 = c;
    end

    t = toc;
    fx = f(x0);
end