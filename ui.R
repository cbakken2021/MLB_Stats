library(shiny)
library(shinythemes)

shinythemes::themeSelector()
navbarPage(
  theme = shinytheme("spacelab"),
  "Collin's MLB Statistics",
  # First bar: Yearly Statistics
  tabPanel("Yearly Statistics",
           sidebarPanel(
             selectizeInput("variable_bar1", h3("Select Player(s)"), choices=NULL, multiple=TRUE),
             sliderInput("yr_bar1", h3("Year Range:"),
                         min = 1951, max = 2020, value = c(1970,1972)),
             actionButton("action_bar1", "Update")
           ),
           mainPanel(
             textOutput("Message_bar1"),
             tableOutput("Stat_Table_bar1")
           )
  ),
  # Second bar: Statistical Summary
  tabPanel("Statistical Summary",
           sidebarPanel(
             selectizeInput("variable_bar2", h3("Select Team(s)"), choices=NULL, multiple=TRUE),
             sliderInput("yr_bar2", h3("Year Range:"),
                         min = 1951, max = 2020, value = c(1951,2020)),
             selectizeInput("variable_plot2x", h3("Select Variable 1"), choices=NULL, selected=NULL),
             selectInput("variable_plot2y", h3("Select Variable 2"), choices=NULL, selected=NULL),
             selectInput("variable_plot2z", h3("Select Variable 3 (optional)"), choices=NULL, selected=NULL),
             actionButton("action_bar2", "Update")
           ),
           mainPanel(
             textOutput("Message_bar2"),
             plotOutput("Plot_2a")
           )
  ),
  # Third bar: Regression Analysis
  tabPanel("Regression Analysis",
           sidebarPanel(
             selectizeInput("response_bar3", h3("Select Response"), choices=NULL, selected=NULL),
             selectizeInput("predictor_bar3", h3("Select Predictor(s)"), choices=NULL, selected=NULL, multiple=TRUE),
             actionButton("action_bar3", "Update")
             
           ),
           mainPanel(
             textOutput("Text_bar3"),
             verbatimTextOutput("Message_bar3"),
             plotOutput("Plot_bar3")
             
           )
           
  )
  
)
  
         