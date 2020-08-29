forwardBackwardButtons <- function(id) {
  ns <- NS(id)

  tags$div(
    class = "forwardBackwardButtons",
    mainButton(
      mainButton = pageTransitionButton(
        id = ns("backward"),
        label = "Voltar",
        class = "green-button"
      ),
      button = pageTransitionButton(
        id = ns("forward"),
        label = "Avançar",
        class = "green-button"
      )
    )
  )
}

forwardBackwardButtonsServer <- function(id, backward, forward) {
  moduleServer(
    id,
    function(input, output, session) {
      pageTransitionButtonServer(id = "backward", page = backward)
      pageTransitionButtonServer(id = "forward", page = forward)
    }
  )
}