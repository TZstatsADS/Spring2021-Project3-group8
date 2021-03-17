#############################################################
### Construct PCA model ###
#############################################################

feature_pca <- function(dat){
  pca <- preProcess(x = dat[, -6007], method = "pca", thresh = 0.95)
  return(pca)
}