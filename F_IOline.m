% �����p����������ߺͷ�����߷�������
function [n_inline,n_outline]=F_IOline(p,a_s,y_s,n)
    % ֱ�Ӹ���̫����λ�Ǻ͸߶ȽǼ������䷽������
    % ������Ϊ���ߴ�̫�������p
    n_inline = [-sin(y_s)*cos(a_s), -cos(y_s)*cos(a_s), -sin(a_s)];
    
    % ���㷴�䷽������
    n_out = dot(n_inline, n);
    n_outline = n_inline - 2 * n_out * n;
    
    % ��һ��
    n_inline = n_inline / norm(n_inline);
    n_outline = n_outline / norm(n_outline);
end
