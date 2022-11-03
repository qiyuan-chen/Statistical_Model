% 第1题.
Y=randn(100,2);
% 第2题.
% (a)
X1=Y(:,1);
X2=Y(:,2);
U=(X1-mean(X1))/sqrt(var(X1));
% (b)
beta=(X2'*X2)\X2'*U;
e=U-X2*beta;
W=(e-mean(e))/sqrt(var(e));
% (c)
r=0.3;
V=r*U+sqrt(1-r*r)*W;
% (d)
mean(U)
var(U)
mean(V)
var(V)
corrcoef(U,V)
% 第3题.
E=randn(100,1);
Y=U+V+E;
% 第4题.
X=[U,V];
beta=(X'*X)\(X'*Y)
% 第5题.
E=randn(100,1000);
Y=zeros(100,1000);
beta=zeros(1000,2);
for i=1:1000
    Y(:,i)=U+V+E(:,i);
    beta(i,:)=(X'*X)\X'*Y(:,i);
end;
% 第6题.
a=beta(:,1);
b=beta(:,2);
hist(a)
hist(b)
hist(a+b)
hist(a-b)