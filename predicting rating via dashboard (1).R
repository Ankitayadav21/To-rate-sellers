library(shiny)
ui <- shinyUI(fluidPage(
  mainPanel(
    numericInput("X", "Enter COST", 1,min = 0,max = 40),
    numericInput("Y", "Enter EXPERIENCE", 1,min = 0, max = 5),
    numericInput("Z",  "Enter EMERGENCY", 1,min = 0, max = 5),
    h5("BEST SELLER"),
    span(textOutput("text_calc"),style="color:red")),
  numericInput("A", "Enter COST", 1,min = 0,max = 40),
  numericInput("B", "Enter EXPERIENCE", 1,min = 0, max = 5),
  numericInput("C",  "Enter EMERGENCY", 1,min = 0, max = 5),
  h5("RATING"),
  span(textOutput("text_calc1"),style="color:red"),
  span(textOutput("text_calc2"), style="color:red")
))
server <- shinyServer(function(input, output,session){
  output$text_calc <- renderText({
    x <- input$X
    y <- input$Y
    z <- input$Z
    paste(" First Seller's rating is", -0.57517+ (0.11765*x) + (0.36953*y) + (0.26212*z))
  })
  output$text_calc1 <- renderText({
    a <- input$A
    b <- input$B
    c <- input$C
    paste("Second Seller's rating is", -0.57517+ (0.11765*a) + (0.36953*b) + (0.26212*c))
  })
  output$text_calc2 <- renderText({
    x <- input$X
    y <- input$Y
    z <- input$Z
    a <- input$A
    b <- input$B
    c <- input$C
    paste("BEST SELLER",max(-0.57517+ (0.11765*x) + (0.36953*y) + (0.26212*z),-0.57517+ (0.11765*a) + (0.36953*b) + (0.26212*c)))
  })
})


shinyApp(ui = ui, server = server)
