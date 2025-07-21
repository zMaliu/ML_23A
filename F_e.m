function e = F_e(a_s,n,n_i)
    h = 3;
    g = 1.366;
    a = 0.4237 - 0.00821 * (6-h)^2;
    b = 0.5055 + 0.00595 * (6.5-h)^2;
    c = 0.2711 + 0.01858 * (2.5-h)^2;
    dni = g * (a + b * exp(-c/sin(a_s)));
    e = dni * n * n_i;
end