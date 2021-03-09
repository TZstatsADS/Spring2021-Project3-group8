###########################################################
### Train a classification model with training features ###
###########################################################

train_LR <- function(features, labels, w = NULL){
  labels <- ifelse(labels == 2, 1, 0)
  data <- as.data.frame(cbind(features, labels))
  data$labels <- as.factor(data$labels)
  
  model <- glm(labels ~ ., data = data, family = "binomial", weights=w)
  return(model)
}