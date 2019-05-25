### Feature engineering - creating new features ###

# 1. Basement
basement <- function(data){
  # Creating variable if house has a basement
  data$basement <- ifelse(data$sqft_basement == 0, 0, 1)
  data$sqft_basement <- NULL
  return(data)
  }

# 2. Renovated
renovated <- function(data){
  # Creating variable to show if there was a renovation before
  data$renovated <- ifelse(data$yr_renovated < 2005, 0, 1)
  data$yr_renovated <- NULL
  return(data)
}

# 3. Viewed or not

viewed <- function(data){
  # Exclude view 1 to 4
  data$view_1 <- NULL
  data$view_2 <- NULL
  data$view_3 <- NULL
  data$view_4 <- NULL
  return(data)
}


# 4. Living sqft comparison

living_comp <- function(data){
  # Ratio of living sqft to avg 15 closest neighbors
  data$living_comp <- data$sqft_living/data$sqft_living15
  data$sqft_living15 <- NULL
  return(data)
}

# 5. Lot sqft comparison

lot_comp <- function(data){
  # Ratio of lot sqft to avg 15 closest neighbors
  data$lot_comp <- data$sqft_lot/data$sqft_lot15
  data$sqft_living15 <- NULL
  return(data)
}


# 6. Decade of housebuilding

floor_decade    = function(value){ return(value - value %% 10) }

decade <- function(data){ 
  data$decade <- floor_decade(data$yr_built)
  data$yr_built<-NULL
  return(data)
  }



### Exclude variables with low correlation ###
#* condition: corr = 0.04
#* sqft_lot15 : cor = 0.08

low_correlation <- function(data){
  
  data$condition = NULL
  data$sqft_lot15 = NULL
  
  return(data)
}