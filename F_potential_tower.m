function p1 = F_potential_tower(p,p_array,r)
    p_array = p_array{1};
    row = size(p_array,1);
    temp = [];
    % ����ÿһ���ڵ�
        % ��������������㣬�ҳ�����С��r
    for j=1:1:row
        dis = sqrt((p(1,1) - p_array(j,1))^2 + (p(1,2) - p_array(j,2))^2);
        if dis < r && dis > 0
            temp = [temp; p_array(j, :)];
        end
    end
    % ��ÿ�б�� cell Ԫ��
    p1 = cell(size(temp, 1), 1);
    for k = 1:size(temp, 1)
        p1{k} = temp(k, :);
    end
end