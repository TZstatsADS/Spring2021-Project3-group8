#############################################################
### Construct features and responses for training images  ###
#############################################################

#need to edit things so that we get an image ranther than a fisducal point thing
featuretest <- function(input_list = image_list, index){
  
  #Format the images
  moded_images <- list()
  
  i <- 0 
  for (img in image_list){
    i<- i+1 
    img<- image_scale(img, "300x300") %>%
      image_quantize(colorspace = 'gray')
    
  }
  
  ### column bind feature matrix in Step 3 and corresponding features
  image_dataframe <- cbind(pairwise_dist_feature, info$label[index])
  
  ### add column names
  colnames(pairwise_data) <- c(paste("feature", 1:(ncol(pairwise_data)-1), sep = ""), "label")
    
  }




featue <- function(input_list = image_list, index){
  
  ### Construct process features for training images 
  
  ### Input: a list of images or fiducial points; index: train index or test index

  ### Output: a data frame containing: features and a column of label
  
  ### here is an example of extracting pairwise distances between fiducial points
  ### Step 1: Write a function pairwise_dist to calculate pairwise distance of items in a vector
  pairwise_dist <- function(vec){
    ### input: a vector(length n), output: a vector containing pairwise distances(length n(n-1)/2)
    return(as.vector(dist(vec)))
  }

  ### Step 2: Write a function pairwise_dist_result to apply function in Step 1 to column of a matrix
  pairwise_dist_result <-function(mat){
    ### input: a n*2 matrix(e.g. fiducial_pt_list[[1]]), output: a vector(length n(n-1))
    return(as.vector(apply(mat, 2, pairwise_dist)))
  }

  ### Step 3: Apply function in Step 2 to selected index of input list, output: a feature matrix with ncol = n(n-1) = 78*77 = 6006
  pairwise_dist_feature <- t(sapply(input_list[index], pairwise_dist_result))
  dim(pairwise_dist_feature)

  ### Step 4: construct a dataframe containing features and label with nrow = length of index
  
  ### column bind feature matrix in Step 3 and corresponding features
  pairwise_data <- cbind(pairwise_dist_feature, info$label[index])
  
  ### add column names
  colnames(pairwise_data) <- c(paste("feature", 1:(ncol(pairwise_data)-1), sep = ""), "label")
  
  ### convert matrix to data frame
  pairwise_data <- as.data.frame(pairwise_data)
  
  
  ### convert label column to factor
  pairwise_data$label <- as.factor(pairwise_data$label)
  
  return(feature_df = pairwise_data)
}
