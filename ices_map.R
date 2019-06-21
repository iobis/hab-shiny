ices_map <- sidebarLayout(
  sidebarPanel(
    selectInput(
      "ices_map_syndrome", "Syndrome",
      choices = syndromeNames, selected = "AZP")
  ),
  mainPanel(plotOutput("ices_map"))
)
