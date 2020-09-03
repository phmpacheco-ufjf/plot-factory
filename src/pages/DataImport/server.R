serverDataImport <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelDataImport")

  dataframe <- importDataButtonServer(id = "importDataButtonDataImport")

  displayDataframeServer(id = "displayDataframeDataImport", dataframe = dataframe)

  observe({
    forwardBackwardButtonsServer(
      id = "forwardBackwardButtonsDataImport",
      backward = "/",
      forward = "type",
      {
        req(dataframe$data)
        session$userData$dataframe$data <- dataframe$data
      }
    )
  })
}