clear;clc;
%%lb,ub���������ı߽�ֵ
A=[];b =[]; Aeq = []; beq = [];
lb = [165;185;225;245;1.0833];
ub = [185;205;245;265;1.6667];
%%���ö�Ŀ���Ż����Ŵ��㷨
[x,y] = gamultiobj(@fitness,5,A,b,Aeq,beq,lb,ub,@ycfuncon);
disp(x);
disp(y);