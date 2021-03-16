###########################################################
### Make predictions with test features ###
###########################################################

test_rf <- function(model, feature_test){
  res <- predict(model, newdata=feature_test)
  return(res)
}

# This function is not necessary.
# We put it here just to show the structure.