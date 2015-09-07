mean=0; sd=1
lb=-0.5244005; ub=0

x <- seq(-4,4,length=100)*sd + mean
hx <- dnorm(x,mean,sd)

plot(x, hx, type="n", xlab="SAT scores", ylab="",
     main="", axes=FALSE)

lines(x, hx)
i <- x <= ub
polygon(c(0,x[i],ub), c(0,hx[i],0), col="yellow") 
i <- x <= lb
polygon(c(0,x[i],lb), c(0,hx[i],0), col="red") 
axis(1, at=seq(-4, 4, 1), pos=0)


