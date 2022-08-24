box::use(rhino,
         echarts4r,
         htmlwidgets[JS],
         tidyr,
         reactable[reactable],
         readr[read_csv])


#' @export
fetch_data <- function() {
  houseData <- read_csv(file = "sortedData/tractIncomeRatioSorted.csv")
}

#' @export
charttractIncome <- function(houseData) {
  
  label <- list(
    formatter = htmlwidgets::JS(
      'function(value, index){
            return value;
        }'
    )
  )
  
  houseData |>
    
    echarts4r$e_chart(x = Year) |>
    echarts4r$e_line(Less_Than_80_Percent, name = "Less Than 80%") |>
    echarts4r$e_line(Between_80_And_120_Percent, name = "Between 80% and 120%") |>
    echarts4r$e_line(Greater_Than_120_Percent, name = "Greater Than 120%") |>
    echarts4r$e_line(Missing_Data, name = "Missing Data") |>
    echarts4r$e_x_axis(Year, axisLabel = label) |>
    echarts4r$e_tooltip()
}

# 
# export function formatYear(value) {
#   return `${value}`;
# }