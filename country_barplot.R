country_barplot <- sidebarLayout(
  sidebarPanel(
    selectInput(
      "country_barplot_type", "Y axis",
      choices = c("grids", "events"), selected = "grids"),
    selectInput(
      "country_barplot_country", "Country",
      choices = c("ALGERIA", "ARGENTINA", "AUSTRALIA", "BELGIUM", "BRAZIL", "CANADA", "CHILE", "CHINA", "COLOMBIA", "COMORES ", "COSTA RICA", "CUBA", "DENMARK", "ECUADOR", "EGYPT", "EL SALVADOR", "FAROE ISLANDS", "FINLAND", "FRANCE", "FRENCH POLYNESIA", "GERMANY", "GUATEMALA", "ICELAND", "INDIA", "IRELAND", "ITALY", "JAMAICA", "JAPAN", "KENYA", "KOREA, REPUBLIC OF", "LA REUNION", "MADAGASCAR", "MALAYSIA", "MAYOTTE", "MEXICO", "MOROCCO", "NETHERLANDS", "NEW ZEALAND", "NICARAGUA", "NORWAY", "PANAMA", "PHILIPPINES", "POLAND", "PORTUGAL", "RUSSIAN FEDERATION", "SEYCHELLES", "SLOVENIA", "SOUTH AFRICA", "SPAIN", "SWEDEN", "TURKEY", "UNITED KINGDOM", "UNITED STATES", "URUGUAY", "VENEZUELA"), selected = "UNITED KINGDOM"),
    selectInput(
      "country_barplot_startyear", "Start year",
      choices = c(1985, 1990, 1995, 2000, 2005, 2010), selected = 1985)
  ),
  mainPanel(plotOutput("country_barplot", height = "600px"))
)
