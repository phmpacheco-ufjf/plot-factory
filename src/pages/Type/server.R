serverType <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelType")

  typePanelServer(id = "typePanelType")

  forwardBackwardButtonsServer(
    id = "forwardBackwardButtonsType", backward = "data-import", forward = "edition"
  )
}