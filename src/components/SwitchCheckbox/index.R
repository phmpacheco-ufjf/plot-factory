switchCheckbox <- function(id, label) {
  ns <- NS(id)
  tags$div(
    class = "switch_container",
    p(label),
    tags$div(
      class = "switch_content",
      HTML(
        paste0(
          "<input id=", ns("switch_shadow"), ' type="checkbox"
            class="switch switch--shadow shiny-bound-input shinyjs-resettable"
            data-shinyjs-resettable-id=', ns("switch_shadow"),
          ' data-shinyjs-resettable-type="Checkbox" data-shinyjs-resettable-value="false">'
        )
      ),
      HTML(
        paste0("<label for=", ns("switch_shadow"), "></label>")
      )
    )
  )
}

switchCheckboxServer <- function(id, ref) {
  moduleServer(
    id,
    function(input, output, session) {
      switch_button <- reactiveValues(state = ref)

      observe({
        updateCheckboxInput(
          session,
          "switch_shadow",
          value = ref
        )
      })

      onclick("switch_shadow", {
        switch_button$state <- input$switch_shadow
      })

      return(switch_button)
    }
  )
}