function S = Shadow( x )
%%计算阴影部分面积，近似为三角形来计算。
%x,1*5的向量，前四个是温区温度，最后一个是传送带速度
    T = fun(x(1),x(2),x(3),x(4),x(5));
    delta_t = 0.5/x(5);
    idx1 = find(abs(T-217)<0.5);
    idx2 = find(T == max(T));
    S = sum(T(idx1(1):idx2)-217)*delta_t;   
end

