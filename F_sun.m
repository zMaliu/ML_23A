function [a_s,y_s]=F_sun(month,hour,minute)
    D_list= [21, 52, 80, 111, 141, 172, 202, 233, 264, 294, 325, 355];
    D=D_list(month);
    ST=hour+minute/60;
    w=(ST-12)*15;
    phi=39.4;

    %赤纬角deta
    deta = 23.45*sin(2*pi*(D+284)/365);

    %计算高度角
    phi_rad = deg2rad(phi);
    delta_rad = deg2rad(deta);
    w_rad = deg2rad(w);
    sin_alpha = cos(delta_rad) * cos(phi_rad) * cos(w_rad) + sin(delta_rad) * sin(phi_rad);
    sin_alpha = max(min(sin_alpha, 1), -1); 
    a_s = asin(sin_alpha); 
    cos_alpha = cos(a_s); % 高度角余弦值


    %计算方位角
    cos_Y = (sin(delta_rad) - sin(a_s) * sin(phi_rad)) / (cos_alpha * cos(phi_rad));
    cos_Y = max(min(cos_Y, 1), -1); 
    y_s = acos(cos_Y); 
    % 上午（时角w<0）方位角为负，下午（w>0）为正
    if w < 0
        y_s = -y_s;
    end

end