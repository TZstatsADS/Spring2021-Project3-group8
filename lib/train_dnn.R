###########################################################
### Train a classification model with training features ###
###########################################################

# https://heartbeat.fritz.ai/binary-classification-using-keras-in-r-ef3d42202aaa
# Install Miniconda (https://docs.conda.io/en/latest/miniconda.html)

train_dnn <- function(features, labels, w = NULL, feature_test, label_test, weight_test = NULL, lr){
  labels <- ifelse(labels == 2, 1, 0)
  
  x_train <- features %>% 
    scale()
  y_train <- to_categorical(labels)
  
  x_test <- feature_test %>% 
    scale()
  y_test <- to_categorical(label_test)
  
  validation_data = list(x_test, y_test, weight_test)
  
  model <- keras_model_sequential()
  model %>% 
    # lr = 0.0002
    layer_batch_normalization() %>%
    layer_dense(units = 512, activation = 'relu', input_shape = ncol(x_train), kernel_regularizer = regularizer_l1_l2(l1 = 0.00002, l2 = 0.00002),) %>%
    layer_dropout(rate = 0.3) %>%
    layer_batch_normalization() %>%
    layer_dense(units = 256, activation = 'relu', kernel_regularizer = regularizer_l1_l2(l1 = 0.00001, l2 = 0.00001),) %>%
    layer_dropout(rate = 0.3) %>%
    layer_batch_normalization() %>%
    layer_dense(units = 128, activation = 'relu', kernel_regularizer = regularizer_l1_l2(l1 = 0.00001, l2 = 0.00001),) %>%
    layer_dropout(rate = 0.3) %>%
    layer_batch_normalization() %>%
    layer_dense(units = 64, activation = 'relu') %>%
    layer_dense(units = 2, activation = 'softmax')
  
  history <- model %>% compile(
    loss = 'binary_crossentropy',
    optimizer = optimizer_adam(lr = lr),
    metrics = c('accuracy')
  )
  
  model %>% fit(
    x_train, y_train, 
    epochs = 100, 
    batch_size = 50,
    # validation_split = validation_split,
    validation_data = validation_data,
    sample_weight = w
  )
  
  return(model)
}
