#server.r
library("ggplot2")
threepl <- function(person, b, a, c) {
  x <- c + (1 - c)*(exp(a * (person - b))/(1 + exp(a * (person - b))))
  return(x)
}

persons <- seq(-3, 3, by = .1)
b <- -3:3
a <- -3:3
C <- seq(0, 1, by = .1)

data_full <- NULL
for(k in 1:length(C)){
  data_c <- NULL

  for(i in 1:length(b)){
    data_a <- NULL
    
    for(j in 1:length(a)){
      tmp <- threepl(persons, b[i], a[j], C[k])
      id <- paste(b[i], a[j], C[k], sep = "_")
      data <- cbind(tmp,id)
      data_a <- rbind(data_a, data)
  }
  data_c <- rbind(data_c, data_a)
}
  data_full <- rbind(data_full, data_c) 
}
data_full <- as.data.frame(data_full)
data_full$estimate <- as.numeric(as.character(data_full$tmp))
data_full$persons <- persons
#head(data_full)
input <- data.frame(diff = 0, disc = 1, guess = 1)

shinyServer(
  function(input,output){
    output$threepl <- renderPlot({
      id_sub <- paste(input$diff, input$disc, input$guess, sep = "_")
      data_tmp <- subset(data_full, id == id_sub)
      qplot(y = estimate, x = persons, geom = "line", data = data_tmp) + ylab("Probability of Getting Item Correct") + xlab("Person Ability") + coord_cartesian(ylim = c(0, 1), xlim = c(-3, 3)) + geom_vline(xintercept = as.numeric(input$diff), colour = "red", linetype = "longdash") + geom_hline(yintercept = as.numeric(input$guess), colour = "red", linetype = "longdash")
    })
    
    
  })