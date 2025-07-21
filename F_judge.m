function bool = F_judge(point_inMirrorA,n_inline,n_out_line,point_MirrorB,n_b)
    w = 3;
    % 入射的判断
    % 从a指向太阳
    d1 = -n_inline;
    l1 = dot(n_b, point_MirrorB - point_onMirrorA);     % 几何意义：向量 (b - a) 在法向量方向上的投影长度
    theta = dot(n_b, d);       % 几何意义：直线方向 d 与法向量 n_b 的夹角余弦
    t1 = l1 / theta;     % 几何意义：从 a 出发，沿方向 d 走多远能碰到平面
    p1 = point_onMirrorA + t1 * d1;    % 从点 a 出发，沿着方向 d 走了长度 t 后
    e11 = cross([0 0 1], n_b);
    if norm(e11) < 1e-8
        e11 = [1 0 0];
    else
        e11 = e11 / norm(e11);   % 单位化
    end
    e21 = cross(n_b, e11);
    % 交点在 以镜面中心为原点、以 e1、e2 为轴的二维坐标系 中的坐标
    local = [dot(p1 - point_MirrorB, e11), dot(p1 - point_MirrorB, e21)];
    % 判断是否在矩阵内
    bool1 = abs(local(1)) <= w && abs(local(2)) <= w;


    % 反射的判断
    r = point_MirrorB - point_inMirrorA;

    l = dot(n_b, r);
    if abs(l) < 1e-8          % 平行或共面
        bool2 = false;
        return;
    end

    t = l / dot(n_b, n_out_line) ;
    if t < 0                       % 反向无意义
        bool2 = false;
        return;
    end

    % 交点坐标
    p = point_inMirrorA + t * n_out_line;

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
    bool2 = abs(local(1)) <= w && abs(local(2)) <= w;

    bool = bool1 && bool2;
end