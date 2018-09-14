## runAnalysis.R - Solution for Courseras Getting and cleaning data week 4 peer review assigment 
#
# The analysis consists of the following steps:
# 1 Merge the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names.
# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 
# Since the source data is 60MG this script assumes assumes the data set is already downloaded and unzipped into a subfolder of the working directory 
# (I.E. path to data is './UCI HAR Dataset').
#
# The original/input dataset for the analysis is: Human Activity Recognition Using Smartphones Dataset Version 1.0 (UCI HAR) 
# All credit goes to  to Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
#
# The following files are used in the  data analysis : 
# activity_labels.txt  -  used to map the activity codes (1-6) to meaningful descriptions of the acitivities (Walking, Standing etc)
# features.txt -  used to the column headings for the 561 columns of the Activity measurement data in X_train/X_test data sets
# subject_(test/train).txt - used to obtain the subject ids (1-30) of the people who performed the activities 
# X_(test/train).txt - various statistics related to the original gyro measurements 
# y_(test/train).txt - the activity labels for the each observation in X_(test/train) dataset (WALKING, STANDING 
#
# Please review the README.txt file in the original data set for more info on the source dataset
#
# prequel - uncomment this section to Download the sample Data  ------------------------------

# dataURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
# if (!file.exists('./sample_data/')) dir.create('./sample_data')
# download.file(dataURL, method = "curl", "./sample_data/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
# setwd('./sample_data')
# unzip('./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip')
 
### uncomment up to here ------------------------------


require(dplyr)

# read the activity descriptions in as strings not factors and use it to generate the factor levels in col activity code and labels in activity column

activityMapTable <- tbl_df(read.table("./UCI HAR Dataset/activity_labels.txt", sep = ' ', stringsAsFactors = F))
names (activityMapTable) <- c("ActivityCode","Activity")


# read the featurs file which contains list of the variable names and which columns they appear in.
# grep for mean and std to return only the columns which represent  mean and std deviation
# then parse and enrich the variable names 

featureCols <- tbl_df(read.table("./UCI HAR Dataset/features.txt", sep = ' ', stringsAsFactors = F))
names(featureCols) <- c('colindex','variablename')

# search through the colum names for the mean and std deviations
# the pattern is looking for columns that end in 'mean()' 'std()' or mean()-XYZ or std()-X/Y/Z

keepCols <- featureCols[grepl('-(mean|std)[()-]*[XYZ]*$',featureCols$variablename,ignore.case = T),]

# The above addresses requirement #2  Keep only columns with measurements relating to mean and standard deviation

# parse variable names to remove () and add meaningful info 

newnames <- gsub('\\(\\)','',keepCols$variablename)
newnames <- gsub('Acc','Acceleration',newnames)
newnames <- gsub('^t','Time-',newnames)
newnames <- gsub('^f','Frequency-',newnames)
newnames <- gsub('Mag','Magnitude',newnames)
newnames <- gsub('Gyro','Gyroscope',newnames)
newnames <- gsub('mean','Mean',newnames)
newnames <- gsub('std','StdDev',newnames)

keepCols$variablename <- newnames

# The above should address requirement #3  Keep only columns with measurements relating to mean and standard deviation


## Read in subject files

# read in the subject_test file that details the individial performing the activity
testSubjects <- tbl_df(read.table("./UCI HAR Dataset/test/subject_test.txt"))
names(testSubjects) <- 'SubjectID'

# read in the subject_train file that details the individial performing the activity

trainSubjects <- tbl_df(read.table("./UCI HAR Dataset/train/subject_train.txt"))
names(trainSubjects) <- 'SubjectID'


## Read in the activity label files 

testActivityLabels <- tbl_df(read.table("./UCI HAR Dataset/test/y_test.txt"))
names(testActivityLabels) <- 'ActivityID'

trainActivityLabels <- tbl_df(read.table("./UCI HAR Dataset/train/y_train.txt"))
names(trainActivityLabels) <- 'ActivityID'


# create a factor column of meaningful activity descriptions instead of number 1-5 using activityMapTable as the key  

testActivityLabels <- testActivityLabels %>% 
                        mutate(ActivityDescription = factor(testActivityLabels$ActivityID, labels = activityMapTable$Activity)) %>%
                            select(ActivityDescription)


trainActivityLabels <- trainActivityLabels %>% 
                        mutate(ActivityDescription = factor(trainActivityLabels$ActivityID, labels = activityMapTable$Activity)) %>%
                            select(ActivityDescription)


##  by replacing activity id 1-5 with a description we have now addressed requirement # 3 Use descriptive activity names to name the activities in the data set

testActivityData <- tbl_df(read.table("./UCI HAR Dataset/test/X_test.txt"))

trainActivityData <- tbl_df(read.table("./UCI HAR Dataset/train/X_train.txt"))


# keep only the columns which represent mean and std deviation measurements  

relevantTestActivityData <- testActivityData[,keepCols$colindex]
names(relevantTestActivityData) <- keepCols$variablename

relevantTrainActivityData <- trainActivityData[,keepCols$colindex]
names(relevantTrainActivityData) <- keepCols$variablename

# Form a complete data set from test and train components

completeTest <- tbl_df(cbind(testSubjects,testActivityLabels, relevantTestActivityData))

completeTrain <- tbl_df(cbind(trainSubjects,trainActivityLabels, relevantTrainActivityData))

# Merge the tidy training and test data sets --- #1 

completeData <- rbind(completeTrain,completeTest)


## 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# group by activity description and summarize mean of all value columns

byActivitySubject <- group_by(completeData, ActivityDescription, SubjectID)

meanByActivitySubject <- summarise_at(byActivitySubject, 3:68, funs(mean))

# Write output files from the 2 summary tables
write.table(meanByActivitySubject, 'MeanByActivityAndSubject.txt', row.names = FALSE)

