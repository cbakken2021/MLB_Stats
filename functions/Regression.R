library('ggplot2')

RunRegression<-function(response, predictors) {
  
  if (response == "Choices" | length(predictors) == 0) {
    message = "Please select a Response variable and at least one Predictor variable."
    return(list(NULL, "Invalid or incomplete selections", message))
  }
  
  message = paste("Regression of ", response, "using predictors: ",
                  paste(predictors, collapse=", "), sep=" ")
  
  source("functions/LoadData.R")
  df<-LoadData()
  dfr<-df[, c(response, predictors)]
  fit<-lm(dfr)
  p<-ggplot(dfr, aes(x=dfr[,1], y=predict(fit))) +
    geom_point() +
    geom_abline(intercept=0, slope=1) +
    labs(x='Actual Values', y='Predicted Values', title='Predicted vs. Actual Values')
  s<-summary(fit)
  return(list(p, s, message))
}
