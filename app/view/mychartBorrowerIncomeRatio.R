box::use(
  reactable[reactableOutput, renderReactable],
  shiny[moduleServer, NS, reactive],
  echarts4r[echarts4rOutput, renderEcharts4r],
)


box::use(
  app/logic/borrowerIncomeRatio
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  echarts4rOutput(ns("mychartBorrowerIncomeRatio"))
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    borrowerIncomeRatioData <- reactive(borrowerIncomeRatio$fetch_data())
    output$mychartBorrowerIncomeRatio<-  renderEcharts4r(
      borrowerIncomeRatio$chartBorrowerIncomeRatio(borrowerIncomeRatioData())
    )
  })
}




