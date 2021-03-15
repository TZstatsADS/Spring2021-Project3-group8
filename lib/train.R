###########################################################
### Train a classification model with training features ###
###########################################################

# train <- function(features, labels, w = NULL, l = 1){
#   model <- glmnet(features, labels, weights = w, alpha = 1, family = "binomial", lambda = l)
#   return(model)
# }

train <- function(features, labels, w = NULL, l = 1){
  labels <- ifelse(labels == 2, 1, 0)
  all_data <- data.frame(features, labels)
  print(all_data[1,])
  model <- glm(all_data$labels ~ ., weights = w, data=all_data, family = "binomial")
  return(model)
}