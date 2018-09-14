# Codebook for Coursera Getting and Cleaning Data Assignment

## The Dataset 

The data set consists of 1 table:

* MeanByActivityAndSubject.txt (180 x 68)

This is  derived from the Human Activity Recognition Using Smartphones Dataset Version 1.0 (UCI HAR) using the steps described in the Readme.

## The Data

Each row represents the average of the 66 mean and standard deviation measurements from the original dataset for a given Activity and Test Subject

The Columns are described below: 


* __ActivityDescription__:  Description of the Activity  
    + Type: Factor 
    + Values: 
                WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  



* __SubjectID__:            ID of the test subject performing the various activities
    + Type: Integer 
    + Values: 1-30


The next 66 columns represent the Average of the measurements for a given Activity and Subject. 

Where the label has a suffix of (-X/-Y/-Z)  this represents 3 distinct variables which are  measurements for the X,Y and Z axis


* Time-BodyAcceleration-Mean(-X/-Y/-Z)
* Time-BodyAcceleration-StdDev(-X/-Y/-Z)
* Time-GravityAcceleration-Mean(-X/-Y/-Z)
* Time-GravityAcceleration-StdDev(-X/-Y/-Z)
* Time-BodyAccelerationJerk-Mean(-X/-Y/-Z)
* Time-BodyAccelerationJerk-StdDev(-X/-Y/-Z)
* Time-BodyGyroscope-Mean(-X/-Y/-Z)
* Time-BodyGyroscope-StdDev(-X/-Y/-Z)
* Time-BodyGyroscopeJerk-Mean(-X/-Y/-Z)
* Time-BodyGyroscopeJerk-StdDev(-X/-Y/-Z)
* Time-BodyAccelerationMagnitude-Mean
* Time-BodyAccelerationMagnitude-StdDev
* Time-GravityAccelerationMagnitude-Mean
* Time-GravityAccelerationMagnitude-StdDev
* Time-BodyAccelerationJerkMagnitude-Mean
* Time-BodyAccelerationJerkMagnitude-StdDev
* Time-BodyGyroscopeMagnitude-Mean
* Time-BodyGyroscopeMagnitude-StdDev
* Time-BodyGyroscopeJerkMagnitude-Mean
* Time-BodyGyroscopeJerkMagnitude-StdDev__
    
* Frequency-BodyAcceleration-Mean(-X/-Y/-Z)
* Frequency-BodyAcceleration-StdDev(-X/-Y/-Z)
* Frequency-BodyAccelerationJerk-Mean(-X/-Y/-Z)
* Frequency-BodyAccelerationJerk-StdDev(-X/-Y/-Z)
* Frequency-BodyGyroscope-Mean(-X/-Y/-Z)
* Frequency-BodyGyroscope-StdDev(-X/-Y/-Z)
* Frequency-BodyAccelerationMagnitude-Mean
* Frequency-BodyAccelerationMagnitude-StdDev
* Frequency-BodyBodyAccelerationJerkMagnitude-Mean
* Frequency-BodyBodyAccelerationJerkMagnitude-StdDev
* Frequency-BodyBodyGyroscopeMagnitude-Mean
* Frequency-BodyBodyGyroscopeMagnitude-StdDev
* Frequency-BodyBodyGyroscopeJerkMagnitude-Mean
* Frequency-BodyBodyGyroscopeJerkMagnitude-StdDev

    + Type: Numeric 
    + Values:  Normalised and bounded within [-1,1]



