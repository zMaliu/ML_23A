Tower=struct();%�����������Խṹ������ �������꣨x,y,z�����뾶(R)
Mirrors=struct();%���涨�վ������Խṹ������ MirrorΪ�������վ��Ľṹ������ ��������(x,y,z) ����(h,w)

for i=1:N%����ʱ��
    %1������ȷ��δ������Ӱ�ڵ��Ķ��վ�
    Mirrors=[];%���ж��վ�
    for j=1:N
        %F_Tower_beshadow:����̫����λ�ǡ��߶Ƚ�+���վ��������� ����true/false���Ƿ�������Ӱ�
        %�Ӻ���F_Tower_shadow:����̫����λ�ǡ��߶Ƚ� ���������Ӱλ��
        if F_Tower_beshadow
            %Mirrorsȥ���õ�����
        end
    end
    
    %2������Mirrorsÿ�����վ� ������Ӱ�ڵ�Ч�ʼ���
    %F_36points:���붨�վ��������� �����ɢ36���������36points
    for j=1:N%ÿ�����վ�
        %F_potential_tower:����Mirrors���� �������Mirrors(j)����С��R�����ж��վ� ��Mirrors
        for k=1:46%����36����
            res=0;
            %F_IOline:��������ꡢ̫����λ�ǡ��߶Ƚ� �������/������߷�������
            for h=1:length(Mirrors)
                %F_judge:��������� ����/�������� ���վ����ꡢ������ ���true/false(�Ƿ��ཻ)
                if F_judge
                    res=res+1;
                end
            end
        end

    end

end