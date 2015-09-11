install.packages("irtoys")  # if you running Windows might need to do Rstudio as administrator to install this!
library(irtoys)
scores <- as.data.frame(Scored)

# Calculates total test score
scores$total_test <- rowSums(scores, na.rm = T)

#
# Item Reliability Index
#

# Calculate standard deviations for all items
item_sd <- apply(scores[-19], 2, sd) # we do -19 b/c it's the total test scores

# Find the correlations
r_cor <- cor(scores)[-19,19]

# Calculate item reliabilites
item_sd * r_cor
sort(item_sd * r_cor)
#
# Item Discrimination Index
# 
# Get 27 and 100-27 quantile scores
values <- quantile(scores$total_test,probs = c(.27, 1 - .27))
values
low_scores <- subset(scores, total_test <= values[1])
high_scores <- subset(scores, total_test >= values[2])

# Calculate d for item 1
d <- mean(high_scores$V1) - mean(low_scores$V1)

# Calculate all ds
all_d <- colMeans(high_scores) - colMeans(low_scores)
all_d[-19] # prints all the d except for the final column which is total test scores
