function [A, b]=make_equations_1(n)
    A = zeros(n);
    b = zeros(n, 1);

    for i=1:n
        b(i) = 2.5 + 0.6 * i;
        for j=1:n
            if j == i
                A(i, j) = 3 * n^2 + (3 * i + 3) * n;
            else
                A(i, j) = 2 * (i + j) + 1;
            end
        end
    end
end
