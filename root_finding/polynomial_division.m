function div_f = polynomial_division(f, x0)
    % PARAMETRY WEJŚCIOWE:
    % f - funkcja anonimowa wyrażająca wielomian f(x)
    % x0 - dzielenie wielomianu przez (x-x0)
    % degree - stopień wielomianu f(x)

    % PARAMETRY WYJŚCIOWE:
    % f - podzielona funkcja
    
    % znalezienie współczynników wielomianu
    sym_f = sym(f);
    coefficients = coeffs(sym_f, 'All');
    
    degree = length(coefficients) - 1;
    new_coeffs = zeros(1, degree);
    
    new_coeffs(1) = coefficients(1);
    for i = 2:degree
        new_coeffs(i) = new_coeffs(i-1) * x0 + coefficients(i);
    end

    % stworzenie funkcji anonimowej z wartości nowych współczynników
    div_f = @(x) sum(arrayfun(@(i) new_coeffs(i) * x.^(degree-i), 1:degree));

end