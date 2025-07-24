clc;clear;
%ʱ��(�� Сʱ ����) Ԫ��Ϊ�б� [month,hour,moment]
Momments={};
months = 1:12; 
hours = [9, 10, 12, 13, 15]; 
minutes = [0, 30, 0, 30, 0]; 
h = 4;
r = 15;
data=readtable("data.xlsx");
%�����������꼯�� Ԫ��Ϊ�б� [x,y]
Mirrors={};
for i=1:height(data)
    Mirrors{i}=[data{i,1},data{i,2},h];
end

for month = months
    for i = 1:length(hours)
        Momments{end+1} = [month, hours(i), minutes(i)];
    end
end

arrry_n_light=zeros(1,60);
array_n_sb=[];
array_n_trunc=[];
array_n_cos=[];
array_n_at=[];
n_ref=0.92;
%part1������ÿ�����վ�����Ӱ�ڵ�Ч��n_sb  ������array_n_sb���
for i=1:length(Momments)%����ʱ��
    month=Momments{i}(1);
    hour=Momments{i}(2);
    momment=Momments{i}(3);
    [a_s,y_s]=F_sun(month,hour,momment);
    total_n_light=0;
    new_Mirrors=[];
    %1.1������ȷ��δ������Ӱ�ڵ��Ķ��վ�
    for j=1:length(Mirrors)
        mirror_site=Mirrors{j};
        %F_select_M:����̫����λ�ǡ��߶Ƚǡ������� 
        % ����true/false���Ƿ�������Ӱ�
        
        if not(F_select_M(a_s,y_s,mirror_site))
            new_Mirrors{end + 1} = mirror_site;
        end
    end
    
    %1.2������Mirrorsÿ�����վ� ������Ӱ�ڵ�Ч�ʼ���
    for j=1:length(new_Mirrors)%ÿ�����վ�
        mirror_site=Mirrors{j};
        tower_site=[0,0,80];

        %part3���������͸���� ������array_n_at���
        n_cos=F_n_cos(a_s,y_s,mirror_site,tower_site);
        n_at=F_n_at(mirror_site,tower_site);
        array_n_at=[array_n_at,n_at];
        array_n_cos=[array_n_cos,n_cos];

        %F_potential_tower:����Mirrors���� �������Mirrors(j)����С��R�����ж��վ� ��potential_Mirrors
        potential_Mirrors=F_potential_tower(mirror_site,new_Mirrors,r);

        %F_36points:���붨�վ��������� �����ɢ36���������36points
        [n,a_m,y_m]=F_mirror(a_s,y_s,mirror_site,tower_site);
        list_36points=F_36points(mirror_site,a_m,y_m);
        % û�б��ڵ����ĵ�ļ��� new_points
        new_points={};
        res=0;
        for k=1:36%����36����
            pointsite_36=list_36points{k};
            %F_IOline:��������ꡢ̫����λ�ǡ��߶Ƚ� �������/������߷�������
            [n_inline,n_outline]=F_IOline(pointsite_36,a_s,y_s,n);
            % �жϵ��Ƿ��ڵ�
            sign = true;
            for h=1:length(potential_Mirrors)
                point_inMb=potential_Mirrors{h};
                [n_Mb,a_m,y_m]=F_mirror(a_s,y_s,point_inMb,tower_site);
                %F_judge:��������� ����/�������� ���վ����ꡢ������ ���true/false(�Ƿ��ཻ)
                if F_judge(pointsite_36,n_inline,n_outline,point_inMb,n_Mb)
                    sign = false;

                end
            end
            if sign
                new_points{end + 1} = pointsite_36;
                res=res+1;
            end
        end
        n_sb=res/36;%�������վ����ڵ�Ч��
        array_n_sb=[array_n_sb,n_sb];

        %part4������ض�Ч�� ������array_n_trunc���
        total_points_in36=length(new_points);
        n_trunc=F_n_trunc(new_points,a_s,y_s,n);
        array_n_trunc=[array_n_trunc,n_trunc];

        n_light=n_trunc*n_sb*n_at*n_cos*n_ref;
        total_n_light=total_n_light+n_light;
    end
    arrry_n_light(i)=total_n_light;
end

