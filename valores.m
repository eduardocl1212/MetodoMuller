function [b] = valores(b,ng,fx,x)

b (1) = fx (1);
for d=2:(ng+1)
    b(d)=b(d-1)*x+fx(d);
end