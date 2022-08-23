box::use(
  shiny[bootstrapPage, moduleServer, NS, renderText, tags, textOutput, column, fluidRow, fluidPage, mainPanel, tabPanel, radioButtons, observe], 
  bslib[bs_theme, font_google,bs_theme_update],
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


my_theme <- bs_theme(bootswatch = "cerulean",
                     base_font = font_google("Righteous"))


#' @export
ui <- function(id) {
  ns <- NS(id)
  
  
  

  
  fluidPage(
    theme = my_theme,
    # radioButtons("current_theme", "App Theme:", c("Light" = "cerulean", "Dark" = "darkly")),
    
      tabPanel(
        title = "Affordability",
        mainPanel(
          fluidRow(
            column(12,mychartLIA$ui(ns("mychartLIA")), style = 'padding-left:30px; padding-right:0px;'),
          )
         
        )
        ),
      tabPanel(
        title = "Second Tab",
      )
      
    
    
   
  )
  # bootstrapPage(
  #   # tags$h3(
  #   #   textOutput(ns("message")))
  #   
  # )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # observe({
    #   # Make sure theme is kept current with desired
    #   session$setCurrentTheme(
    #     bs_theme_update(my_theme, bootswatch = input$current_theme)
    #   )
    # })
    
    
    mychartLIA$server("mychartLIA")
   
    # output$message <- renderText("Hello!")
  })
}


