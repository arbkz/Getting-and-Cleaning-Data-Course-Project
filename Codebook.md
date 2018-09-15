# Codebook for Coursera Getting and Cleaning Data Assignment

## The Dataset 

The data set consists of 1 table:

* MeanByActivityAndSubject.txt (180 x 68)

This is derived from the Human Activity Recognition Using Smartphones Dataset Version 1.0 (UCI HAR).

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The original dataset was divided in two parts.

1. Inertial sensor data 
2. Records of activity windows. 

This dataset is obtained from the second part (only the activity labels, subject information and mean and standard deviation features were used) using the steps described in the README

Credit goes to Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Links to the original dataset can be found in the README

## The Data

 Each row is composed of: 
 
- An activity label. 
- An identifier of the subject who carried out the experiment.
- A 66-feature vector representing the averages of the 66 mean and standard deviation measurements for a given Activity and Test Subject

The Columns are described below: 


* __ActivityDescription__:  Description of the Activity  
    + Type: Factor 
    + Values: 
                WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  



* __SubjectID__:            ID of the test subject performing the various activities
    + Type: Integer 
    + Values: 1-30


The next 66 columns represent the Average of each feature for a given Activity and Subject. 

The prefix of Time implies a time domain variable 
The prefix of Frequency implies a frequency domain variable 

Where the variable has a suffix of (-X/-Y/-Z) it is short hand for 3 distinct measurements for the X,Y and Z axis

The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2). 

The gyroscope units are rad/seg. 

The values are normalized and bounded within [-1,1].

<b>Time Domain Variables</b>

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
* Time-BodyGyroscopeJerkMagnitude-StdDev

    + Type: Numeric 
    + Values:  Normalised and bounded within [-1,1]

<b>Frequency Domain Variables</b>
    
* Frequency-BodyAcceleration-Mean(-X/-Y/-Z)
* Frequency-BodyAcceleration-StdDev(-X/-Y/-Z)
* Frequency-BodyAccelerationJerk-Mean(-X/-Y/-Z)
* Frequency-BodyAccelerationJerk-StdDev(-X/-Y/-Z)
* Frequency-BodyGyroscope-Mean(-X/-Y/-Z)
* Frequency-BodyGyroscope-StdDev(-X/-Y/-Z)
* Frequency-BodyAccelerationMagnitude-Mean
* Frequency-BodyAccelerationMagnitude-StdDev
* Frequency-BodyAccelerationJerkMagnitude-Mean
* Frequency-BodyAccelerationJerkMagnitude-StdDev
* Frequency-BodyGyroscopeMagnitude-Mean
* Frequency-BodyGyroscopeMagnitude-StdDev
* Frequency-BodyGyroscopeJerkMagnitude-Mean
* Frequency-BodyGyroscopeJerkMagnitude-StdDev

    + Type: Numeric 
    + Values:  Normalised and bounded within [-1,1]



