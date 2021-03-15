###########################################################
### Train a classification model with training features ###
###########################################################

train <- function(features, labels){
  #model <- glmnet(features, labels, weights = w, alpha = 1, family = "binomial", lambda = l)
  
  # #convolutions base
  # model <- keras_model_sequential() %>%
  #   layer_conv_1d(filters = 100, kernel_size = 2, activation = "relu",
  #                 input_shape = c(152,3)) %>%
  # 
  #   layer_max_pooling_1d(pool_size = 3) %>%
  #   layer_conv_1d(filters = 64, kernel_size = 3, activation = "relu") %>%
  #   layer_max_pooling_1d(pool_size = 2) %>%
  #   layer_conv_1d(filters = 64, kernel_size = 3, activation = "relu") %>%
  # 
  #   #dense Layers
  #   layer_flatten() %>%
  #   layer_dense(units = 64, activation = "relu") %>%
  #   layer_dense(units = 10, activation = "softmax") %>%
  # 
  # #Compile the model
  #   compile(
  #     optimizer = "adam",
  #     loss = "sparse_categorical_crossentropy",
  #     metrics = list("accuracy","AUC")
  #   )

  
  model <- keras_model_sequential() 
  
  model %>% 
    
    #first layer is Convolution Layer
    layer_conv_1d(filters = 32, kernel_size = 3, activation = "relu",input_shape = c(152,3)) %>%
    layer_max_pooling_1d(pool_size = 2) %>%
    layer_conv_1d(filters = 64, kernel_size = 3, activation = "relu") %>% 
    layer_max_pooling_1d(pool_size = 2) %>%
    layer_conv_1d(filters = 64, kernel_size = 3, activation = "relu") %>% 
    
    #Fourth layer is Flatten Layer
    layer_flatten() %>% 

    layer_dense(units = 64, activation = 'relu') %>% 
    layer_dense(units = 1, activation = 'sigmoid')
  
 
   model %>% compile(
    loss='binary_crossentropy',
    optimizer = "adam",
    metrics = list("accuracy","AUC")
  )
  
  summary(model)
   
   # features2 = features.batch_and_drop_remainder(128)
   # labels2 = labels.features.batch_and_drop_remainder(128)
  
  model %>% 
    fit(
      x = features, y = labels,
      epochs = 10,
      validation_split = 0.3,
      verbose = 2
    )
  
  
  

  return(model)
}

#https://tensorflow.rstudio.com/tutorials/advanced/images/cnn/