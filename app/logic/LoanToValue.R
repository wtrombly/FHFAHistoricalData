box::use(rhino,
         echarts4r,
         htmlwidgets[JS],
         tidyr,
         reactable[reactable],
         readr[read_csv])


#' @export
fetch_data <- function() {
  houseData <- read_csv(file = "sortedData/LTVSorted.csv")
}

#' @export
chartLoanToValue <- function(houseData) {
  
  label <- list(
    formatter = htmlwidgets::JS(
      'function(value, index){
            return value;
        }'
    )
  )
  
  houseData |>
    
    echarts4r$e_chart(x = Year) |>
    echarts4r$e_line(Less_Than_60_Percent, name = "Less Than 60%") |>
    echarts4r$e_line(Between_60_And_80_Percent, name = "Between 60% and 80%") |>
    echarts4r$e_line(Between_80_And_90_Percent, name = "Between 80% and 90%") |>
    echarts4r$e_line(Between_90_And_95_Percent, name = "Between 90% and 95%") |>
    echarts4r$e_line(Greater_Than_95_Percent, name = "Greater Than 95%") |>
    echarts4r$e_x_axis(Year, axisLabel = label) |>
    echarts4r$e_grid(
      left = 100,# pixels
      top = "15%" # percentage = responsive
    ) |>
    echarts4r$e_tooltip()
}


