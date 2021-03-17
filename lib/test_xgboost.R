###########################################################
### Make predictions with test features ###
###########################################################

test_xgboost <- function(model, features, pred.type){
  pred <- predict(model, features)
  if (pred.type != "probability") {
    pred <- as.numeric(pred > 0.5)
  }
  return(pred)
}

# This function is not necessary.
# We put it here just to show the structure.