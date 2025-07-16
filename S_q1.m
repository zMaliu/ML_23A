Tower=[];
Mirrors=[];

for i=1:N%遍历时间
    %1、遍历确定未被塔阴影遮挡的定日镜
    for j=1:N
        %F_select_M:输入太阳方位角、高度角、点坐标 返回true/false（是否在塔阴影里）
        if F_select_M
            %Mirrors去掉该点坐标
        end
    end
    
    %2、遍历Mirrors每个定日镜 进行阴影遮挡效率计算
    %F_36points:输入定日镜中心坐标 输出离散36个点的数组36points
    for j=1:N%每个定日镜
        %F_potential_tower:输入Mirrors数组 输出距离Mirrors(j)长度小于R的所有定日镜 即Mirrors
        for k=1:36%遍历36个点
            res=0;
            %F_IOline:输入点坐标、太阳方位角、高度角 输出入射/反射光线方向向量
            for h=1:length(Mirrors)
                %F_judge:输入点坐标 入射/反射向量 定日镜坐标、法向量 输出true/false(是否相交)
                if F_judge
                    res=res+1;
                end
            end
        end
        effect_n=res/36;%单个定日镜的遮挡效率
    end

end