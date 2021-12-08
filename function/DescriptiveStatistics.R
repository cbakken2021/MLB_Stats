DescriptiveStatistics <- function(player_names, start_year, end_year) {
  source("function/LoadData.R")
  df <- LoadData()
  dfr <- df %>%
    filter(FullName %in% player_names) %>%
    filter(yearID >= start_year) %>%
    filter(yearID <= end_year)
  
  stats <- dfr %>%
    group_by(FullName, bats, teamID, lgID) %>%
    summarise(
      meanBA = mean(BA), sdBA = sd(BA), medianBA = median(BA), 
      meanH = mean(H), sdH = sd(H), medianH = median(H), 
      meanR = mean(R), sdR = sd(R), medianR = median(R), 
      meanX2B = mean(X2B), sdX2B = sd(X2B), medianX2B = median(X2B), 
      meanHR = mean(HR), sdHR = sd(HR), medianHR = median(HR), 
      meanRBI = mean(RBI), sdRBI = sd(RBI), medianRBI = median(RBI), 
      meanSO = mean(SO), sdSO = sd(SO), medianSO = median(SO)
      ) 
  return(stats)
}