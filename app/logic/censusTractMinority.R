box::use(rhino,
         echarts4r,
         htmlwidgets[JS],
         tidyr,
         reactable[reactable],
         readr[read_csv])


#' @export
fetch_data <- function() {
  houseData <- read_csv(file = "sortedData/censusTractMinoritySorted.csv")
}

#' @export
chartCensusTractMinority <- function(houseData) {
  
  label <- list(
    formatter = htmlwidgets::JS(
      'function(value, index){
            return value;
        }'
    )
  )
  
  houseData |>
    
    echarts4r$e_chart(x = Year) |>
    echarts4r$e_line(Less_Than_10_Percent, name = "Less than 10%") |>
    echarts4r$e_line(Between_10_And_30_Percent, name = "Between 10% and 30%") |>
    echarts4r$e_line(Between_30_And_100_Percent, name = "Between 30% and 100%") |>
    echarts4r$e_line(Missing_Data, name = "Missing Data") |>
    echarts4r$e_x_axis(Year, axisLabel = label) |>
    echarts4r$e_tooltip()
}


