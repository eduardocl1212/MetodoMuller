function [xr, nit, er] = pmuller(fx, x0, x1, x2, er_max, nit_max)

nit = 0;
er = inf;

fx0 = evalp(fx, x0);
fx1 = evalp(fx, x1);
fx2 = evalp(fx, x2);
while((nit<nit_max)&&(er>er_max))
    h0 = x1-x0;
    h1 = x2-x1;
    d0 = (fx1-fx0)/h0;
    d1 = (fx2-fx1)/h1;

    c = fx2;
    a = (d1-d0)/(h0+h1);
    b = a*h1+d1;
    abc = b^2-4*a*c;
    x1r = x2+(-b+sqrt(b^2-4*a*c))/(2*a);
    x2r = x2+(-b-sqrt(b^2-4*a*c))/(2*a);

    fx1r = evalp(fx, x1r);
    fx2r = evalp(fx, x2r);

    x0 = x1;
    fx0 = fx1;
    x1 = x2;
    fx1 = fx2;
    if(abs(fx1r)>abs(fx2r))
        x2 = x2r;
        fx2 = fx2r;
    else
        x2 = x1r;
        fx2 = fx1r;
    end

    er = abs((x2-x1)/x2);
    nit = nit + 1;
end

if abs(imag(x2))<3*eps
    xr = real(x2);
else
    xr(1) = x2;
    xr(2) = conj(x2);
end





