box::use(
  shiny[bootstrapPage, moduleServer, NS, renderText, tags, textOutput], 
 )

box::use(
  app/view/mychartLIA,
  app/view/mychartOther
)

# box::use(callr)
# 
# callr$r(function (mychart) {
#   box::set_script_path(mychart)
#   box::use(./app/view/mychart)
# }, args = list(mod = file.path(box::file(), 'mychart.R')))


#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    # tags$h3(
    #   textOutput(ns("message")))
    mychartLIA$ui(ns("mychartLIA")),
    mychartOther$ui(ns("mychartOther"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    mychartLIA$server("mychartLIA")
    mychartOther$server("mychartOther")
    # output$message <- renderText("Hello!")
  })
}


