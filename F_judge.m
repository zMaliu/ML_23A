function bool = F_judge(point_inMirrorA,out_line,point_MirrorB,n_b)
    w = 3;
    r = point_MirrorB - point_inMirrorA;

    l = dot(n_b, r);
    if abs(l) < 1e-8          % 平行或共面
        bool = false;
        return;
    end

    t = l / dot(n_b, out_line) ;
    if t < 0                       % 反向无意义
        bool = false;
        return;
    end

    % 交点坐标
    p = point_inMirrorA + t * out_line;

    % 判断交点在不在定日镜上
    % 建立局部坐标系
    e1 = cross([0 0 1], n_b);
    if norm(e1) < 1e-8
        e1 = [1 0 0];
    else
        e1 = e1 / norm(e1);   % 单位化
    end
    e2 = cross(n_b, e1);
    % 交点在 以镜面中心为原点、以 e1、e2 为轴的二维坐标系 中的坐标
    local = [dot(p - point_MirrorB, e1), dot(p - point_MirrorB, e2)];
    % 判断是否在矩阵内
    bool = abs(local(1)) <= w && abs(local(2)) <= w;
end