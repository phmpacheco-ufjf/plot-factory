serverType <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelType")

  plotOptions <- typePanelServer(id = "typePanelType")

  observe({
    forwardBackwardButtonsServer(
      id = "forwardBackwardButtonsType",
      backward = "data-import",
      forward = "edition",
      {
        req(plotOptions$type, plotOptions$variableX)
        session$userData$plotOptions$type <- plotOptions$type
        session$userData$plotOptions$variableX <- plotOptions$variableX
        session$userData$plotOptions$variableY <- plotOptions$variableY
        session$userData$plotOptions$variableGroupBy <- plotOptions$variableGroupBy
      }
    )
  })
}