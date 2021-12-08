source("global.R")
server = function(input, output, session) {
  #First Bar
  
  observe({
    source("function/LoadData.R")
    player_names <- LoadNames()
    updateSelectizeInput(session, "variable_bar1", choices = player_names, server = TRUE)
  })
  dataInput_bar1<- eventReactive(input$action_bar1,{
    source("function/DescriptiveStatistics.R")
    DescriptiveStatistics(input$variable_bar1, input$yr_bar1[1], input$yr_bar1[2])
  })
  # output$Message_bar1<- renderText({
  #   paste(dataInput_bar1()[[1]])
  # })
  
  output$Stat_Table_bar1 <- renderTable({
    dataInput_bar1()
  })
    #   # Second Bar
#   dataInput_bar2<- eventReactive(input$action_bar2,{
#     source("functions/Player_Yr_Summary.R")
#     Player_yr_summary(input$gender_bar2, input$yr_bar2, input$player_name_bar2)
#   })
# 
#   output$Message_bar2<- renderText({
#     paste(dataInput_bar2()[[1]])
#   })
# 
#   output$Stat_Table_bar2 <- renderTable({
#     dataInput_bar2()[[2]]
#   })
#   # Third Bar
#   observe({
#     source("functions/Tourney_Search.R")
#     label_tourneys<- Tourney_search(input$gender_bar3, input$yr_bar3)
#     updateSelectizeInput(session, "tourney_bar3",
#                          choices = label_tourneys, server = TRUE)
#     #updateSelectInput(session, "tourney_bar3",
#     #                  label = "Select Tourney", choices = label_tourneys)
# 
#   })
# 
#   dataInput_bar3<- eventReactive(input$action_bar3,{
#     source("functions/Championship_Search.R")
#     Championshipe_search(input$gender_bar3, input$yr_bar3, input$tourney_bar3)
#   })
# 
#   output$Stat_Table_bar3 <- renderTable({
#     dataInput_bar3()
#   })

}