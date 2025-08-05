clc;clear;
x = 1:1:12;
array_n_at1 = [0.9651	0.9651	0.9651	0.9651	0.9651	0.9651	0.9651	0.9651	0.9651	0.9651	0.9651	0.9651];
array_n_light1 = [0.4727    0.4972    0.5137    0.5281    0.5339 ...
0.5348    0.5336    0.5277    0.5142    0.4968 0.4714    0.4552];
array_n_cos1   = [0.7191  0.7392  0.7604  0.7792  0.7893  0.7924 ...
                  0.7896  0.7794  0.7608  0.7380  0.7183  0.7111];
array_n_sb1    = [0.9816  0.9973  0.9999  1.0000  1.0000  1.0000 ...
                  1.0000  1.0000  0.9999  0.9970  0.9803  0.9662];
array_n_trunc1 = [0.7542    0.7578    0.7585    0.7612    0.7597    0.7581 ...
                0.7589    0.7605    0.7589    0.7589    0.7545    0.7467];
n_ref = 0.92;


figure;
h1 = plot(x, array_n_light1,'-o','LineWidth',1.5); hold on;
h2 = plot(x, array_n_at1,   '-s','LineWidth',1.5);
h3 = plot(x, array_n_cos1,  '-^','LineWidth',1.5);
h4 = plot(x, array_n_sb1,   '-d','LineWidth',1.5);
h5 = plot(x, array_n_trunc1,'-v','LineWidth',1.5);
h6 = plot(x, n_ref*ones(size(x)),'-x','LineWidth',1.5); % 镜面反射率是常数

ylim([0.3 1]);
xlabel('月份');
ylabel('各种效率');
legend([h1 h2 h3 h4 h5 h6], ...
       {'平均光学效率','大气透射率','平均余弦效率', ...
        '平均阴影遮挡效率','平均截断效率','镜面反射率'}, ...
       'Location','southoutside','Orientation','horizontal');
grid on;