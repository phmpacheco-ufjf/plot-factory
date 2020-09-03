codePlot <- function(id) {
  ns <- NS(id)

  tags$div(
    class = "blue-border",
    htmlOutput(ns("code"))
  )
}

codePlotServer <- function(id, code) {
  moduleServer(
    id,
    function(input, output, session) {
      output$code <- renderUI({
        HTML(code$text, sep = "<br/>")
      })
    }
  )
}