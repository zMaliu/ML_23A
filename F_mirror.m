%a_m:镜子方位角 y_m:镜子俯仰角 site表示坐标（m:镜子 t：塔顶）
function [n,a_m,y_m]=F_mirror(a_s,y_s,m_site,t_site)
    %入射向量I
    I_x=-sin(y_s)*cos(a_s);
    I_y=-cos(y_s)*cos(a_s);
    I_z=-sin(a_s);
    I=[I_x,I_y,I_z];
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
        az_rad=atan2(n(1),n(2));  
        a_m=rad2deg(az_rad);
        a_m=mod(a_m,360); 
    end
    %俯仰角m_el
    el_rad=asin(n(3));  % 法线与水平面夹角
    y_m=rad2deg(el_rad);
end