source("./src/pages/Home/ui.R", encoding = "UTF-8")
source("./src/pages/Home/server.R", encoding = "UTF-8")

source("./src/pages/DataImport/ui.R", encoding = "UTF-8")
source("./src/pages/DataImport/server.R", encoding = "UTF-8")

source("./src/pages/Type/ui.R", encoding = "UTF-8")
source("./src/pages/Type/server.R", encoding = "UTF-8")

source("./src/pages/Edition/ui.R", encoding = "UTF-8")
source("./src/pages/Edition/server.R", encoding = "UTF-8")

source("./src/pages/Result/ui.R", encoding = "UTF-8")
source("./src/pages/Result/server.R", encoding = "UTF-8")

router <- make_router(
  route("/", uiHome, serverHome),
  route("data-import", uiDataImport, serverDataImport),
  route("type", uiType, serverType),
  route("edition", uiEdition, serverEdition),
  route("result", uiResult, serverResult)
)