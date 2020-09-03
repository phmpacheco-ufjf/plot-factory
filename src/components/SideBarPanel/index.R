sideBarPanel <- function(id) {
  ns <- NS(id)

  tags$div(
    class = "sideBarPanel",
    img(src = "./assets/logos/logoWithTagline.svg", class = "logo"),
    tags$div(
      class = "navigation",
      sideBarPanelItem(id = ns("home")),
      sideBarPanelItem(id = ns("data-import")),
      sideBarPanelItem(id = ns("type")),
      sideBarPanelItem(id = ns("edition")),
      sideBarPanelItem(id = ns("result"))
    ),
    tags$div(
      class = "footer",
      img(src = "./assets/icons/copyright.svg"),
      p("Todos os direitos reservados")
    )
  )
}

sidebarPanelServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      sideBarPanelItemServer(
        id = "home", ref = "/", label = "Página inicial"
      )
      sideBarPanelItemServer(
        id = "data-import", ref = "data-import", label = "Importando dados"
      )
      sideBarPanelItemServer(
        id = "type", ref = "type", label = "Tipo de gráfico"
      )
      sideBarPanelItemServer(
        id = "edition", ref = "edition", label = "Edição"
      )
      sideBarPanelItemServer(
        id = "result", ref = "result", label = "Resultado"
      )
    }
  )
}