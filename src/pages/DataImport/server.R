serverDataImport <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelDataImport")

  dataframe <<- importDataButtonServer(id = "importDataButtonDataImport")

  observeEvent(dataframe(), {
    displayDataframeServer(id = "displayDataframeDataImport", dataframe = dataframe())
  })

  forwardBackwardButtonsServer(
    id = "forwardBackwardButtonsDataImport", backward = "/", forward = "type"
  )
}