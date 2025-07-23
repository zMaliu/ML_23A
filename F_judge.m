function bool = F_judge(point_inMirrorA, n_inline, n_out_line, point_MirrorB, n_b)
    w = 3;                                  % ������
    bool = false;                           % Ĭ�Ͻ��

    % ---------- ��������뾵�潻�� ----------
    d1    = -n_inline;                      % ��������
    denom = dot(n_b, d1);
    if abs(denom) < 1e-8                   % ƽ���ھ���
        bool1 = false;
    else
        l1  = dot(n_b, point_MirrorB - point_inMirrorA);
        t1  = l1 / denom;
        p1  = point_inMirrorA + t1 * d1;

        % �����ֲ�����ϵ
        e11 = cross([0 0 1], n_b);
        if norm(e11) < 1e-8
            e11 = [1 0 0];
        else
            e11 = e11 / norm(e11);
        end
        e21 = cross(n_b, e11);
        local1 = [dot(p1 - point_MirrorB, e11), ...
                  dot(p1 - point_MirrorB, e21)];
        bool1 = all(abs(local1) <= w);
    end

    % ---------- ��������뾵�潻�� ----------
    r     = point_MirrorB - point_inMirrorA;
    denom = dot(n_b, n_out_line);
    if abs(denom) < 1e-8                   % ƽ���ھ���
        bool2 = false;
    else
        t  = dot(n_b, r) / denom;
        if t < 0                           % ����������
            bool2 = false;
        else
            p = point_inMirrorA + t * n_out_line;

            % �����ֲ�����ϵ
            e1 = cross([0 0 1], n_b);
            if norm(e1) < 1e-8
                e1 = [1 0 0];
            else
                e1 = e1 / norm(e1);
            end
            e2 = cross(n_b, e1);
            local2 = [dot(p - point_MirrorB, e1), ...
                      dot(p - point_MirrorB, e2)];
            bool2 = all(abs(local2) <= w);
        end
    end

    % ���ս��
    bool = bool1 && bool2;
end