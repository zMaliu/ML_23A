Tower=struct();%储存塔的属性结构体数组 包括坐标（x,y,z）、半径(R)
Mirrors=struct();%储存定日镜的属性结构体数组 Mirror为单个定日镜的结构化数组 包括坐标(x,y,z) 长宽(h,w)

for i=1:N%遍历时间
    %1、遍历确定未被塔阴影遮挡的定日镜
    Mirrors=[];%所有定日镜
    for j=1:N
        %F_Tower_beshadow:输入太阳方位角、高度角+定日镜中心坐标 返回true/false（是否在塔阴影里）
        %子函数F_Tower_shadow:输入太阳方位角、高度角 输出塔的阴影位置
        if F_Tower_beshadow
            %Mirrors去掉该点坐标
        end
    end
    
    %2、遍历Mirrors每个定日镜 进行阴影遮挡效率计算
    %F_36points:输入定日镜中心坐标 输出离散36个点的数组36points
    for j=1:N%每个定日镜
        %F_potential_tower:输入Mirrors数组 输出距离Mirrors(j)长度小于R的所有定日镜 即Mirrors
        for k=1:46%遍历36个点
            res=0;
            %F_IOline:输入点坐标、太阳方位角、高度角 输出入射/反射光线方向向量
            for h=1:length(Mirrors)
                %F_judge:输入点坐标 入射/反射向量 定日镜坐标、法向量 输出true/false(是否相交)
                if F_judge
                    res=res+1;
                end
            end
        end

    end

end