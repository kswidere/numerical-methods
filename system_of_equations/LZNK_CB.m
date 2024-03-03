% ZADANIE 3.

function a=LZNK_CB(x, y, n)
    % PARAMETRY WEJŚCIOWE:
    % x - wektor wartości xi
    % y - wektor wartości yi = f(xi)
    % n - stopień wielomianu

    % PARAMETR WYJŚCIOWY:
    % a - wektor współczynników wielomianu przybliżającego f(x)

    % aby rozwiązać należy rozwiązać układ równań
    %   X'Xa = X'y

    X = make_matrix(x, n);
    A = X' * X;
    b = X' * y;
    a = cholesky_banachiewicz(A, b);
end