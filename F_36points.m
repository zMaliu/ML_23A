% �������[1,2,3]
function point = F_36points(mirror_site,a_m,y_m)
    point=cell(36,1);
    idx = 0;
    for i=1:1:6
        for j=1:1:6
            idx = idx+1;
            pm = [-4+i,-4+j,0];
            point{idx} = F_change_toland(a_m,y_m,mirror_site,pm);
        end
    end
end
