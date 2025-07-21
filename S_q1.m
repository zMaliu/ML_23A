Mirrors={};%镜子中心坐标集合 元素为列表 [x,y]
Momments={};%时刻(月 小时 分钟) 元素为列表 [month,hour,moment]

array_n_at=[];
array_n_trunc=[];
%part1：计算每个定日镜的阴影遮挡效率n_sb  以数组array_n_sb输出
array_n_sb=[];
for i=1:len(Momments)%遍历时刻
    month=Momments{i}(1);
    hour=Momments{i}(2);
    momment=Momments{i}(3);
    [a_s,y_s]=F_sun(month,hour,momment);
    %1.1、遍历确定未被塔阴影遮挡的定日镜
    for j=1:len(Mirrors)
        mirror_site=Mirrors{j};
        %F_select_M:输入太阳方位角、高度角、点坐标 
        % 返回true/false（是否在塔阴影里）
        
        if F_select_M(a_s,y_s,mirror_site)
            %Mirrors去掉该点坐标
            Mirrors{j}=[];
        end
    end
    
    %1.2、遍历Mirrors每个定日镜 进行阴影遮挡效率计算
    for j=1:len(Mirrors)%每个定日镜
        mirror_site=Mirrors{j};
        mirror_site=[mirror_site,4];
        tower_site=[0,0,80];

        %part3：计算大气透射率 以数组array_n_at输出
        %F_n_at
        n_at=F_n_at(mirror_site,tower_site);
        array_n_at=[array_n_at,n_at];

        %F_potential_tower:输入Mirrors数组 输出距离Mirrors(j)长度小于R的所有定日镜 即potential_Mirrors
        potential_Mirrors=F_potential_tower(mirror_site,Mirrors,9);

        %F_36points:输入定日镜中心坐标 输出离散36个点的数组36points
        [n,a_m,y_m]=F_mirror(a_s,y_s,mirror_site,tower_site);
        list_36points=F_36points(mirror_site,a_m,y_m);
        for k=1:36%遍历36个点
            pointsite_36=list_36points{k};
            res=0;
            new_points={};
            %F_IOline:输入点坐标、太阳方位角、高度角 输出入射/反射光线方向向量
            [n_inline,n_outline]=F_IOline(pointsite_36,a_s,y_s,n);
            for h=1:len(potential_Mirrors)
                point_inMb=potential_Mirrors{h};
                [n_Mb,a_m,y_m]=F_mirror(a_s,y_s,point_inMb,tower_site,n_Mb);
                %F_judge:输入点坐标 入射/反射向量 定日镜坐标、法向量 输出true/false(是否相交)
                if not F_judge(pointsite_36,n_inline,n_outline,point_inMb,n_Mb)
                    res=res+1;
                    new_points{end+1}=potential_Mirrors;
                end
            end
        end
        n_sb=res/36;%单个定日镜的遮挡效率
        array_n_sb=[array_n_sb,n_sb];

        %part4：计算截断效率 以数组array_n_trunc输出
        total_points_in36=len(new_points);
        n_trunc=F_n_trunc(new_points,a_s,y_s,n);
        array_n_trunc=[array_n_trunc,n_trunc];
    end

end

%part2：计算余弦效率 以数组array_n_cos输出

%part5：计算镜面反射率 以数组array_n_ref输出
n_ref=0.92;
array_n_ref=n_ref*ones(1,len(Mirrors));
%finalpart：五因素数组相乘再相加 得到年平均光学效率