% 计算点p处的入射光线和反射光线方向向量
function [n_inline,n_outline]=F_IOline(p,a_s,y_s,n)
    % 直接根据太阳方位角和高度角计算入射方向向量
    % 负号因为光线从太阳射向点p
    n_inline = [-sin(y_s)*cos(a_s), -cos(y_s)*cos(a_s), -sin(a_s)];
    
    % 计算反射方向向量
    n_out = dot(n_inline, n);
    n_outline = n_inline - 2 * n_out * n;
    
    % 归一化
    n_inline = n_inline / norm(n_inline);
    n_outline = n_outline / norm(n_outline);
end
