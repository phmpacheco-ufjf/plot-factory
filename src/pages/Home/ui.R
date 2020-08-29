uiHome <- tags$div(
  class = "home",
  sideBarPanel(id = "sideBarPanelHome", route_id = "home"),
  mainPanel(
    mainText(
      title = "Seja bem-vindo!",
      text = "A Plot Factory é uma plataforma voltada para a criação de gráficos
              interativos através da ferramenta estatística Shiny disponível no R."
    ),
    mainButton(
      mainButton = pageTransitionButton(
        id = "pageTransitionButtonHome",
        label = "Importar dados",
        class = "green-button"
      ),
      p("Clique aqui para começar")
    )
  )
)