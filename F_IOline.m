% �ٶ�̫������ԭ��500m �����ſ��Լٶ�̫��������
function [n_inline,n_outline]=F_IOline(p,a_s,y_s)
    l = 500;
    % x y �������Ϊ���������� z Ϊ����
    I_x=-sin(y_s_rad)*cos(a_s_rad);
    I_y=-cos(y_s_rad)*cos(a_s_rad);
    I_z=-sin(a_s_rad);
end