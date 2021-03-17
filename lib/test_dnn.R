###########################################################
### Make predictions with test features ###
###########################################################

test_dnn <- function(model, features, type = "predict_classes"){
  x_test <- features %>%
    scale()
  if (type == "predict_classes") {
    predictions <- model %>% predict_classes(x_test)
  } else {
    predictions <- model %>% predict_proba(x_test)
  }
  
  return(predictions)
}

# This function is not necessary.
# We put it here just to show the structure.