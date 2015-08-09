# Install the graphics program
install.packages("ggplot2")

# Load the library
library("ggplot2")

# Set up the parameters
sample_size <- 500
mean <- 100
standard_deviation <- 15

# Generate random numbers
x <- rnorm(sample_size, mean, standard_deviation)  

# Plot the data
qplot(x, fill = I("white"), color = I("#c96552")) + theme_bw() + xlab("Intelligence Quotient") + ylab("Frequency")

# -------------------------------

set.seed(107)
x1 <- rnbinom(500, mu = 4, size = 1)
qplot(x1, fill = I("white"), color = I("#c96552")) + theme_bw() + xlab("Number of drinks last month") + ylab("Frequency")

# -------------------------------

set.seed(105)
x1 <- rnorm(250, mean = 162, sd = 3)
x2 <- rnorm(250, mean = 180, sd = 3)
qplot(c(x1,x2), fill = I("white"), color = I("#c96552")) + theme_bw() + xlab("Height") + ylab("Frequency")

# ------------------------------
library("gridExtra")
set.seed(105)
x1 <- rnorm(500, mean = 100, sd = 15)
x2 <- rnorm(500, mean = 100, sd = 5)
g0 <- qplot(x1, fill = I("white"), color = I("blue")) + theme_bw() + xlab("IQ") + ylab("Frequency") + coord_cartesian(xlim = c(50, 150))
g1 <- qplot(x2, fill = I("white"), color = I("red")) + theme_bw() + xlab("IQ") + ylab("Frequency") + coord_cartesian(xlim = c(50, 150))
grid.arrange(g0,g1)

# -----------------------------
x <- seq(-4, 4, length=100)
hx <- dnorm(x)
plot(x, hx, type="l", xlab="Ability", ylab="Density", main="Normal Distribution")

# -----------------------------
mean=100; sd=15
lb=85; ub=115

x <- seq(-4,4,length=100)*sd + mean
hx <- dnorm(x,mean,sd)

plot(x, hx, type="n", xlab="IQ Values", ylab="",
     main="Normal Distribution", axes=FALSE, ylim = c(0,.03))

i.g <- x >= 55 & x <= 145
i.b <- x >= 70 & x <= 130
i.r <- x >= lb & x <= ub
lines(x, hx)


# polygon(c(55,x[i.g],145), c(0,hx[i.g],0), col="green")
# polygon(c(70,x[i.b],130), c(0,hx[i.b],0), col="blue")
# polygon(c(lb,x[i.r],ub), c(0,hx[i.r],0), col="red") 
area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
result <- paste("P(Green) = 99.7%\nP(Blue) = 95.4%\nP(Red) = 68.3%\n")
#text(77, .028,"13.59%", cex = .8)
text(78.5, .028,"13.59%", cex = .8)
text(92.5, .028,"34.13%", cex = .8)
text(107.5, .028,"34.13%", cex = .8)
text(60, .028,"2.15%", cex = .8)
text(123, .028,"2.15%", cex = .8)
abline(v = c(55, 70, 85, 100, 115, 130, 145))

axis(1, at=seq(40, 160, 20), pos=0)

