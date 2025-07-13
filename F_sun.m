function [x,y,z]=F_sun(month,hour,minute)
    D_list=[306,337,0,31,61,92,122,153,184,214,245,275];
    D=D_list(month);
    ST=hour+minute/60;
    w=(ST-12)*15;
    weidu=39.4;

    %赤纬角delta
    delta = 23.45*sin(2*pi*(D+284)/365);

    %计算高度角
    weidu_rad = deg2rad(weidu);
    delta_rad = deg2rad(delta);
    w_rad = deg2rad(w);
    sin_alpha = cos(delta_rad) * cos(weidu_rad) * cos(w_rad) + sin(delta_rad) * sin(weidu_rad);
    sin_alpha = max(min(sin_alpha, 1), -1); 
    alpha_s_rad = asin(sin_alpha); 
    cos_alpha = cos(alpha_s_rad); % 高度角余弦值


    %计算方位角
    cos_Y = (sin(delta_rad) - sin(alpha_s_rad) * sin(phi_rad)) / (cos_alpha * cos(phi_rad));
    cos_Y = max(min(cos_Y, 1), -1); 
    Y_s_rad = acos(cos_Y); 
    % 上午（时角w<0）方位角为负，下午（w>0）为正
    if w < 0
        Y_s_rad = -Y_s_rad;
    end
    x = sin(Y_s_rad) * cos_alpha; 
    y = cos(Y_s_rad) * cos_alpha; 
    z = sin_alpha;

    x = round(x, 4);
    y = round(y, 4);
    z = round(z, 4);
end