#server.r
library("ggplot2")
rascha <- function(person, item, a) {
  exp(a*(person - item))/(1 + exp(a*(person - item)))
}

persons <- seq(-3, 3, by = .1)
b <- -3:3
a <- -3:3

data_full <- NULL
for(i in 1:length(b)){
  data <- matrix(nrow = length(persons), ncol = length(a))
  for(j in 1:length(a)){
    data[,j] <- rascha(persons, b[i], a[j])
  }
  data_full <- cbind(data_full,data)
}
x <- NULL
for(i in 1:length(b)){
  tmp <- paste(b[i], a, sep = "")
  x <- append(x, tmp)
}
colnames(data_full) <- x

shinyServer(
  function(input,output){
    output$twopl <- renderPlot({
      qplot(y = data_full[,paste(input$diff, input$disc, sep = "")], x = persons, geom = "line") + ylab("Probability of Getting Item Correct") + xlab("Person Ability") + coord_cartesian(ylim = c(0, 1), xlim = c(-3, 3)) + geom_vline(xintercept = as.numeric(input$diff), colour = "red", linetype = "longdash")
    })
    
    
  })