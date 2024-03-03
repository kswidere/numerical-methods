function [a, b] = find_root_isolation_interval(f, x0)
    % PARAMETRY WEJŚCIOWE:
    % f - funkcja anonimowa wyrażająca f(x)
    % x0 - punkt startowy przedziału

    % PARAMETRY WYJŚCIOWE:
    % a - początek przedziału izolacji pierwiastka
    % b - koniec przedziału izolacji pierwiastka

    a = x0;
    b = x0 + 1;
    
    while (f(a)*f(b) > 0)
        b = b+(b-a);
    end
end
