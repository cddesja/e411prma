
library("shiny")
library("ggplot2")
persons <- seq(-3, 3, by = .1)
b <- -3:3
rasch <- function(person, item) {
  exp(person - item)/(1 + exp(person - item))
}
data_r <- matrix(nrow = length(persons), ncol = length(b))
for(i in 1:length(b)){
  data_r[,i] <- rasch(persons, b[i])
}
data_r <- as.data.frame(data_r)
colnames(data_r) <- b

shinyServer(
  function(input, output){
    output$one <- renderPlot({
      qplot(y = data_r[,paste(input$idiff)], x = persons, geom = "line") + ylab("Probability of Getting Item Correct") + xlab("Person Ability") + coord_cartesian(ylim = c(0, 1), xlim = c(-3, 3)) + geom_vline(xintercept = as.numeric(input$idiff), colour = "red", linetype = "longdash")
    })
  }
)

data_r[,-1]
