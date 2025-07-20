function points_onMirrorB = F_change_toMirror(n_inline,n_b,a_m,y_m,point_onMirrorA,point_MirrorB)
    % ��aָ��̫��
    d = -n_inline;
    l = dot(n_b, point_MirrorB - point_onMirrorA);     % �������壺���� (b - a) �ڷ����������ϵ�ͶӰ����
    theta = dot(n_b, d);       % �������壺ֱ�߷��� d �뷨���� n_b �ļн�����
    t = l / theta;     % �������壺�� a �������ط��� d �߶�Զ������ƽ��
    p = point_onMirrorA + t * d;    % �ӵ� a ���������ŷ��� d ���˳��� t ��
    % �ѵ�ת�������վ�B����ϵ��
    T_a = [1,0,0;
           0,cos(a_m),sin(a_m);
           0,-sin(a_m),cos(a_m)];
    T_b = [cos(y_m),sin(y_m),0;
            -sin(y_m),cos(y_m),0;
            0,0,1];
    T = T_a * T_b;
    points_onMirrorB = (p - point_MirrorB) / T;

end