library(rhaedat)

countryNames <- countries()$countryName
syndromeNames <- syndromes()$syndromeName

source("region_barplot.R", local = TRUE)
source("country_barplot.R", local = TRUE)

haedat_graphs <- navbarMenu("HAEDAT graphs",
  tabPanel("Region barplot", region_barplot),
  tabPanel("Country barplot", country_barplot)
)
