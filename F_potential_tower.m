function p1 = F_potential_tower(p,p_array,r)
    row = size(p_array,1);
    p1 = [];
    % 遍历每一个节点
        % 遍历其他的坐标点，找出距离小于r
    for j=1:1:row
        dis = sqrt((p(1,1) - p_array(j,1))^2 + (p(1,2) - p_array(j,2))^2);
        if dis < r && dis > 0
            p1 = [p1; p_array(j, :)];
        end
    end
end