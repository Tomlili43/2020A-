function T=Tline(v,x)

    %附件各温区温度
    %Ts1 = 175; Ts2 = 195; Ts3 = 235; Ts4 = 255; Ts5 = 25;
    %q_1各温区温度
    Ts1 = 173; Ts2 = 198; Ts3 = 230; Ts4 = 257; Ts5 = 25;
    k = [-0.015187;-0.017869;-0.02185;-0.025687;-0.006988];
    %进入温区前的材料温度
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
end

