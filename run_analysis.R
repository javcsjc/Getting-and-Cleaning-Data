#########################################################################################################
## Getting and Cleaning Data - Course Project
## Data Science Specialization - Coursera
## Student: Jose Alberto Valdez Crespo
## Date: July 25, 2015
## 
## Original Dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
## Course Project Objectives:
##
## 1.- Merge the training and the test sets to create one data set
## 2.- Extract only the measurements on the mean and standard deviation for each measurement
## 3.- Use descriptive activity names to name the activities in the data set
## 4.- Appropriately label the data set with descriptive activity names
## 5.- Create a second, independent tidy data set with the average of each variable for each activity and each subject
##
## Assumptions:
##
## 1.- User has downloaded the Dataset.zip file to local machine and has unzipped the file.
##
#################################################################################################

## Start with a clean workspace
rm(list=ls()))

## Set working directory
setwd("/Users/AValdez/Desktop/Data Science Specialization - Coursera/Getting and Cleaning Data")

## Load necessary libraries
library(plyr);
library(dplyr);

## Objective 1.- Merge the training and the test sets to create one data set.
## We need to perform a series of steps to both train and test sets to meet this objective.

## Step #1 - Read data from Train folder
## Importing X_train.txt file. We get a data.frame with dimensions of: 7352  561.
xTrain = read.table('./UCI HAR Dataset/train/X_train.txt', stringsAsFactors=FALSE); 
## Importing y_train.txt file. We get a data.frame with dimensions of: 7352  1.
yTrain = read.table('./UCI HAR Dataset/train/y_train.txt', stringsAsFactors=FALSE);
## Importing subject_train.txt. We get a data.frame with dimensions of: 7352  1.
subjectTrain = read.table('./UCI HAR Dataset/train/subject_train.txt', stringsAsFactors=FALSE);

## Step #2 - Read in the additional data from the UCI HAR Dataset folder
## Importing features.txt file. We get a data.frame with dimensions: 561  2.
features = read.table('./UCI HAR Dataset/features.txt', stringsAsFactors=FALSE);
## Importing activity_labels.txt file. We get a data.frame with dimensions: 6  2.
activityType = read.table('./UCI HAR Dataset/activity_labels.txt', stringsAsFactors=FALSE);

## Step #3 - Use the records on "features' as the column names on "xTrain"
names(xTrain) <- features$V2; ## We are using the second column (hence the $V2) of "features", to name all columns in "xTrain".

## Step #4 - Use the "activityType" as activity labels for "yTrain"
## We are matching the labels ids on "yTrain" to include the label descriptions on "activityType"
yTrain <- inner_join(yTrain, activityType, by = "V1");
## Next, we are changing the names of the columns from "V1" to "activityID" and from "V2" to "activitydesc"
yTrain <- rename(yTrain, activityID = V1, activitydesc = V2);
## Here we are selecting only the column with the activities description. We no longer need the "activityID".
yTrain <- select(yTrain, activitydesc);

## Step #5 - Renaming the column on "subjectTrain" from "V1" to "subjectID"
subjectTrain <- rename(subjectTrain, subjectID = V1);

## Step #6 - Now we combine the three files using cbind to have a complete set for Train data.
trainingData <- cbind(xTrain, subjectTrain, yTrain);
## We get a data.frame with dimensions of: 7352  563. 
## 2 more columns than original dataset(7352  561). 1 column to include the subjectID, 
## and the other one to include the activity description.

## Now we need to repeat Steps 1-6 for the Test data. 
xTest = read.table('./UCI HAR Dataset/test/X_test.txt', stringsAsFactors=FALSE); ## data.frame dimensions: 2947  561.
yTest = read.table('./UCI HAR Dataset/test/y_test.txt', stringsAsFactors=FALSE); ## data.frame dimensions: 2947  1.
subjectTest = read.table('./UCI HAR Dataset/test/subject_test.txt', stringsAsFactors=FALSE); ## data.frame dimensions: 2947  1.

## Use the records on "features' as the column names on "xTest"
names(xTest) <- features$V2; ## We are using the second column (hence the $V2) of "features", to name all columns in "xTest".

## We are matching the labels ids on "yTest" to include the label descriptions on "activityType"
yTest <- inner_join(yTest, activityType, by = "V1");
## Next, we are changing the names of the columns from "V1" to "activityID" and from "V2" to "activitydesc"
yTest <- rename(yTest, activityID = V1, activitydesc = V2);
## Here we are selecting only the column with the activities description. We no longer need the "activityID".
yTest <- select(yTest, activitydesc);

## Renaming the column on "subjectTest" from "V1" to "subjectID"
subjectTest <- rename(subjectTest, subjectID = V1);

## Now we combine the three files using cbind to have a complete set for Test data.
testData <- cbind(xTest, subjectTest, yTest); ## Make sure to keep the same order as "trainingData".
## We get a data.frame with dimensions of: 2947  563. 
## It is very important to have the same number of columns as "trainingData", so we can use rbind.

## At last for this objective, we need to combine the two data sets: "testData" and "trainingData".
## This is the answer to Course Project Objective #1.
objective1 = rbind(trainingData, testData); ## data set with 10,299 observations with 563 variables.


## Objective 2.- Extract only the measurements on the mean and standard deviation for each measurement

## First, we need to create a vector for the column names from "objective1".
columnNames = colnames(objective1); ## columnNames vector.

## Now, we need a logical vector that contains TRUE values for mean(), std(), "subjectID" and "activitydesc".
selectColumns = (grepl("-mean..", columnNames) & !grepl("-meanFreq..", columnNames) |
                        grepl("-std..", columnNames) | grepl("subject..", columnNames) | grepl("activity..", columnNames));

## Subset "objective1" based on the logical vector "selectColumns", to keep only desired columns.
## This is the answer to Course Project Objective #2.
objective2 = objective1[selectColumns==TRUE]; ## data set with 10,299 observations with 68 variables.

## Objective 3.- Use descriptive activity names to name the activities in the data set. DONE as part of Objective #1.
## "objective2" includes a column name "activitydesc" which represents the activity description in the data set. 
## This was DONE as part of Objective #1. See rows 53-59 for Train data set and rows 78-83 for Test data set.

## Objective 4.- Appropriately label the data set with descriptive activity names.

## First, we need to create a vector for the column names from "objective2".
columnNames2 = colnames(objective2); ## columnNames vector with the names of the 68 variables on "objective2".

## We are going to use a loop to clean up the variable names.
for (i in 1:length(columnNames2))
{
        columnNames2[i] = gsub("\\()", "", columnNames2[i])
        columnNames2[i] = gsub("-mean()", "Mean", columnNames2[i])
        columnNames2[i] = gsub("-std()", "StdDev", columnNames2[i])
        columnNames2[i] = gsub("^(t)", "time", columnNames2[i])
        columnNames2[i] = gsub("^(f)", "freq", columnNames2[i])
        columnNames2[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)", "Body", columnNames2[i])
        columnNames2[i] = gsub("AccMag", "AccMagnitude", columnNames2[i])
        columnNames2[i] = gsub("JerkMag", "JerkMagnitude", columnNames2[i])
        columnNames2[i] = gsub("GyroMag", "GyroMagnitude", columnNames2[i])
};

## Now we need to reassign the new column names to the final data set
colnames(objective2) = columnNames2;

## This new updated "objective2" is the answer to Course Project Objective #4.

## Objective 5.- Create a second, independent tidy data set with the average of each variable, for each activity, for each subject.

## We start with grouping by subject and activities the latest data file.
by_subject_activity <- group_by(objective2, subjectID, activitydesc);

## We use the function summarise_each from dplyr package.
## We pipe in the previously grouped file "by_subject_activity" to the summarise_each function
## and then we select to calculate the mean for all variables using "funs(mean)".
## finally, we assigned this new tidy data set to "objective5"
## This is the answer to Course Project Objective #5
objective5 <- by_subject_activity %>% summarise_each(funs(mean));














