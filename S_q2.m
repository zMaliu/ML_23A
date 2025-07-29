% 请设计定日镜场的以下参数：
% 吸收塔的位置坐标(tower_site)、定日镜尺寸(M_square)、安装高度(install_H)、定日镜数目(M_nums)、定日镜位置(M_site)
% 使得定日镜场在达到额定功率的条件下，单位镜面面积年平均输出热功率尽量大
% E = F_e(tower_site,M_square,install_H,M_nums,M_site)
clc; clear; close all;

%% 基本参数
M_max   = 4000;     % 最大候选数目
R_inner = 100;      % 塔周禁区半径 (m)
R_outer = 350;      % 镜场半径 (m)
P_rated = 50e6;     % 额定输出热功率 (W)

%% 变量总数
nvars = 5 + 3*M_max;   % [tower_x, tower_y, h_m, w_m, l, s, x, y]

%% 上下界
lb = [-R_outer, -R_outer, 2, 2, 2, ...
      zeros(1, M_max), -R_outer*ones(1, 2*M_max)];
ub = [ R_outer,  R_outer, 6, 8, 8, ...
      ones(1, M_max),  R_outer*ones(1, 2*M_max)];

%% 整数变量索引（开关变量）
intcon = 6 : (5 + M_max);

%% 遗传算法选项
options = optimoptions('ga', ...
    'PopulationSize', 100, ...
    'MaxGenerations', 200, ...
    'Display', 'iter', ...
    'UseParallel', false);

%% 运行 GA
[x_opt, fval] = ga(@(x) objectiveFunction(x, M_max, R_inner, R_outer, P_rated), ...
                   nvars, [], [], [], [], lb, ub, [], intcon, options);

%% 结果提取
tower_opt = x_opt(1:2);
h_m_opt   = x_opt(3);
w_m_opt   = x_opt(4);
l_opt     = x_opt(5);

s         = round(x_opt(6:5+M_max));
pos_all   = [x_opt(6+M_max:5+2*M_max); x_opt(6+2*M_max:5+3*M_max)].';
activeIdx = find(s == 1);
pos_opt   = pos_all(activeIdx, :);
M_nums    = numel(activeIdx);

fprintf('最优塔位坐标：'); disp(tower_opt);
fprintf('安装高度 h_m：%.2f m\n', h_m_opt);
fprintf('镜面宽度 w_m：%.2f m\n', w_m_opt);
fprintf('镜面高度 l：%.2f m\n', l_opt);
fprintf('启用定日镜数目：%d\n', M_nums);
fprintf('最大单位镜面年平均输出热功率：%.4f\n', fval);

%% 可视化
figure; axis equal; hold on;
viscircles(tower_opt, R_inner, 'Color', 'r', 'LineWidth', 1.5);
viscircles(tower_opt, R_outer, 'Color', 'k', 'LineWidth', 1.5);
plot(pos_opt(:,1), pos_opt(:,2), 'b.');
title('优化后定日镜布置');
legend({'100 m 禁区','350 m 边界','定日镜'});