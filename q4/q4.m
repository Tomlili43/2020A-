clear;clc;
%%lb,ub：各变量的边界值
A=[];b =[]; Aeq = []; beq = [];
lb = [165;185;225;245;1.0833];
ub = [185;205;245;265;1.6667];
%%调用多目标优化的遗传算法
[x,y] = gamultiobj(@fitness,5,A,b,Aeq,beq,lb,ub,@ycfuncon);
disp(x);
disp(y);