% ����ڵ�������Լ���λ�Ǻ͸����ǣ������Ӧ��36���������
function point = F_point(x,y,a_m,y_m)
    point=zeros(6,6,3);
    pd=[x,y,4];
    % �ھ�������ϵ��ת���ɴ������ϵ
    % pm ���ڶ��վ��µ�����
    for i=1:1:6
        for j=1:1:6
            pm = [-4+i,-4+j,0];
            point(i,j) = F_ma_to_d(pd,a_m,y_m,pm);
        end
    end
end
