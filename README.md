# Linear-Ridge-Regression
Linear Regression to predict the age of Abalone

We will be implementing Linear Regression to predict the age of Abalone (is a type of snail). The dataset is made available as part of the zip folder (linregdata). You can read more about the dataset at the UCI repository [1]. We are primarily interested in predicting the last column of the data that corresponds to the age of the abalone using all the other attributes.

1. The first column in the data encodes the attribute that encodes-female, infant and male as 0, 1 and 2 respectively. The numbers used to represent these values are symbols and therefore are not ordered. Transform this attribute into a three column binary representation. 
For example, represent female as (1, 0, 0), infant as (0, 1, 0) and male as (0, 0, 1).

2. Before performing linear regression, we must first standardize the independent variables, which includes everything except the last attribute (target attribute) - the number of rings. Standardizing means subtracting each attribute by its mean and dividing by its standard deviation. Standardization will transform the attributes to possess zero mean and unit standard deviation. You can use this fact to verify the correctness of your code.

3. Implemented the function named mylinridgereg(X, Y, lambda) that calculates the linear least squares solution with the ridge regression penalty parameter lambda (λ) and returns the regression weights. Implement the function mylinridgeregeval(X, weights) that returns a prediction of the target variable given the input variables and regression weights.

4. Before applying these functions to the dataset, randomly partition the data into a training and test set. Refer to the partition fraction as frac. If we want to use a 20%/80% training/testing split, then the value of frac will be 0.2. Now use your mylinridgereg with a variety of λ values to fit the penalized linear model to the training data and predict the target variable for the training and also for the testing data using two calls to your mylinridgeregeval function.

5. Implemented the function meansquarederr(T, Tdash) that computes the mean squared error between the predicted and actual target values.

6. Pick a value for λ and examine the weights of the ridge regression model. Which are the most significant attributes? Try removing two or three of the least significant attributes and observed how the mean squared errors change.

7. We observed the following:
  a. Does the effect of λ on error change for different partitions of the data into training andtesting sets?
	b. How do we know if we have learned a good model?
  
8. To see if the training set fraction affects the effect of lambda on error, plotted the effect in multiple graphs, one for each training set fraction, by building the following figure. Madee one figure of multiple graphs, one for each training set fraction, each graph being a plot of the average mean squared training error versus λ values and a plot of the average mean squared testing error versus λ. To enable the comparison across graphs, force each graph to have the same error (y axis) limits. 

9. The figures provide some insight, but is not very clear right? So we drew two more graphs.

  a. In the first graph plot the minimum average mean squared testing error versus the training set fraction values. 
  b. In the second graph, plot the λ value that produced the minimum average mean squared testing error versus the training set fraction.

10. So far we have been looking at only the mean squared error. We might also be interested in understanding the contribution of each prediction towards the error. Maybe the error is due to a few samples with huge errors and all others have tiny errors. One way to visualize this information is to a plot of predicted versus actual values. Use the best choice for the training fraction and λ, make two graphs corresponding to the training and testing set. The X and Y axis in these graphs will correspond to the predicted and actual target values respectively. If the model is good, then all the points will be close to a 45-degree line through the plot.

### References:
http://archive.ics.uci.edu/ml/datasets/Abalone	
