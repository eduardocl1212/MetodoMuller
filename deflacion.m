function [fxd, r] = deflacion(fx, xr)

ng = length(fx)-1;
fxd = zeros(1, ng);

r = fx(1);
for i1=1:ng
    s = fx(i1+1);
    fxd(i1) = r;
    r = s+r*xr;
end