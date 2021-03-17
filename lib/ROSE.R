###########################################################
### Handles unbalanced Data Using ROSE Method           ###
###########################################################

use_rose <- function(dat_train){
  model <- ROSE(label~., data = dat_train)$data
  return(model)
}