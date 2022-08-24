box::use(rhino,
         echarts4r,
         htmlwidgets[JS],
         tidyr,
         reactable[reactable],
         readr[read_csv])


#' @export
fetch_data <- function() {
  houseData <- read_csv(file = "sortedData/loanTypeSorted.csv")
}

#' @export
chartLoanType <- function(houseData) {
  
  label <- list(
    formatter = htmlwidgets::JS(
      'function(value, index){
            return value;
        }'
    )
  )
  
  houseData |>
    
    echarts4r$e_chart(x = Year) |>
    echarts4r$e_line(FHA_Or_VA, name = "FHA OR VA") |>
    echarts4r$e_line(RHS, name = "Rural Housing Service") |>
    echarts4r$e_line(HECM, name = "Home Equity Conversion Mortgage") |>
    echarts4r$e_line(No_Federal_Guarantee, name = "No Federal Guarantee") |>
    echarts4r$e_x_axis(Year, axisLabel = label) |>
    echarts4r$e_tooltip()
}


