function p1 = F_potential_tower(p,p_array,r)
    row = size(p_array,1);
    p1 = [];
    % ����ÿһ���ڵ�
        % ��������������㣬�ҳ�����С��r
    for j=1:1:row
        dis = sqrt((p(1,1) - p_array(j,1))^2 + (p(1,2) - p_array(j,2))^2);
        if dis < r && dis > 0
            p1 = [p1; p_array(j, :)];
        end
    end
end