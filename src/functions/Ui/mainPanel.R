mainPanel <- function(...) {
  children <- tagList(...)

  tags$div(
    class = "main",
    img(src = "./assets/images/background.svg"),
    children
  )
}