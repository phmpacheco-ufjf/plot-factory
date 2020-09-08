typePanel <- function(id) {
  ns <- NS(id)

  tags$div(
    class = "typePanel",
    h2("Selecionando componentes"),
    tags$div(
      class = "typeChoices",
      selectInput(
        ns("type"),
        h4("Tipo de gráfico"),
        choices = ""
      ),
      selectInput(
        ns("variableX"),
        h4("Variável eixo X"),
        choices = ""
      ),
      selectInput(
        ns("variableY"),
        h4("Variável eixo Y"),
        choices = ""
      ),
      selectInput(
        ns("variableGroupBy"),
        h4("Agrupar por"),
        choices = ""
      )
    )
  )
}

typePanelServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      choices <- c(
        "Escolha um tipo" = "",
        "Gráfico de linha (com pontos)" = "markers+lines",
        "Gráfico de linha (sem pontos)" = "lines",
        "Gráfico de dispersão" = "markers",
        "Gráfico de pizza" = "pie",
        "Gráfico de boxplot" = "box"
      )

      observe({
        req(session$userData$dataframe$data)

        updateSelectInput(
          session,
          "type",
          choices = choices,
          selected = session$userData$plotOptions$type
        )

        updateSelectInput(
          session,
          "variableX",
          choices = c("Escolha uma variável" = "", names(session$userData$dataframe$data)),
          selected = session$userData$plotOptions$variableX
        )

        updateSelectInput(
          session,
          "variableY",
          choices = c("Escolha uma variável" = "", names(session$userData$dataframe$data)),
          selected = session$userData$plotOptions$variableY
        )

        updateSelectInput(
          session,
          "variableGroupBy",
          choices = c("Escolha uma variável" = "", names(session$userData$dataframe$data)),
          selected = session$userData$plotOptions$variableGroupBy
        )
      })

      observeEvent(input$type, {
        req(input$type)

        if (input$type == "pie" | input$type == "box") {
          updateSelectInput(
            session,
            "variableY",
            selected = ""
          )

          disable("variableY")
        } else {
          enable("variableY")
        }
      })

      plotOptions <- reactiveValues(
        type = NULL,
        variableX = NULL,
        variableY = NULL,
        variableGroupBy = NULL
      )

      observeEvent(input$type, {
        plotOptions$type <- defaultSetPlotOptions(input = input$type)
      })

      observeEvent(input$variableX, {
        plotOptions$variableX <- defaultSetPlotOptions(input = input$variableX)
      })

      observeEvent(input$variableY, {
        plotOptions$variableY <- defaultSetPlotOptions(input = input$variableY)
      })

      observeEvent(input$variableGroupBy, {
        plotOptions$variableGroupBy <- defaultSetPlotOptions(input = input$variableGroupBy)
      })

      return(plotOptions)
    }
  )
}