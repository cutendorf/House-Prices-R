### Preparing the data set ###

prep_data <- function(data){

# Transforming date column in actual date format
data$date<-as.Date(data$date, "%m/%d/%Y")

# Transforming zip code in factor format
data$zipcode<-as.factor(data$zipcode)

# Creating variable to show if there was a renovation before
data$renovated <- ifelse(data$yr_renovated == 0, 0, 1)

# Creating variable if house has a basement
data$basement <- ifelse(data$sqft_basement == 0, 0, 1)

# Creating variable that shows the age of the house
data$houseage <- year(Sys.time()) - data$yr_built

return(data)
}

### Splitting into train and test data ###

f_split<-function(data, test, testsize = 0.2, seed = 1){
  set.seed = seed
  
  # Index sample based on test size
  nall = nrow(data) #total number of rows in data
  ntrain = floor((1-testsize) * nall)
  index = seq(1:nall)
  trainIndex = sample(index, ntrain) #train data set
  testIndex = index[-trainIndex]
  
  # Splitting into train and test
  train = data[trainIndex,]
  holdout = data[testIndex,]
  
  # Creating the list
  whole_data <- list(train, holdout, test)
  names(whole_data) <- c("train", "holdout", "test")
  
  
  return(whole_data)
}