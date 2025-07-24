clc;clear;
%时刻(月 小时 分钟) 元素为列表 [month,hour,moment]
Momments={};
months = 1:12; 
hours = [9, 10, 12, 13, 15]; 
minutes = [0, 30, 0, 30, 0]; 
h = 4;
r = 15;
data=readtable("data.xlsx");
%镜子中心坐标集合 元素为列表 [x,y]
Mirrors={};
for i=1:height(data)
    Mirrors{i}=[data{i,1},data{i,2},h];
end

for month = months
    for i = 1:length(hours)
        Momments{end+1} = [month, hours(i), minutes(i)];
    end
end

arrry_n_light=zeros(1,60);
array_n_sb=[];
array_n_trunc=[];
array_n_cos=[];
array_n_at=[];
n_ref=0.92;
%part1：计算每个定日镜的阴影遮挡效率n_sb  以数组array_n_sb输出
for i=1:length(Momments)%遍历时刻
    month=Momments{i}(1);
    hour=Momments{i}(2);
    momment=Momments{i}(3);
    [a_s,y_s]=F_sun(month,hour,momment);
    total_n_light=0;
    new_Mirrors=[];
    %1.1、遍历确定未被塔阴影遮挡的定日镜
    for j=1:length(Mirrors)
        mirror_site=Mirrors{j};
        %F_select_M:输入太阳方位角、高度角、点坐标 
        % 返回true/false（是否在塔阴影里）
        
        if not(F_select_M(a_s,y_s,mirror_site))
            new_Mirrors{end + 1} = mirror_site;
        end
    end
    
    %1.2、遍历Mirrors每个定日镜 进行阴影遮挡效率计算
    for j=1:length(new_Mirrors)%每个定日镜
        mirror_site=Mirrors{j};
        tower_site=[0,0,80];

        %part3：计算大气透射率 以数组array_n_at输出
        n_cos=F_n_cos(a_s,y_s,mirror_site,tower_site);
        n_at=F_n_at(mirror_site,tower_site);
        array_n_at=[array_n_at,n_at];
        array_n_cos=[array_n_cos,n_cos];

        %F_potential_tower:输入Mirrors数组 输出距离Mirrors(j)长度小于R的所有定日镜 即potential_Mirrors
        potential_Mirrors=F_potential_tower(mirror_site,new_Mirrors,r);

        %F_36points:输入定日镜中心坐标 输出离散36个点的数组36points
        [n,a_m,y_m]=F_mirror(a_s,y_s,mirror_site,tower_site);
        list_36points=F_36points(mirror_site,a_m,y_m);
        % 没有被遮挡到的点的集合 new_points
        new_points={};
        res=0;
        for k=1:36%遍历36个点
            pointsite_36=list_36points{k};
            %F_IOline:输入点坐标、太阳方位角、高度角 输出入射/反射光线方向向量
            [n_inline,n_outline]=F_IOline(pointsite_36,a_s,y_s,n);
            % 判断点是否被遮挡
            sign = true;
            for h=1:length(potential_Mirrors)
                point_inMb=potential_Mirrors{h};
                [n_Mb,a_m,y_m]=F_mirror(a_s,y_s,point_inMb,tower_site);
                %F_judge:输入点坐标 入射/反射向量 定日镜坐标、法向量 输出true/false(是否相交)
                if F_judge(pointsite_36,n_inline,n_outline,point_inMb,n_Mb)
                    sign = false;

                end
            end
            if sign
                new_points{end + 1} = pointsite_36;
                res=res+1;
            end
        end
        n_sb=res/36;%单个定日镜的遮挡效率
        array_n_sb=[array_n_sb,n_sb];

        %part4：计算截断效率 以数组array_n_trunc输出
        total_points_in36=length(new_points);
        n_trunc=F_n_trunc(new_points,a_s,y_s,n);
        array_n_trunc=[array_n_trunc,n_trunc];

        n_light=n_trunc*n_sb*n_at*n_cos*n_ref;
        total_n_light=total_n_light+n_light;
    end
    arrry_n_light(i)=total_n_light;
end

