function pm = F_change_toMirror(a_m,y_m,pd,p)
    T_a = [1,0,0;
           0,cos(a_m),-sin(a_m);
           0,sin(a_m),cos(a_m)];
    T_b = [cos(y_m),-sin(y_m),0;
            sin(y_m),cos(y_m),0;
            0,0,1];
    T_a_inv = T_a'; % 由于 T_a 是正交矩阵，其逆等于转置
    T_b_inv = T_b'; % 由于 T_b 是正交矩阵，其逆等于转置
    T = T_b_inv * T_a_inv; % 利用 (AB)^-1 = B^-1 A^-1
    pm = (p - pd) * T;
end