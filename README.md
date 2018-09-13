# Getting-and-Cleaning-Data-Course-Project

## Introduction

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. (Human Activity Recognition Using Smartphones Dataset Version 1.0)

This Repo includes:

* An R script (runAnalysis.R) that cleans the data set and produces 2 tidy text files.
* A codebook (Codebook.md) which describes the contents, structure, and layout of the 2 output files.

## The Data  

The original/input dataset for the analysis is: Human Activity Recognition Using Smartphones Dataset Version 1.0 (UCI HAR) 

For more information about the dataset refer to the source here <a href='http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones'>

Please review the original README.txt file in the original data set for more info 


The following files from the datasset are used in this data analysis : 
 activity_labels.txt  -  used to map the activity codes (1-6) to meaningful descriptions of the acitivities (Walking, Standing etc)
 features.txt -  used to the column headings for the 561 columns of the Activity measurement data in X_train/X_test data sets
 subject_(test/train).txt - used to obtain the subject ids (1-30) of the people who performed the activities 
 X_(test/train).txt - various statistics related to the original gyro measurements 
 y_(test/train).txt - the activity labels for the each observation in X_(test/train) dataset (WALKING, STANDING 


## The Analysis Steps

The analysis S consists of the following steps:
* 1 The training and the test sets are merged  to create one data set.
* 2 The measurements on the mean and standard deviation for each measurement are extracted.
* 3 Descriptive activity names are added to the activities in the data set
* 4 The data is relabelled with  descriptive variable names.
* 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

These are described in more detail below.

## The Script 
 runAnalysis.R
 
 requires: dplyr
 
 Since the source data is 60MB this script assumes the data set is already downloaded and unzipped into the working directory.
 It can be downloaded here : <a href='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'>
 or you can uncomment the section in the script which will do it for you. 

 
