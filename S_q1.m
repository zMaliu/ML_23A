% ̫����γ��
% 1��21�� D=0 31 59
deta = asin(sin(2*pi*D/365) * sin(2*pi*23.45/360));
% ̫��ʱ��
% ST = 9 10.5 12 13.5 15
w = pi*(ST - 12)/12;
% ����γ��
phi = 39.4;
% ̫���߶Ƚ�
a_s = asin(cos(deta)*cos(phi)*cos(w) + sin(deta)*sin(phi));
% ̫����λ��
y_s = acos((sin(deta) - sin(a_s)*sin(phi)) / cos(a_s)*cos(phi));



% ÿ�����վ��Ĺ�ѧЧ�� n
n = n_sb * n_cos * n_at * n_trunc * n_ref;