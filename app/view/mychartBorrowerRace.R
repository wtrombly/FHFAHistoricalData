box::use(
  reactable[reactableOutput, renderReactable],
  shiny[moduleServer, NS, reactive],
  echarts4r[echarts4rOutput, renderEcharts4r],
)


box::use(
  app/logic/borrowerRace
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  echarts4rOutput(ns("mychartBorrowerRace"))
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    borrowerRaceData <- reactive(borrowerRace$fetch_data())
    output$mychartBorrowerRace <-  renderEcharts4r(
      borrowerRace$chartBorrowerRace(borrowerRaceData())
    )
  })
}




