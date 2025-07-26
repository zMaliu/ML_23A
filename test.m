% 已有数据
p  = [277.327 163.667 2.536];
d  = [0.0385 0.5747 0.8175];
d  = d / norm(d);             % 如想单位化
t  = linspace(0,500,200)';
X  = p + t .* d;

% 只画 xoy 平面投影
plot(X(:,1), X(:,2), 'r', 'LineWidth', 2);
axis equal
grid on
xlabel('x'); ylabel('y');
title('Ray projection onto xoy plane');