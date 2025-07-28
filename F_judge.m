function is_blocked = F_judge(point_on_mirrorA, sun_direction, blocker_mirror_pos, blocker_mirror_normal)
    % ����̫�����򵽾���A��ĳ��Ĺ����Ƿ񱻾���B�ڵ�
    % point_on_mirrorA: ����A�ϵĵ�
    % sun_direction: ̫�����߷��򣨴�̫��ָ��㣩
    % blocker_mirror_pos: �����ڵ��ľ���Bλ��
    % blocker_mirror_normal: ����B�ķ�����
    
    w = 3;  % ���վ����
    
    % ��������뾵��Bƽ��Ľ���
    ray_dir = -sun_direction;  % ���ߴ������򣨴ӵ㿴�Ƿ���
    denom = dot(blocker_mirror_normal, ray_dir);
    
    % ��������뾵��B����ƽ�У����ཻ
    if abs(denom) < 1e-8
        is_blocked = false;
        return;
    end
    
    % ���㽻�����
    t = dot(blocker_mirror_normal, blocker_mirror_pos - point_on_mirrorA) / denom;
    
    % ��������ڹ��߷������ཻ
    if t < 0
        is_blocked = false;
        return;
    end
    
    % ���㽻������
    intersection_point = point_on_mirrorA + t * ray_dir;
    
    % ��������B�ľֲ�����ϵ
    e1 = cross([0 0 1], blocker_mirror_normal);
    if norm(e1) < 1e-8
        e1 = [1 0 0];
    else
        e1 = e1 / norm(e1);
    end
    e2 = cross(blocker_mirror_normal, e1);
    
    % ������ת��������B�ľֲ�����ϵ
    local_coords = [dot(intersection_point - blocker_mirror_pos, e1), ...
                    dot(intersection_point - blocker_mirror_pos, e2)];
    
    % �жϽ����Ƿ��ھ���B��Χ��
    is_blocked = all(abs(local_coords) <= w);
end
