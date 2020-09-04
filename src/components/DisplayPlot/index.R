displayPlot <- function(id) {
  ns <- NS(id)

  tags$div(
    class = "blue-border",
    plotlyOutput(ns("plot"))
  )
}

displayPlotServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      code <- reactiveValues(text = NULL)

      output$plot <- renderPlotly({
        req(session$userData$plotOptions$title, session$userData$plotOptions$subtitle)

        result <- typeOfPlot(session = session, type = session$userData$plotOptions$type, dataframe = "dataframe")

        code$text <- result$text
        eval(parse(text = paste0("session$userData$dataframe$data %>%", result$plot)))
      })

      return(code)
    }
  )
}