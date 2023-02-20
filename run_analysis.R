## Loading the necessary labraries

library(dplyr)
library(stringr)

## Downloading the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## We will create a directory to put file zipped by using following sequences:
## A condition to create the data folder

if(!file.exists("./data")) {dir.create("./data")}

## Setting the url and downloading the raw data.

urlfile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urlfile, destfile = "./data/RawData.zip", "curl")

## To unzip the file raw data into ./data folder
unzip(zipfile = "./data/RawData.zip", exdir = "./data")

########################
## 1 - Merges the training and the test sets to create one data set.
#
## We use the same names of the UCI HAR Dataset txt files. In the folder has two
## types: train and test that is subsetting in X & y. We will create a table each one.

## First, reading the files that are vectors used by train, test and subject txt files
features <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

## Extracting the train txt files and assigning the column names

X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions )
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "code")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

## The test files

X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

## Merging the train and test dataset

mergeTrain <- cbind(X_train, subject_train, y_train)
mergeTest <- cbind(X_test, subject_test, y_test)
rawData <- rbind(mergeTrain, mergeTest)

###################
## 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
colNames <- colnames(rawData)

mean_std_set <-(grepl("code", colNames) | grepl("subject", colNames) |
                        grepl("mean..", colNames) | grepl("std..", colNames))

mean_std_result <- rawData[, mean_std_set == T]
mean_std_result

###################
## 3 - Uses descriptive activity names to name the activities in the data set

descriptive_activity <- merge(mean_std_result, activity_labels, by = "code", all.x = T)
descriptive_activity

###################
## 4 - Appropriately labels the data set with descriptive variable names. 

X <- rbind(X_train, X_test)
Y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
MergeDT <- cbind(subject, X, Y)

tidyData <- MergeDT%>% select(subject, code, contains("mean"), contains("std"))

descriptive_variable <- merge(tidyData, activity_labels, by = "code", all.x = T)

descriptive_variable

##################
## 5 - From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
#

## Creating second dataset - independent tidy with average.

rawData2 <- aggregate(. ~subject + activity, descriptive_variable, mean)
rawData2 <- rawData2[order(rawData2$subject, rawData2$activity),]

write.table(rawData2, "Dataset2.txt", row.names = F)



###############################################################################
# All credits and recognitions for this assignment belong to: 
# https://rpubs.com/ninjazzle/DS-JHU-3-4-Final; 
# https://github.com/jcombari/Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R
# AND https://rstudio-pubs-static.s3.amazonaws.com/37290_8e5a126a3a044b95881ae8df530da583.html
# I just modified and tested code from one and the other using the same database 
# and the results were the same. I thank everyone for sharing their ideas, 
# as it would have been almost impossible for me to have an understanding 
# of what the exercise required. Thank you and may God bless you all.
