serverEdition <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelEdition")

  plot <- editionPanelServer(id = "editionPanelEdition")

  observe({
    forwardBackwardButtonsServer(
      id = "forwardBackwardButtonsEdition",
      backward = "type",
      forward = "result",
      {
        req(plot$plotOptions$title, plot$plotOptions$subtitle)
        session$userData$plotOptions$title <- plot$plotOptions$title
        session$userData$plotOptions$subtitle <- plot$plotOptions$subtitle
        session$userData$plotOptions$hexColor <- plot$plotOptions$hexColor
        session$userData$plotOptions$typeColor <- plot$plotOptions$typeColor

        session$userData$plotConfig$subtitles <- plot$plotConfig$subtitles$state
        session$userData$plotConfig$subtitles_hover <- plot$plotConfig$subtitles_hover$state
      }
    )
  })
}