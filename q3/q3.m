clear;clc;
%%lb,ub���������ı߽�ֵ
A=[];b =[]; Aeq = []; beq = [];
lb = [165;185;225;245;1.0833];
ub = [185;205;245;265;1.6667];
%%�����Ŵ��㷨
[x,y] = ga(@Shadow,5,A,b,Aeq,beq,lb,ub,@ycfuncon);
disp(x);
disp(y);
t = (0:0.5:410.5)./x(5);
T = fun(x(1),x(2),x(3),x(4),x(5));
plot(t,T);
xlabel('t/s');
ylabel('T/���϶�');
title('�Ż����¯������');
grid on;
