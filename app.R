source("./src/config/index.R")
source("./src/routes/index.R")

ui <- tags$html(
  # conditionalPanel(
  #   condition = "$('html').hasClass('shiny-busy')",
  #   tags$div(
  #     class = "lds-roller",
  #     tags$div(), tags$div(), tags$div(), tags$div(), tags$div(), tags$div(), tags$div(), tags$div()
  #   )
  # ),

  tags$head(
    useShinyjs(),

    tags$link(
      href = "https://fonts.googleapis.com/css2?family=PT+Sans+Narrow:wght@400;700&display=swap",
      rel = "stylesheet"
    ),
    tags$link(
      href = "https://fonts.googleapis.com/css2?family=Rajdhani:wght@500&display=swap",
      rel = "stylesheet"
    ),

    tags$style(sass(sass_file("./src/styles/main.scss"),
      options = sass_options(output_style = "expanded"),
      output = "./src/styles/styles.css"
    )),
    includeScript("./scripts/reload.js"),

    tags$link(rel = "icon", href = "./assets/logos/favicon.ico"),
    tags$meta(name = "description", content = "Plot Factory"),
    tags$meta(charset = "utf-8"),
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=1"),
    tags$title("Plot Factory")
  ),

  tags$body(
    router_ui()
  )
)

server <- function(input, output, session) {
  router(input, output, session)

  session$userData$dataframe <- reactiveValues(
    data = NULL
  )

  session$userData$plotOptions <- reactiveValues(
    type = NULL,
    variableX = NULL,
    variableY = NULL,
    variableGroupBy = NULL,
    title = NULL,
    subtitle = NULL,
    hexColor = NULL,
    typeColor = NULL
  )

  session$userData$plotConfig <- reactiveValues(
    subtitles = FALSE,
    subtitles_hover = FALSE
  )

  # session$userData$dataframe <- reactiveValues(
  #   data = NULL,
  #   x = NULL,
  #   y = NULL,
  #   groupBy = NULL
  # )

  # session$userData$plotOptions <- reactiveValues(
  #   type = NULL,
  #   mode = NULL,
  #   marker = NULL,
  #   line = NULL,
  #   hoverinfo = NULL,
  #   textinfo = NULL,
  #   showlegend = NULL,
  #   labels = NULL,
  #   values = NULL,
  #   hole = NULL,
  #   textposition = NULL,
  #   insidetextanchor = NULL,
  #   title = NULL,
  #   subtitle = NULL,
  #   hexColor = NULL,
  #   typeColor = NULL
  # )
}

options(shiny.port = 3333)
shinyApp(ui, server)