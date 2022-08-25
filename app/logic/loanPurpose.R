box::use(rhino,
         echarts4r,
         htmlwidgets[JS],
         tidyr,
         reactable[reactable],
         readr[read_csv])


#' @export
fetch_data <- function() {
  houseData <- read_csv(file = "sortedData/loanPurposeSorted.csv")
}

#' @export
chartLoanPurpose <- function(houseData) {
  
  label <- list(
    formatter = htmlwidgets::JS(
      'function(value, index){
            return value;
        }'
    )
  )
  
  houseData |>
    
    echarts4r$e_chart(x = Year) |>
    echarts4r$e_line(Purchase, name = "Purchase") |>
    echarts4r$e_line(Refinance_Or_Other, name = "Refinance Or Other") |>
    echarts4r$e_x_axis(Year, axisLabel = label) |>
    echarts4r$e_grid(
      left = 100,# pixels
      top = "15%" # percentage = responsive
    ) |>
    echarts4r$e_tooltip()
}


