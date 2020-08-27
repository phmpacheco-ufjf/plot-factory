source("./src/components/SideBarPanel/index.R")

uiResult <- tags$div(
  sideBarPanel(id = "sideBarResult", route_id = "result")
)