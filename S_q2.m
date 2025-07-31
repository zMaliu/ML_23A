% 请设计定日镜场的以下参数：
% 吸收塔的位置坐标(tower_site)、定日镜尺寸(M_square)、安装高度(install_H)、定日镜数目(M_nums)、定日镜位置(M_site)
% 使得定日镜场在达到额定功率的条件下，单位镜面面积年平均输出热功率尽量大
% e = F_q2(Tower_site,M_square,install_H,M_nums,M_site)
clc;clear;

% 变量个数
nvars = 4;

% 约束条件
lb = [-350, 4, 2,2500]; % 变量下界
ub = [0, 64, 6,4000]; % 变量上界

% 整数约束（x1 和 x4 是整数）
IntCon = [1, 4];

% 非线性约束：sqrt(x2) > x3 → x3 - sqrt(x2) < 0
nonlcon = @(x) deal(x(3) - sqrt(x(2)), []);

% 目标函数 
objective = @(x) F_q2(x(1), x(2), x(3), x(4), F_M_site(x(1),x(2),x(4)));

% 设置选项
options = optimoptions('ga', ...
    'PopulationSize', 100, ...      % 种群大小
    'MaxGenerations', 50, ...      % 最大迭代次数
    'Display', 'iter'); 

% 求解
[x_opt, e_opt] = ga(objective, nvars, [], [], [], [], lb, ub, nonlcon, IntCon, options);

% 输出结果
fprintf('最优解：\n');
fprintf('Tower_site = %d\n', x_opt(1));
fprintf('M_square = %.4f\n', x_opt(2));
fprintf('install_H = %.4f\n', x_opt(3));
fprintf('M_nums = %d\n', x_opt(4));
fprintf('最优 e = %.4f\n', e_opt);

