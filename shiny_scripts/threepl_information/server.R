library("shiny")
library("irtoys")

shinyServer(
  function(input, output){
    output$threepl <- renderPlot({
      plot(iif(c(as.numeric(input$disc), as.numeric(input$diff), as.numeric(input$guess))), ylim = c(0,3))
    })
  }
)

