initialButton <- function(id) {
  ns <- NS(id)

  tags$div(
    p("Clique aqui para começar"),
    tags$a(
      id = ns("button"),
      class = "action-button",
      "Importar dados"
    )
  )
}

initialButtonServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      onclick("button", change_page("data-import"))
    }
  )
}