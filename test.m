% ��������
p  = [277.327 163.667 2.536];
d  = [0.0385 0.5747 0.8175];
d  = d / norm(d);             % ���뵥λ��
t  = linspace(0,500,200)';
X  = p + t .* d;

% ֻ�� xoy ƽ��ͶӰ
plot(X(:,1), X(:,2), 'r', 'LineWidth', 2);
axis equal
grid on
xlabel('x'); ylabel('y');
title('Ray projection onto xoy plane');