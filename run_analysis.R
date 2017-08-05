## Create R-script "run_analysis.R" ##

## PREVIOUS STEPS: install & Load needed packages .
if (!"data.table" %in% installed.packages()) {
	install.packages("data.table")
}
if (!"reshape2" %in% installed.packages()) {
	install.packages("reshape2")
}

library("data.table")
library("reshape2")

## PREVIOUS STEPS: Download data from URL
urlZipFile <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dirZipFile <- "UCI HAR Dataset"
zipFileName <- "UCIdata.zip"

if(!file.exists(zipFileName)){
  download.file(urlZipFile,zipFileName, mode = "wb") 
}

if(!file.exists(dirZipFile)){
  unzip(zipFileName, files = NULL, exdir=".")
}


## ANALISIS-STEPS:	0.Read data and labels for train and test
# labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE)
features <- read.table("UCI HAR Dataset/features.txt",header=FALSE)  
#data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE)
X_train <- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)

# add column name 
colnames(activity_labels)<-c("activityId","activityType")
colnames(subject_train) <- "subjectID"
colnames(subject_test) <- "subjectID"
 
colnames(X_train) <- features$V2
colnames(X_test) <- features$V2
colnames(y_train) <- "activityId"
colnames(y_test) <- "activityId"


## ANALISIS-STEPS:	1.Merges the training and the test sets to create one data set.
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
dataSetCombined <- rbind(train, test)


## ANALISIS-STEPS:	2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#I include de subjectID  and activityId columns
meanstdcols <- grepl("subjectID|activityId|mean\\(\\)|std\\(\\)", colnames(dataSetCombined))
dataSetCombined <- dataSetCombined[, meanstdcols]


## ANALISIS-STEPS:	3.Uses descriptive activity names to name the activities
## already in the data set.

## ANALISIS-STEPS:	4.Appropriately labels the data set with descriptive
dataSetCombined$activityId <- factor(dataSetCombined$activityId, labels=activity_labels$activityType)

## ANALISIS-STEPS:	5.Creates a second, independent tidy data set with the
meltedData <- melt(dataSetCombined, id.vars=c("subjectID","activityId"))
secondDataSet <- dcast(meltedData, subjectID+activityId ~ variable, mean,na.rm = TRUE)

# write the tidy data set to a file
write.table(secondDataSet, "tidy.txt", row.names=FALSE)
