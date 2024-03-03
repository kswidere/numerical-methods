function [x, y, h, delta] = RK2(f, xspan, y0, h0, hmin, eps_w, eps_b, s)
    % PARAMETRY WEJŚCIOWE:
    % f - równania różniczkowe
    % xspan - zakres badanych wartości, np. [0 20]
    % y0 - y-ki początkowe, np. [8 8]
    % h0 - początkowa długość kroku
    % hmin - minimalna długość kroku
    % eps_w - błąd względny
    % eps_b - błąd bezwzględny
    % s - współczynnik bezpieczeństwa

    % PARAMETRY WYJŚCIOWE:
    % x - wektor iksów
    % y - macierz igreków
    % h - wektor kolejnych wartości długości kroku
    % delta - macierz wartości oszacowań błędu

    % rezerwowane nadmiarowe miejsce - później rozmiar zostanie zmniejszony
    y = zeros(1000, length(y0));
    y(1, :) = y0;
    x = zeros(1000, 1);
    x(1) = xspan(1);
    h = zeros(1000, 1);
    h(1) = h0;
    delta = zeros(1000, length(y0));

    n = 1;   % licznik iteracji
    
    xn = x(1);
    hn = h(1);
    yn = y(1, :)';

    while (xn <= xspan(2))
        % nachylenie początkowe
        k_p = f(xn, yn);
        y_pred = yn + k_p * hn;
    
        % nachylenie końcowe
        k_k = f(xn + hn, y_pred);

        % nachylenie średnie
        k = (k_p + k_k)/2;

        % obliczenie nowej wartości y
        y_new = (yn + k * hn);

        % obliczenie y dla dwóch kroków o 1/2 dł.
        hn_half = hn / 2;
        y_half_pred = yn + k_p * hn_half;
        k_half_k = f(xn + hn_half, y_half_pred);
        k_half = (k_p + k_half_k)/2;
        y_half_new = (yn + k_half * hn_half);
        
        k_half_p = f(xn + hn_half, y_half_new);
        y_half_pred = y_half_new + k_half_p * hn_half;
        k_half_k = f(xn + hn, y_half_pred);
        k_half = (k_half_p + k_half_k)/2;
        y_half_new = (y_half_new + k_half * hn_half);

        % szacowanie błędu
        delta_n = (y_half_new - y_new)/3;
        delta(n, :) = delta_n';
        epsilon = abs(y_half_new) * eps_w + eps_b;

        % współczynnik korekty długości
        alpha = min((epsilon ./ abs(delta_n)) .^ (1/3));

        % nowa długość kroku
        h_new = s * alpha * hn;

        % aktualizowanie długości kroku
        if (s * alpha >= 1)
            if (xn + hn == xspan(2))
                break
            end
            n = n + 1;
            xn = xn + hn;
            x(n) = xn;
            hn = min([h_new, 5 * hn, xspan(2)-xn]);
            h(n) = hn;
            yn = y_new;
            y(n, :) = yn';
        elseif (h_new < hmin)
            ME = MException("RK2:ImpossibleTask", "Can't solve with given precision");
            throw(ME);
        else
            hn = h_new;
            h(n) = hn;
        end
    end

    y = y(1:n, :);
    x = x(1:n);
    h = h(1:n);
    delta = delta(1:n, :);
end