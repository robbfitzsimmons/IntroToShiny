library(shiny)

ui <- fluidPage(
  sliderInput("num", "Choose a number:", 1, 100, 50),
  plotOutput("hist"),
  verbatimTextOutput("sum")
)

server <- function(input, output) {
  data <- reactive({
    rnorm(input$num)
  })
  output$hist <- renderPlot({
    hist(data())
  })
  output$sum <- renderPrint({
    summary(data())
  })
}

shinyApp(ui = ui, server = server)
