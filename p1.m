filename='data.xlsx';
data=readtable(filename);
x = data{:, 1}; % 第一列
y = data{:, 2}; % 第二列

% 绘制散点图
scatter(x, y, 'filled'); % 使用填充的散点
xlabel('X 坐标');
ylabel('Y 坐标');
