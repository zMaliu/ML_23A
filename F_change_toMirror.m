function points_onMirrorB = F_change_toMirror(n_inline,n_b,a_m,y_m,point_onMirrorA,point_MirrorB)
    % 从a指向太阳
    d = -n_inline;
    numerator = dot(n_b, point_MirrorB - point_onMirrorA);     % 几何意义：向量 (b - a) 在法向量方向上的投影长度
    denominator = dot(n_b, d);       % 几何意义：直线方向 d 与法向量 n_b 的夹角余弦
    t = numerator / denominator;     % 几何意义：从 a 出发，沿方向 d 走多远能碰到平面
    p = a + t * d;    % 从点 a 出发，沿着方向 d 走了长度 t 后
    % 把点转换到定日镜B坐标系下
    T_a = [1,0,0;
           0,cos(a_m),sin(a_m);
           0,-sin(a_m),cos(a_m)];
    T_b = [cos(y_m),sin(y_m),0;
            -sin(y_m),cos(y_m),0;
            0,0,1];
    T = T_a * T_b;
    points_onMirrorB = (p - point_MirrorB) / T;

end