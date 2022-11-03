data=load("D:\coding\matlab\data\yule.dat")

% 第一部分

one=ones(32,1)

x=data(:,[2,3,4])
x=x-100
y_true=data(:,1)-100 % 真实的y
x=[one,x]

beta=x\y_true
y_pred=x*beta
e=y_true-y_pred
sse=e'*e

b_hat=beta(2)
c=inv(x'*x)
c=c(2,2)
sigma_hat=sqrt(sse/(length(y_pred)-5))

t=b_hat/sqrt(c)/sigma_hat
% 1
one=ones(32,1)

x=data(:,[2,3,4])
x=x-100
y_true=data(:,1)-100 % 真实的y
x=[one,x]

beta=[-40;0;0.2;-0.3]
r=normrnd(0,15,32,1) % 产生随机数

% 2
y_simulate=x*beta+r

% 3
beta_simulate=x\y_simulate
b_hat=beta_simulate(2)
y_pred=x*beta_simulate
e=y_simulate-y_pred
sse=e'*e

b_hat=beta_simulate(2)
c=inv(x'*x)
c=c(2,2)
sigma_hat=sqrt(sse/(length(y_pred)-5))
t=b_hat/sqrt(c)/sigma_hat

% 4
r=normrnd(0,15,32,1000)
y_simulate=x*beta*ones(1,1000)+r
beta_simulate=x\y_simulate
y_pred=x*beta_simulate
e=y_simulate-y_pred
sse=diag(e'*e)

b_hat=beta_simulate(2,:)
c=inv(x'*x)
c=c(2,2)
sigma_hat=sqrt(sse/27)
t=b_hat'./sqrt(c)./sigma_hat


% 5
hist(b_hat)
scatter(b_hat,sigma_hat)
hist(t)

% 7
b_mean=mean(b_hat)
b_sd=sqrt(var(b_hat))



