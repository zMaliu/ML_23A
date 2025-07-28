function is_blocked = F_judge(point_on_mirrorA, sun_direction, blocker_mirror_pos, blocker_mirror_normal)
    % 检查从太阳方向到镜面A上某点的光线是否被镜面B遮挡
    % point_on_mirrorA: 镜面A上的点
    % sun_direction: 太阳光线方向（从太阳指向点）
    % blocker_mirror_pos: 可能遮挡的镜面B位置
    % blocker_mirror_normal: 镜面B的法向量
    
    w = 3;  % 定日镜宽度
    
    % 计算光线与镜面B平面的交点
    ray_dir = -sun_direction;  % 光线传播方向（从点看是反向）
    denom = dot(blocker_mirror_normal, ray_dir);
    
    % 如果光线与镜面B几乎平行，则不相交
    if abs(denom) < 1e-8
        is_blocked = false;
        return;
    end
    
    % 计算交点参数
    t = dot(blocker_mirror_normal, blocker_mirror_pos - point_on_mirrorA) / denom;
    
    % 如果交点在光线反向，则不相交
    if t < 0
        is_blocked = false;
        return;
    end
    
    % 计算交点坐标
    intersection_point = point_on_mirrorA + t * ray_dir;
    
    % 建立镜面B的局部坐标系
    e1 = cross([0 0 1], blocker_mirror_normal);
    if norm(e1) < 1e-8
        e1 = [1 0 0];
    else
        e1 = e1 / norm(e1);
    end
    e2 = cross(blocker_mirror_normal, e1);
    
    % 将交点转换到镜面B的局部坐标系
    local_coords = [dot(intersection_point - blocker_mirror_pos, e1), ...
                    dot(intersection_point - blocker_mirror_pos, e2)];
    
    % 判断交点是否在镜面B范围内
    is_blocked = all(abs(local_coords) <= w);
end
