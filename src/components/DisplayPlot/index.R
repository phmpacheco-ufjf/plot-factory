displayPlot <- function(id) {
  ns <- NS(id)

  tags$div(
    class = "blue-border",
    plotlyOutput(ns("plot"))
  )
}

displayPlotServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      code <- reactiveValues(text = NULL)

      output$plot <- renderPlotly({
        req(session$userData$plotOptions$title, session$userData$plotOptions$subtitle)
        text <- paste0("plot_ly(<br>
          &nbsp x = ~", session$userData$plotOptions$variableX, ",<br>
          &nbsp y = ~", session$userData$plotOptions$variableY, ',<br>
          &nbsp type = "scatter",<br>
          &nbsp mode = "markers+line",<br>
          &nbsp marker = list(color = "#299213"),<br>
          &nbsp line = list(color = "#299213")<br>
        ) %>%<br>
          &nbsp layout(<br>
            &nbsp &nbsp xaxis = list(title = "', session$userData$plotOptions$variableX, '", fixedrange = TRUE),<br>
            &nbsp &nbsp yaxis = list(title = "', session$userData$plotOptions$variableY, '", fixedrange = TRUE)<br>
          &nbsp )<br>')

        plot <- plot_ly(
          x = ~ eval(parse(text = paste0("session$userData$dataframe$data$`", session$userData$plotOptions$variableX, "`"))),
          y = ~ eval(parse(text = paste0("session$userData$dataframe$data$`", session$userData$plotOptions$variableY, "`"))),
          type = "scatter",
          mode = "markers+line",
          marker = list(color = "#299213"),
          line = list(color = "#299213")
        ) %>%
          layout(
            xaxis = list(title = paste(session$userData$plotOptions$variableX), fixedrange = TRUE),
            yaxis = list(title = paste(session$userData$plotOptions$variableY), fixedrange = TRUE)
          )

        code$text <- text
        plot
      })

      return(code)
    }
  )
}