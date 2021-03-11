###########################################################
### Train a classification model with training features ###
###########################################################

train <- function(features, labels, w = NULL, l = 1){
  #model <- glmnet(features, labels, weights = w, alpha = 1, family = "binomial", lambda = l)
  
  #convolutional base
  model <- keras_model_sequential() %>% 
  layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = "relu", 
                input_shape = c(750,1000,3)) %>% 
  layer_max_pooling_2d(pool_size = c(2,2)) %>% 
  layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = "relu") %>% 
  layer_max_pooling_2d(pool_size = c(2,2)) %>% 
  layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = "relu") %>% 
  
  #dense Layers 
  layer_flatten() %>% 
  layer_dense(units = 64, activation = "relu") %>% 
  layer_dense(units = 10, activation = "softmax") %>%
  
  #Compile the model 
    compile(
      optimizer = "adam",
      loss = "sparse_categorical_crossentropy",
      metrics = "accuracy"
    )
  
  

  return(model)
}

#https://tensorflow.rstudio.com/tutorials/advanced/images/cnn/