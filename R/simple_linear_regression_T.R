#SIMPLE LINEAR REGRESSION

# Importing the dataset
dataset = read.csv('Salary_Data.csv')


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#FITTING SIMPLE LINEAR REGRESSION TO TRAINING SET
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#PREDICTING THE TEST SET RESULTS
y_pred = predict(regressor, newdata = test_set)

#VISUALISING THE TRAINING SET RESULTS
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

#VISUALISING THE TESTING SET RESULTS
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Testing Set)') +
  xlab('Years of Experience') +
  ylab('Salary')