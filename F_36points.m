function point = F_36points(x,y,a_m,y_m)
    point=zeros(6,6,3);
    % ���վ��ڵ�������ϵ������
    pd=[x,y,4];

    for i=1:1:6
        for j=1:1:6
            pm = [-4+i,-4+j,0];
            point(i,j) = F_ma_to_d(pd,a_m,y_m,pm);
        end
    end
end
