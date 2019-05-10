source('functions/libraries.R')
source('functions/functions.R')

raw_train_data<-fread('data/house_price_train.csv', stringsAsFactors = F)

raw_test_data<-fread('data/house_price_test.csv', stringsAsFactors = F)

dataset = f_split(raw_train_data, raw_test_data, testsize = 0.2, seed = 1)
