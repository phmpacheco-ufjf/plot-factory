uiDataImport <- tags$div(
  class = "dataImport",
  sideBarPanel(id = "sideBarPanelDataImport"),
  mainPanel(
    mainText = mainText(
      title = "Importando dados",
      text = "O primeiro passo para a construção de qualquer gráfico é importaro banco de dados.
              Para isso, clique no botão abaixo para selecionar o arquivo de interesse.",
      p(
        "É importante ressaltar que os dados devem estar livre de erros e com a formatação correta de
        suas variáveis. Para que isso ocorra, exigimos que a base de dados esteja em formato .RDS"
      )
    ),
    importData(idButton = "importDataButtonDataImport", idDisplay = "displayDataframeDataImport"),
    forwardBackwardButtons(id = "forwardBackwardButtonsDataImport")
  )
)