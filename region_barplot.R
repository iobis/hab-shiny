region_barplot <- sidebarLayout(
  sidebarPanel(
    selectInput(
      "region_barplot_type", "Y axis",
      choices = c("relative", "absolute"), selected = "relative")
  ),
  mainPanel(plotOutput("region_barplot"))
)
