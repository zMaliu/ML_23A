% 太阳赤纬角
% 1月21日 D=0 31 59
deta = asin(sin(2*pi*D/365) * sin(2*pi*23.45/360));
% 太阳时角
% ST = 9 10.5 12 13.5 15
w = pi*(ST - 12)/12;
% 当地纬度
phi = 39.4;
% 太阳高度角
a_s = asin(cos(deta)*cos(phi)*cos(w) + sin(deta)*sin(phi));
% 太阳方位角
y_s = acos((sin(deta) - sin(a_s)*sin(phi)) / cos(a_s)*cos(phi));



% 每个定日镜的光学效率 n
n = n_sb * n_cos * n_at * n_trunc * n_ref;