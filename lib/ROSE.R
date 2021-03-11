###########################################################
### Handles unbalanced Data Using ROSE Method           ###
###########################################################

use_rose <- function(dat_train){
  set.seed(2020)
  model <- ROSE(label~., data = dat_train)$data
  return(model)
}