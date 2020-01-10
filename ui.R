
library(shiny)
library(DT)


fluidPage(
  
  titlePanel("店出し数予測"),
  
  sidebarLayout(
    sidebarPanel(
      selectizeInput(
        inputId = "shopIdInput", label = h4("店名を選択"),
        choices = NULL, selected = NULL 
        # 内部で読み込んだデータフレームの値をchoicesにしたいので空にしておく．
      ),

      br(),
      h4("今年度の店出数量の予測値：1365")
    ),

    mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("店舗情報", br(),
                             fluidRow(
                                 column(width = 10, tableOutput("table")),
                                 column(width = 5, tableOutput("table_month")),
                                 column(width = 5, tableOutput("table_sum")))
                             ),
                    tabPanel("前年との気象の差", br(), tableOutput("table_weather")),
                    tabPanel("モデル詳細"),
                    tabPanel("全店舗の売上"))
    )
  )
)

