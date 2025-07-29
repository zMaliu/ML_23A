% 射出去到达集热器的点/每个镜子实际射出去的点
function n_trunc = F_n_trunc(points,a_s,y_s,n_m)
    points = cell2mat(points.');
    n = size(points,1);
    r = 3.5;
    zmin = 80;
    zmax = 88;
    ta_n = 0;
    % 遍历每个点，得到每个点的反射光线
    for i=1:1:n
        p = points(i,:);
        [~,n_outline]=F_IOline(p,a_s,y_s,n_m);
        x = p(1); y = p(2); z = p(3);
        dx = n_outline(1); dy = n_outline(2); dz = n_outline(3);

        A = dx^2 + dy^2;
        B = 2*(x*dx + y*dy);
        C = x^2 + y^2 - r^2;
        % 计算判别式
        delta = B^2 - 4*A*C;
        % 求出两个根
        sqrtDelta = sqrt(delta);
        t1 = (-B - sqrtDelta) / (2*A);
        t2 = (-B + sqrtDelta) / (2*A);

        % 取最小的非负根
        t = inf;
        if t1 >= 0
            t = t1;
        elseif t2 >= 0
            t = t2;
        else
            hitFlag = false;
        end

        % 查看高度是否在范围内
        z_hit = z + t*dz;
        hitFlag = (z_hit >= zmin) && (z_hit <= zmax);
        if hitFlag
            ta_n = ta_n + 1;
        end

    end
    n_trunc = ta_n / n;
end