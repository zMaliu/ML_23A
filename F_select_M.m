% ��Ӱ���� ����ֻ����100m��� �����ж���������Բ��ľ����Լ���Բ��֮��ļн�
% p �ǵ����������
function bool = F_select_M(a_s,y_s,p)
    a = p(1,1);
    b = p(1,2);
    theta = atan2(3.5,100);
    theta_p = atan2(a,b);
    % �ж�����
    distance_condition = (a^2 + b^2 < 88 / tan(a_s));
    angle_condition = (theta_p > y_s - theta) && (theta_p < y_s + theta);
    
    % �ۺ��ж�
    bool = distance_condition && angle_condition;
end