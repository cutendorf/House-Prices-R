source('functions/libraries.R')
source('functions/functions.R')
source('functions/metrics.R')

raw_train_data<-fread('data/house_price_train.csv', stringsAsFactors = F)

raw_test_data<-fread('data/house_price_test.csv', stringsAsFactors = F)

str(raw_train_data)
