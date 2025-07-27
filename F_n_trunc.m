% 射出去到达集热器的点/每个镜子实际射出去的点
function n_trunc = F_n_trunc(points,a_s,y_s,n_m)
    points = cell2mat(points.');
    n = size(points,1);
    r = 3.5;
    zmin = 72;
    zmax = 80;
    ta_n = 0;
    % 遍历每个点，得到每个点的反射光线
    for i = 1:n
        p = points(i,:);
        [~,d] = F_IOline(p,a_s,y_s,n_m);
        a = d(1)^2 + d(2)^2;
        b = 2*(p(1)*d(1)+p(2)*d(2));
        c = p(1)^2 + p(2)^2 - r^2;
        disc = b^2 - 4*a*c;

        if disc >= 0                                   % 有实根
            t = [(-b-sqrt(disc))/(2*a), (-b+sqrt(disc))/(2*a)];
            t = t(t >= 0);
            z = p(3) + t*d(3);
            if any(z >= zmin & z <= zmax)
                ta_n = ta_n + 1;                       % ← 满足高度
            end
        end
    end
    n_trunc = ta_n / n;
end