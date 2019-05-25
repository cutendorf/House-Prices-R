#Mean absolute error
mae<-function(real, predicted){
  return(mean(abs(real-predicted)))
}

#Mean absolute percentage error
mape<-function(real,predicted){
  return(mean(abs((real-predicted)/real)))
}

#Root mean squared error
rmse<-function(real,predicted){
  return(sqrt(mean((real-predicted)^2)))
}

