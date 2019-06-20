library(rhaedat)
library(ggplot2)
library(dplyr)

server <- function(input, output) {

  data <- events()
  
  output$region_barplot <- renderPlot({

    if (input$region_barplot_type == "relative") {
      relative <- TRUE
    } else {
      relative <- FALSE
    }
    
    regionplot(data, relative = relative) +
      ggtitle("HAB events by region") +
      xlab("region") +
      ylab("events composition") +
      theme(plot.title = element_text(hjust = 0.5)) +
      labs(fill = "syndrome")
  })
  
  output$country_barplot <- renderPlot({
    
    if (input$country_barplot_type == "grids") {
      title <- "Grids with HAB events per year"
    } else {
      title <- "HAB events per year"
    }
    
    cdata <- data %>% filter(countryName == input$country_barplot_country)
    barplot(cdata, input$country_barplot_type, min_year = as.numeric(input$country_barplot_startyear), max_year = as.integer(format(Sys.Date(), "%Y")), split = TRUE) +
      ggtitle(title) +
      xlab("year") +
      ylab("grids") +
      theme(plot.title = element_text(hjust = 0.5)) +
      labs(fill = "syndrome")
    
  })
  
}