# Getting and Cleaning Data

## Getting and Cleaning Data Course Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project

1. Put ```run_analysis.R``` in a folder.
2. When you run ```run_analysis.R``` this script will download the "UCI HAR Dataset" zip file and then decompress this file and create de "UCI HAR Dataset" directory
3. Finally ```run_analysis.R``` created a ```tiny_data.csv``` in your working directory.

## Dependencies

```run_analysis.R```depends on ```reshape2``` and ```data.table```. but It will  install the dependencies automatically.
