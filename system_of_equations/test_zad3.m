x = [-10 -8 -6 -4 -2 0 2 4 6 8 10];
y = [2.008 -3.668 -4.916 -1.870 -0.045 0.550 -0.839 -1.011 2.613 14.615 39.655];
n = [3 5 7 9 10];
epsilons_CB = zeros(length(n), 1);
epsilons_QR = zeros(length(n), 1);
eps_inf_CB = zeros(length(n), 1);
eps_inf_QR = zeros(length(n), 1);

for i=1:(length(n))
    pcb = LZNK_CB(x, y', n(i));
    pqr = LZNK_QR(x, y', n(i));

    y_cb = polyval(pcb, x);
    y_qr = polyval(pqr, x);

    epsilons_CB(i) = norm(y-y_cb);
    epsilons_QR(i) = norm(y-y_qr);

    eps_inf_CB(i) = norm(y-y_cb, inf);
    eps_inf_QR(i) = norm(y-y_qr, inf);
end

