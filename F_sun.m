function [a_s,y_s]=F_sun(month,hour,minute)
    D_list= [306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275];
    D=D_list(month);
    ST=hour+minute/60;
    w=(ST-12)*pi/12;
    phi=39.4;

    %赤纬角deta
    deta = asin(sin(2*pi*D/365)*sin(2*pi*23.45/360));

    %计算高度角
    phi_rad = deg2rad(phi);
    sin_alpha = cos(deta) * cos(phi_rad) * cos(w) + sin(deta) * sin(phi_rad);
    a_s = asin(sin_alpha); 
    cos_alpha = cos(a_s); % 高度角余弦值


    %计算方位角
    cos_Y = (sin(deta) - sin_alpha * sin(phi_rad)) / (cos_alpha * cos(phi_rad));
    y_s = acos(cos_Y); 
    % 上午（时角w<0）方位角为负，下午（w>0）为正
    if w < 0
        y_s = -y_s;
    end

end