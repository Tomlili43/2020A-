%�������� TS���� TԪ�����¶� k e��ϵ�� T0Ԫ������ʼ��������¶� tΪʱ��
book = xlsread('����.xlsx',1,'A2:B710');
TS=25;
T0=242.27;
k=-0.0080;

timeStart=680;
timeEnd=709;
timeInterval=296;
t=book(timeStart:timeEnd,1)-timeInterval;
const = 2;
Correct = const + 2*exp(0.0008*t);
T=TS+(T0-TS)*exp(k*t)+Correct;

RealData = book(timeStart:timeEnd,2);

plot(t,T,'-');
hold on;
plot(t,RealData,'--');
Ne=abs(RealData-T);
Error=sum(Ne);
%TE=sum(Error);