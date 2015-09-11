# ui.r
shinyUI(fluidPage(
  titlePanel("Rasch Information"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("idiff", label = "Item Difficulty", min = -3, max = 3, value = 1, step = 1, round = T)),
    mainPanel(plotOutput("one"))
  )
))