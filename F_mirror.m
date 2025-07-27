%a_m:镜子方位角 y_m:镜子俯仰角 site表示坐标（m:镜子 t：塔顶）
function [n,a_m,y_m]=F_mirror(a_s,y_s,m_site,t_site)
    %坐标
    l = 10000;
    I_x=sin(y_s)*cos(a_s)*l;
    I_y=cos(y_s)*cos(a_s)*l;
    I_z=sin(a_s)*l;
    p=[I_x,I_y,I_z];
    %入射向量
    i=m_site-p;
    I=i/norm(i);
    %反射向量R
    r=t_site-m_site;
    R=r/norm(r);
    %法向量n
    n=R-I;
    n=n/norm(n);
    %方位角m_az
    nh = sqrt(n(1)^2+n(2)^2); 
    if nh<1e-10  % 避免法线垂直时的除零问题
        a_m=0;
    else
        a_m=atan2(n(1),n(2));  
    end
    %俯仰角y_m 法线与竖直方向的夹角
    y_m=n(3);
end