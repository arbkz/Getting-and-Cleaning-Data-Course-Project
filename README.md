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

The original dataset was divided in two parts.

1. Inertial sensor data 
2. Records of activity windows. 

This analysis uses only the second data set and only the activity labels, subject information and mean and standard deviation features are used in dataset analysis. 

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

The script reads the following input files 

The following files are used in this  analysis : 
* activity_labels.txt  -  used to map the activity codes to meaningful descriptions of the acitivities 
* features.txt -  contains the headings for the 561 columns of the Activity measurement data in X_train/X_test data sets
* subject_(test/train).txt - used to obtain the subject id (1-30) of the person who performed each activity 
* X_(test/train).txt - various statistics related to the original gyro measurements 
* y_(test/train).txt - the activity labels for the each observation in X_(test/train) dataset (WALKING, STANDING 

The Script does the following:

**Pre-Processing Meta Data**

* activity_labels.txt is used to create a mapping table to translate the activity codes in y_test/train to meaningful descriptions of the activities 
* features.txt is processed to determine which of the 561 columns of the X_train/X_test dataset represent a mean or standard deviation feature. This produces a vector of column numbers that is used to filter X_(test/train)

**Merge/Join Measurement Data**

* subject_(test/train).txt are read into data tables 
* X_(test/train).txt are read into data tables and then filtered to retain only the columns representing a mean or standard deviation
* y_(test/train).txt are read into data tables and transformed to replace a numeric ID with a meaningful activity labels  

Each of the 3 data files that represent test/train data are enriched/transformed and then joined (cbind) to create a complete test/train dataset which includes subject id, activity description and the 66 variables/columns which represent mean and standard deviation measurements.

The train and test datasets are then merged to form one complete dataset.

This dataset is then grouped by Activity Description and SubjectID and this grouped dataset is then summarised to ive the average value of each variable for a given activity and by Subject.

Finally the output file <i>MeanByActivityAndSubject.txt</i> is written to the working directory 

