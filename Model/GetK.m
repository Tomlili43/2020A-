book = xlsread('¸½¼þ.xlsx',1,'A2:B710');

timeStart=555;
timeEnd=679;
timeInterval=296;
Ts = 25;
T0 = 242.27;


xdata = book(timeStart:timeEnd,1)-timeInterval;
ydata = book(timeStart:timeEnd,2);
y = log(Ts - ydata);
b = log(Ts - T0);

predicted = @(a,t) a.*t + b;
a0 = 0.1;

[ahat,resnorm,residual,exitflag,output,lambda,jacobian] =...
   lsqcurvefit(predicted,a0,xdata,y);

plot(xdata,y,'o');
xlabel('Ê±¼ät/s');
ylabel('T/K');
hold on;
plot(xdata,predicted(ahat,xdata),'-');
