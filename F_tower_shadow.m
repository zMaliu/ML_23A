function tower_shadow=F_tower_shadow(Mirror,Tower,a_s,y_s)
    %完全遮挡
    if a_s<1e-6
        tower_shadow=1;
        return;
    end
    %塔高、塔长与太阳半张角
    H_tower=Tower.z;
    R_tower=Tower.R;
    sigma=4.65e-3;

    n_shadow=[-cos(a_s)*sin(y_s),-cos(a_s)*cos(y_s)];%阴影方向向量
    L_shadow=H_tower/tan(a_s);%阴影长度
    Center_shadow=[tower.x,tower.y]+n_shadow*L_shadow;%阴影中心坐标
    R_shadow=R_tower+H_tower*tan(sigma)/tan(a_s);%阴影半径

    d=norm([Mirror.x-Center_shadow(1),Mirror.y-Center_shadow(2)]);%定日镜与阴影的距离
    mirror_diag=sqrt((Mirror.w/2)^2+(Mirror.h/2)^2);%定日镜半对角线
    
    if d>=R_shadow+mirror_diag
        tower_shadow=0;
    elseif d+mirror_diag<=R_shadow
        tower_shadow=1;
    else%计算阴影面积占比
        area=
        tower_shadow=area/(Mirror.w*Mirror.h);
    end
end