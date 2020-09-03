uiType <- tags$div(
  class = "type",
  sideBarPanel(id = "sideBarPanelType"),
  mainPanel(
    mainText = mainText(
      title = "Tipo de gráfico",
      text = "Definida a base de dados, o próximo passo é escolher quais serão as
        variáveis a serem analisadas e também qual o tipo do gráfico a ser exibido.
        Lembre-se que um bom gráfico necessita de boas variáveis e também da
        formatação correta."
    ),
    typePanel(id = "typePanelType"),
    forwardBackwardButtons(id = "forwardBackwardButtonsType")
  )
)