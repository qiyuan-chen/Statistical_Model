data=load("D:\coding\matlab\data\yule.dat")

% part1
one=ones(32,1)
x=data(:,[2,3,4])
x=x-100
y_true=data(:,1)-100
x=[one,x]

mu=x\y_true

y_pred=x*mu %大模型预测得到的y
e=y_true-y_pred

x_small=x(:,[1,2])
mu_small=x_small\y_true
y_pred_small=x_small*mu_small

F=((y_pred'*y_pred-y_pred_small'*y_pred_small)/2)...
/(e'*e/(32-4))

y_true'*y_true
y_pred_small'*y_pred_small+ ...
(y_pred'*y_pred-y_pred_small'*y_pred_small)+e'*e

%part2
mu1=[8;0.8;0;0]
sigma1=normrnd(0,15,32,100)
y_true_1=x*mu1*ones(1,100)+sigma1
mu_1=x\y_true_1
y_pred_1=x*mu_1
mu_small_1=x_small\y_true_1
y_pred_small_1=x_small*mu_small_1
e_1=y_true_1-y_pred_1

F_1=((diag(y_pred_1'*y_pred_1)-...
diag(y_pred_small_1'*y_pred_small_1))/2)./...
(diag(e_1'*e_1)/(32-4))
hist(F_1)


mu2=[13;0.8;0.1;-0.3]
sigma2=normrnd(0,10,32,100)
y_true_2=x*mu2*ones(1,100)+sigma2
mu_2=x\y_true_2
y_pred_2=x*mu_2
mu_small_2=x_small\y_true_2
y_pred_small_2=x_small*mu_small_2
e_2=y_true_2-y_pred_2
F_2=((diag(y_pred_2'*y_pred_2)-...
diag(y_pred_small_2'*y_pred_small_2))/2)./...
(diag(e_2'*e_2)/(32-4))
hist(F_2)


