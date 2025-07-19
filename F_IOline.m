% �ٶ�̫������ԭ��500m �����ſ��Լٶ�̫��������
function [n_inline,n_outline]=F_IOline(p,a_s,y_s,n)
    l = 500;
    % x y �������Ϊ���������� z Ϊ����
    x=-sin(y_s)*cos(a_s)*l;
    y=-cos(y_s)*cos(a_s)*l;
    z=sin(a_s)*l;
    % �������
    n_in = [p(1)-x,p(2)-y,p(3)-z];
    n_inline = n_in/norm(n_in);
    % ���㷴�䷽��
    n_out = dot(n_inline, n);
    n_outline = n_in - 2 * n_out * n;
end