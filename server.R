library(rhaedat)
library(ggplot2)
library(dplyr)

store <- reactive({
  invalidateLater(1000 * 60 * 5) # 5 minutes
  list(data = events())
})

server <- function(input, output) {

  output$region_barplot <- renderPlot({

    if (input$region_barplot_type == "relative") {
      relative <- TRUE
      lab <- "events composition"
    } else {
      relative <- FALSE
      lab <- "events"
    }
    
    regionplot(store()$data, relative = relative) +
      ggtitle("HAB events by region") +
      xlab("region") +
      ylab(lab) +
      theme(plot.title = element_text(hjust = 0.5)) +
      labs(fill = "syndrome")
  })
  
  output$country_barplot <- renderPlot({
    
    if (input$country_barplot_type == "grids") {
      title <- "Grids with HAB events per year"
    } else {
      title <- "HAB events per year"
    }
    
    cdata <- store()$data %>% filter(countryName == input$country_barplot_country)
    barplot(cdata, input$country_barplot_type, min_year = as.numeric(input$country_barplot_startyear), max_year = as.integer(format(Sys.Date(), "%Y")), split = TRUE) +
      ggtitle(title) +
      xlab("year") +
      ylab("grids") +
      theme(plot.title = element_text(hjust = 0.5)) +
      labs(fill = "syndrome")
    
  })
  
  output$ices_map <- renderPlot({
    
    area <- list(name = "atlantic", xlim = c(-110, 40), ylim = c(20, 75))
    years_scale <- scale_radius(limits = c(1, 35), range = c(1.5, 8), breaks = c(1, 10, 20, 30))
    data <- store()$data %>% filter(syndromeName == input$ices_map_syndrome)

    stats <- data %>% 
      group_by(syndromeName, longitude, latitude) %>%
      summarize(years = length(unique(eventYear)))
    if (any(stats$years > 35)) stop("Too many years for chosen scale, contact p.provoost@unesco.org")
    
    make_map(data, area = area, type = "years", scale = years_scale, line_color = "black", line_width = 0.75, color = "#ff704d") +
      ggtitle("Years with events") +
      theme(plot.title = element_text(hjust = 0.5))

  })
  
}