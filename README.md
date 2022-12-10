# FHFAHistoricalData
 Exploring FHFA Data is a microfront end web application using [R Shiny](https://shiny.rstudio.com/) and [Rhino framework](https://appsilon.github.io/rhino/) full stack development system which allows for modularizing, testing, and taking an engineers approach to development.

Feel free to explore the web app hosted on my webpage [here].(https://therealestateexaminer.com/fhfa-data-2010-2020/)


##WebApp Preview
![Sequence 01_2](https://user-images.githubusercontent.com/76636215/187077768-67029cfa-bd3a-4087-92de-608eb2a7283b.gif)

## Installation

Use github to clone the repository to your local hard drive. Open the RShinyHUD.proj file in R Studio IDE, [download here](https://posit.co/download/rstudio-desktop/) Navigate to and open "./app/main.R".  Then click Run App in R Studio. This will open in your browser and allow local operation of the application. This application will run and operate as expected due to the renv library used in the Rhino framework even though there has been multiple R code updates since this project was finished.

A data pipeline has not been developed for this project as HUD data is not published regularly.

## How To Use
The web application has 8 tabs with graphs and commentary associated with each. This commentary provides an explanation of the metrics selected as well as some light interpretion the data relative to the intended use of the web application.  The graph plot has been selected to allow the user an interactive interface refining the graph by selectung multple categories for viewing with toggles shown at the top of each graph. This provides a better data visualization experience and allows for maximum information communicated to the user using current technology.

## Why

The data provided is from the FHFA.GOV [website](Data Source: https://www.fhfa.gov/DataTools/Downloads/Pages/Single-Family-Mortgage-Level-Owner-Occupied-1-Unit-Property-(National-File-A).aspx). This is an important step in allowing the public to detail and analyze how effective government sponsored enterprises (GSE's) like Fannie Mae and Freddie Mac influence the housing market in the United States. As a certified residential appraiser I play a large role in this process and aim to be up to date and a source of information for those I serve as leadership among my peers as well as the customers I serve.
