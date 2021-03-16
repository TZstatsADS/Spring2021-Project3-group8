########################
### Cross Validation ###
########################

### Author: Catherine Gao
### Project 3


cv.function_rf <- function(features, labels, K, ntree, mtry){
  ### Input:
  ### - features: feature data frame
  ### - labels: label data vector
  ### - K: a number stands for K-fold CV
  ### - l: tuning parameters 
  ### - reweight: sample reweighting 
  
  set.seed(2020)
  n <- dim(features)[1]
  n.fold <- round(n/K, 0)
  s <- sample(n) %% K + 1
  cv.error <- rep(NA, K)
  cv.AUC <- rep(NA, K)
  
  for (i in 1:K){
    ## create features and labels for train/test
    feature_train <- features[s != i,]
    feature_test <- features[s == i,]
    label_train <- labels[s != i]
    label_test <- labels[s == i]
    
    ## model training
    
    model_rf <- train_rf(feature_train, label_train, ntree=ntree, mtry=mtry)
    
    ## make predictions
    label_pred <- as.integer(predict(model_rf, feature_test))
    
    cv.error[i] <- mean(label_pred != as.integer(label_test))
    tpr.fpr <- roc(label_pred, as.integer(label_test))
    cv.AUC[i] <- tpr.fpr$auc
  }
  return(c(mean(cv.error),sd(cv.error), mean(cv.AUC), sd(cv.AUC)))
}