function [ t_rise,t_hot,Tmax ] = Constraints( T,v )
%t_rise,�¶�������������150?C~190?C��ʱ��
%t_hot,�¶ȴ���217?C��ʱ��
%Tmax,��ֵ�¶�

%x,���ʹ��־���
x = 0:0.5:410.5;
t = x./v;
idx1 = find(abs(T-150)<0.5);
idx2 = find(abs(T-190)<0.5);
t_rise = t(idx2(1)) - t(idx1(1));

idx3 = find(abs(T-217)<0.5);
t_hot = t(idx3(end))-t(idx3(1));

Tmax = max(T);

end

