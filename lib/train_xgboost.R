###########################################################
### Train a classification model with training features ###
###########################################################

# https://xgboost.readthedocs.io/en/latest/R-package/xgboostPresentation.html

# if(!require("xgboost")){
#   install.packages("xgboost")
# }
# require(xgboost)
# 
# a = load("../output/feature_train_tmp_only.RData")
# features = get(a)
# rm(a)
# 
# b = load("../output/label_train_tmp_only.RData")
# labels = get(b)
# rm(b)
# labels <- ifelse(labels == 2, 0, 1)
# 
# a = load("../output/feature_test_tmp_only.RData")
# features2 = get(a)
# rm(a)
# 
# b = load("../output/label_test_tmp_only.RData")
# labels2 = get(b)
# rm(b)
# labels2 <- ifelse(labels2 == 2, 0, 1)

train_xgboost <- function(features, labels, eta, colsample_bytree, reweight){
  labels <- ifelse(labels == 2, 0, 1)
  
  scale_pos_weight = NULL
  if (reweight) {
    scale_pos_weight <- sum(labels == 0) / sum(labels == 1)
  }
  
  bst <- xgboost(data = as.matrix(features), label = labels, max.depth = 3, eta = eta, nrounds = 300, objective = "binary:logistic", scale_pos_weight = scale_pos_weight, colsample_bytree = colsample_bytree)
  
  return(bst)
}