###########################################################
### Train a classification model with training features ###
###########################################################

train_rf <- function(feature_train, label_train, ntree, mtry){
  model <- randomForest(x=feature_train, y=label_train, ntree=ntree, mtry=mtry)
  return(model)
}