# ui.r
shinyUI(fluidPage(
  titlePanel("3PL IRT model"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("diff", label = "Item Difficulty",
                  choices = -3:3, selected = 0),
      selectInput("disc", label = "Item Discrimination",
                  choices = -3:3, selected = 1),
      sliderInput("guess", label = "Guessing", min = 0, max = 1, value = 0, step = .1)),
    mainPanel(plotOutput("threepl"))
  )
))