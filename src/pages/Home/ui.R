source("./src/components/SideBarPanel/index.R")
source("./src/components/InitialButton/index.R")

source("./src/functions/Ui/mainPanel.R")

uiHome <- tags$div(
  sideBarPanel(id = "sideBarHome", route_id = "home"),
  mainPanel(
    tags$div(
      class = "initialText",
      h1("Seja bem-vindo!"),
      p(
        "A Plot Factory é uma plataforma voltada para a criação de gráficos
        interativos através da ferramenta estatística Shiny disponível no R."
      )
    ),
    initialButton(id = "initialButtonHome")
  )
)