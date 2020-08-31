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
        "Gráfico de linha",
        "Gráfico de barras",
        "Gráfico de pizza",
        "Gráfico de boxplot"
      )

      observeEvent(session$userData$dataframe$data, {
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
        session$userData$plotOptions$type <- defaultSetPlotOptions(input = input$type)
      })

      observeEvent(input$variableX, {
        session$userData$plotOptions$variableX <- defaultSetPlotOptions(input = input$variableX)
      })

      observeEvent(input$variableY, {
        session$userData$plotOptions$variableY <- defaultSetPlotOptions(input = input$variableY)
      })

      observeEvent(input$variableGroupBy, {
        session$userData$plotOptions$variableGroupBy <- defaultSetPlotOptions(input = input$variableGroupBy)
      })

      observeEvent(input$type, {
        req(input$type)

        if (input$type == "Gráfico de pizza" | input$type == "Gráfico de boxplot") {
          updateSelectInput(
            session,
            "variableY",
            selected = ""
          )

          updateSelectInput(
            session,
            "variableGroupBy",
            selected = ""
          )

          disable("variableY")
          disable("variableGroupBy")
        } else {
          enable("variableY")
          enable("variableGroupBy")
        }
      })
    }
  )
}