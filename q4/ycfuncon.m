function [f,g] = ycfuncon( x )
%%遗传算法的非线性约束条件
    [T,grad,t1,t2,Tm] = fun(x(1),x(2),x(3),x(4),x(5));
    f = [abs(grad(1))-3
        abs(grad(2))-3
        abs(grad(3))-3
        abs(grad(4))-3
        abs(grad(5))-3
        t1-120
        60-t1
        t2-90
        40-t2
        Tm-250
        240-Tm];
    g = 0;
end

