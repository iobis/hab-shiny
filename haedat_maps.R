source("ices_map.R", local = TRUE)

haedat_maps <- navbarMenu("HAEDAT maps",
  tabPanel("ICES map", ices_map)
)
