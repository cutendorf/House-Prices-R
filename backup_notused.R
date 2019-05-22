raw_train_data$date<-as.Date(raw_train_data$date, "%m/%d/%Y")
raw_test_data$date<-as.Date(raw_test_data$date, "%m/%d/%Y")

raw_train_data$zipcode<-as.factor(raw_train_data$zipcode)
raw_test_data$zipcode<-as.factor(raw_test_data$zipcode)

raw_train_data$waterfront<-as.logical(raw_train_data$waterfront)
raw_test_data$waterfront<-as.logical(raw_test_data$waterfront)

raw_train_data[ , names(raw_train_data)[sapply(raw_train_data, is.integer)]:=lapply(.SD,as.numeric),
                .SDcols = sapply(raw_train_data, is.integer)]
raw_test_data[ , names(raw_test_data)[sapply(raw_test_data, is.integer)]:=lapply(.SD,as.numeric),
               .SDcols = sapply(raw_test_data, is.integer)]


dataset = f_split(raw_train_data, raw_test_data, testsize = 0.2, seed = 1)






