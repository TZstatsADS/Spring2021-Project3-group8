
if(!require("caret")){
  install.packages("caret")
}
library(caret)

feature_pca <- function(dat){
  pca <- preProcess(x = dat[, -6007], method = "pca", thresh = 0.95)
  pca_feature <- predict(pca, dat[, -6007])
  return(pca_feature)
}