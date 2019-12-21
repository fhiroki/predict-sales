
library(shiny)
library(DT)


fluidPage(
  
  titlePanel("店出し数予測"),
  
  sidebarLayout(
    sidebarPanel(
      selectizeInput(
        inputId = "shopNameInput", label = h4("店名を選択"),
        choices = NULL, selected = NULL 
        # 内部で読み込んだデータフレームの値をchoicesにしたいので空にしておく．
      ),

      fileInput(
        "file", label=h4("気象データをアップロード")
      ),
  
      # ラッソ回帰で固定であれば必要なし.
      radioButtons("model", label = h4("モデルを選択"),
          choices = c("ラッソ回帰" = "lasso",
                      "ランダムフォレスト" = "rf",
                      "XGBoost" = "xgb"),
          selected = "lasso"),

      br(),
      h3("今年度の店出数量の予測値：1365")
    ),

    mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("店舗情報", br(), tableOutput("table")),
                    tabPanel("グラフ"),
                    tabPanel("分析"),
                    tabPanel("要因"),
                    tabPanel("モデル詳細"))
    )
  )
)

