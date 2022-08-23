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
  houseData |>
    
    echarts4r$e_chart(x = Year) |>
    echarts4r$e_line(Very_Low_Income_Family_Not_Low_Income_Area, name = "Very Low Income Family") |>
    echarts4r$e_line(Low_Income_Family_Area, name = "Low Income Family Area") |>
    echarts4r$e_line(Very_Low_Income_Family_And_Low_Income_Area, name = "Very Low Income Family and Low Income Area") |>
    
    echarts4r$e_line(No_Designation) |>
    echarts4r$e_x_axis(Year) |>
    echarts4r$e_tooltip()
}


#' @export
chartOther <- function(houseData) {
  houseData |>
    echarts4r$e_chart(x = Year) |>
    echarts4r$e_line(Other) |>
    echarts4r$e_x_axis(Year, formatter = JS("App.formatYear")) |>
    echarts4r$e_tooltip()
}