path_1 <- file.path("/Users/alex18269/Downloads", "UCI HAR Dataset")
files <- list.files(path_1, recursive = TRUE)
files
dataActivityTest <- read.table(file.path(path_1, "test", "Y_test.txt") , header = FALSE)
dataActivityTrain <- read.table(file.path(path_1, "train", "Y_train.txt") , header = FALSE)
dataSubjectTrain <- read.table(file.path(path_1, "train", "subject_train.txt") , header = FALSE)
dataSubjectTest <- read.table(file.path(path_1, "test", "subject_test.txt") , header = FALSE)
dataFeaturesTest <- read.table(file.path(path_1, "test", "x_test.txt") , header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_1, "train", "x_train.txt") , header = FALSE)
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataSubjectTrain, dataSubjectTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)
dataFeatures_mean_std <- dataFeatures[, grep("-(mean|std)\\(\\)", read.table(features.txt)[,2])]
dataFeatures_mean_std <- dataFeatures[, grep("-(mean|std)\\(\\)",read.table(file.path(path_1, "features.txt"))[,2])]
names(dataFeatures_mean_std) <- read.table(file.path(path_1, "features.txt"))[grep("-(mean|std)\\(\\)",read.table(file.path(path_1, "features.txt"))[,2]),2]
View(dataFeatures_mean_std)
#question3 
dataActivity[,1] <- read.table(file.path(path_1, "activity_labels.txt"))[dataActivity[,1],2]
names(dataActivity) <- "Activity"
View(dataActivity)
#question4
 names(dataSubject) <- "Subject"
 summary(dataSubject)
#question5
combinedataset <- cbind(dataFeatures_mean_std, dataActivity, dataSubject)
names(combinedataset) <- make.names(names(combinedataset))
names(combinedataset) <- gsub('Acc', "Acceleration", names(combinedataset))
names(combinedataset) <- gsub('GyroJerk', "Angular Acceleration", names(combinedataset))
names(combinedataset) <- gsub('GyroJerk', "AngularAcceleration", names(combinedataset))
names(combinedataset) <- gsub('Gyro', "AngularSpeed", names(combinedataset))
names(combinedataset) <- gsub('Mag', "Magnitude", names(combinedataset))
names(combinedataset) <- gsub('^t', "TimeDomain.", names(combinedataset))
names(combinedataset) <- gsub('^f', "FrequencyDomain.", names(combinedataset))
names(combinedataset) <- gsub('\\.mean', ".Mean", names(combinedataset))
names(combinedataset) <- gsub('\\.std', ".StandardDeviation", names(combinedataset))
names(combinedataset) <- gsub('Freq\\.', "Frequency.", names(combinedataset))
names(combinedataset) <- gsub('Freq$', "Frequency", names(combinedataset))
View(combinedataset)
names(combinedataset)
Data2<- aggregate(. ~Subject + Activity, combinedataset, mean)
Data2<- Data2[order(Data2$Subject,Data2$Activity),]
write.table(Data2, file = "tidydata.txt", row.names = FALSE)
