typePanel <- function(id) {
  ns <- NS(id)

  tags$div(
    class = "typePanel",
    h2("Selecionando componentes"),
    selectInput(
      ns("typeOfPlot"),
      h4("Tipo de gráfico"),
      choices =
        c(
          "Escolha um tipo" = "",
          "Gráfico de linha" = 1,
          "Gráfico de barras" = 2,
          "Gráfico de pizza" = 3,
          "Gráfico de boxplot" = 4
        )
    ),
    tags$div(
      class = "typeChoices",
      uiOutput(ns("typeChoices"))
    )
  )
}

typePanelServer <- function(id, dataframe) {
  moduleServer(
    id,
    function(input, output, session) {
      output$typeChoices <- renderUI({
        req(input$typeOfPlot)

        selectInput(
          session$ns("typeVariableX"),
          h4("Variável eixo X"),
          choices = c("Escolha uma variável" = "", names(dataframe))
        )
      })
    }
  )
}