#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source("global.R")
server = function(input, output, session) {
  # First page
  observe({
    source("functions/LoadData.R")
    player_names <- LoadNames()
    updateSelectizeInput(session, "variable_bar1", choices=player_names, server=TRUE)
  })
  
  dataInput1<- eventReactive(input$action_bar1, {
    source("functions/DescriptiveStatistics.R")
    DescriptiveStatistics(input$variable_bar1, input$yr_bar1[1], input$yr_bar1[2])
  })
  
  output$Message_bar1<- renderText({
    dataInput1()[[1]]
  })
  
  output$Stat_Table_bar1<- renderTable({
    dataInput1()[[2]]
  })
  
  # Second page
  observe({
    source("functions/LoadData.R")
    team_names <- LoadTeamNames()
    updateSelectizeInput(session, "variable_bar2", choices=team_names, server=TRUE)
    col_names <- LoadColNames()
    updateSelectizeInput(session, "variable_plot2x", choices=col_names, server=TRUE)
    updateSelectizeInput(session, "variable_plot2y", choices=col_names, server=TRUE)
    updateSelectizeInput(session, "variable_plot2z", choices=col_names, server=TRUE)
    
  })
  
  dataInput2 <- eventReactive(input$action_bar2, {
    source("functions/Visualizations.R")
    GeneratePlots(input$variable_bar2, input$yr_bar2[1], input$yr_bar2[2], input$variable_plot2x, input$variable_plot2y, input$variable_plot2z)
  })
  
  output$Message_bar2<- renderText({
    dataInput2()[[1]]
  })
  
  output$Plot_2a <- renderPlot({
    dataInput2()[[2]]
  })
  

  #Third Page
  observe({
    source("functions/LoadData.R")
    col_names <- LoadColNames()
    updateSelectizeInput(session, "response_bar3", choices=col_names, server=TRUE)
    updateSelectizeInput(session, "predictor_bar3", choices=col_names, server=TRUE)
  })
  
  dataInput3<- eventReactive(input$action_bar3, {
    source("functions/Regression.R")
    RunRegression(input$response_bar3, input$predictor_bar3, input$unknown_bar3)
  })
  output$Text_bar3<- renderText({
    dataInput3()[[1]]
  })
  output$Message_bar3<- renderPrint({
    dataInput3()[[2]]
  })
  
  output$Plot_bar3 <- renderPlot({
    dataInput3()[[3]]
  })
  
  output$Prediction_bar3<- renderText({
    dataInput3()[[4]]
  })
}


