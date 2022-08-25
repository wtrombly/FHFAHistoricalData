box::use(rhino,
         echarts4r,
         htmlwidgets[JS],
         tidyr,
         reactable[reactable],
         readr[read_csv])


#' @export
fetch_data <- function() {
  houseData <- read_csv(file = "sortedData/borrowerIncomeRatio.csv")
}

#' @export
chartBorrowerIncomeRatio <- function(houseData) {
  
  label <- list(
    formatter = htmlwidgets::JS(
      'function(value, index){
            return value;
        }'
    )
  )
  
  houseData |>
    
    echarts4r$e_chart(x = Year) |>
    echarts4r$e_line(Less_Than_Or_Equal_To_50_Percent, name = "Less than Or Equal to 50%") |>
    echarts4r$e_line(Between_50_And_80_Percent, name = "Between 50% and 80%") |>
    echarts4r$e_line(Greater_Than_80_Percent, name = "Greater Than 80%") |>
    echarts4r$e_line(Not_Applicable, name = "Not Applicable") |>
    echarts4r$e_line(Less_Than_50_Percent, name = "Less Than 50%") |>
    echarts4r$e_x_axis(Year, axisLabel = label) |>
    echarts4r$e_grid(
      left = 100,# pixels
      top = "15%" # percentage = responsive
    ) |>
    echarts4r$e_tooltip()
}


