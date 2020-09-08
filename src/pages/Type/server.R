serverType <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelType")

  plotOptions <- typePanelServer(id = "typePanelType")

  observe({
    forwardBackwardButtonsServer(
      id = "forwardBackwardButtonsType",
      backward = "data-import",
      forward = "edition",
      {
        req(plotOptions$type)
        if (plotOptions$type == "markers+lines" | plotOptions$type == "markers" | plotOptions$type == "lines") {
          req(plotOptions$variableX, plotOptions$variableY)
        } else if (plotOptions$type == "pie") {
          req(plotOptions$variableX, plotOptions$variableGroupBy)
        } else {
          req(plotOptions$variableX)
        }

        session$userData$plotOptions$type <- plotOptions$type
        session$userData$plotOptions$variableX <- plotOptions$variableX
        session$userData$plotOptions$variableY <- plotOptions$variableY
        session$userData$plotOptions$variableGroupBy <- plotOptions$variableGroupBy
      }
    )
  })
}