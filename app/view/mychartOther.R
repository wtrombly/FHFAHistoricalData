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
  echarts4rOutput(ns("mychartOther"))
 }
 
 #' @export
 server <- function(id) {
   moduleServer(id, function(input, output, session) {
     houseData <- reactive(affordability$fetch_data())
    output$mychartOther <-  renderEcharts4r(
      affordability$chartOther(houseData())
    )
   })
 }
 
 
 
 
 