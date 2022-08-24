box::use(
  reactable[reactableOutput, renderReactable],
  shiny[moduleServer, NS, reactive],
  echarts4r[echarts4rOutput, renderEcharts4r],
)


box::use(
  app/logic/affordability
)

#' @export
 ui <- function(id) {
   ns <- NS(id)
  echarts4rOutput(ns("mychartLIA"))
 }
 
 #' @export
 server <- function(id) {
   moduleServer(id, function(input, output, session) {
     affordabilityData <- reactive(affordability$fetch_data())
    output$mychartLIA <-  renderEcharts4r(
      affordability$chartLIA(affordabilityData())
    )
   })
 }
 
 
 
 
 