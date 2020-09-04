typeOfPlot <- function(session, type, dataframe) {
  if (type == "Gráfico de linha (com pontos)" | type == "Gráfico de linha (sem pontos)" | type == "Gráfico de dispersão") {
    str <- array(NA)

    str[1] <- "plot_ly("
    str[2] <- paste0("x = ~`", session$userData$plotOptions$variableX, "`,")
    str[3] <- paste0("y = ~`", session$userData$plotOptions$variableY, "`,")
    str[4] <- "type = 'scatter',"

    if (type == "Gráfico de linha (com pontos)") {
      str[5] <- "mode = 'markers+lines',"
    } else if (type == "Gráfico de linha (sem pontos)") {
      str[5] <- "mode = 'lines',"
    } else if (type == "Gráfico de dispersão") {
      str[5] <- "mode = 'markers',"
    }

    if (!is.null(session$userData$plotOptions$variableGroupBy)) {
      str[6] <- paste0("color = ~`", session$userData$plotOptions$variableGroupBy, "`,")
      str[7] <- paste0("colors = '", session$userData$plotOptions$typeColor, "',")
      aux <- TRUE
    } else {
      str[6] <- paste0("marker = list(color = '", session$userData$plotOptions$hexColor, "'),")
      str[7] <- paste0("line = list(color = '", session$userData$plotOptions$hexColor, "'),")
      aux <- FALSE
    }

    str[8] <- "hoverinfo = 'text',"

    str[9] <- paste0(
      "text = ~ paste('", session$userData$plotOptions$variableX, " = ', `", session$userData$plotOptions$variableX,
      "`, ', ", session$userData$plotOptions$variableY, " = ', `", session$userData$plotOptions$variableY, "`)"
    )

    str[10] <- ") %>%"

    str[11] <- "layout("

    str[12] <- paste0("title = '", session$userData$plotOptions$title, "',")

    str[13] <- paste0(
      "annotations = list(text = '", session$userData$plotOptions$subtitle,
      "', showarrow = FALSE, align = 'center', x = 0.5, y = 1, xref = 'paper', yref = 'paper'),"
    )

    str[14] <- "legend = list(orientation = 'h', xanchor = 'center', x = 0.5, y = 0),"

    str[15] <- paste0("xaxis = list(fixedrange = ", session$userData$plotConfig$fixedRange, "),")

    str[16] <- paste0("yaxis = list(fixedrange = ", session$userData$plotConfig$fixedRange, "),")

    str[17] <- paste0("showlegend = ", session$userData$plotConfig$subtitles)

    str[18] <- ")"

    if (type == "Gráfico de linha (com pontos)") {
      plot <- capture.output(cat(str))
    } else if (type == "Gráfico de linha (sem pontos)") {
      if (aux) {
        plot <- capture.output(cat(str))
      } else {
        plot <- capture.output(cat(str[-6]))
      }
    } else if (type == "Gráfico de dispersão") {
      if (aux) {
        plot <- capture.output(cat(str))
      } else {
        plot <- capture.output(cat(str[-7]))
      }
    }

    textFormat <- function(el, spaces) {
      return(paste0(strrep("&nbsp ", spaces), el, "<br>"))
    }

    text <- capture.output(
      cat(
        c(
          paste0(dataframe, " %>%<br>"),
          textFormat(el = str[1], spaces = 0),
          sapply(str[2:9], textFormat, spaces = 1),
          textFormat(el = str[10], spaces = 0),
          textFormat(el = str[11], spaces = 1),
          sapply(str[12:17], textFormat, spaces = 2),
          textFormat(el = str[18], spaces = 1)
        )
      )
    )

    return(list(plot = plot, text = text))
  }
}