# Codebook 

## Data Set

Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Data Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Analysis

The script run_analysis.R merges and cleans up data and produces requested tidy data sets.

(1) Download, read, and merge test and train data tables provided in UCI HAR Dataset
(2) Read features.txt to provide variable names and bind to merged data set
(3) Extract measurements on mean and standard deviation for each measurement in merged data set using grep()
(4) Read activity_labels.txt to provide descriptive activity names for subset of merged data set
(5) Appropriately label this data set with descriptive variable names, removing hyphens and parantheses and replacing abbreviations with full terms. 
(6) Use aggregate to create a tidy data set of the average of each measurement by subject and by activity. The result is saved as a text file: tidy.data.txt. 

## Variables

fileUrl - the url where the UCI HAR Dataset is stored online
path - a shortcut to the UCI HAR Dataset's location in the working directory
data.train.features - data table of X_train.txt
data.train.activity - data table of y_train.txt
data.train.subject - data table of subject_train.txt
data.test.features - data table of X_test.txt
data.test.activity - data table of y_test.txt
data.test.subject - data table of subject_test.txt
data.features - merged data.train.features and data.test.features
data.activity - merged data.train.activity and data.test.activity
data.subject - merged data.train.subject and data.test.subject
features.names - data table of features.txt contents
merged.data - merged data.features, data.subject, and data.activity after names(data.features) has been replaced by features.names$V2
mean_std.features.names - features.names$V2 entries that include "mean\\(\\)" or "std\\(\\)"
subset.features.names - vector of mean_std.features.names,"subject", and "activity"
data.subset - subset of merged data using subset.features.names vector
activity.labels - data table of activity_labels.txt
tidy.data - data table created by aggregating data.subset and returning the mean, ordered by $activity then $subject

## Returned Output

tidy.data.txt - 180 (observations) x 68 (variables) data frame
1st column - subject id (1-30)(integer)
2nd column - type of activity (labeled according to activity_labels.txt)(character)
3-68 columns - measurements (numeric)

