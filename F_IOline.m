% 假定太阳距离原点10000m 这样才可以假定太阳的坐标
function [n_inline,n_outline]=F_IOline(p,a_s,y_s,n)
    % x y 坐标可以为负数，但是 z 为正数
    l=10000;
    x=sin(y_s)*cos(a_s)*l;
    y=cos(y_s)*cos(a_s)*l;
    z=sin(a_s)*l;
    % 入射光线
    n_in = p-[x,y,z];
    n_inline = n_in/norm(n_in);
    % 计算反射方向
    n_outline = n_inline + n;
    n_outline = n_outline / norm(n_outline);
end