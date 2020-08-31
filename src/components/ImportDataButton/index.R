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
      dataframe <- reactive({
        req(input$button)

        readRDS(input$button$datapath)
      })

      observeEvent(dataframe(), {
        session$userData$dataframe$data <- dataframe()
      })
    }
  )
}