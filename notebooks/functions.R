### Preparing the data set - Step 1 ###

prep_data <- function(data){

# Transforming date column in actual date format
data$date<-as.Date(data$date, "%m/%d/%Y")

# Transforming zip code in factor format
data$zipcode<-as.factor(data$zipcode)

return(data)
}


### Preparing the data set - Step 2 (Final data types) ###

data_types <- function(data){
  
  # Transform into factor variables
  data[,c("bedrooms", "floors", "view")] <- lapply(data[,c("bedrooms", "floors", "view")], as.factor) 
  
  
  # Transform all integer columns into numeric ones
  data[ , names(data)[sapply(data, is.integer)]:=lapply(.SD,as.numeric),
        .SDcols = sapply(data, is.integer)]
  
  return(data)
}

### Splitting into train, hold-out and test data ###


f_partition<-function(df, test, test_proportion=0.2, seed=NULL){
  
  if(!is.null(seed)) set.seed(seed)
  
  train_index<-sample(nrow(df), floor(nrow(df)*(1-test_proportion)), replace = FALSE)
  df_train<-df[train_index]
  df_holdout<-df[-train_index]
  df_test <- test
  
  return(list(train=df_train, holdout=df_holdout, test=df_test))
}








### Feature engineering - creating new features ###

new_features <- function(data){
  
  # Transforming date column in actual date format
  data$month <- month(data$date)
  data$year <- year(data$date)
  
  # Creating variable to show if there was a renovation before
  data$renovated <- ifelse(data$yr_renovated == 0, 0, 1)
  
  # Creating variable if house has a basement
  data$basement <- ifelse(data$sqft_basement == 0, 0, 1)
  
  # Creating variable that shows the age of the house
  data$houseage <- year(Sys.time()) - data$yr_built
  
  return(data)
}


### Exclude variables with low correlation ###

low_correlation <- function(data){
  
  data$condition = NULL
  data$houseage = NULL
  data$sqft_lot15 = NULL
  data$month = NULL
  
  return(data)
}