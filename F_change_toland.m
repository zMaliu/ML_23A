% ��x����ʱ��תa_m ��z����ʱ��תy_m 
function p = F_change_toland(pd,a_m,y_m,pm)
    T_a = [1,0,0;
           0,cos(a_m),-sin(a_m);
           0,sin(a_m),cos(a_m)];
    T_b = [cos(y_m),-sin(y_m),0;
            sin(y_m),cos(y_m),0;
            0,0,1];
    T = T_a * T_b;
    % �ҳˣ����������������������
    p=pm*T+pd;
end
