# Project: Can you recognize the emotion from an image of a face?
<img src="figs/CE.jpg" alt="Compound Emotions" width="500"/>
(Image source: https://www.pnas.org/content/111/15/E1454)

### [Full Project Description](doc/project3_desc.md)

Term: Spring 2021

+ Team 8
+ Team members
  + Amir Idris
  + Catherine Gao
  + Eve Washington
  + Ruize Yu
  + Yiwen Fang

+ Project summary:
  + In this project, we created a classification engine for facial emotion recognition. We used **Gradient Boosting Machines (GBM)** as our baseline model, and the advance model is **Dense Neural Network (DNN)**.
  + We also performed research on model optimization. We created several models including DNN, CNN, XGBoost, Logistic Regression, SVM, and Random Forecast based on a set of 3,000 facial images with imbalanced class ratio, resulting in 6,006 features for each observation.
  + The goal is to identify two types of emotions: compound emotions (classified as 0) and basic emotions (classified as 1). To optimize performance of our models, we also tested our models with Random Over-Sampling Examples (ROSE) to rebalance the training data and improved features using Principal Component Analysis (PCA) to reduce the number of features to 66.
  + Our best advance model is DNN. This model has 74% testing accuracy and 85% testing AUC, which trained in 327s. Our result is significantly improved compared to GBM baseline model with 72% testing accuracy, 80% testing AUC, and 69s training time.
  + For DNN (Dense Neural Network), Five dense layers with multiple Neurons are sued to ensure the accuracy of the model. layer_batch_normalization, regularizer_l1_l2, and layer_dropout are applied to avoid overfitting.

+ Files:
  + GBM and DNN are in `doc/main.Rmd`.
  + Other models are in the other GitHub branches named with model names.

+ Environment Setup:
  + Python env is required to run DNN model in R combined with Keras and Tensorflow.
  + Install Miniconda for Python (https://docs.conda.io/en/latest/miniconda.html).
  + keras and tensorflow should be installed automatically.
  + use_condaenv("r-tensorflow") should be installed automatically. Restart RStudio if required in the console.

**Contribution statement**: ([default](doc/a_note_on_contributions.md)) All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contributions statement.

Amir Idris organized and attended all group meetings, attempted to rework logistic regression to achieve better accuracy, wrote the outline for the group presentation, and constructed the main files for presenation as well as testing.

Catherine Gao performed research on potential advance models to optimize performance. She constructed the skeleton code for Random Forest by training the model with different sets of hyperparameters. She also further improved the model by implementing ROSE and PCA with Random Forest and validating the xgboost model. Catherine also prepared the README file in Github and validated the codes in Main file.

Eve Washington assisted in researching advanced models, focusing on the theory behind the CNN model and alternatives to fiduciary point comparison. She implemented this research by desgining, training, and testing the CNN model. She also helped to validate the results of the Random Forest model for the presentation preparation. She attended all group meetings, particpated is discussions, and resolved errors in the main.Rmd file before submitting.

Ruize Yu built the SVM advanced model, attended all team meetings and participated in team discussions. Ruize is the presenter for our group and makes sure the main file runs smoothly in R.

Yiwen Fang investigated/wrote codes of GBM and DNN models as baseline and advanced model respectively in .Rmd. He used cross validations to tune the model parameters of GBM and DNN. He wrote PCA functions, explored XGBoost model, wrote label prediction script to export label_prediction.csv, helped with code review/debug for SVM model/cross-validation functions. Also, read/summarized past work/online materials to provide clues to find potential candidates from tens of models, explained/shared machine learning concepts with teammates during meetings.

All team members contributed to the models and results discussions. All team members approve of this contribution statement.


Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
