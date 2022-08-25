box::use(rhino,
         echarts4r,
         htmlwidgets[JS],
         tidyr,
         reactable[reactable],
         readr[read_csv])


#' @export
fetch_data <- function() {
  houseData <- read_csv(file = "sortedData/affordabilitysorted.csv")
}

#' @export
chartLIA <- function(houseData) {
  
  label <- list(
    formatter = htmlwidgets::JS(
      'function(value, index){
            return value;
        }'
    )
  )
  
  houseData |>
    
    echarts4r$e_chart(x = Year) |>
    echarts4r$e_line(Very_Low_Income_Family_Not_Low_Income_Area, name = "Very Low Income Family") |>
    echarts4r$e_line(Low_Income_Family_Area, name = "Low Income Family Area") |>
    echarts4r$e_line(Very_Low_Income_Family_And_Low_Income_Area, name = "Very Low Income Family and Low Income Area") |>
    echarts4r$e_line(No_Designation, name = "No Designation") |>
    echarts4r$e_line(Other) |>
    echarts4r$e_x_axis(Year, axisLabel = label) |>
    echarts4r$e_grid(
      left = 100,# pixels
      top = "15%" # percentage = responsive
    ) |>
    echarts4r$e_tooltip()
}


