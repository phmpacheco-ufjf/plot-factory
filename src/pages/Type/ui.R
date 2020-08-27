source("./src/components/SideBarPanel/index.R")

uiType <- tags$div(
  sideBarPanel(id = "sideBarType", route_id = "type")
)