serverType <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelType")

  plotOptions <- typePanelServer(id = "typePanelType")

  observe({
    req(plotOptions$type, plotOptions$variableX)

    forwardBackwardButtonsServer(
      id = "forwardBackwardButtonsType",
      backward = "data-import",
      forward = "edition",
      {
        session$userData$plotOptions$type <- plotOptions$type
        session$userData$plotOptions$variableX <- plotOptions$variableX
        session$userData$plotOptions$variableY <- plotOptions$variableY
        session$userData$plotOptions$variableGroupBy <- plotOptions$variableGroupBy
      }
    )
  })
}