library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput("num", "Choose a number", 1, 100, 50)
    ),
    mainPanel(
      plotOutput("hist"),
      verbatimTextOutput("sum")
    )
  )
)

server <- function(input, output) {
  data <- reactive({rnorm(input$num)})
  output$hist <- renderPlot({
    hist(data())   
  })
  output$sum <- renderPrint({
    summary(data())
  })
}

shinyApp(ui = ui, server = server)