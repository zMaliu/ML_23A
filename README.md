问题一思路：
    1、镜场年平均光学效率
    计算每个定日镜的光学效率（五因素） 累加 即得到镜场年平均光学效率


代码说明：

S_q1:计算阴影挡光效率

F_sun:输入时刻 输出太阳方位角、高度角

F_mirror:输入镜子/塔顶坐标、太阳方位角/高度角 输出定日镜法向量、方位角、俯仰角

F_36points:输入定日镜俯仰角、方位角、中心点坐标 输出36个点坐标数组

F_change_toland:输入定日镜坐标、点的坐标（定日镜下）、镜子的俯仰角/方位角 输出点在大地坐标系下的坐标

F_change_toMirror:输入太阳到点的入射光线、定日镜B的法向量、方位角、俯仰角、
定日镜B的坐标（大地坐标系下）、点的坐标（大地坐标系下） 输出在定日镜B上的坐标（定日镜下）

F_select_M:输入太阳方位角、高度角、点坐标 返回true/false（是否在塔阴影里）

F_potential_tower:输入Mirrors数组 输出距离Mirrors(j)长度小于R的所有定日镜 即Mirrors

F_IOline:输入点坐标、太阳方位角、高度角、镜子法向量 输出入射/反射光线方向向量

F_judge:输入在定日镜A点坐标 入射/反射向量 定日镜B坐标、法向量 输出true/false(是否相交)

F_n_at:计算大气透射率 输入镜子中心与集热器中心的坐标 输出大气透射率