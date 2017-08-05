# CodeBook

This code book  describes the variables, the data, and any transformations or work that I performed to clean up the data.

## PREVIOUS STEPS: install & Load needed packages .

*  the script install(if it is necessary) the needed packages "data.table" "reshape2"
*  the script download(if it is necessary) the dataset "UCI HAR Dataset"
 
## Describes the data
* "UCI HAR Dataset/activity_labels.txt": Description of activity IDs in y_test and y_train
* "UCI HAR Dataset/features.txt": Label of each variables in X_(test|train)
* "UCI HAR Dataset/subject_test.txt": Subject IDs for test
* "UCI HAR Dataset/subject_train.txt": Subject IDs for train
* "UCI HAR Dataset/X_test.txt": Variables in test
* "UCI HAR Dataset/X_train.txt": Variables in train
* "UCI HAR Dataset/y_test.txt": Activity ID in test
* "UCI HAR Dataset/y_train.txt": Activity ID in train


## Describes the variables

*  Variables use for labels
	* The variable "activity_labels" is used to store the data "UCI HAR Dataset/activity_labels.txt"
	* The Variable "features" store  is used to the data "UCI HAR Dataset/features.txt"  
*  Variables use for data
	* The variable "subject_train" is used to store the data "UCI HAR Dataset/train/subject_train.txt"
	* The variable "subject_test" is used to store the data "UCI HAR Dataset/test/subject_test.txt" 
	* The variable "X_test" is used to store the data "UCI HAR Dataset/test/X_test.txt" 
	* The variable "X_train" is used to store the data "UCI HAR Dataset/train/X_train.txt" 
	* The variable "y_test" is used to store the data "UCI HAR Dataset/test/y_test.txt" 
	* The variable "y_train" is used to store the data "UCI HAR Dataset/train/y_train.txt" 

## Transformation details

There are 5 parts:
1. Merges the training and the test sets to create one data set.
	* I Used "cbind" and "rbind" to performed the task
2. Extracts only the measurements on the mean and standard deviation for each measurement.
	* I Used "grepl" to performed the task
3. Uses descriptive activity names to name the activities in the data set
	* I used ordinary "colnames" functions to give names
4. Appropriately labels the data set with descriptive activity names.
	* I Used "factor" to performed the task
5. Creates a second, independent tidy data set with the average of each
	* I used "melt" and "dcast" to performed the task

 

