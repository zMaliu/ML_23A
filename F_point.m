% 输入节点的坐标以及方位角和俯仰角，输出对应的36个点的坐标
function point = F_point(x,y,a_m,y_m)
    point=zeros(6,6,3);
    pd=[x,y,4];
    % 在镜面坐标系下转换成大地坐标系
    % pm 是在定日镜下的坐标
    for i=1:1:6
        for j=1:1:6
            pm = [-4+i,-4+j,0];
            point(i,j) = F_ma_to_d(pd,a_m,y_m,pm);
        end
    end
end
