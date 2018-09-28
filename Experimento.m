clc;
clear all;
close all;
x0 = 0;
option=optimset('DISP','ITER');
x=fzero(@(x) x^10-1, x0, option)