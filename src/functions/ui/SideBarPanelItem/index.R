sideBarPanelItem <- function(id, ref, label, route_id) {
  tags$div(
    class = "sideBarPanelItem",
    img(src = "./assets/icons/grayTriangle.svg"),
    tags$a(label,
      id = id,
      class = if (ref == route_id) "active action-button" else "not-active action-button"
    )
  )
}