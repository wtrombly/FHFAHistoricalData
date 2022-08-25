box::use(shiny[bootstrapPage, moduleServer, HTML, br,verbatimTextOutput, NS, div, renderText, tags, textOutput, navbarPage,tabsetPanel, navbarMenu, column, fluidRow, fluidPage, mainPanel, tabPanel, radioButtons, observe],
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



my_theme <- bs_theme(bootswatch = "cerulean",
                     base_font = font_google("Righteous"))


grid <- function(...) div(class = "grid", ...)
card <- function(...) div(class = "card", ...)



#' @export
ui <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    theme = my_theme,
    
    tabsetPanel(
      tabPanel(title = "Affordability",
             mainPanel(fluidRow(
              card(column(12, mychartLIA$ui(ns("mychartLIA")), style = 'padding-left:0px; padding-right:0px;')),
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     CLICK THE LEGEND IN THE GRAPH TO TOGGLE TREND LINES")
               )
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <strong>AFFORDABILITY COMMENTARY</strong> The above shown graphic represents income classifications for loans made 
                     for homeowners that had loans go through Fannie Mae and Freddie Mac. As shown above the majority of home loans occurred in
                     not Low-Income areas and then peaking as the timeline approaches the last year accounted for (2020).")
               )
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     While removing the trend lines for Other and No Designation, you can see that the number of home loans made in
                     Very Low Income Families in Low Income Areas does show similar trends to that of the other available trend lines.
                     However with this point you can also see that being a low income family in a low income area appears to be 
                     reducing available credit for home owners, which supports current findings regarding low income borrowers.")
               )
             ))),
    tabPanel(title = "Tract Income Ratio",
             mainPanel(fluidRow(
               card(column(12, mychartTractIncome$ui(ns("mychartTractIncome")), style = 'padding-left:30px; padding-right:0px;')),
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     CLICK THE LEGEND IN THE GRAPH TO TOGGLE TREND LINES")
               )
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <strong>TRACT INCOME COMMENTARY</strong> As shown above the majority of loans received through Fannie Mae and Freddie Mac 
                     have had tract income ratios above 80%. As of the posting of this commentary new census data is expected and should change
                     the layout of this statistic There is a lack of data to further support any findings but this does appear to be in line
                     with the lack of available credit to homeowners with less income.")
               )
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <strong>STAT DESCRIPTION (Fromt FHFA website) </strong> The ratio of the borrower’s (or borrowers’) annual income to the area
                     median family income for the reporting year. This is the ratio used to determine whether borrower’s (or borrowers’) income 
                     qualifies for an income-based housing goal. This is the ratio defined at 12 CFR 1282.15(b)(1) for owner-occupied units.")
               )
             ))),
    tabPanel(title = "Borrower Race",
             mainPanel(fluidRow(
               card(column(12, mychartBorrowerRace$ui(ns("mychartBorrowerRace")), style = 'padding-left:30px; padding-right:0px;')),
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     CLICK THE LEGEND IN THE GRAPH TO TOGGLE TREND LINES")
               )
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <strong>BORROWER RACE COMMENTARY</strong> This chart is supported through ethnicity reported by Fannie Mae and Freddie Mac
                     for single family unit homes. As indicated by the data the majority of loans processed by GSE's, the majority of loans reported 
                     have an associated ethinicity that is overwhelmingly white. The next classification shown is those that do not or have not chosen
                     to fall under one of the categories, followed by Asian and Hispanic populations.")
               )
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <strong>STAT DESCRIPTION (From FHFA website) </strong> Categories 1-7 consolidate information on borrower race and ethnicity
                     reported by the Enterprise. Categories 1 through 6 include only borrowers not identified as Hispanic or Latino. Categories 1-5
                     include non-Hispanic or Latino borrowers identifying only one race category. Category 6 includes non-Hispanic or Latino borrowers
                     identifying two or more races. Category 7 includes borrowers identified as Hispanic or Latino, of any race. Category 9 includes 
                     mortgages for which no borrower race or ethnicity is identified, originally coded as information not provided by the borrower in
                     a mail or telephone application, not applicable, or not available.")
               )
             ))),
    tabPanel(title = "Loan To Value",
             mainPanel(fluidRow(
               card(column(12, mychartLoanToValue$ui(ns("mychartLoanToValue")), style = 'padding-left:30px; padding-right:0px;')),
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     CLICK THE LEGEND IN THE GRAPH TO TOGGLE TREND LINES")
               )
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <strong>LOAN TO VALUE RATIO COMMENTARY</strong> The majority of loans processed by Fannie Mae and Freddie Mac have had Loan To Value Ratios 
                     between 60% and 80% with the next highest category being less than 60%. The different categories do appear to follow similar trends
                     with the exception of Loan To Value Ratio Loans being higher than 95% not increasing over the end of the term.")
               )
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <strong>STAT DESCRIPTION (From FHFA website) </strong> Combined LTV (or CLTV) when a subordinate lien is known to the Enterprise.")
               )
             ))),
    tabPanel(title = "Loan Type",
             mainPanel(fluidRow(
               card(column(12, mychartLoanType$ui(ns("mychartLoanType")), style = 'padding-left:30px; padding-right:0px;')),
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     CLICK THE LEGEND IN THE GRAPH TO TOGGLE TREND LINES")
               )
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <strong>LOAN TYPE COMMENTARY</strong> The majority of loans processed by Fannie Mae and Freddie Mac are not federally 
                     guaranteed home loans. The above classifications DO NOT share similar trends, most notably a strong peak and decline of 
                     FHA or VA home loans being processed through 2012 an 2014. Rural Housing Service (RHS) Loans are a significantly smaller statistic
                     in this data set which includes other guaranteed loan types.")
               )
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <strong>STAT DESCRIPTION (From FHFA website) </strong> The loan types reported by GSE's Fannie Mae and Freddie Mac. 
                     Rural Housing Service loans include other federally guaranteed loans.")
               )
             ))),
    tabPanel(title = "Loan Purpose",
             mainPanel(fluidRow(
               card(column(12, mychartLoanPurpose$ui(ns("mychartLoanPurpose")), style = 'padding-left:30px; padding-right:0px;')),
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <i>Raw HTML!</i>")
               )
             ))),
    tabPanel(title = "Census Tract Minority",
             mainPanel(fluidRow(
               card(column(12, mychartCensusTractMinority$ui(ns("mychartCensusTractMinority")), style = 'padding-left:30px; padding-right:0px;')),
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <i>Raw HTML!</i>")
               )
             ))),
    tabPanel(title = "Borrower Income Ratio",
             mainPanel(fluidRow(
               card(column(12, mychartBorrowerIncomeRatio$ui(ns("mychartBorrowerIncomeRatio")), style = 'padding-left:30px; padding-right:0px;')),
             ),
             br(),
             fluidRow(
               tags$html(HTML("
                     <i>Raw HTML!</i>")
               )
             ))),
   
    
  )

  
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
