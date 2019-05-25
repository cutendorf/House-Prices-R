# 1. Define our grid of hyperparameters to tune
tuneGrid <- expand.grid(nrounds = 50,
                        max_depth = c(6,8,10),
                        eta = c(0.01,0.1,0.2,0.3),
                        gamma = 0,
                        colsample_bytree = c(0.3, 0.5, 0.8),
                        min_child_weight=c(1,3,5),
                        subsample=1)


# 2. Define the validation squema
ctrl <- trainControl(
  method = "cv",
  number = 5,
  savePredictions=TRUE
)

# 3. Train the model
ini<-now()
set.seed(123)
xgboostFit <- train(
  formula,
  data = train_hyp,
  method = "xgbTree", num.trees=1000,
  preProc = NULL, 
  tuneGrid = tuneGrid,
  trControl = ctrl,
  metric = "RMSE"
)
print(now()-ini)


xgboostFit


# inspecting the most relevant features: 
xgboostFit$results
xgboostFit$bestTune
xgboostFit$finalModel

# we can access the K-fold validation predictions
str(xgboostFit$pred)
pred_cv<-data.table(xgboostFit$pred)

# and visualize a CV summary using the established metric
plot(xgboostFit)

# we save the train object
saveRDS(xgboostFit,'xgboostFit_auto.RData')

# 4. Fit the model to all train data
params_hyp = list(eta=xgboostFit$bestTune$eta, max_depth=xgboostFit$bestTune$max_depth,gamma = 0,subsample=1,colsample_bytree=xgboostFit$bestTune$colsample_bytree,min_child_weight=xgboostFit$bestTune$min_child_weight)

xgb_hyp<-xgboost(booster='gbtree',
                 data=as.matrix(train_hyp[, !'price', with=F]),
                 label=train_hyp$price,
                 nrounds = 50,
                 params = params_hyp,
                 objective='reg:linear'
)

# 5. Predict on test data
test_xgb_hyp<-predict(xgb_hyp, newdata = as.matrix(test_hyp[, !'price', with=F]), type='response')