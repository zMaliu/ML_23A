function bool = F_judge(point_inMirrorA,n_inline,n_out_line,point_MirrorB,n_b)
    w = 3;
    % ������ж�
    % ��aָ��̫��
    d1 = -n_inline;
    l1 = dot(n_b, point_MirrorB - point_onMirrorA);     % �������壺���� (b - a) �ڷ����������ϵ�ͶӰ����
    theta = dot(n_b, d);       % �������壺ֱ�߷��� d �뷨���� n_b �ļн�����
    t1 = l1 / theta;     % �������壺�� a �������ط��� d �߶�Զ������ƽ��
    p1 = point_onMirrorA + t1 * d1;    % �ӵ� a ���������ŷ��� d ���˳��� t ��
    e11 = cross([0 0 1], n_b);
    if norm(e11) < 1e-8
        e11 = [1 0 0];
    else
        e11 = e11 / norm(e11);   % ��λ��
    end
    e21 = cross(n_b, e11);
    % ������ �Ծ�������Ϊԭ�㡢�� e1��e2 Ϊ��Ķ�ά����ϵ �е�����
    local = [dot(p1 - point_MirrorB, e11), dot(p1 - point_MirrorB, e21)];
    % �ж��Ƿ��ھ�����
    bool1 = abs(local(1)) <= w && abs(local(2)) <= w;


    % ������ж�
    r = point_MirrorB - point_inMirrorA;

    l = dot(n_b, r);
    if abs(l) < 1e-8          % ƽ�л���
        bool2 = false;
        return;
    end

    t = l / dot(n_b, n_out_line) ;
    if t < 0                       % ����������
        bool2 = false;
        return;
    end

    % ��������
    p = point_inMirrorA + t * n_out_line;

    % �жϽ����ڲ��ڶ��վ���
    % �����ֲ�����ϵ
    e1 = cross([0 0 1], n_b);
    if norm(e1) < 1e-8
        e1 = [1 0 0];
    else
        e1 = e1 / norm(e1);   % ��λ��
    end
    e2 = cross(n_b, e1);
    % ������ �Ծ�������Ϊԭ�㡢�� e1��e2 Ϊ��Ķ�ά����ϵ �е�����
    local = [dot(p - point_MirrorB, e1), dot(p - point_MirrorB, e2)];
    % �ж��Ƿ��ھ�����
    bool2 = abs(local(1)) <= w && abs(local(2)) <= w;

    bool = bool1 && bool2;
end