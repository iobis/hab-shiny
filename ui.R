source("haedat_graphs.R", local = TRUE)
source("haedat_maps.R", local = TRUE)

ui <- navbarPage(
  "HAB data visualization portal",
  haedat_graphs,           
  haedat_maps,
  tabPanel("OBIS graphs"),
  tabPanel("OBIS maps")
)
