serverResult <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelResult")

  resultPanelServer(id = "resultPanelResult")
  forwardBackwardButtonsServer(id = "backwardButtonResult", backward = "edition")
}