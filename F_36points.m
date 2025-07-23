function point = F_36points(mirror_site,a_m,y_m)
    mirror_site = mirror_site{1};
    x=mirror_site(1);
    y=mirror_site(2);
    point=zeros(36,1);
    % 定日镜在地面坐标系下坐标
    pd=[x,y,4];

    for i=1:1:6
        for j=1:1:6
            pm = [-4+i,-4+j,0];
            point(i+j-1,1) = F_change_toland(a_m,y_m,pd,pm);
        end
    end
    point = num2cell(point,2);
end
