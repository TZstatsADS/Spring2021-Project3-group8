###########################################################
### Make predictions with test features ###
###########################################################

test_gbm <- function(model, features, n.trees, pred.type){
  res <- predict(model, newdata = data.frame(features), n.trees = n.trees, type = pred.type)
  return(res)
}

# This function is not necessary.
# We put it here just to show the structure.