mainText <- function(title, text, ...) {
  children <- list(...)

  tags$div(
    class = "mainText",
    h1(title),
    p(text),
    children
  )
}