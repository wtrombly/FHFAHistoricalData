box::use(
  reactable[reactableOutput, renderReactable],
  shiny[moduleServer, NS, reactive],
  echarts4r[echarts4rOutput, renderEcharts4r],
)


box::use(
  app/logic/LoanToValue
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  echarts4rOutput(ns("mychartLoanToValue"))
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    LTVData <- reactive(LoanToValue$fetch_data())
    output$mychartLoanToValue <-  renderEcharts4r(
      LoanToValue$chartLoanToValue(LTVData())
    )
  })
}




