###########################################################
### Train a classification model with training features ###
###########################################################

# https://heartbeat.fritz.ai/binary-classification-using-keras-in-r-ef3d42202aaa
# Install Miniconda (https://docs.conda.io/en/latest/miniconda.html)

# x = load("../output/feature_train_tmp_only.RData")
# features = get(x)
# rm(x)
# 
# y = load("../output/label_train_tmp_only.RData")
# labels = get(y)
# rm(y)

train_dnn <- function(features, labels, w = NULL, feature_test, label_test, weight_test = NULL){
  labels <- ifelse(labels == 2, 1, 0)
  
  # class_weight <- NULL
  # if (!is.null(w)){
  #   labels_w <- cbind(labels, w)
  #   labels_w[!duplicated(labels_w[,1]),]
  #   labels_w <- labels_w[order(labels_w[,1]),]
  #   class_weight <- list("0" = labels_w[1,1],"1" = labels_w[2,1])
  # }
  
  x_train <- features %>% 
    scale()
  y_train <- to_categorical(labels)
  
  x_test <- feature_test %>% 
    scale()
  y_test <- to_categorical(label_test)
  
  validation_data = list(x_test, y_test, weight_test)
  
  model <- keras_model_sequential()
  model %>% 
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
  
    # lr = 0.0001, 80%
    # layer_batch_normalization() %>%
    # layer_dense(units = 512, activation = 'relu', input_shape = ncol(x_train)) %>%
    # layer_dropout(rate = 0.3) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 256, activation = 'relu') %>%
    # layer_dropout(rate = 0.3) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 128, activation = 'relu') %>%
    # layer_dropout(rate = 0.3) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 64, activation = 'relu') %>%
    # layer_dense(units = 2, activation = 'softmax')
  
    # lr = 0.0002, 79.06296 % + 0.8666566
    # layer_batch_normalization() %>%
    # layer_dense(units = 512, activation = 'relu', input_shape = ncol(x_train), kernel_regularizer = regularizer_l1_l2(l1 = 0.00002, l2 = 0.00002),) %>%
    # layer_dropout(rate = 0.3) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 256, activation = 'relu', kernel_regularizer = regularizer_l1_l2(l1 = 0.00001, l2 = 0.00001),) %>%
    # layer_dropout(rate = 0.3) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 128, activation = 'relu', kernel_regularizer = regularizer_l1_l2(l1 = 0.00001, l2 = 0.00001),) %>%
    # layer_dropout(rate = 0.3) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 64, activation = 'relu') %>%
    # layer_dense(units = 2, activation = 'softmax')
  
    # lr = 0.0005, 76.02036 % + 0.8521545
    # layer_batch_normalization() %>%
    # layer_dense(units = 512, activation = 'relu', input_shape = ncol(x_train), kernel_regularizer = regularizer_l1_l2(l1 = 0.0001, l2 = 0.0001),) %>%
    # layer_dropout(rate = 0.3) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 256, activation = 'relu', kernel_regularizer = regularizer_l1_l2(l1 = 0.00001, l2 = 0.00001),) %>%
    # layer_dropout(rate = 0.3) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 128, activation = 'relu', kernel_regularizer = regularizer_l1_l2(l1 = 0.00001, l2 = 0.00001),) %>%
    # layer_dropout(rate = 0.3) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 64, activation = 'relu') %>%
    # layer_dense(units = 2, activation = 'softmax')
  
    # layer_batch_normalization() %>%
    # layer_dense(units = 600, activation = 'relu', input_shape = ncol(x_train)) %>%
    # # layer_dropout(rate = 0.2) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 300, activation = 'relu') %>%
    # # layer_dropout(rate = 0.2) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 150, activation = 'relu') %>%
    # # layer_dropout(rate = 0.2) %>%
    # layer_batch_normalization() %>%
    # layer_dense(units = 50, activation = 'relu') %>%
    # layer_dense(units = 2, activation = 'softmax')
  
  history <- model %>% compile(
    loss = 'binary_crossentropy',
    optimizer = optimizer_adam(lr = 0.0002),
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

# # model = train_dnn(features, labels)
# summary(model)
# 
# model %>% save_model_hdf5("../output/model_dnn.h5")
# # model <- load_model_hdf5("../output/model_dnn.h5")
# 
# a = load("../output/feature_test_tmp_only.RData")
# features2 = get(a)
# rm(a)
# 
# b = load("../output/label_test_tmp_only.RData")
# labels2 = get(b)
# rm(b)
# labels2 <- ifelse(labels2 == 2, 1, 0)
# 
# x_test <- features2 %>% 
#   scale()
# y_test <- to_categorical(labels2)
# 
# model %>% evaluate(x = x_test, y = y_test)
# 
# predictions <- model %>% predict_classes(x_test)
# 
# table(factor(predictions, levels=min(y_test):max(y_test)),factor(y_test, levels=min(y_test):max(y_test)))
