library('ggplot2')

GeneratePlots<-function(team_names, start_year, end_year, xvar, yvar, zvar) {
  
  message = ""
  p = NULL
  if (length(team_names) == 0) {
    message = "Please select at least one team for analysis."
    return(list(message, p))
  }
  
  if (xvar == "Choices" | yvar == "Choices") {
    message = "Must select values other than Choices for both variable 1 and variable 2."
    return(list(message, p))
  }
  
  source("functions/LoadData.R")
  df<-LoadData()
  dfr<- df %>%
    filter(teamID %in% team_names) %>%
    filter(yearID >= start_year) %>%
    filter(yearID <= end_year)

  
  xdata = dfr[, c(xvar)]
  ydata = dfr[, c(yvar)]
  zdata = NULL
  if (zvar != "Choices") {
    zdata = dfr[, c(zvar)]
  }
  
  message = paste("Plot includes data from ", start_year, "to", end_year, "for the following teams: ",
                  paste(team_names, collapse=" "), sep=" ")
  
  if (is.numeric(xdata) & is.numeric(ydata) & is.factor(zdata)) {
    p<-ggplot(
      data=dfr,
      aes(x=xdata,
          y=ydata,
          color=zdata)
    ) + geom_point() + labs(title = paste(yvar, " vs ", xvar), x=xvar, y=yvar, color=zvar)
    return(list(message, p))
  } else if (is.numeric(xdata) & is.factor(ydata) & is.numeric(zdata)) {
    p<-ggplot(
      data=dfr,
      aes(x=xdata,
          y=zdata,
          color=ydata)
    ) + geom_point() + labs(title = paste(zvar, " vs ", xvar), x=xvar, y=zvar, color=yvar)
    return(list(message, p))
  } else if (is.numeric(xdata) & is.numeric(ydata) & is.numeric(zdata)) {
    p<-ggplot(
      data=dfr, 
      aes(x=xdata, 
          y=ydata, 
          color=zdata)) + 
      geom_point() + labs(title = paste(yvar, " vs ", xvar), x=xvar, y=yvar, color=zvar)
    return(list(message, p))
  } else if (is.numeric(xdata) & is.factor(ydata) & is.factor(zdata)) {
    p<-ggplot(
      data=dfr, 
      aes(x=xdata, 
          y=ydata, 
          color=zdata)) + geom_boxplot() + labs(title = paste(yvar, " vs ", xvar), x=xvar, y=yvar, color=zvar)
    return(list(message, p))
  } else if (is.factor(xdata) & is.numeric(ydata) & is.numeric(zdata)) {
    p<-ggplot(
      data=dfr,
      aes(x=zdata,
          y=ydata,
          color=xdata)
    ) + geom_point() + labs(title = paste(yvar, " vs ", zvar), x=zvar, y=yvar, color=xvar)
    return(list(message, p))
  } else if (is.factor(xdata) & is.numeric(ydata) & is.factor(zdata)) {
    p<-ggplot(
      data=dfr,
      aes(x=ydata,
          y=xdata,
          color=zdata)
    ) + geom_boxplot() + labs(title = paste(xvar, " vs ", yvar), x=yvar, y= xvar, color=zvar)
    return(list(message, p))
  } else if (is.factor(xdata) & is.factor(ydata) & is.numeric(zdata)) {
    p<-ggplot(
      data=dfr,
      aes(x=zdata,
          y=xdata,
          color=ydata)
    ) + geom_boxplot() + labs(title = paste(xvar, " vs ", zvar), x=zvar, y=xvar, color = yvar)
    return(list(message, p))
  } else if (is.factor(xdata) & is.factor(ydata) & is.factor(zdata)) {
    p<-ggplot(
      data=dfr) + 
      geom_bar(aes(x=xdata, fill = ydata),
               position = "dodge") + 
      facet_wrap(zdata) + labs(title= paste("Frequency of ", xvar), x =xvar, fill = zvar)
    return(list(message, p))
  } else if (is.numeric(xdata) & is.numeric(ydata)) {
    p<-ggplot(
      data=dfr,
      aes(x=xdata, 
          y=ydata))+
      geom_point() + labs(title = paste(yvar, " vs ", xvar), x=xvar, y=yvar)
    return(list(message, p))
  } else if (is.numeric(xdata) & is.factor(ydata)) {
    p<-ggplot(
      data=dfr,
      aes(x=xdata, 
          y=ydata))+
      geom_boxplot() + labs(title = paste(yvar, " vs ", xvar), x=xvar, y=yvar)
    return(list(message, p))
  } else if (is.factor(xdata) & is.numeric(ydata)) {
    p<-ggplot(
      data=dfr,
      aes(x=ydata, 
          y=xdata))+
      geom_boxplot() + labs(title = paste(xvar, " vs ", yvar), x=yvar, y=xvar)
    return(list(message, p))
  } else if (is.numeric(xdata) & is.factor(ydata)) {
    p<-ggplot(
      data=dfr,
      aes(x=xdata, 
          y=ydata))+
      geom_boxplot() + labs(x=xvar, y=yvar)
    return(list(message, p))
  } else if (is.factor(xdata) & is.factor(ydata)) {
    p<-ggplot(
      data = dfr, 
      aes(x=xdata, fill=ydata)) + geom_bar(position = "dodge") + 
      labs(title = paste("Frequency of ", yvar), x=xvar, fill = yvar)
    return(list(message, p))
  }}  