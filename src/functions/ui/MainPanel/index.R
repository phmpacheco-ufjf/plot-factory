mainPanel <- function(...) {
  children <- tagList(...)

  tags$div(
    class = "mainPanel",
    children
  )
}