function point = F_36points(mirror_site, a_m, y_m,M_square)
    grid_size = 10;   % 10x10网格 = 100个点
    
    point = cell(grid_size*grid_size, 1);
    idx = 0;
    half_size = M_square / 2;
    
    % 在镜面范围内均匀分布100个点
    for i = 1:grid_size
        for j = 1:grid_size
            idx = idx + 1;
            % 将网格坐标映射到镜面实际坐标
            x_local = -half_size + (i-1) * (M_square / (grid_size-1));
            y_local = -half_size + (j-1) * (M_square / (grid_size-1));
            pm = [x_local, y_local, 0];
            point{idx} = F_change_toland(a_m, y_m, mirror_site, pm);
        end
    end
end