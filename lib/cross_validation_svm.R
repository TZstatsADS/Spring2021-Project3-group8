########################
### Cross Validation ###
########################

### Author: Chengliang Tang
### Project 3


cv.function <- function(features, labels, K, c){
  
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
    
    #train_data <- data[s != i,]
    #test_data <- data[s == i,]
    #par <- list(cost = cost)
    
    ## model training
    
    model_svm <- svm(label_train ~., data = cbind(feature_train, label_train), kernel = "linear", cost = c) 
    
    #label_train = ifelse(label_train == 2, 1, 0)
    
    #model_svm <- train(feature_train,label_train,c)
    
    ## make predictions
    
    label_pred <- as.integer(predict(model_svm, feature_test)) 
    
    label_test <- ifelse(label_test==2,1,0)
    cv.error[i] <- mean(label_pred != as.integer(label_test))
    
    tpr.fpr <- roc(label_pred, as.integer(label_test))
    cv.AUC[i] <- tpr.fpr$auc
  }
  return(c(mean(cv.error),sd(cv.error),mean(cv.AUC),sd(cv.AUC)))
}