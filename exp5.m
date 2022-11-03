r=normrnd(15,10,32,1000)
ave=mean(r)
sd=std(r)

hist(ave)
hist(sd)

scatter(ave,sd)