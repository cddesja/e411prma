library("shiny")
library("irtoys")

shinyServer(
  function(input, output){
    output$one <- renderPlot({
      plot(iif(c(1, input$idiff, 0)))
    })
  }
)

