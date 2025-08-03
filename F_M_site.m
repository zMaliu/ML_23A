function M_site = F_M_site(tower_x, tower_y, N_mirrors, M_square)
% F_M_site 在半径 350 的圆内随机生成 N_mirrors 个点
% 1) 所有点不重合
% 2) 所有点离 (tower_x, tower_y) 的距离 > 100
% 3) 任意两点之间距离 > (M_square + 5)
% 4) 所有点（含塔位置）位于以 (0,0) 为圆心、半径 350 的圆内
%
% 输入:
%   tower_x, tower_y : 塔坐标
%   N_mirrors        : 需要生成的点数
%   M_square         : 用于计算最小间距
%
% 输出:
%   M_site : N_mirrors×2 矩阵，每行一个点的 [x, y]

    M_site = zeros(N_mirrors, 2);
    R = 350;                         
    minDist2Tower = 100;             
    minDistBetween = M_square + 5;  
    
    % 检查塔自身是否在大圆内
    if sqrt(tower_x^2 + tower_y^2) >= R
        error('塔坐标超出大圆范围！');
    end
    
    % 生成点
    for k = 1:N_mirrors
        found = false;
        attempts = 0;
        maxAttempts = 10000;          % 防止死循环
        
        while ~found && attempts < maxAttempts
            attempts = attempts + 1;
            
            % 均匀圆内随机
            theta = 2*pi*rand();
            r = R*sqrt(rand());
            x = r*cos(theta);
            y = r*sin(theta);
            pt = [x, y];
            
            % 检查离塔距离
            if norm(pt - [tower_x, tower_y]) <= minDist2Tower
                continue;
            end
            
            % 检查与已有点的距离
            if k > 1
                dists = sqrt(sum((M_site(1:k-1,:) - pt).^2, 2));
                if any(dists <= minDistBetween)
                    continue;
                end
            end
            
            % 通过所有检查
            M_site(k, :) = pt;
            found = true;
        end
        
        if ~found
            error('无法在约束条件下生成 %d 个点。', N_mirrors);
        end
    end
end