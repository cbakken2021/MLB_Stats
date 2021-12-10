library('ggplot2')

RunRegression<-function(response, predictors, testdata) {
  
  if (response == "Choices" | length(predictors) == 0) {
    message = "Please select a Response variable and at least one Predictor variable."
    return(list("Invalid or incomplete selections", message, NULL, ""))
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
  testdata<- unlist(strsplit(testdata, ","))
  
  if (length(testdata) + 1 == length(dfr)) {
    tdata<-t(data.frame(as.numeric(c(testdata))))
    colnames(tdata)<-c(predictors)
    tpred<-predict(fit, newdata=as.data.frame(tdata))
    if (is.numeric(tpred)) {
      message2<-paste("Given the input data, the predicted value of", names(dfr)[1], "would be", tpred, sep=" ")
    } else {
      message2 = "Given the input data, a prediction could not be generated"
    }
  } else {
    message2 = "Given the input data, a prediction could not be generated"
  }
  
  return(list(message, s, p, message2))
}
