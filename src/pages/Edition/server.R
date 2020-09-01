serverEdition <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelEdition")

  plotOptions <- editionPanelServer(id = "editionPanelEdition")

  observe({
    req(plotOptions$title, plotOptions$subtitle)

    forwardBackwardButtonsServer(
      id = "forwardBackwardButtonsEdition",
      backward = "type",
      forward = "result",
      {
        session$userData$plotOptions$title <- plotOptions$title
        session$userData$plotOptions$subtitle <- plotOptions$subtitle
        session$userData$plotOptions$hexColor <- plotOptions$hexColor
        session$userData$plotOptions$typeColor <- plotOptions$typeColor
      }
    )
  })
}