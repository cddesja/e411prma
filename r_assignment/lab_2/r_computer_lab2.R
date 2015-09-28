## ------------------------------------------------------------------------
install.packages("irtoys")
library("irtoys")

## ------------------------------------------------------------------------
getwd()

## ------------------------------------------------------------------------
# This actually runs the model
rasch_model <- est(Scored, model="1PL", engine="ltm", rasch = TRUE)

#
# Estimated Parameters
#
est_params <- rasch_model$est
colnames(est_params) <- c("Discrimination", "Difficulty", "Guessing")
rownames(est_params) <- paste("Item", 1:18)
est_params

#
# Standard Errors
# 
est_se <- rasch_model$se
colnames(est_se) <- c("Discrimination SE", "Difficulty SE", "Guessing SE")
rownames(est_se) <- paste("Item", 1:18)
est_se

#
# Plot item response function for items 1, 3, 5
#
plot(irf(est_params[c(1,3,5),]), co = NA)  
# you can safely delete co = NA if you want the lines to all be black

#
# Estimated abilities
#
est_abl <- as.data.frame(mlebme(Scored, ip = est_params))
min(est_abl$est)  # Prints the minimum score
max(est_abl$est)  # Prints the maximum scores
which.min(est_abl$est)  # Prints out the person minimum score
which.max(est_abl$est)  # Prints out the person with the maximum score

# To find out score for person 200
est_abl[200,]

#
# Plot Item Information Function for items 1, 3, 5
#
plot(iif(est_params[c(1,3,5),]), co = NA)  


#
# Plot Test Information Function
#
plot(tif(est_params))

## ------------------------------------------------------------------------
# This actually runs the model
twopl_model <- est(Scored, model="2PL", engine="ltm")

#
# Estimated Parameters
#
twopl_params <- twopl_model$est
colnames(twopl_params) <- c("Discrimination", "Difficulty", "Guessing")
rownames(twopl_params) <- paste("Item", 1:18)
twopl_params

#
# Estimated abilities
#
twopl_abl <- as.data.frame(mlebme(Scored, ip = twopl_params))

# Correlation between the ability estimates
cor(twopl_abl$est,est_abl$est)

#
# Plot Item Information Function for items 1, 3, 5
#
plot(iif(twopl_params[c(1,3,5),]), co = NA) 
 

