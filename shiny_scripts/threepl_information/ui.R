# ui.r
shinyUI(fluidPage(
  titlePanel("3PL IRT model"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("diff", label = "Item Difficulty",
                  choices = -3:3, selected = 0),
      sliderInput("disc", label = "Item Discrimination", min = 1, max = 3, value = 1, step = .1),
      sliderInput("guess", label = "Guessing", min = 0, max = 1, value = 0, step = .25)),
    mainPanel(plotOutput("threepl"))
  )
))