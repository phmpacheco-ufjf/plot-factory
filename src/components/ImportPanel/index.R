importPanel <- function(id) {
  ns <- NS(id)

  tags$div(
    class = "importData",
    mainButton(
      mainButton = importDataButton(id = ns("button"), label = "Selecionar", class = "green-button")
    ),
    displayDataframe(id = ns("display"))
  )
}

importPanelServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      dataframe <- importDataButtonServer(id = "button")

      displayDataframeServer(id = "display", dataframe = dataframe)

      return(dataframe)
    }
  )
}