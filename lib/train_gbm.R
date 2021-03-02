###########################################################
### Train a classification model with training features ###
###########################################################

train_gbm <- function(features, labels, w = NULL, n.trees, shrinkage){
  labels <- ifelse(labels == 2, 0, 1)
  model <- gbm.fit(x = features, y = labels, distribution = "bernoulli", w = w, n.trees = n.trees, shrinkage = shrinkage, verbose = FALSE)
  return(model)
}