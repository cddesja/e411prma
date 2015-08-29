# Create the Spearman-Brown correction formula for a split half
sb <- function(r_hh){
  2 * r_hh / (1 + r_hh)
}
# Run the function
sb(0.6)

# Find the new test length
new_length <- function(r_sb, r_hh, n){
  r_sb * (1 - r_hh) / (r_hh * (1 - r_sb)) * n
}

# Run the function
new_length(0.9, 0.5, 40)

# Run the LSAT example, I didn't do this in class
lsat <- read.csv("http://cddesja.github.io/classes/e411prma2015-1/lecture3/data/lsat.csv")

# Kuder-Richardson 20
kr20 <- function(data){
  p <- colMeans(data)
  q <- 1 - colMeans(data)
  num <- sum(p * q) 
  denom <- var(rowSums(data))
  k <- ncol(data)
  k / (k - 1) * (1 - num / denom)
}
kr20(lsat)

# Coefficient Alpha
coef_alpha <- function(data){
  num <- sum(apply(data, 2, var))
  denom <- var(rowSums(data))
  k <- ncol(data)
  k / (k - 1) * (1 - num / denom)
}
coef_alpha(lsat)

# 95% confidence interval
# You will ned to install the cocron library to use this function.
install.packages("cocron")
cocron::cronbach.alpha.CI(coef_alpha(lsat), n = nrow(lsat), items = 5) 

