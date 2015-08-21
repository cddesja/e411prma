install.packages(c("shiny", "ggplot2"))

shinyApp(
  ui = fluidPage(
    titlePanel("Normal Distribution"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("mu", label = "Mean", min = 0, max = 200, value = 100, step = 20),
        sliderInput("sigma", label = "Standard Deviation",min = 1, max = 30, value = 15, step = 1),
        sliderInput("sampsize", label = "Sample Size", min = 25, max = 500, value = 25, step = 25),
        sliderInput("bin", label = "Width of the Bin", min = 1, max = 30, value = 1, step = 2)),
      mainPanel(plotOutput("normal")))),
    
  server = function(input, output) {
    output$normal <- renderPlot({
      dat <- rnorm(as.numeric(input$sampsize), as.numeric(input$mu), as.numeric(input$sigma))
      qplot(dat, geom = "histogram", bin = input$bin, fill = I("white"), color = I("red")) + xlab("Score") + ylab("Frequency")
    })
  },
  options = list(height = 600, width = 500)
)
