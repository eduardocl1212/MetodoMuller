clc;
close all;
clear all;


%%fx = [2 1 -3.5 +2.75 2.125 -3.875 -1.25];
fx = [1 -5 -17 129 -180];

ng = length(fx)-1;

er_max = eps;
nit_max = 1e6;

%%xr = zeros(1, ng);
xr = cell(1, ng);

fx1 = fx;

x0 = 4.5;
x1 = 5.5;
x2 = 5;

for i1=1:(ng-2)
    [xrt, nitm, erm] = pmuller(fx1, x0, x1, x2, er_max, nit_max);
    if(length(xrt)~=2)
        [fx1, r1] = deflacion(fx1, xrt);
        xr{i1} = xrt;
    else
        [fx1] = deflacion2(fx1, xrt(1));
        xr{i1} = xrt(1);
         i1=i1+1;
        xr{i1} = xrt(2);
    end
end
if(length(fx1)==3)
    xr{ng-1}=(-fx1(2)+sqrt(fx1(2)^2-4*fx1(1)*fx1(3)))/(2*fx1(1));
    xr{ng}=(-fx1(2)-sqrt(fx1(2)^2-4*fx1(1)*fx1(3)))/(2*fx1(1));
else
    xr{ng} = -fx1(2);
end


