% �ٶ�̫������ԭ��10000m �����ſ��Լٶ�̫��������
function [n_inline,n_outline]=F_IOline(p,a_s,y_s,n)
    % x y �������Ϊ���������� z Ϊ����
    l=10000;
    x=sin(y_s)*cos(a_s)*l;
    y=cos(y_s)*cos(a_s)*l;
    z=sin(a_s)*l;
    % �������
    n_in = p-[x,y,z];
    n_inline = n_in/norm(n_in);
    % ���㷴�䷽��
    n_outline = n_inline + n;
    n_outline = n_outline / norm(n_outline);
end