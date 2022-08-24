box::use(shiny[bootstrapPage, moduleServer, NS, renderText, tags, textOutput, navbarPage,tabsetPanel, navbarMenu, column, fluidRow, fluidPage, mainPanel, tabPanel, radioButtons, observe],
         bslib[bs_theme, font_google, bs_theme_update],)

box::use(app / view / mychartLIA,
         app / view / mychartOther,
         app / view / mychartTractIncome,
         app / view / mychartBorrowerRace,
         app / view / mychartLoanToValue,
         app / view / mychartLoanType,
         app / view / mychartLoanPurpose,
         app / view / mychartCensusTractMinority,
         app / view / mychartBorrowerIncomeRatio,)

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
    
    tabsetPanel(
      tabPanel(title = "Affordability",
             mainPanel(fluidRow(
               column(12, mychartLIA$ui(ns("mychartLIA")), style = 'padding-left:30px; padding-right:0px;'),
             ))),
    tabPanel(title = "Tract Income Ratio",
             mainPanel(fluidRow(
               column(12, mychartTractIncome$ui(ns("mychartTractIncome")), style = 'padding-left:30px; padding-right:0px;'),
             ))),
    tabPanel(title = "Borrower Race",
             mainPanel(fluidRow(
               column(12, mychartBorrowerRace$ui(ns("mychartBorrowerRace")), style = 'padding-left:30px; padding-right:0px;'),
             ))),
    tabPanel(title = "Loan To Value",
             mainPanel(fluidRow(
               column(12, mychartLoanToValue$ui(ns("mychartLoanToValue")), style = 'padding-left:30px; padding-right:0px;'),
             ))),
    tabPanel(title = "Loan Type",
             mainPanel(fluidRow(
               column(12, mychartLoanType$ui(ns("mychartLoanType")), style = 'padding-left:30px; padding-right:0px;'),
             ))),
    tabPanel(title = "Loan Purpose",
             mainPanel(fluidRow(
               column(12, mychartLoanPurpose$ui(ns("mychartLoanPurpose")), style = 'padding-left:30px; padding-right:0px;'),
             ))),
    tabPanel(title = "Census Tract Minority",
             mainPanel(fluidRow(
               column(12, mychartCensusTractMinority$ui(ns("mychartCensusTractMinority")), style = 'padding-left:30px; padding-right:0px;'),
             ))),
    tabPanel(title = "Borrower Income Ratio",
             mainPanel(fluidRow(
               column(12, mychartBorrowerIncomeRatio$ui(ns("mychartBorrowerIncomeRatio")), style = 'padding-left:30px; padding-right:0px;'),
             ))),
  )
  # bootstrapPage(
  #   # tags$h3(
  #   #   textOutput(ns("message")))
  #
  # )
  )
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
    mychartTractIncome$server("mychartTractIncome")
    mychartBorrowerRace$server("mychartBorrowerRace")
    mychartLoanToValue$server("mychartLoanToValue")
    mychartLoanType$server("mychartLoanType")
    mychartLoanPurpose$server("mychartLoanPurpose")
    mychartCensusTractMinority$server("mychartCensusTractMinority")
    mychartBorrowerIncomeRatio$server("mychartBorrowerIncomeRatio")
    
    # output$message <- renderText("Hello!")
  })
}
