function X=make_matrix(x, n)
    % PARAMETRY WEJŚCIOWE:
    % x - wektor wartości xi
    % n - stopień wielomianu

    m = length(x);
    X = zeros(m, n+1);
    for i=1:m
        for j=n:-1:0
            X(i, n-j+1) = x(i)^j;
        end
    end
end