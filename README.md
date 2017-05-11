# Getting-and-Cleaning-Data-Course-Project

## Introduction
This repository contains (1) CodeBook.md describing the variables, the data, and transformations performed to clean up the data; (2) analysis.R, the project's analysis script; and (3) the tidy.data.txt data returning the result of the analysis with the average of each variable for each activity and each subject.  

## Project Instructions:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data Source Information
Human Activity Recognition Using Smartphones Dataset includes data collected from embedded accelerometers in Samsung Galaxy S II smartphones. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Analysis Script Description

Downloading Data and Preparing for Analysis:
(0) Create a directory to download unzipped data set. Install and/or load packages "plyr" and "data.table".
(1) Download data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and put it into a folder in the the chosen directory. The data set folder should be labeled "UCI HAR Dataset" and include the relevant files (features.txt, X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt, and activity_labels.txt). 

Merging the training and the test sets to create one data set:  
(2) Read all necessary data sets
(3) Merge train data sets (X_train.txt, y_train.txt, and subject_train.txt) 
(4) Merge test data sets (X_test.txt, y_test.txt, subject_test.txt)
(5) Add variable names to the 2 new data sets using features.txt
(6) Combine the train data table with the test data table, using rbind\
(7) Extract only the measurements on mean and standard deviation for each measurement into a subset database.

Label the data set with descriptive variable names:
(8) Refer to activity_labels.txt for descriptive variable names. Read table and merge with subset database by "activity" variable. To clean up the variable names, t is replaced by TimeDomain, f is replaced by FrequencyDomain, Acc is replaced by Accelerometer, Gyro is replaced by Gyroscope, Mag is replaced by Magnitude, -mean- is replaced by Mean, and -std- is replaced by StandardDeviation.

Create a second, tidy data set with the average of each variable for each activity and each subject:
(9) Utilizing aggregate() on data.subset for subject and activity, have the mean as the function returned. Use write.table to convert the returned to a text file.   
    
