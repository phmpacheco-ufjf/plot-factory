serverDataImport <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelDataImport")

  importDataButtonServer(id = "importDataButtonDataImport")

  observeEvent(session$userData$dataframe$data, {
    displayDataframeServer(id = "displayDataframeDataImport")
  })

  forwardBackwardButtonsServer(
    id = "forwardBackwardButtonsDataImport", backward = "/", forward = "type"
  )
}