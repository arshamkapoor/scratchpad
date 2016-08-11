setwd("C://Users/Arsham/workspace/R")
getwd()
Proc <- read.csv("ProcessingTimes.csv",header=T,sep=",")
plot(Proc$Input,Proc$Time,main="Processing Times",xlab="Input",ylab="Time",col="red")
X <- Proc$Input
Y <- Proc$Time
mean(X)
var(X)
cov(X,Y)
mean(Y)
beta_1 <- cov(X,Y)/var(X)
beta_1
beta_0 <- mean(Y)-beta_1*mean(X)
beta_0
Proc.reg <- lm(Proc$Time~Proc$Input)
Proc.anova <- aov(Proc$Time~Proc$Input)
summary(Proc.reg)
par(mfrow=c(2,2))
# plot residuals
plot(fitted(Proc.reg),resid(Proc.reg),xlab="Fitted Values",ylab="Residuals",main="Residuals vs Fitted Values")
abline(h=0)
#Plot residuals in order with jitter to get an idea of independance
plot(c(1:length(X)),jitter(resid(Proc.reg)),type="l",xlab="Fitted Values",ylab="Residuals",main="Independence Plot")
abline(h=0) # plot quantile-quantile plots
qqnorm(resid(Proc.reg),xlab="Normal Scores")
qqline(resid(Proc.reg))
# plot histogram of residuals
hist(resid(Proc.reg),xlab="Residuals",main="Histogram of Residuals")
summary(Proc.reg)
summary(Proc.anova)
#Prac 3 Q1-a
confint(Proc.reg,level=0.95)
#Prac 3 Q1-c
confint(Proc.reg,level=0.975)
ci_b <-qt(0.975,length(Proc$Input)-2)
ci_a <- (beta_0+(beta_1*1.6))
ci_c <- (0.6388*(sqrt(1/10)+((1.6-mean(X))^2/(9*var(X)))))
ci_p95 <- ci_a+(ci_b*ci_c)
ci_n95 <- ci_a-(ci_b*ci_c)
ci_p95
ci_n95
#Prac 3 Q1-d
pi_c <- (0.6388*(1+(sqrt(1/10)+((1.6-mean(X))^2/(9*var(X))))))
pi_n95 <- ci_a-(ci_b*pi_c)
pi_p95 <- ci_a+(ci_b*pi_c)
pi_n95
pi_p95