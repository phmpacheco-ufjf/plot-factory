serverDataImport <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelDataImport")

  dataframe <- importDataButtonServer(id = "importDataButtonDataImport")

  displayDataframeServer(id = "displayDataframeDataImport", dataframe = dataframe)

  observeEvent(dataframe$data, {
    forwardBackwardButtonsServer(
      id = "forwardBackwardButtonsDataImport",
      backward = "/",
      forward = "type",
      {
        session$userData$dataframe$data <- dataframe$data
      }
    )
  })
}