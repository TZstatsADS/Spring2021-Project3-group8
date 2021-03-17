########################
### Cross Validation ###
########################

### Author: Yiwen Fang
### Project 3


cv.function_xgboost <- function(features, labels, K, eta, colsample_bytree, reweight = FALSE){
  ### Input:
  ### - features: feature data frame
  ### - labels: label data vector
  ### - K: a number stands for K-fold CV
  ### - n.trees: tuning parameters
  ### - shrinkage: tuning parameters
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
    
    ## sample reweighting
    weight_train <- rep(NA, length(label_train))
    weight_test <- rep(NA, length(label_test))
    for (v in unique(labels)){
      weight_train[label_train == v] = 0.5 * length(label_train) / length(label_train[label_train == v])
      weight_test[label_test == v] = 0.5 * length(label_test) / length(label_test[label_test == v])
    }
    
    ## model training
    if (reweight){
      model_train <- train_xgboost(feature_train, label_train, eta, colsample_bytree, reweight = reweight)
    } else {
      model_train <- train_xgboost(feature_train, label_train, eta, colsample_bytree, reweight = NULL)
    }
    
    ## make predictions
    prob_pred <- test_xgboost(model_train, feature_test, pred.type = 'probability')
    
    label_pred <- ifelse(prob_pred > 0.5, 1, 0)
    label_test <- ifelse(label_test == 2, 1, 0)
    
    cv.error[i] <- 1 - sum(weight_test * (label_pred == label_test)) / sum(weight_test)
    
    tpr.fpr <- WeightedROC(prob_pred, label_test, weight_test)
    cv.AUC[i] <- WeightedAUC(tpr.fpr)
  }
  return(c(mean(cv.error),sd(cv.error), mean(cv.AUC), sd(cv.AUC)))
}
