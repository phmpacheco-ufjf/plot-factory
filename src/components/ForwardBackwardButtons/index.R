forwardBackwardButtons <- function(id, forward = TRUE) {
  ns <- NS(id)

  tags$div(
    class = "forwardBackwardButtons",
    if (forward) {
      mainButton(
        mainButton = pageTransitionButton(
          id = ns("backward"),
          label = "Voltar",
          class = "green-button"
        ),
        button <- pageTransitionButton(
          id = ns("forward"),
          label = "Avançar",
          class = "green-button"
        )
      )
    } else {
      mainButton(
        mainButton = pageTransitionButton(
          id = ns("backward"),
          label = "Voltar",
          class = "green-button"
        )
      )
    }
  )
}

forwardBackwardButtonsServer <- function(id, backward, forward, ...) {
  moduleServer(
    id,
    function(input, output, session) {
      pageTransitionButtonServer(id = "backward", page = backward)

      pageTransitionButtonServer(id = "forward", page = forward, ...)
    }
  )
}