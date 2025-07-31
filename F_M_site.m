% 约束：定日镜之间的距离 - sqrt(x2) > 5，定日镜没有分布在（0，x1）为圆心的半径100m内，
% 只分布在半径为350m内，输出格式是x(4)*2
function M_site = F_M_site(x1, x2, x4)
    % 在半径350的圆内生成x4个点，满足：
    % 1. 不在以 (0, x1) 为圆心、半径100的圆内
    % 2. 任意两点间距离 > 5
    % 输入:
    %   x1 - 小圆的y坐标（圆心为 (0, x1)）
    %   x2 - 用于计算最小距离（当前未使用，但保留接口）
    %   x4 - 需要生成的点数量
    % 输出:
    %   M_site - x4×2矩阵，每行是一个点的(x,y)坐标
    
    M_site = zeros(x4, 2);  % 预分配内存
    small_center = [0, x1]; % 小圆圆心
    small_radius = 100;     % 小圆半径
    big_radius = 350;       % 大圆半径
    min_distance = sqrt(x2);       % 最小点间距
    
    for i = 1:x4
        attempts = 0;
        max_attempts = 1000; % 防止无限循环
        while attempts < max_attempts
            % 极坐标法生成均匀随机点
            theta = 2 * pi * rand();      % 随机角度 [0, 2π]
            r = big_radius * sqrt(rand()); % 随机半径 [0, 350]
            x = r * cos(theta);
            y = r * sin(theta);
            
            % 检查是否在小圆外
            dx = x - small_center(1);
            dy = y - small_center(2);
            if dx^2 + dy^2 < small_radius^2
                attempts = attempts + 1;
                continue;  % 在小圆内，重新生成
            end
            
            valid = true;
            for j = 1:i-1
                dist = sqrt((x - M_site(j,1))^2 + (y - M_site(j,2))^2);
                if dist <= min_distance
                    valid = false;
                    break;
                end
            end
            
            if valid
                M_site(i, :) = [x, y];  % 符合条件，存储
                break;
            else
                attempts = attempts + 1;
            end
        end
        
        if attempts >= max_attempts
            warning('Failed to find a valid point after %d attempts for point %d.', max_attempts, i);
            M_site(i, :) = [NaN, NaN];  % 标记无效点（可选）
        end
    end
end