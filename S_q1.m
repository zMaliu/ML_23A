Tower=[];
Mirrors=[];

for i=1:N%����ʱ��
    %1������ȷ��δ������Ӱ�ڵ��Ķ��վ�
    for j=1:N
        %F_select_M:����̫����λ�ǡ��߶Ƚǡ������� ����true/false���Ƿ�������Ӱ�
        if F_select_M
            %Mirrorsȥ���õ�����
        end
    end
    
    %2������Mirrorsÿ�����վ� ������Ӱ�ڵ�Ч�ʼ���
    %F_36points:���붨�վ��������� �����ɢ36���������36points
    for j=1:N%ÿ�����վ�
        %F_potential_tower:����Mirrors���� �������Mirrors(j)����С��R�����ж��վ� ��Mirrors
        for k=1:36%����36����
            res=0;
            %F_IOline:��������ꡢ̫����λ�ǡ��߶Ƚ� �������/������߷�������
            for h=1:length(Mirrors)
                %F_judge:��������� ����/�������� ���վ����ꡢ������ ���true/false(�Ƿ��ཻ)
                if F_judge
                    res=res+1;
                end
            end
        end
        effect_n=res/36;%�������վ����ڵ�Ч��
    end

end