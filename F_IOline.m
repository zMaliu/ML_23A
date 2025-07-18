% 假定太阳距离原点500m 这样才可以假定太阳的坐标
function [n_inline,n_outline]=F_IOline(p,a_s,y_s)
    l = 500;
    % x y 坐标可以为负数，但是 z 为正数
    I_x=-sin(y_s_rad)*cos(a_s_rad);
    I_y=-cos(y_s_rad)*cos(a_s_rad);
    I_z=-sin(a_s_rad);
end