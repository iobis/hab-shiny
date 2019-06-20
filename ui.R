source("haedat_graphs.R", local = TRUE)

ui <- navbarPage(
  "HAB data visualization portal",
  haedat_graphs,           
  tabPanel("HAEDAT maps"),
  tabPanel("OBIS graphs"),
  tabPanel("OBIS maps")
)
