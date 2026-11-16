library(shiny)
library(tidyverse)

ui <- fluidPage(
  titlePanel(
    tagList(
      textOutput("title", inline = TRUE),
      "Shiny App"
    ),
    # Without this, the browser tab would show the HTML of the title above.
    windowTitle = "Shiny App"
  ),
  textInput("name", label = "Enter your Name"),
  numericInput("age", label = "How old are you?", value = 0),
  textOutput("greeting"),
  textOutput("agefn")
)

server <- function(input, output, session) {
  output$title <- renderText(paste0(input$name, "'s"))
  output$greeting <- renderText(paste0("Hello ", input$name))
  output$agefn <- renderText(paste0("You are ", input$age, " years old"))
}

shinyApp(ui, server)
