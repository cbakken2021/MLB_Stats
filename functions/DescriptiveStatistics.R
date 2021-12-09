DescriptiveStatistics<-function(player_names, start_year, end_year) {
  source("functions/LoadData.R")
  df<-LoadData()
  dfr<- df %>%
    filter(FullName %in% player_names) %>%
    filter(yearID >= start_year) %>%
    filter(yearID <= end_year)
  
  header=paste("The table below shows average baseball statistics over the years",
               start_year, "to", end_year, sep=" ")
  if (length(player_names) == 0) {
    header="No players selected.  Please select at least one player and update the table."
  } else if (nrow(dfr) == 0) {
    header = "No data available for the players selected in the year range selected.  Please try again."
  }
  
  stats <- dfr %>%
    group_by(FullName, bats, teamID, lgID) %>%
    summarise(
      meanBA = mean(BA),
      sdBA = sd(BA),
      medianBA = median(BA),
      meanH = mean(H),
      sdH = sd(H),
      medianH = median(H),
      meanR = mean(R), sdR = sd(R), medianR = median(R), meanAB = mean(AB), sdAB = sd(AB), medianAB = median(AB), meanX2B = mean(X2B), sdX2B = sd(X2B), medianX2B = median(X2B), meanX3B = mean(X3B), sdX3B = sd(X3B), medianX3B = median(X3B), meanHR = mean(HR), sdHR = sd(HR), medianHR = median(HR), meanRBI = mean(RBI), sdRBI = sd(RBI), medianRBI = median(RBI), meanSB = mean(SB), sdSB = sd(SB), medianSB = median(SB), meanBB = mean(BB), sdBB = sd(BB), medianBB = median(BB), meanSO = mean(SO), sdSO = sd(SO), medianSO = median(SO)
    )
  return(list(header, stats))
}
