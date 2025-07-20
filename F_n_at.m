function n_at = F_n_at(p_Mirror,p)
    d = norm(p-p_Mirror);
    n_at = 0.99321 - 0.0001176 * d + 1.97 * d^2 * 1e-8;
end