textFormat <- function(el, spaces) {
  return(paste0(strrep("&nbsp ", spaces), el, "<br>"))
}

typeOfPlot <- function(session, dataframe, plotOptions, plotConfig) {
  if (plotOptions$type == "markers+lines" | plotOptions$type == "lines" | plotOptions$type == "markers") {
    str <- array(NA)

    str[1] <- "plot_ly("
    str[2] <- paste0("x = ~`", plotOptions$variableX, "`,")
    str[3] <- paste0("y = ~`", plotOptions$variableY, "`,")
    str[4] <- "type = 'scatter',"

    str[5] <- paste0("mode = '", plotOptions$type, "',")

    if (!is.null(plotOptions$variableGroupBy)) {
      str[6] <- paste0("color = ~`", plotOptions$variableGroupBy, "`,")
      str[7] <- paste0("colors = '", plotOptions$typeColor, "',")
      aux <- TRUE
    } else {
      str[6] <- paste0("marker = list(color = '", plotOptions$hexColor, "'),")
      str[7] <- paste0("line = list(color = '", plotOptions$hexColor, "'),")
      aux <- FALSE
    }

    str[8] <- "hoverinfo = 'text',"

    str[9] <- paste0(
      "text = ~ paste('", plotOptions$variableX, " = ', `", plotOptions$variableX,
      "`, ', ", plotOptions$variableY, " = ', `", plotOptions$variableY, "`)"
    )

    str[10] <- ") %>%"

    str[11] <- "layout("

    str[12] <- paste0("title = '", plotOptions$title, "',")

    str[13] <- paste0(
      "annotations = list(text = '", plotOptions$subtitle,
      "', showarrow = FALSE, align = 'center', x = 0.5, y = 1, xref = 'paper', yref = 'paper'),"
    )

    str[14] <- "legend = list(orientation = 'h', xanchor = 'center', x = 0.5, y = 0),"

    str[15] <- paste0("xaxis = list(fixedrange = ", plotConfig$fixedRange, "),")

    str[16] <- paste0("yaxis = list(fixedrange = ", plotConfig$fixedRange, "),")

    str[17] <- paste0("showlegend = ", plotConfig$subtitles)

    str[18] <- ")"

    if (plotOptions$type == "markers+lines") {
      plot <- capture.output(cat(str))
    } else if (plotOptions$type == "lines") {
      if (aux) {
        plot <- capture.output(cat(str))
      } else {
        plot <- capture.output(cat(str[-6]))
      }
    } else if (plotOptions$type == "markers") {
      if (aux) {
        plot <- capture.output(cat(str))
      } else {
        plot <- capture.output(cat(str[-7]))
      }
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
  } else if (plotOptions$type == "box") {
    str <- array(NA)

    str[1] <- "plot_ly("
    str[2] <- paste0("y = ~`", plotOptions$variableX, "`,")

    if (!is.null(plotOptions$variableGroupBy)) {
      str[3] <- paste0("color = ~`", plotOptions$variableGroupBy, "`,")
      str[4] <- paste0("colors = '", plotOptions$typeColor, "',")
      aux <- TRUE
    } else {
      str[3] <- paste0("marker = list(color = '", plotOptions$hexColor, "'),")
      str[4] <- paste0("line = list(color = '", plotOptions$hexColor, "'),")
      aux <- FALSE
    }

    str[5] <- paste0("type = '", plotOptions$type, "'")

    str[6] <- ") %>%"

    str[7] <- "layout("

    str[8] <- paste0("title = '", plotOptions$title, "',")

    str[9] <- paste0(
      "annotations = list(text = '", plotOptions$subtitle,
      "', showarrow = FALSE, align = 'center', x = 0.5, y = 1, xref = 'paper', yref = 'paper'),"
    )

    str[10] <- "legend = list(orientation = 'h', xanchor = 'center', x = 0.5, y = 0),"

    str[11] <- paste0("xaxis = list(fixedrange = ", plotConfig$fixedRange, "),")

    str[12] <- paste0("yaxis = list(fixedrange = ", plotConfig$fixedRange, "),")

    str[13] <- paste0("showlegend = ", plotConfig$subtitles)

    str[14] <- ")"

    plot <- capture.output(cat(str))

    text <- capture.output(
      cat(
        c(
          paste0(dataframe, " %>%<br>"),
          textFormat(el = str[1], spaces = 0),
          sapply(str[2:5], textFormat, spaces = 1),
          textFormat(el = str[6], spaces = 0),
          textFormat(el = str[7], spaces = 1),
          sapply(str[8:13], textFormat, spaces = 2),
          textFormat(el = str[14], spaces = 1)
        )
      )
    )

    return(list(plot = plot, text = text))
  } else if (plotOptions$type == "pie") {
    str <- array(NA)

    str[1] <- "plot_ly() %>%"

    str[2] <- "add_pie("

    str[3] <- paste0("labels = ~`", plotOptions$variableGroupBy, "`,")
    str[4] <- paste0("values = ~`", plotOptions$variableX, "`,")

    str[5] <- "hole = 0.6,"

    str[6] <- "marker = list("
    str[7] <- "line = list(color = '#FFFFFF', width = 1),"
    str[8] <- paste0("colors = '", plotOptions$typeColor, "'")
    str[9] <- "),"

    str[10] <- "textinfo = 'label+percent',"

    str[11] <- "insidetextfont = list(color = '#FFFFFF'),"

    str[12] <- "hoverinfo = 'text',"

    str[13] <- paste0(
      "text = ~ paste('", plotOptions$variableGroupBy, " = ', `", plotOptions$variableGroupBy,
      "`, ', ", plotOptions$variableX, " = ', `", plotOptions$variableX, "`)"
    )

    str[14] <- ") %>%"

    str[15] <- "layout("

    str[16] <- paste0("title = '", plotOptions$title, "',")

    str[17] <- paste0(
      "annotations = list(text = '", plotOptions$subtitle,
      "', showarrow = FALSE, align = 'center', x = 0.5, y = 1, xref = 'paper', yref = 'paper'),"
    )

    str[18] <- "legend = list(orientation = 'h', xanchor = 'center', x = 0.5, y = 0),"

    str[19] <- paste0("xaxis = list(fixedrange = ", plotConfig$fixedRange, "),")

    str[20] <- paste0("yaxis = list(fixedrange = ", plotConfig$fixedRange, "),")

    str[21] <- paste0("showlegend = ", plotConfig$subtitles)

    str[22] <- ")"

    plot <- capture.output(cat(str[-6:-9]))

    text <- capture.output(
      cat(
        c(
          paste0(dataframe, " %>%<br>"),
          textFormat(el = str[1], spaces = 0),
          textFormat(el = str[2], spaces = 1),
          sapply(str[3:6], textFormat, spaces = 2),
          sapply(str[7:8], textFormat, spaces = 3),
          sapply(str[9:13], textFormat, spaces = 2),
          textFormat(el = str[14], spaces = 1),
          textFormat(el = str[15], spaces = 1),
          sapply(str[16:21], textFormat, spaces = 2),
          textFormat(el = str[22], spaces = 1)
        )
      )
    )

    return(list(plot = plot, text = text))
  }
}