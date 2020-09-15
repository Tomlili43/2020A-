clear;
clc;
%����ȷ������ٶ���1.38cm/s��1.40cm/s֮��
for v = 1.38:0.001:1.40
    [T,grad] = Tline(v);
    [t1,t2,Tm] = Constraints(T,v);
    if abs(grad) > 3
        val = v;
        break;
    end
    if t1 < 60 || t1 >120
        val = v;
        break;
    end
    if t2 < 40 || t2 > 90
        val = v;
        break;
    end
    if Tm < 240 || Tm > 250
        val = v;
        break;
    end
end
disp(val-0.001);