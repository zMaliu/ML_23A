% ���ȥ���Ｏ�����ĵ�/ÿ������ʵ�����ȥ�ĵ�
function n_trunc = F_n_trunc(points,a_s,y_s,n_m)
    points = cell2mat(points.');
    n = size(points,1);
    r = 3.5;
    zmin = 80;
    zmax = 88;
    ta_n = 0;
    % ����ÿ���㣬�õ�ÿ����ķ������
    for i=1:1:n
        p = points(i,:);
        [~,n_outline]=F_IOline(p,a_s,y_s,n_m);
        x = p(1); y = p(2); z = p(3);
        dx = n_outline(1); dy = n_outline(2); dz = n_outline(3);

        A = dx^2 + dy^2;
        B = 2*(x*dx + y*dy);
        C = x^2 + y^2 - r^2;
        % �����б�ʽ
        delta = B^2 - 4*A*C;
        % ���������
        sqrtDelta = sqrt(delta);
        t1 = (-B - sqrtDelta) / (2*A);
        t2 = (-B + sqrtDelta) / (2*A);

        % ȡ��С�ķǸ���
        t = inf;
        if t1 >= 0
            t = t1;
        elseif t2 >= 0
            t = t2;
        else
            hitFlag = false;
        end

        % �鿴�߶��Ƿ��ڷ�Χ��
        z_hit = z + t*dz;
        hitFlag = (z_hit >= zmin) && (z_hit <= zmax);
        if hitFlag
            ta_n = ta_n + 1;
        end

    end
    n_trunc = ta_n / n;
end