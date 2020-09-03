uiResult <- tags$div(
  class = "result",
  sideBarPanel(id = "sideBarPanelResult"),
  mainPanel(
    mainText = mainText(
      title = "Resultado",
      text = "Et voilà! Seu gráfico está pronto para ser compartilhado e analisado.
        Lembre-se que um design é bem-sucedido quando cada detalhe tem um porquê.
        Logo, tenha ciência daquilo que está construindo, isso fará total diferença."
    ),
    resultPanel(id = "resultPanelResult"),
    forwardBackwardButtons(id = "backwardButtonResult", forward = FALSE)
  )
)