source("./src/functions/Ui/sideBarPanelItem.R")

sideBarPanel <- function(id, route_id) {
  ns <- NS(id)

  tags$div(
    class = "panel",
    img(src = "./assets/logos/logoWithTagline.svg", class = "logo"),
    tags$div(
      class = "navigation",
      sideBarPanelItem(id = ns("home"), ref = "home", label = "Página Inicial", route_id = route_id),
      sideBarPanelItem(id = ns("data-import"), ref = "data-import", label = "Importando dados", route_id = route_id),
      sideBarPanelItem(id = ns("type"), ref = "type", label = "Tipo de gráfico", route_id = route_id),
      sideBarPanelItem(id = ns("edition"), ref = "edition", label = "Edição", route_id = route_id),
      sideBarPanelItem(id = ns("result"), ref = "result", label = "Resultado", route_id = route_id)
    ),
    tags$div(
      class = "footer",
      img(src = "./assets/icons/copyright.svg"),
      p("Todos os direitos reservados")
    )
  )
}

sidebarPanelServer <- function(id, route_id) {
  moduleServer(
    id,
    function(input, output, session) {
      onclick("home", if (!is_page("/")) change_page("/"))

      onclick("data-import", if (!is_page("data-import")) change_page("data-import"))

      onclick("type", if (!is_page("type")) change_page("type"))

      onclick("edition", if (!is_page("edition")) change_page("edition"))

      onclick("result", if (!is_page("result")) change_page("result"))
    }
  )
}