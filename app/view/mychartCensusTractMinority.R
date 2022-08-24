box::use(
  reactable[reactableOutput, renderReactable],
  shiny[moduleServer, NS, reactive],
  echarts4r[echarts4rOutput, renderEcharts4r],
)


box::use(
  app/logic/censusTractMinority
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  echarts4rOutput(ns("mychartCensusTractMinority"))
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    censusTractMinorityData <- reactive(censusTractMinority$fetch_data())
    output$mychartCensusTractMinority <-  renderEcharts4r(
      censusTractMinority$chartCensusTractMinority(censusTractMinorityData())
    )
  })
}




