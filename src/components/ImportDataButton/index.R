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
      dataframe <- reactiveValues(data = NULL)

      observeEvent(input$button, {
        dataframe$data <- readRDS(input$button$datapath)
      })

      return(dataframe)
    }
  )
}