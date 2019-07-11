data1<-read.csv("Entry Only.csv")
plot(data1$wait)
str(data1)
library(ggplot2)
ggplot(data1, aes(data1$service.time ,..density..))+ geom_histogram(fill="blue",color="black",alpha = 0.5,bins =50) #+ geom_density()

library(fitdistrplus)
descdist(data1$shop, boot = 1000)


fp = fitdist(data1$roam,"normal")

summary(fln)
mean(data1$roam)