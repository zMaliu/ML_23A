Mirrors={};%�����������꼯�� Ԫ��Ϊ�б� [x,y]
Momments={};%ʱ��(�� Сʱ ����) Ԫ��Ϊ�б� [month,hour,moment]

array_n_at=[];
array_n_trunc=[];
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
        %F_select_M:����̫����λ�ǡ��߶Ƚǡ������� 
        % ����true/false���Ƿ�������Ӱ�
        
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

        %part3���������͸���� ������array_n_at���
        %F_n_at
        n_at=F_n_at(mirror_site,tower_site);
        array_n_at=[array_n_at,n_at];

        %F_potential_tower:����Mirrors���� �������Mirrors(j)����С��R�����ж��վ� ��potential_Mirrors
        potential_Mirrors=F_potential_tower(mirror_site,Mirrors,9);

        %F_36points:���붨�վ��������� �����ɢ36���������36points
        [n,a_m,y_m]=F_mirror(a_s,y_s,mirror_site,tower_site);
        list_36points=F_36points(mirror_site,a_m,y_m);
        for k=1:36%����36����
            pointsite_36=list_36points{k};
            res=0;
            new_points={};
            %F_IOline:��������ꡢ̫����λ�ǡ��߶Ƚ� �������/������߷�������
            [n_inline,n_outline]=F_IOline(pointsite_36,a_s,y_s,n);
            for h=1:len(potential_Mirrors)
                point_inMb=potential_Mirrors{h};
                [n_Mb,a_m,y_m]=F_mirror(a_s,y_s,point_inMb,tower_site,n_Mb);
                %F_judge:��������� ����/�������� ���վ����ꡢ������ ���true/false(�Ƿ��ཻ)
                if not F_judge(pointsite_36,n_inline,n_outline,point_inMb,n_Mb)
                    res=res+1;
                    new_points{end+1}=potential_Mirrors;
                end
            end
        end
        n_sb=res/36;%�������վ����ڵ�Ч��
        array_n_sb=[array_n_sb,n_sb];

        %part4������ض�Ч�� ������array_n_trunc���
        total_points_in36=len(new_points);
        n_trunc=F_n_trunc(new_points,a_s,y_s,n);
        array_n_trunc=[array_n_trunc,n_trunc];
    end

end

%part2����������Ч�� ������array_n_cos���

%part5�����㾵�淴���� ������array_n_ref���
n_ref=0.92;
array_n_ref=n_ref*ones(1,len(Mirrors));
%finalpart�������������������� �õ���ƽ����ѧЧ��