clc;clear;
I = [-1,0,0];
R = [0,0,1];
n = R-I;
n = n/norm(n);
disp(n(3));