source('notebooks/libraries.R')
source('notebooks/functions.R')
source('notebooks/metrics.R')

raw_train_data<-fread('data/house_price_train.csv', stringsAsFactors = F)

raw_test_data<-fread('data/house_price_test.csv', stringsAsFactors = F)

str(raw_train_data)

sum(is.na(raw_train_data))
sum(is.na(raw_test_data))

cols_train<-names(raw_train_data)
cols_test<-names(raw_test_data)

prep_train_data <- prep_data(raw_train_data)
str(prep_train_data)

prep_test_data <- prep_data(raw_test_data)
str(prep_test_data)

