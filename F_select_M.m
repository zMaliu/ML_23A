% 阴影区域 我们只计算100m外的 两个判断条件，到圆点的距离以及和圆点之间的夹角
% p 是单个点的坐标
function bool = F_select_M(a_s,y_s,p,Tower_site)
    a = p(1,1);
    b = p(1,2);
    theta = atan2(3.5,100);
    theta_p = atan2(a-Tower_site(1),b-Tower_site(2));
    % 判断条件
    distance_condition = ((a-Tower_site(1))^2 + (b-Tower_site(2))^2 < 80 / tan(a_s));
    angle_condition = (theta_p > y_s - theta) && (theta_p < y_s + theta);
    
    % 综合判断
    bool = distance_condition && angle_condition;
end