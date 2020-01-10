

library(shiny)


df_shop <- read.csv("data/shop.csv", header=T)
df_shop_month <- read.csv("data/shop_year_month.csv", header=T)

function(input, output, session) {

  updateSelectizeInput(           # selectizeInputウィジェット を 更新する．
    session,                      # update*()の時はこう書く決まり．
    inputId = "shopIdInput",    # widget(input)のID
    choices = df_shop$shop_id,       # 選択肢
    server = T                    # サーバ側にこの情報を保存するかどうか
  )

  output$table <- renderTable(
    df_shop[df_shop$shop_id == input$shopIdInput, ]
  )

  output$table_month <- renderTable(
      df_shop_month[df_shop_month$shop_id == input$shopIdInput &
                        df_shop_month$year == 2019 &
                        df_shop_month$month >= 3, ][c('month', 'hanbai', 'henpin')]
  )

  output$table_sum <- renderTable({
      df_month = df_shop_month[df_shop_month$shop_id == input$shopIdInput &
                        df_shop_month$year == 2019 &
                        df_shop_month$month >= 3, ][c('month', 'hanbai', 'henpin')]
      data.frame(
          出荷数合計 = sum(df_month['hanbai']),
          予測値との差分 = abs(100 - sum(df_month['hanbai'])))
  })

  output$table_weather <- renderTable({
      columns = c("feel_avg_04", "sunny_cnt_04", "sunny_cnt_07", "rainy_cnt_07", "hummd_daily_min_03", "popu_per_shops")
      data.frame(
          "2018年" = df_shop[df_shop$year == 2018][columns],
          "2019年" = df_shop[df_shop$yar == 2019][columns]
      )
  })

  output$text1 = renderText({ 
    as.character(1000)
  })
}



