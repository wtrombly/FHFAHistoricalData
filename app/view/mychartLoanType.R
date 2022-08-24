box::use(
  reactable[reactableOutput, renderReactable],
  shiny[moduleServer, NS, reactive],
  echarts4r[echarts4rOutput, renderEcharts4r],
)


box::use(
  app/logic/LoanType
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  echarts4rOutput(ns("mychartLoanType"))
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    LoanTypeData <- reactive(LoanType$fetch_data())
    output$mychartLoanType <-  renderEcharts4r(
      LoanType$chartLoanType(LoanTypeData())
    )
  })
}




