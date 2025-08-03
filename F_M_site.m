function M_site = F_M_site(tower_x, tower_y, N_mirrors, M_square)
% 生成 N_mirrors 个坐标，允许重复；
% 仅跳过以下两种情形：
%   1) 落在大圆外
%   2) 离塔 ≤ 100 m
% 其余直接写入结果，不检查间距。

    R = 350;
    minDist2Tower = 100;

    % 预分配
    M_site = zeros(N_mirrors, 2);

    % 生成循环
    k = 0;
    while k < N_mirrors
        theta = 2*pi*rand();
        r = R*sqrt(rand());
        x = r*cos(theta);
        y = r*sin(theta);
        pt = [x, y];

        % 只检查是否在大圆内且离塔足够远
        if norm(pt) <= R && norm(pt - [tower_x, tower_y]) > minDist2Tower
            k = k + 1;
            M_site(k, :) = pt;
        end
    end
end