source("./src/components/SideBarPanel/index.R")

uiDataImport <- tags$div(
  sideBarPanel(id = "sideBarDataImport", route_id = "data-import")
)