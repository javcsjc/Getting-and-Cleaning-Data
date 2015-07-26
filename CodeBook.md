Getting and Cleaning Data - Course Project

Author: Jose Alberto Valdez Crespo

The source data for this project can be found here: 

* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original and Relevant Data Sets for this project:
* X_train.txt - Training set
* y_train.txt - Training IDs representing which activity was performed for each record
* subject_train.txt - ID representing the subject who performed the activity for the training set
* X_test.txt - Test set
* y_test.txt - Test IDs representing which activity was performed for each record
* subject_test.txt - ID representing the subject who performed the activity for the test set
* features.txt - List of all features
* activity_labels.txt - Labels representing each of the activities performed in both the training and test sets.

High Level Project Steps (For further details please refer to the run_analysis.R file):
* Read all the files
* Get Train data set ready
  ** Use feature labels as column names for training set
  ** Use activity labels to represent activities for training set
  ** Rename column for subjects on training set
* Get Test data set ready
  ** Use feature labels as column names for test set
  ** Use activity labels to represent activities for test set
  ** Rename column for subjects on training set. Use the same column name as for trainig set.
* Combine Test and Training sets
* Subset the combined data set to include select columns. i.e. mean() and std()
* Descriptive activity names done as part of prepping test and train data
* Label data set with descriptive column names
* Create a second independent data set with the average of each variable, for each activity, for each subject.

Internal Data Sets from run_analysis.R file:
* xTrain - Content imported from reading the X_train.txt file. Data frame: 7352 observations 561 variables.
* yTrain - Content imported from reading the y_train.txt file. Data frame: 7352 observations 1 variable.
* subjectTrain - Content imported from reading the subject_train.txt file. Data frame: 7352 observations 1 variable.
* features - Content imported from reading the features.txt file. Data frame: 561 observations 2 variables.
* activityType - Content imported from reading the activity_labels.txt file. Data frame: 6 observations 2 variables.
* xTest - Content imported from reading the X_test.txt file. Data frame: 2947 observations 561 variables
* yTest - Content imported from reading the y_test.txt file. Data frame: 2947 observations 1 variable.
* subjectTest - Content imported from reading the subject_test.txt file. Data frame: 2947 observations 1 variable. 
* trainingData - Data set created after combining xTrain, subjectTrain and yTrain. Data frame: 7352 observations 563 variables.
* testData - Data set created after combining xTest, subjectTest and yTest. Data frame: 2947 observations 563 variables.
* objective1 - Data set created by combining the Test and Training sets. trainingData + testData. Data frame: 10299 observations 563 variables.
* objective2 - Data set created after extracting selected columns. i.e: mean() and std(). Data frame: 10299 observations 68 variables.
* objective2 - Updated data set created after changing labels with more descriptive names. Data frame: 10299 observations 68 variables.
* objective5 - Independent tidy data set with the average of each variable, for each activity, for each subject. Data frame: 180 observations 68 variables.
* Objective5_dataset.txt - Text file created for the submission of the final dataset. Created using write.table(). Data frame: 180 observations 68 variables.

List of columns names (in order since they are grouped by subject & activity) for the Objective5_dataset.txt:
* 1 subjectID
* 2	activitydesc
* 3	timeimeBodyAccMean-X
* 4	timeBodyAccMean-Y
* 5	timeBodyAccMean-Z
* 6	timeBodyAccStdDev-X
* 7	timeBodyAccStdDev-Y
* 8	timeBodyAccStdDev-Z
* 9	timeGravityAccMean-X
* 10	timeGravityAccMean-Y
* 11	timeGravityAccMean-Z
* 12	timeGravityAccStdDev-X
* 13	timeGravityAccStdDev-Y
* 14	timeGravityAccStdDev-Z
* 15	timeBodyAccJerkMean-X
* 16	timeBodyAccJerkMean-Y
* 17	timeBodyAccJerkMean-Z
* 18	timeBodyAccJerkStdDev-X
* 19	timeBodyAccJerkStdDev-Y
* 20	timeBodyAccJerkStdDev-Z
* 21	timeBodyGyroMean-X
* 22	timeBodyGyroMean-Y
* 23	timeBodyGyroMean-Z
* 24	timeBodyGyroStdDev-X
* 25	timeBodyGyroStdDev-Y
* 26	timeBodyGyroStdDev-Z
* 27	timeBodyGyroJerkMean-X
* 28	timeBodyGyroJerkMean-Y
* 29	timeBodyGyroJerkMean-Z
* 30	timeBodyGyroJerkStdDev-X
* 31	timeBodyGyroJerkStdDev-Y
* 32	timeBodyGyroJerkStdDev-Z
* 33	timeBodyAccMagnitudeMean
* 34	timeBodyAccMagnitudeStdDev
* 35	timeGravityAccMagnitudeMean
* 36	timeGravityAccMagnitudeStdDev
* 37	timeBodyAccJerkMagnitudeMean
* 38	timeBodyAccJerkMagnitudeStdDev
* 39	timeBodyGyroMagnitudeMean
* 40	timeBodyGyroMagnitudeStdDev
* 41	timeBodyGyroJerkMagnitudeMean
* 42	timeBodyGyroJerkMagnitudeStdDev
* 43	freqBodyAccMean-X
* 44	freqBodyAccMean-Y
* 45	freqBodyAccMean-Z
* 46	freqBodyAccStdDev-X
* 47	freqBodyAccStdDev-Y
* 48	freqBodyAccStdDev-Z
* 49	freqBodyAccJerkMean-X
* 50	freqBodyAccJerkMean-Y
* 51	freqBodyAccJerkMean-Z
* 52	freqBodyAccJerkStdDev-X
* 53	freqBodyAccJerkStdDev-Y
* 54	freqBodyAccJerkStdDev-Z
* 55	freqBodyGyroMean-X
* 56	freqBodyGyroMean-Y
* 57	freqBodyGyroMean-Z
* 58	freqBodyGyroStdDev-X
* 59	freqBodyGyroStdDev-Y
* 60	freqBodyGyroStdDev-Z
* 61	freqBodyAccMagnitudeMean
* 62	freqBodyAccMagnitudeStdDev
* 63	freqBodyAccJerkMagnitudeMean
* 64	freqBodyAccJerkMagnitudeStdDev
* 65	freqBodyGyroMagnitudeMean
* 66	freqBodyGyroMagnitudeStdDev
* 67	freqBodyGyroJerkMagnitudeMean
* 68	freqBodyGyroJerkMagnitudeStdDev
