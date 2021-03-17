##Use this to load in the required packages to run code below
library(dplyr)

##Next is to download the dataset that this code runs
filename <- "Coursera_DS3_Final.zip"

## This sees if the archieve already exists
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

## This checks to see if the folder exists
if (!file.exists("UCI_Dataset")) { 
  unzip(filename) 
}

##The code below is to assign all the different data frames
features <- read.table("UCI_Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI_Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI_Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI_Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI_Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI_Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI_Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI_Dataset/train/y_train.txt", col.names = "code")

##Combines the training and test sets to make one data set.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

##Extracts only stdev and mean for each measurement
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

##Names the activities in the data.
TidyData$code <- activities[TidyData$code, 2]

##Labels data set with variable names.
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

##Creates independent tidy data.
FinalData <- TidyData %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)

##The variable names are checked
str(FinalData)

##Then pull up the "compressed"/"trimmed" data
FinalData
