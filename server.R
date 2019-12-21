

library(shiny)


df_shop <- read.csv("data/shop_2.csv", header=T)

function(input, output, session) {

  updateSelectizeInput(           # selectizeInputウィジェット を 更新する．
    session,                      # update*()の時はこう書く決まり．
    inputId = "shopNameInput",    # widget(input)のID
    choices = df_shop$店名,       # 選択肢
    server = T                    # サーバ側にこの情報を保存するかどうか
  )

  output$table <- renderTable(
    df_shop[df_shop$店名 == input$shopNameInput, ]
  )

  output$text1 = renderText({ 
    as.character(1000)
  })
}



