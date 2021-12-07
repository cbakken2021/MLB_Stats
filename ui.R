library(shiny)
library(shinythemes)

shinythemes::themeSelector()
navbarPage(
  theme = shinytheme("darkly"),
  "Collin's MLB Statistics",
  # First bar: Yearly Statistics
  tabPanel("Yearly Statistics",
           sidebarPanel(
             radioButtons("team_bar1", label = h3("Team"),
                          choices = list("ANA" = 1, "ARI" = 2, "ATL" = 3, 
                                         "BAL" = 4, "BOS" = 5, "BRO" = 6,
                                         "BSN" = 7, "CAL" = 8, "CHA" = 9,
                                         "CHN" = 10, "CIN" = 11, "CLE" = 12,
                                         "COL" = 13, "DET"= 14, "FLO" = 15,
                                         "HOU" = 16, "KC1"= 17, "KCA" = 18,
                                         "LAA"= 19, "LAN" = 20, "MIA" = 21,
                                         "MIL" = 22, "MIN" = 23, "ML4" = 24,
                                         "MON" = 25, "NYA" = 26, "NYN" = 27,
                                         "OAK" = 28, "PHA" = 29, "PHI" = 30,
                                         "PIT" = 31, "SDN" = 32, "SE1" = 33,
                                         "SEA" = 34, "SFN" = 35, "SLA" = 36,
                                         "SLN" = 37, "TBA" = 38, "TEX" = 39,
                                         "TOR" = 40, "WAS" = 41, "WS1" = 42,
                                         "WS2" = 43
                                         ), 
                          selected = 1),
             sliderInput("yr_bar1", h3("Year Range:"),
                         min = 1951, max = 2020, value = c(2000:2001)),
             actionButton("action_bar1", "Update")
             #submitButton("Update")
           ),
           mainPanel(
             textOutput("Message_bar1"),
             tableOutput("Stat_Table_bar1")
           )
  ),
  # Second bar: Statistical Summary
  tabPanel("Statistical Summary",
           selectizeInput("stats_bar1", h3("Select Stat"),
                          choices = NULL, multiple = FALSE),
             selectInput('yr_bar2', h3('Year'),
                         choices = c(1968:2015), selectize = FALSE),
             textInput("player_name_bar2", h3("Player's Name"), "Rafael Nadal"),
             actionButton("action_bar2", "Update"),
           mainPanel(
             textOutput("Message_bar2"),
             tableOutput("Stat_Table_bar2")
           )
  ),
  # Third bae: Championship Search
  tabPanel("Championship Search",
           sidebarPanel(
             radioButtons("gender_bar3", label = h3("Gender"),
                          choices = list("Men" = 1, "Women" = 2), 
                          selected = 1),
             selectInput("yr_bar3", h3("Year"),
                         choices = c(1968:2015), selectize = FALSE),
             #selectInput("tourney_bar3", h3("Select Tourney"),
             #                choices = NULL),
             selectizeInput("tourney_bar3", h3("Select Tourney(s)"),
                            choices = NULL, multiple = TRUE),
             actionButton("action_bar3", "Update")
             
           ),
           mainPanel(
             tableOutput("Stat_Table_bar3")
             
           )
           
  )
  
)