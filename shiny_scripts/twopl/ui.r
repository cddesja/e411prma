# ui.r
shinyUI(fluidPage(
  titlePanel("2PL IRT model"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("diff", label = "Item Difficulty",
                  choices = -3:3, selected = 0),
      sliderInput("disc", label = "Item Discrimination", min = -3, max = 3, value = 1, step = 1, round = T)),
    mainPanel(plotOutput("twopl"))
  )
))