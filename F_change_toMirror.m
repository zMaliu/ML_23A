function pm = F_change_toMirror(a_m,y_m,pd,p)
    T_a = [1,0,0;
           0,cos(a_m),-sin(a_m);
           0,sin(a_m),cos(a_m)];
    T_b = [cos(y_m),-sin(y_m),0;
            sin(y_m),cos(y_m),0;
            0,0,1];
    T_a_inv = T_a'; 
    T_b_inv = T_b'; 
    T = T_b_inv * T_a_inv; 
    pm = (p - pd) * T;
end