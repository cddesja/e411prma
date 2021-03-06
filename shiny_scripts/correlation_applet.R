
library("shiny")
library("ggplot2")
shinyApp(
  ui = fluidPage(
  titlePanel("Correlations"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput('cor', label = "Correlation", 0,
                   min = -.95, max = .95, step = .05)),
    mainPanel(plotOutput("corplot"))
  )
),
 server = function(input,output){
   output$corplot <- renderPlot({
     n     <- 100                    # length of vector
     rho   <- input$cor             # desired correlation = cos(angle)
     theta <- acos(rho)             # corresponding angle
     x1    <- rnorm(n, 1, 1)        # fixed given data
     x2    <- rnorm(n, 2, 0.5)      # new random data
     X     <- cbind(x1, x2)         # matrix
     Xctr  <- scale(X, center=TRUE, scale=FALSE)   # centered columns (mean 0)
     Id   <- diag(n)                               # identity matrix
     Q    <- qr.Q(qr(Xctr[ , 1, drop=FALSE]))      # QR-decomposition, just matrix Q
     P    <- tcrossprod(Q)          # = Q Q'       # projection onto space defined by x1
     x2o  <- (Id-P) %*% Xctr[ , 2]                 # x2ctr made orthogonal to x1ctr
     Xc2  <- cbind(Xctr[ , 1], x2o)                # bind to matrix
     Y    <- Xc2 %*% diag(1/sqrt(colSums(Xc2^2)))  # scale columns to length 1
     x <- Y[ , 2] + (1 / tan(theta)) * Y[ , 1]     # final new vector
     dat <- data.frame(x1,x)
     qplot(x1, x, dat) + xlab("X") + ylab("Y")
   })
 }
)