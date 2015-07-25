Codebook.md
Course: Getting and Cleaning Data Project
Author: "Jose Alberto Valdez Crespo"

Files on this Repo
1.- run_analysis.R
2.- README.md
3.- CodeBook.md

Data Source:

The source data for this project can be found here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original and Relevant Data Sets for this project:

X_train.txt - Training set
y_train.txt - Training IDs representing which activity was performed for each record
subject_train.txt - ID representing the subject who performed the activity for the training set
X_test.txt - Test set
y_test.txt - Test IDs representing which activity was performed for each record
subject_test.txt - ID representing the subject who performed the activity for the test set
features.txt - List of all features
activity_labels.txt - Labels representing each of the activities performed in both the training and test sets.

High Level Project Steps (For further details please refer to the run_analysis.R file):

Read all the files
Get Train data set ready
  Use feature labels as column names for training set
  Use activity labels on represent activities for training set
  Rename column for subjects on training set
Get Test data set ready
  Use feature labels as column names for test set
  Use activity labels on represent activities for test set
  Rename column for subjects on training set. Use the same column name as for trainig set.
Combine Test and Training sets
Subset the combined data set to include select columns. i.e. mean() and std()
Descriptive activity names done as part of prepping test and train data
Label data set with descriptive column names
Create a second independent data set with the average of each variable, for each activity, for each subject.

Internal Data Sets to run_analysis.R file:

xTrain - Content imported from reading the X_train.txt file
yTrain - Content improted from reading the y_train.txt file
subjectTrain - Content imported from reading the subject_train.txt file
features - Content imported from reading the features.txt file
activityType - Content imported from reading the activity_labels.txt file
xTest - Content imported from reading the X_test.txt file
yTest - Content improted from reading the y_test.txt file
subjectTest - Content imported from reading the subject_test.txt file 
trainingData - Data set created after combining xTrain, subjectTrain and yTrain
testData - Data set created after combining xTest, subjectTest and yTest
objective1 - Data set created by combining the Test and Training sets. trainingData + testData.
objective2 - Data set created after extracting selected columns. i.e: mean() and std().
objective2 <updated> - Data set created after changing labels with more descriptive names
objective5 - Independent tidy data set with the average of each variable, for each activity, for each subject.
