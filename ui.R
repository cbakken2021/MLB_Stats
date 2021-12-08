library(shiny)
library(shinythemes)

shinythemes::themeSelector()
navbarPage(
  theme = shinytheme("darkly"),
  "Collin's MLB Statistics",
  # First bar: Yearly Statistics
  tabPanel("Yearly Statistics",
           sidebarPanel(
             selectizeInput("variable_bar1", h3("Select Player(s)"), choices = NULL, multiple = TRUE),
             sliderInput("yr_bar1", h3("Year Range:"),
                         min = 1951, max = 2020, value = c(1990,2010)),
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