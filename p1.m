filename='data.xlsx';
data=readtable(filename);
x = data{:, 1}; % ��һ��
y = data{:, 2}; % �ڶ���

% ����ɢ��ͼ
scatter(x, y, 'filled'); % ʹ������ɢ��
xlabel('X ����');
ylabel('Y ����');
