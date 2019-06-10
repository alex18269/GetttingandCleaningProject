---
title: "Codebook"
author: "Alejandro Ortega"
date: "9/6/2019"
output: html_document
The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

Download the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset

Assign each data to variables
dataFeatures_mean_std <- features.txt : 561 rows, 2 columns 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
dataActivity <- activity_labels.txt : 6 rows, 2 columns 
List of activities performed when the corresponding measurements were taken and its codes (labels)
dataSubjectTest <- test/subject_test.txt : 2947 rows, 1 column 
contains test data of 9/30 volunteer test subjects being observed
dataFeaturesTest <- test/X_test.txt : 2947 rows, 561 columns 
contains recorded features test data
dataActivityTest <- test/y_test.txt : 2947 rows, 1 columns 
contains test data of activities’code labels
dataSubjectTrain <- test/subject_train.txt : 7352 rows, 1 column 
contains train data of 21/30 volunteer subjects being observed
dataFeaturesTrain <- train/X_train.txt : 7352 rows, 561 columns 
contains recorded features train data
dataActivityTrain <- train/y_train.txt : 7352 rows, 1 columns 
contains train data of activities’code labels

Merges the training and the test sets to create one data set
dataFeatures (10299 rows, 561 columns) is created by merging dataFeaturesTrain and dataFeaturesTest using rbind() function
dataActivity (10299 rows, 1 column) is created by merging dataActivityTrain and dataActivityTest using rbind() function
dataSubject (10299 rows, 1 column) is created by merging dataSubjectTrain and dataSubjectTest using rbind() function
combinedataset (10299 rows, 563 column) is created by merging dataFeatures, dataActivity and dataSubject using cbind() function

Extracts only the measurements on the mean and standard deviation for each measurement
TidyData (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

Uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the  activities variable

Appropriately labels the data set with descriptive variable names
code column in TidyData renamed into activities
All Acc in column’s name replaced by Acceleration
All Gyro in column’s name replaced by Angular Speed
All Mag in column’s name replaced by Magnitude
All GyroJerk in column’s name replaced by Angular Acceleration
All \\.mean in column’s name replaced by .Mean
All \\.std in column’s name replaced by .StandardDeviation
All Freq\\. in column’s name replaced by Frequency
All Freq$ in column’s name replaced by Frequency
All start with character f in column’s name replaced by FrequencyDomain
All start with character t in column’s name replaced by TimeDomain

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
FinalData (180 rows, 88 columns) is created by sumarizing TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.
Export FinalData into Tidydata.txt file.
