##Download data for analysis

library(data.table)
library(plyr)
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./projectdata")){dircreate("./projectdata")}
    download.file(fileUrl,"./UCI HAR Dataset.zip", mode = "wb")
    unzip(zipfile = "UCI HAR Dataset.zip", exdir = "./projectdata")

##Read and convert data
path <- file.path("./projectdata", "UCI HAR Dataset")

data.train.features <- read.table(file.path(path, "train", "X_train.txt"), header = FALSE)
data.train.activity <- read.table(file.path(path, "train", "y_train.txt"), header = FALSE)
data.train.subject <- read.table(file.path(path, "train", "subject_train.txt"), header = FALSE)

data.test.features <- read.table(file.path(path,"test", "X_test.txt"), header = FALSE)
data.test.activity <- read.table(file.path(path, "test", "y_test.txt"), header = FALSE)
data.test.subject <- read.table(file.path(path, "test", "subject_test.txt"), header = FALSE)

##Merges training and testing sets into one data set called merged.data

data.features <- rbind(data.train.features, data.test.features)
data.activity <- rbind(data.train.activity, data.test.activity)
data.subject <- rbind(data.train.subject, data.test.subject)

features.names <- read.table(file.path(path, "features.txt"), header = FALSE)
names(data.features) <- features.names$V2
names(data.activity) <- c("activity")
names(data.subject) <- c("subject")

merged.data <- cbind(data.features, data.subject, data.activity)

## Extracts only measurements on the mean and standard deviation for each measurement
mean_std.features.names <- features.names$V2[grep("mean\\(\\)|std\\(\\)", features.names$V2)]
subset.features.names <- c(as.character(mean_std.features.names), "subject", "activity")
data.subset <- subset(merged.data, select = subset.features.names)

## Use descriptive activity names to name the activities in the data set
## Refer to activity_labels.txt file

activity.labels <- read.table(file.path(path, "activity_labels.txt"), header = FALSE)
activity.labels <- as.character(activity.labels[,2])
data.subset$activity <- activity.labels[data.subset$activity]

## Appropriately labels the data set with descriptive variable names

names(data.subset) <- gsub("^t", "Time", names(data.subset))
names(data.subset) <- gsub("^f", "Frequency", names(data.subset))
names(data.subset) <- gsub("Acc", "Accelerometer", names(data.subset))
names(data.subset) <- gsub("Gyro", "Gyroscope", names(data.subset))
names(data.subset) <- gsub("Mag", "Magnitude", names(data.subset))
names(data.subset) <- gsub("BodyBody", "Body", names(data.subset))
names(data.subset) <- gsub("-mean", "Mean", names(data.subset))
names(data.subset) <- gsub("-std", "Std", names(data.subset))
names(data.subset) <- gsub("[-()]", "", names(data.subset))

## From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.

tidy.data <- aggregate(. ~subject + activity, data.subset, mean)
tidy.data <- tidy.data[order(tidy.data$subject, tidy.data$activity),]
write.table(tidy.data, file = "tidy_data.txt", row.name = FALSE)


