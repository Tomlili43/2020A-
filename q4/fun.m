function [T,grad,t_rise,t_hot,Tmax] = fun(Ts1,Ts2,Ts3,Ts4,v)
%grad,各阶段最大斜率
%t_rise,温度上升过程中在150?C~190?C的时间
%t_hot,温度大于217?C的时间
%Tmax,峰值温度
    %%Ts各温区温度
    Ts5 = 25;
    %k,各温区的系数
    Ts = [Ts1,Ts2,Ts3,Ts4,Ts5];
    k = 3e-7.*(Ts.^2)-4e-6.*Ts + 0.0069;
    k = -k;
    %x,传送带距离
    x = 0:0.5:410.5;
    %%进入温区前的材料温度
    T01 = 30;
    T02 = Ts1 + (T01 - Ts1).*exp(k(1)/v.*175);
    T03 = Ts2 + (T02 - Ts2).*exp(k(2)/v.*(210.5-175));
    T04 = Ts3 + (T03 - Ts3).*exp(k(3)/v.*(246-210.5));
    T05 = Ts4 + (T04 - Ts4).*exp(k(4)/v.*(317-246));
    %分段函数
    T = (Ts1 + (T01 - Ts1).*exp(k(1)/v.*x)).*(x>=0 & x<=175) + ...
        (Ts2 + (T02 - Ts2).*exp(k(2)/v.*(x-175))).*(x>175 & x<=210.5)+...
        (Ts3 + (T03 - Ts3).*exp(k(3)/v.*(x-210.5))).*(x>210.5 & x<=246)+...
        (Ts4 + (T04 - Ts4).*exp(k(4)/v.*(x-246))).*(x>246 & x<=317)+...
        (Ts5 + (T05 - Ts5).*exp(k(5)/v.*(x-317))).*(x>317 & x<=410.5);
    %求斜率
    grad(1) = -k(1)*(Ts1-T01);
    grad(2) = -k(2)*(Ts2-T02);
    grad(3) = -k(3)*(Ts3-T03);
    grad(4) = -k(4)*(Ts4-T04);
    grad(5) = -k(5)*(Ts5-T05);
    %求t_rise
    t = x./v;
    idx1 = find(abs(T-150)<0.5);
    idx2 = find(abs(T-190)<0.5);
    t_rise = t(idx2(1)) - t(idx1(1));
    %求t_hot
    idx3 = find(abs(T-217)<0.5);
    t_hot = t(idx3(end))-t(idx3(1));
    %求Tmax
    Tmax = max(T);
end

