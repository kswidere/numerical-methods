function a=LZNK_QR(x, y, n)
    % PARAMETRY WEJŚCIOWE:
    % x - wektor wartości xi
    % y - wektor wartości yi = f(xi)
    % n - stopień wielomianu

    % PARAMETR WYJŚCIOWY:
    % a - wektor współczynników wielomianu przybliżającego f(x)

    % aby rozwiązać należy rozwiązać układ równań
    %   Ra = Q'y
    X = make_matrix(x, n);
    a = zeros(n+1, 1);

    [Q, R] = qr(X);

    b = Q' * y;

    for i=n:-1:1
        cur_val = R(i, :) * a;
        a(i) = (b(i) - cur_val)/R(i, i);
    end
end