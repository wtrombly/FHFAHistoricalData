box::use(
  reactable[reactableOutput, renderReactable],
  shiny[moduleServer, NS, reactive],
  echarts4r[echarts4rOutput, renderEcharts4r],
)


box::use(
  app/logic/loanPurpose
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  echarts4rOutput(ns("mychartLoanPurpose"))
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    LoanPurposeData <- reactive(loanPurpose$fetch_data())
    output$mychartLoanPurpose <-  renderEcharts4r(
      loanPurpose$chartLoanPurpose(LoanPurposeData())
    )
  })
}




