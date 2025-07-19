% 绕x轴顺时针转a_m 绕z轴顺时针转y_m 
function points_onland = F_change_toland(a_m,y_m,Mirror_onland,points_onMirror)
    T_a = [1,0,0;
           0,cos(a_m),sin(a_m);
           0,-sin(a_m),cos(a_m)];
    T_b = [cos(y_m),sin(y_m),0;
            -sin(y_m),cos(y_m),0;
            0,0,1];
    T = T_a * T_b;
    % 右乘，我们输入的向量是行向量
    points_onland=points_onMirror*T+Mirror_onland;
end
