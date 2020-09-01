switchCheckbox <- function(id) {
  ns <- NS(id)

  tags$div(
    class = "switch__container",
    # tags$input(
    #   class = "switch switch--shadow",
    #   id = ns("switch_shadow"),
    #   type = "checkbox"
    # ),
    HTML(
      paste0("<input id=", ns("switch_shadow"), ' type="checkbox" class="switch switch--shadow shiny-bound-input shinyjs-resettable" data-shinyjs-resettable-id=', ns("switch_shadow"), ' data-shinyjs-resettable-type="Checkbox" data-shinyjs-resettable-value="false">')
    ),
    HTML(
      paste0("<label for=", ns("switch_shadow"), "></label>")
    ),
    # checkboxInput(ns("teste2"), "teste")
    # tags$label(ns("switch_shadow"))
  )
}

switchCheckboxServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # observe({
      #   print(input$switch_shadow)
      # })

      onclick("switch_shadow", print(input$switch_shadow))
    }
  )
}