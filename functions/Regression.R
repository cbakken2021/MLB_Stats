library('ggplot2')

RunRegression<-function(response, predictors) {
  source("functions/LoadData.R")
  df<-LoadData()
  dfr<-df[, c(response, predictors)]
  fit<-lm(dfr)
  p<-ggplot(dfr, aes(x=dfr[,1], y=predict(fit))) +
    geom_point() +
    geom_abline(intercept=0, slope=1) +
    labs(x='Actual Values', y='Predicted Values', title='Predicted vs. Actual Values')
  s<-summary(fit)
  return(list(p, s))
}
