% 镜面坐标系a转到大地坐标系
% pd 是定日镜的坐标 a_m:镜子方位角 y_m:镜子俯仰角 pm 是节点在定日镜下的坐标
% 输出是节点在大地坐标系下的坐标
function p = F_ma_to_d(pd,a_m,y_m,pm)
    T = [cos(y_m),sin(y_m)*sin(a_m),-sin(y_m)*cos(a_m);
        -sin(a_m),cos(y_m)*sin(a_m),-cos(y_m)*cos(a_m);
        0,cos(a_m),sin(a_m)];
    p=T*pm+pd;
end
