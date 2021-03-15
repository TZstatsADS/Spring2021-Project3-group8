###########################################################
### Make predictions with test features ###
###########################################################

test <- function(model, features, type){
  if (type == "classes") {
    pred <- predict_classes(model, features)
    #reu <- 1-sum(pred !=  dat_test$label)/length(pred)
  } else {
    pred <- predict_proba(model, features)
    #reu <- 1-sum(pred !=  dat_test$label)/length(pred)
  }
  
  # pred <- predict_classes(model, features)
  # reu <- 1-sum(pred !=  dat_test$label)/length(pred)
  return(pred)
}

# This function is not necessary.
# We put it here just to show the structure.