% ZADANIE 2.

function [x, t] = mullerMM2(f, x0, degree)
    % PARAMETRY WEJŚCIOWE:
    % f - funkcja anonimowa wyrażająca wielomian f(x)
    % x0 - punkt startowy
    % degree - stopień wielomianu

    % PARAMETRY WYJŚCIOWE:
    % x - wektor wszystkich pierwiastków wielomianu
    % t - czas wykonywania

    tic;
    x = zeros(degree, 1);
    x(1) = x0;

    for i=1:degree
        while (abs(f(x(i))) > 100 * eps)
            df = polynomial_derivative(f);
            d2f = polynomial_derivative(df);
    
            z1 = (-2 * f(x(i)))/(df(x(i)) + sqrt((df(x(i))^2 - 2 * f(x(i)) * d2f(x(i)))));
            z2 = (-2 * f(x(i)))/(df(x(i)) - sqrt((df(x(i)))^2 - 2 * f(x(i)) * d2f(x(i))));
    
            if abs(z2) > abs(z1)
                x(i) = x(i) + z1;
            else
                x(i) = x(i) + z2;
            end
        end

        % podzielić f przez (x - x0)
        f = polynomial_division(f, x(i));
    end
    t = toc;
end