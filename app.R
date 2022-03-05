# Load required packages
library(shiny)
library(rclipboard)

#source files
source("functions.R")

# Define UI for application
ui <- fluidPage(
  includeCSS("www/custom.css"),
  
  rclipboardSetup(),
  
  fluidRow(
    column(width = 6, offset = 3, align="center",
           titlePanel("Generate a password"),
           h1(textOutput("password")),
           div(uiOutput("clip"), style="display:inline-block"),
           actionButton(inputId = "generate",
                        label = "Generate",
                        width = NULL
            ),#end actionButton
          br(),
          br(),
          numericInput(inputId = "alphabets",
                       label = "Alphabets",
                       value = 16,
                       width = 80,
          ),
          numericInput(inputId = "numbers",
                       label = "Numbers",
                       value = 4,
                       width = 80,
          ),
          numericInput(inputId = "specialChars",
                       label = "Characters",
                       value = 4,
                       width = 80,
          ),
           
    )#end column
  )#end FluidRow
)#end FluidPage

# Define server logic
server <- function(input, output) {
  
  pass <- reactive({
    
    input$generate
    
    pass <- isolate(genPassword(input$alphabets, input$numbers, input$specialChars))
    
  })
  
  output$password <- renderText(pass())
  
  # Add clipboard buttons
  output$clip <- renderUI({
    output$clip <- renderUI({
      rclipButton(
        inputId = "clipbtn",
        label = "",
        clipText = pass(), 
        icon = icon("clipboard")
      )
    })
  })
}

# Run the application 
shinyApp(ui, server)