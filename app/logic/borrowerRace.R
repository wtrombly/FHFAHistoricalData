box::use(rhino,
         echarts4r,
         htmlwidgets[JS],
         tidyr,
         reactable[reactable],
         readr[read_csv])


#' @export
fetch_data <- function() {
  houseData <- read_csv(file = "sortedData/borrowerRaceSorted.csv")
}

#' @export
chartBorrowerRace <- function(houseData) {
  
  label <- list(
    formatter = htmlwidgets::JS(
      'function(value, index){
            return value;
        }'
    )
  )
  
  houseData |>
    
    echarts4r$e_chart(x = Year) |>
    echarts4r$e_line(American_Indian_or_Alaska_Native, name = "American Indian or Alaska Native") |>
    echarts4r$e_line(Asian, name = "Asian") |>
    echarts4r$e_line(Black_of_African_American, name = "Black or African American") |>
    echarts4r$e_line(Native_Hawaiian_or_Other_Pacific_Islander, name = "Native Hawaiian or Other Pacific Islander") |>
    echarts4r$e_line(White, name = "White") |>
    echarts4r$e_line(Two_or_More_Races, name = "Two or More Races") |>
    echarts4r$e_line(Hispanic_or_Latino, name = "Hispanic Or Latino") |>
    echarts4r$e_line(Not_Available, name = "Not Available") |>
    echarts4r$e_x_axis(Year, axisLabel = label) |>
    echarts4r$e_grid(
      left = 100,# pixels
      top = "15%" # percentage = responsive
    ) |>
    echarts4r$e_tooltip()
}


