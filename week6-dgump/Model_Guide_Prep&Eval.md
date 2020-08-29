* We have data and we want to make predictions
	* EDA
		* What is the target?
			* How do things relate to the target
		* missingness
		* outliers
		* Potentially look at predictor/target distributions
		* Classify input features as numeric or categorical
		* view correlations
	* Train/test split
	* Cleaning/Feature Prep
		* Potentially remove highly correlated features
		* Is our data on different scales?
			* If the model needs it, scale
		* Encode categorical columns 
		* Potentially select some best features
		* Potentially PCA
	* Choose appropriate model
		* Regression? Classification
	* Evaluate model performance
		* Classification
			* Confusion Matrix
			* ROC
			* Calibration (cares about confidence)
			* Metrics to maximize
				* Accuracy(right/wrong)
				* Precision
				* Recall
				* F1
				* AUC (considers confidence)
			* Metrics to minimize:			
				* log_loss (care about condicence)
				* others
		* Regression
			* TBD


___

* 