% ��������ϵaת���������ϵ
% pd �Ƕ��վ������� a_m:���ӷ�λ�� y_m:���Ӹ����� pm �ǽڵ��ڶ��վ��µ�����
% ����ǽڵ��ڴ������ϵ�µ�����
function p = F_ma_to_d(pd,a_m,y_m,pm)
    T = [cos(y_m),sin(y_m)*sin(a_m),-sin(y_m)*cos(a_m);
        -sin(a_m),cos(y_m)*sin(a_m),-cos(y_m)*cos(a_m);
        0,cos(a_m),sin(a_m)];
    p=T*pm+pd;
end
