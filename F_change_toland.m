% 绕x轴顺时针转a_m 绕z轴顺时针转y_m 
function points_onland = F_change_toland(a_m,y_m,Mirror_onland,points_onMirror)
    a_m_rad = deg2rad(a_m);
    y_m_rad = deg2rad(y_m);
    T_a = [1,0,0;
           0,cos(a_m_rad),sin(a_m_rad);
           0,-sin(a_m_rad),cos(a_m_rad)];
    T_b = [cos(y_m_rad),sin(y_m_rad),0;
            -sin(y_m_rad),cos(y_m_rad),0;
            0,0,1];
    T = T_a * T_b;
    % 右乘，我们输入的向量是行向量
    points_onland=points_onMirror*T+Mirror_onland;
end
