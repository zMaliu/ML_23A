function p1 = F_potential_tower(mirror_site,new_Mirrors,r)
    new_Mirrors = cell2mat(new_Mirrors.');
    row = size(new_Mirrors,1);
    temp = [];
    % ����ÿһ���ڵ�
        % ��������������㣬�ҳ�����С��r
    for j=1:1:row
        dis = sqrt((mirror_site(1,1) - new_Mirrors(j,1))^2 + (mirror_site(1,2) - new_Mirrors(j,2))^2);
        if dis < r && dis > 0
            temp = [temp; new_Mirrors(j, :)];
        end
    end
    % ��ÿ�б�� cell Ԫ��
    p1 = cell(size(temp, 1), 1);
    for k = 1:size(temp, 1)
        p1{k} = temp(k, :);
    end
end