resultPanel <- function(id) {
  ns <- NS(id)

  tags$div(
    class = "container",
    displayPlot(id = ns("plot")),
    codePlot(id = ns("code"))
  )
}

resultPanelServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      code <- displayPlotServer(id = "plot")

      codePlotServer(id = "code", code = code)
    }
  )
}