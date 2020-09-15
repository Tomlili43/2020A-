function S = Shadow( x )
%%������Ӱ�������������Ϊ�����������㡣
%x,1*5��������ǰ�ĸ��������¶ȣ����һ���Ǵ��ʹ��ٶ�
    T = fun(x(1),x(2),x(3),x(4),x(5));
    delta_t = 0.5/x(5);
    idx1 = find(abs(T-217)<0.5);
    idx2 = find(T == max(T));
    S = sum(T(idx1(1):idx2)-217)*delta_t;   
end

