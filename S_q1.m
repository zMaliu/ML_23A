Mirrors={};%�����������꼯�� Ԫ��Ϊ�б� [x,y]
Momments={};%ʱ��(�� Сʱ ����) Ԫ��Ϊ�б� [month,hour,moment]

array_n_at=[];
%part1������ÿ�����վ�����Ӱ�ڵ�Ч��n_sb  ������array_n_sb���
array_n_sb=[];
for i=1:len(Momments)%����ʱ��
    month=Momments{i}(1);
    hour=Momments{i}(2);
    momment=Momments{i}(3);
    [a_s,y_s]=F_sun(month,hour,momment);
    %1.1������ȷ��δ������Ӱ�ڵ��Ķ��վ�
    for j=1:len(Mirrors)
        mirror_site=Mirrors{j};
        %F_select_M:����̫����λ�ǡ��߶Ƚǡ������� ����true/false���Ƿ�������Ӱ�
        
        if F_select_M(a_s,y_s,mirror_site)
            %Mirrorsȥ���õ�����
            Mirrors{j}=[];
        end
    end
    
    %1.2������Mirrorsÿ�����վ� ������Ӱ�ڵ�Ч�ʼ���
    for j=1:len(Mirrors)%ÿ�����վ�
        mirror_site=Mirrors{j};
        mirror_site=[mirror_site,4];
        tower_site=[0,0,80];
        %�������͸����n_at
        %F_n_at
        n_at=F_n_at(mirror_site,tower_site);
        array_n_at=[array_n_at,n_at];

        %F_potential_tower:����Mirrors���� �������Mirrors(j)����С��R�����ж��վ� ��potential_Mirrors
        Mirrors=F_potential_tower(mirror_site,Mirrors,9);

        %F_36points:���붨�վ��������� �����ɢ36���������36points
        [n,a_m,y_m]=F_mirror(a_s,y_s,mirror_site,tower_site);
        list_36points=F_36points(mirror_site,a_m,y_m);
        for k=1:36%����36����
            pointsite_36=list_36points{k};
            res=0;
            %F_IOline:��������ꡢ̫����λ�ǡ��߶Ƚ� �������/������߷�������
            [n_inline,n_outline]=F_IOline(pointsite_36,a_s,y_s,n);
            for h=1:len(potential_Mirrors)
                x_inpM=potential_Mirrors{h}[1];
                y_inpM=potential_Mirrors{h}[2];
                %F_judge:��������� ����/�������� ���վ����ꡢ������ ���true/false(�Ƿ��ཻ)
                if F_judge()
                    res=res+1;
                end
                
            end
        end
        n_sb=res/36;%�������վ����ڵ�Ч��
        array_n_sb=[array_n_sb,n_sb];
    end

end

%part2����������Ч�� ������array_n_cos���

%part3���������͸���� ������array_n_at��� ����

%part4������ض�Ч�� ������array_n_trunc���

%part5�����㾵�淴���� ������array_n_ref���
n_ref=0.92;
array_n_ref=n_ref*ones(1,len(Mirrors));
%finalpart�������������������� �õ���ƽ����ѧЧ��