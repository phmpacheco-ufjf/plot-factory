serverType <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelType")

  typePanelServer(id = "typePanelType", dataframe = dataframe())
  forwardBackwardButtonsServer(
    id = "forwardBackwardButtonsType", backward = "data-import", forward = "edition"
  )
}