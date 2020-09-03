sideBarPanelItem <- function(id) {
  ns <- NS(id)

  uiOutput(ns("item"))
}

sideBarPanelItemServer <- function(id, label, ref) {
  moduleServer(
    id,
    function(input, output, session) {
      output$item <- renderUI({
        tags$div(
          class = "sideBarPanelItem",
          img(src = "./assets/icons/grayTriangle.svg"),
          tags$a(
            label,
            id = session$ns("button"),
            class = if (is_page(ref)) "action-button active" else "action-button"
          )
        )
      })

      # onclick("button", if (!is_page(ref)) change_page(ref))
    }
  )
}