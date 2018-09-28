function fx1 = evalp(fx, x1)

ng = length(fx)-1;
fx1 = fx*(x1.^(ng:-1:0)');