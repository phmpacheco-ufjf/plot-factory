uiEdition <- tags$div(
  class = "edition",
  sideBarPanel(id = "sideBarPanelEdition"),
  mainPanel(
    mainText = mainText(
      title = "Edição",
      text = "Por fim, é preciso editar o gráfico. Adicionar um bom título,
        cores equilibradas, legendas bem indicadas e uma visualização dinâmica
        gera uma combinação harmoniosa e chamativa. São esses detalhes que fazem
        o seu gráfico ser diferenciado."
    ),
    editionPanel(id = "editionPanelEdition"),
    forwardBackwardButtons(id = "forwardBackwardButtonsEdition")
  )
)