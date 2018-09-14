# Getting-and-Cleaning-Data-Course-Project

## Introduction

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. (Human Activity Recognition Using Smartphones Dataset Version 1.0)

This Repo includes:

* An R script (runAnalysis.R) that cleans the data set and produces a tidy ouput file.
* A codebook (Codebook.md) which describes the contents, structure, and layout of the output file.

## The Data  

The original/input dataset for the analysis is: Human Activity Recognition Using Smartphones Dataset Version 1.0 (UCI HAR) 

For more information about the dataset refer to the source 
<a href='http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones'>here</a>

The dataset can be downloaded <a href='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'>here</a> or you can uncomment the relevant section in the script and it will download it for you. 

Please review the  README.txt file in the original data set for more info.

Only following files from the datasset are used in this  analysis : 
* activity_labels.txt  -  used to map the activity codes to meaningful descriptions of the acitivities 
* features.txt -  contains the headings for the 561 columns of the Activity measurement data in X_train/X_test data sets
* subject_(test/train).txt - used to obtain the subject id (1-30) of the person who performed each activity 
* X_(test/train).txt - various statistics related to the original gyro measurements 
* y_(test/train).txt - the activity labels for the each observation in X_(test/train) dataset (WALKING, STANDING 


## The Analysis 

The analysis consists of the following steps:
* 1 The training and the test sets are merged  to create one data set.
* 2 The measurements on the mean and standard deviation for each measurement are extracted.
* 3 Descriptive activity names are added to the activities in the data set
* 4 The data is relabelled with  descriptive variable names.
* 5 From the data set in step 4, a second, independent tidy data set is created with the average of each variable for each activity and subject.


## The Script 
**runAnalysis.R**
 
requires: dplyr
 
Since the source data is 60MB this script assumes the data set is already downloaded and unzipped into a subfolder of the working directory (I.E. path to data is './UCI HAR Dataset').

The script reads the following input files into data tables 
* activity_labels.txt  is used to create a mapping table to translate the activity codes in y_test/train  to meaningful descriptions of the activities 
* features.txt is used to determine which of the 561 columns of the X_train/X_test dataset represent a mean or standard deviation and should be retained for the rest of the analysis
* subject_(test/train).txt are read into a data table then joined together (rbind to form a complete data set)  
* X_(test/train).txt are read into data tables and joined together (rbind to form a complete data set)
* y_(test/train).txt are read into data tables and joined together (rbind to form a complete data set)

These three are then joined (cbind) to create the full dataset which includes subject id, activity label and the 66 variables/columns which represent mean and standard deviation measurements.

This dataset is then grouped by Activity to find the average value of each variable for a given activity and by Subject  o find the average value of each variable for a given subject.

Finally the output file is created in the working directory. MeanByActivityAndSubject.txt

