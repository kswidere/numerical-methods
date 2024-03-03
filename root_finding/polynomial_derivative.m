function df = polynomial_derivative(f)
    % PARAMETRY WEJŚCIOWE:
    % f - funkcja anonimowa wyrażająca wielomian f(x)

    % PARAMETRY WYJŚCIOWE:
    % df - funkcja anonimowa wyrażająca pochodną wielomianu f(x)

    h = sqrt(eps);
    df = @(x) (f(x + h) - f(x - h)) / (2 * h);
end