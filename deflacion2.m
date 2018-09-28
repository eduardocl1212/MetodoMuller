function [fxd] = deflacion2(fx,  xr)

ng = length(fx)-2;
fxd = zeros(1,ng);

s = -2*real(xr);
t = real(xr)^2+imag(xr)^2;

fxd(1) = fx(1);
fxd(2) = fx(2)-fxd(1)*s;
for i1=3:ng
    fxd(i1) = fx(i1)-fxd(i1-1)*s-fxd(i1-2)*t;
end
