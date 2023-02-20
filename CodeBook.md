# Codebook 
The R script called run_analysis.R contains the following information:
- The original file was downloaded from the link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- The file is zipped and contains a folder called "./data" and inside there is a subfolder named UCI HAR Dataset.
The files in .txt format. In the task we will use the files:
  * features.txt
  * activity_labels.txt
  - in the "test" folder
  * X_test.txt
  * y_test.txt
  - in the "train" folder
  * X_train.txt
  * y_train.txt

The other txt.files contain information about the data, its source and another details that we do not apply in this work.

The composition of the files and the variables created and used for this assigment are as follows:

1 - features - file with 562 obs and 2 variables. Contains the following information>
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

2 - Activity_labels.txt. File with 6 obs and 2 variable. 

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

3 - The X_train, X_test, subject_train, subject_test, they are the files extracted from the original txt files to be later merged.
4 - rawData - Main file. Result of the merge between files "mergeTrain" and "mergeTest".
5 - MergeTrain contais the X_train, subject_train and y_train, by using cbind function to merge it.
6 - MergeTest files contain the X_test, subject_test and y_test follow the same cbind function
7 - colNames has the function of assigning the names to the rawData dataset.
8 - mean_std_set - responsible for assigning names and adding the columns code, subject, filtered by the words "mean.." and "std.."
9 - mean_std_result - Application of file 8 over file 4.
10 - descriptive_activity - "Used descriptive activity names to name the activities in the data set"
11 - X, Y and subject carry out the same procedures described in step 3.
12 - MergeDT carry out the same procedures described in steps 5 and 6.
13 - tidyData is data filtered by the code and subject where contains the "mean" and "std" worlds within dataset.
14 - descriptive_variable the result the tidyData merging with file step 2.
15 - rawData2 - The new data from step prior.

########
# All credits and recognitions for this assignment belong to: 
# https://rpubs.com/ninjazzle/DS-JHU-3-4-Final; 
# https://github.com/jcombari/Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R
# AND https://rstudio-pubs-static.s3.amazonaws.com/37290_8e5a126a3a044b95881ae8df530da583.html
# I just modified and tested code from one and the other using the same database 
# and the results were the same. I thank everyone for sharing their ideas, 
# as it would have been almost impossible for me to have an understanding 
# of what the exercise required. Thank you and may God bless you all.
 

