function result= ex3(x1,x2,ex)
%任意多项式矩阵加减运算

L1 = length(x1);%判断系数矩阵长度
L2 = length(x2);
 
if L1>L2  %系数矩阵扩充
    x2=[zeros(1,L1-L2),x2];
else
    x1=[zeros(1,L2-L1),x1];
end

if (ex == '+')
    x3 = x1+x2; %系数矩阵相加 
elseif (ex == '-')
    x3 = x1-x2;
end

result=x3;

