source("./src/components/SideBarPanel/index.R")

uiEdition <- tags$div(
  sideBarPanel(id = "sideBarEdition", route_id = "edition")
)