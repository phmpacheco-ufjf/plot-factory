serverDataImport <- function(input, output, session) {
  sidebarPanelServer(id = "sideBarPanelDataImport")
  dataframe <- importPanelServer(id = "importPanelDataImport")

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