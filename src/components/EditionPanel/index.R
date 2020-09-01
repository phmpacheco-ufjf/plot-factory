editionPanel <- function(id) {
  ns <- NS(id)

  tags$div(
    useShinyjs(),
    class = "editionPanel",
    h2("Estilizando componentes"),
    tags$div(
      class = "main",
      tags$div(
        class = "titles",
        textAreaInput(
          ns("title"),
          label = h4("Escolha um título"),
          width = "100%",
          value = "",
          resize = "none"
        ),
        textAreaInput(
          ns("subtitle"),
          label = h4("Escolha um subtítulo"),
          width = "100%",
          value = "",
          resize = "none"
        )
      ),
      tags$div(
        class = "color",
        uiOutput(ns("color"))
      )
    ),
    tags$div(
      class = "config",
      switchCheckbox(id = ns("teste"))
    )
  )
}

editionPanelServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      switchCheckboxServer(id = "teste")

      output$color <- renderUI({
        req(session$userData$plotOptions$type, session$userData$plotOptions$variableX)

        if (session$userData$plotOptions$type == "Gráfico de boxplot") {
          tagList(
            colourInput(
              session$ns("hexColor"),
              label = h4("Escolha uma cor"),
              value = session$userData$plotOptions$hexColor
            ),
            disabled(
              selectInput(
                session$ns("typeColor"),
                h4("Tom de cores"),
                choices = "",
                selected = ""
              )
            )
          )
        } else if (session$userData$plotOptions$type == "Gráfico de pizza") {
          tagList(
            disabled(
              colourInput(
                session$ns("hexColor"),
                label = h4("Escolha uma cor"),
                value = ""
              )
            ),
            selectInput(
              session$ns("typeColor"),
              h4("Tom de cores"),
              choices = c("Escolha uma variável" = "", "Azul", "Vermelho"),
              selected = session$userData$plotOptions$typeColor
            )
          )
        } else {
          if (is.null(session$userData$plotOptions$variableGroupBy)) {
            tagList(
              colourInput(
                session$ns("hexColor"),
                label = h4("Escolha uma cor"),
                value = session$userData$plotOptions$hexColor
              ),
              disabled(
                selectInput(
                  session$ns("typeColor"),
                  h4("Tom de cores"),
                  choices = "",
                  selected = ""
                )
              )
            )
          } else {
            tagList(
              disabled(
                colourInput(
                  session$ns("hexColor"),
                  label = h4("Escolha uma cor"),
                  value = ""
                )
              ),
              selectInput(
                session$ns("typeColor"),
                h4("Tom de cores"),
                choices = c("Escolha uma variável" = "", "Azul", "Vermelho"),
                selected = session$userData$plotOptions$typeColor
              )
            )
          }
        }
      })

      observe({
        req(session$userData$plotOptions$type, session$userData$plotOptions$variableX)

        updateTextAreaInput(
          session,
          "title",
          value = session$userData$plotOptions$title
        )

        updateTextAreaInput(
          session,
          "subtitle",
          value = session$userData$plotOptions$subtitle
        )
      })

      plotOptions <- reactiveValues(
        title = NULL,
        subtitle = NULL,
        hexColor = NULL,
        typeColor = NULL
      )

      observeEvent(input$title, {
        plotOptions$title <- defaultSetPlotOptions(input = input$title)
      })

      observeEvent(input$subtitle, {
        plotOptions$subtitle <- defaultSetPlotOptions(input = input$subtitle)
      })

      observeEvent(input$hexColor, {
        plotOptions$hexColor <- defaultSetPlotOptions(input = input$hexColor)
      })

      observeEvent(input$typeColor, {
        plotOptions$typeColor <- defaultSetPlotOptions(input = input$typeColor)
      })

      return(plotOptions)
    }
  )
}