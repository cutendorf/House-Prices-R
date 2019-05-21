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


price_dist <- ggplot(prep_train_data, aes(x = price)) +    
  geom_histogram(alpha = 0.8, fill='greenyellow') +
  scale_x_continuous(limits=c(0,2e6)) +
  labs(x= 'Price',y = 'Count', title = 'Cutted Price distribution') + 
  theme_bw()+  
  theme(panel.border = element_blank(), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_blank(),
        axis.ticks = element_blank(),
        legend.position="none")


ggplotly(price_dist)
