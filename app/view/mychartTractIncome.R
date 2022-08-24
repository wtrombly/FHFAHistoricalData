box::use(
  reactable[reactableOutput, renderReactable],
  shiny[moduleServer, NS, reactive],
  echarts4r[echarts4rOutput, renderEcharts4r],
)


box::use(
  app/logic/tractIncomeRatio
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  echarts4rOutput(ns("mychartTractIncome"))
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    tractIncomeData <- reactive(tractIncomeRatio$fetch_data())
    output$mychartTractIncome <-  renderEcharts4r(
      tractIncomeRatio$charttractIncome(tractIncomeData())
    )
  })
}




