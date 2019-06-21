country_barplot <- sidebarLayout(
  sidebarPanel(
    selectInput(
      "country_barplot_type", "Y axis",
      choices = c("grids", "events"), selected = "grids"),
    selectInput(
      "country_barplot_country", "Country",
      choices = countryNames, selected = "UNITED KINGDOM"),
  selectInput(
      "country_barplot_startyear", "Start year",
      choices = c(1985, 1990, 1995, 2000, 2005, 2010), selected = 1985)
  ),
  mainPanel(plotOutput("country_barplot", height = "600px"))
)
