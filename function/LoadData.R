library("Lahman")
library("dplyr")
LoadData <- function() {
  Clean = subset(People, select = -c(birthMonth, birthYear, birthCountry, birthState, birthCity, deathYear, deathMonth, deathDay, deathCountry, deathCity, deathState, retroID, bbrefID, deathDate, birthDate, finalGame, debut, birthDay))
  Clean$FullName <- paste(Clean$nameFirst, Clean$nameLast)
  Clean2 = subset(Clean, select = -c(nameFirst, nameLast))
  Clean3 <- merge(Clean2, Batting, by.x = "playerID", by.y="playerID")
  Clean3 <- Clean3 %>%
    mutate(BA = H / AB)
  Clean3 <- filter(Clean3, AB > 0)
  Clean3 <- filter(Clean3, yearID > 1950)
  Clean3 = subset(Clean3, select = -c(throws, stint, CS, IBB, HBP, SH, SF, GIDP, G, nameGiven))
  return(Clean3)
}

LoadNames <- function() {
  df <- LoadData()
  return(unique(df$FullName))
}