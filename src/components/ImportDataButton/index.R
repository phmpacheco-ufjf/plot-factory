importDataButton <- function(id, label, class) {
  ns <- NS(id)

  tags$div(
    tags$a(
      fileInputOnlyButton(
        inputId = ns("button"),
        label = NULL,
        buttonLabel = label,
        accept = ".RDS",
        class = class
      )
    )
  )
}

importDataButtonServer <- function(id, label) {
  moduleServer(
    id,
    function(input, output, session) {
      userFile <- reactive({
        validate(need(input$button, message = FALSE))
        input$button
      })

      dataframe <- reactive({
        readRDS(userFile()$datapath)
      })

      return(dataframe)
    }
  )
}