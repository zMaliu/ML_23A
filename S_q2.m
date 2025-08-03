%设计吸收塔的位置坐标(Tower_site)、定日镜尺寸(M_square)、安装高度(install_H)、定日镜数目(N_mirrors)、定日镜位置(M_site)
clc; clear; 

lb = [0 0 2 2 1500];
ub = [350 350 8 6 2500];
options = optimoptions('ga','PopulationSize',10,'MaxGenerations',10,'Display','iter');
[x_best,fval] = GA(lb,ub,options);

fprintf('\n最优解：\n');
disp(x_best);
fprintf('最优目标值：%.4f\n', fval);