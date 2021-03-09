###########################################################
### Make predictions with test features ###
###########################################################

test_LR <- function(model, features, pred.type){
  res <- predict(model, newdata = data.frame(features), type = pred.type)
  return(res)
}

# This function is not necessary.
# We put it here just to show the structure.