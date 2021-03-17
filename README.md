# Project: Can you recognize the emotion from an image of a face? 
<img src="figs/CE.jpg" alt="Compound Emotions" width="500"/>
(Image source: https://www.pnas.org/content/111/15/E1454)

### [Full Project Description](doc/project3_desc.md)

Term: Spring 2021

+ Team ##
+ Team members
	+ team member 1
	+ team member 2
	+ team member 3
	+ team member 4
	+ team member 5

+ Project summary: 
+ In this project, we created a classification engine for facial emotion recognition. We used **Gradient Boosting Machines (GBM)** as our baseline model, and the advance model is **Dense Neural Network (DNN)**. 
  + We also performed research on model optimization. We created several models including DNN, CNN, XGBoost, Logistic Regression, SVM, and Random Forecast based on a set of 3,000 facial images with imbalanced class ratio, resulting in 6,006 features for each observation. 
  + The goal is to identify two types of emotions: compound emotions (classified as 0) and basic emotions (classified as 1). To optimize performance of our models, we also tested our models with Random Over-Sampling Examples (ROSE) to rebalance the training data and improved features using Principal Component Analysis (PCA) to reduce the number of features to 66. 
In this branch we attempted to rework logistic regression into a workable model. The lasso penalty was removed and compared with lasso regression. 
	
**Contribution statement**: ([default](doc/a_note_on_contributions.md)) All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contributions statement. 

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
