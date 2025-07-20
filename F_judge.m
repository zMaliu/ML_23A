function bool = F_judge(point_inMirrorA,out_line,point_MirrorB,n_b)
    w = 3;
    r = point_MirrorB - point_inMirrorA;

    l = dot(n_b, r);
    if abs(l) < 1e-8          % ƽ�л���
        bool = false;
        return;
    end

    t = l / dot(n_b, out_line) ;
    if t < 0                       % ����������
        bool = false;
        return;
    end

    % ��������
    p = point_inMirrorA + t * out_line;

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
    bool = abs(local(1)) <= w && abs(local(2)) <= w;
end