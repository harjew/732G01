# Test för de som vill
install.packages("animation")
library(animation)

x <- seq(-4.5,4.5,.01)
dn <- dnorm(x)
saveGIF(
  {
    k <- c()
    for(i in c(seq(1,10,1),seq(15,100,5))){
      a <- dt(x,i) 
      plot(x,dn,col="blue",type = "l",main="Z vs t",ylab = "",xlab = "",xlim=c(-4,4))
      if(i > 1){
        for(j in k){
          a2 <- dt(x,j) 
          lines(x,a2,col='pink')
          points(x=c(qt(0.025,j),qt(0.975,j)),y=c(dt(qt(0.025,j),j),dt(qt(0.975,j),j)),pch=19,col="pink",cex=0.7)
          
        }
      }
      k <- c(k,i)
      lines(x,a,col='red')
      lines(x,dn,col="blue",type = "l")
      points(x=c(qt(0.025,i),qt(0.975,i)),y=c(dt(qt(0.025,i),i),dt(qt(0.975,i),i)),pch=19,col="red",cex=0.7)
      points(x=c(qnorm(0.025),qnorm(0.975)),y=c(dnorm(qnorm(0.025)),dnorm(qnorm(0.975))),pch=19,col="blue",cex=0.7)
      text(x=c(qnorm(0.025),qnorm(0.975)),y=c(dnorm(qnorm(0.025)),dnorm(qnorm(0.975))),
           labels = c("-1.96","1.96"),pos = c(4,2),cex=0.7,col="blue")
      text(x=c(qt(0.025,i),qt(0.975,i)),y=c(dt(qt(0.025,i),i),dt(qt(0.975,i),i)),
           labels = c(round(qt(0.025,i),3),round(qt(0.975,i),3)),pos = c(2,4),cex=0.7,col="red")
      abline(h=0,col="gray",lty=3)
      legend("topleft",c("Z",paste("t,df=",i),"95% konfidensintervall Z",paste("95% konfidensintervall t,df=",i)),
             col =c("blue","red","blue","red"),pch=c(NA,NA,19,19),lty=c(1,1,NA,NA),cex=0.8)
    }
  },
  movie.name = "zvst.gif",
  interval= 0.5,
  ani.width = 700, 
  ani.height = 700
)

