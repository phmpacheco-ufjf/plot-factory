importData <- function(idButton, idDisplay) {
  tags$div(
    class = "importData",
    mainButton(
      mainButton = importDataButton(id = idButton, label = "Selecionar", class = "green-button")
    ),
    displayDataframe(id = idDisplay)
  )
}