editionPanel <- function(id) {
  ns <- NS(id)

  tags$div(
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
          resize = "none"
        ),
        textAreaInput(
          ns("subtitle"),
          label = h4("Escolha um subtítulo"),
          width = "100%",
          resize = "none"
        )
      ),
      tags$div(
        class = "color",
        colourInput(
          ns("hexColor"),
          label = h4("Escolha uma cor"),
          value = ""
        ),
        selectInput(
          ns("typeColor"),
          h4("Tom de cores"),
          choices = ""
        )
      )
    ),
    tags$div(
      class = "config",
    )
  )
}

editionPanelServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      observeEvent(session$userData$dataframe$data, {
        req(session$userData$dataframe$data)

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

        updateColourInput(
          "hexColor",
          value = session$userData$plotOptions$hexColor
        )
      })

      observeEvent(session$userData$plotOptions$variableGroupBy, {
        req(session$userData$plotOptions$variableGroupBy)

        updateSelectInput(
          session,
          "typeColor",
          choices = c("Escolha uma variável" = "", "Azul", "Vermelho"),
          selected = session$userData$plotOptions$typeColor
        )
      })

      observeEvent(input$title, {
        session$userData$plotOptions$title <- defaultSetPlotOptions(input = input$title)
      })

      observeEvent(input$subtitle, {
        session$userData$plotOptions$subtitle <- defaultSetPlotOptions(input = input$subtitle)
      })

      observeEvent(input$hexColor, {
        session$userData$plotOptions$hexColor <- defaultSetPlotOptions(input = input$hexColor)
      })

      observeEvent(input$typeColor, {
        session$userData$plotOptions$typeColor <- defaultSetPlotOptions(input = input$typeColor)
      })

      observe({
        session$userData$plotOptions$type

        if (is.null(session$userData$plotOptions$variableGroupBy)) {
          updateSelectInput(
            session,
            "typeColor",
            selected = ""
          )

          disable("typeColor")
          enable("hexColor")
        } else {
          disable("hexColor")
          enable("typeColor")
        }
      })
    }
  )
}