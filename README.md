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

+ Project summary: In this project, we created a classification engine for facial emotion recognition. We used Gradient Boosting Machines (GBM) as our baseline model and performed research on model optimization. We created several models including DNN, CNN, XGBoost, Logistic Regression, SVM, and Random Forecast based on a set of 3,000 facial images with imbalanced class ratio, resulting in 6,006 features for each observation. The goal is to identify two types of emotions: compound emotions (classified as 0) and basic emotions (classified as 1). To optimize performance of our models, we used the Random Over-Sampling Examples (ROSE) to rebalance the training data and improved our features using Principal Component Analysis (PCA) to reduce the number of features to 66. Our best advanced model is Deep Neural Network (DNN). This model has 0.74 testing accuracy and 0.85 testing AUC, which trained within approximately 5 minutes. Our result is significantly improved compared to GBM baseline model with 0.71 testing accuracy, 0.8 testing AUC, and 77 sec training time. 

The main R markdown can be found in the doc folder, and the different models can be explored by checking out to the other named branches.
	
**Contribution statement**: ([default](doc/a_note_on_contributions.md)) All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contributions statement. 

Amir Idris organized and attended all group meetings, attempted to rework logistic regression to achieve better accuracy, wrote the outline for the group presentation, and constructed the main files for presenation as well as testing. 

Catherine Gao performed research on potential advance models to optimize performance. She constructed the skeleton code for Random Forest by training the model with different sets of hyperparameters. She also further improved the model by implementing ROSE and PCA to create the best advance model with the highest testing accuracy and testing AUC. Catherine also prepared the README file in Github. 

Eve Washington assisted in researching advanced models, focusing on the theory behind the CNN model and alternatives to fiduciary point comparison. She implemented this research by desgining, training, and testing the CNN model. She also helped to validate the results of the Random Forest model for the presentation preparation. 

Ruize Yu built the SVM advanced model, attended all team meetings and participated in team discussions. Ruize is the presenter for our group. 

Yiwen Fang investigated/wrote codes of GBM, XGBoost, DNN models in .Rmd, wrote PCA functions, helped with code review/debug for SVM model/cross-validation functions. Also, read/summarized past work/online materials to provide clues to find potential candidates from tens of models, explained/shared machine learning concepts with teammates during meetings.

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
