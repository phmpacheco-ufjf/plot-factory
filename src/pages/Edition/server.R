serverEdition <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelEdition")

  editionPanelServer(id = "editionPanelEdition")

  forwardBackwardButtonsServer(
    id = "forwardBackwardButtonsEdition", backward = "type", forward = "result"
  )
}