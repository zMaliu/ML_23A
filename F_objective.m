% 
function E = F_objective(x, M_max, R_inner, R_outer, P_rated)
    %% 解码共用参数
    tower = x(1:2);
    h_m   = x(3);   % 安装高度
    w_m   = x(4);   % 镜面宽度
    l     = x(5);   % 镜面高度

    %% 共用约束
    if l > w_m || h_m <= l/2
        E = -1e6;  
        return;
    end

    %% 解码开关变量与坐标
    s   = round(x(6:5+M_max));
    pos = [x(6+M_max:5+2*M_max); x(6+2*M_max:5+3*M_max)].';

    M_nums = sum(s);
    if M_nums < 2000 || M_nums > 4000
        E = -1e6;  
        return;
    end

    activeIdx  = find(s == 1);
    pos_active = pos(activeIdx, :);

    %% 环形区域 & 不重叠
    dist = vecnorm(pos_active - tower, 2, 2);
    if any(dist < R_inner) || any(dist > R_outer)
        E = -1e6;  return;
    end

    if M_nums > 1
        minDist = min(pdist(pos_active));
        if minDist < w_m
            E = -1e6;  return;
        end
    end

    %% 计算总年平均输出热功率（占位函数，请替换）
    totalPower = calculateEnergy(tower, l, w_m, h_m, pos_active);

    %% 单位镜面功率
    mirrorArea = M_nums * l * w_m;
    E = totalPower / mirrorArea;

    %% 额定功率惩罚
    if totalPower < P_rated
        E = E - 1e3 * (P_rated - totalPower)^2;
    end
end