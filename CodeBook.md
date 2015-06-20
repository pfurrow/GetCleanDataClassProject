## Project Description
Assemble, extract and aggregate select statistics from the "Human Activity Recognition Using Smartphones Dataset" [1]

##Study Design and Data Processing

###Collection of the raw data
The input files to this processing script are from a zip file "UCI HAR Dataset.zip" which is published on the following University of California Irving web page:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The README.TXT within the zip file explains how the data were collected and the features_info.txt file explains how the metrics contained in the raw files were generated.

NOTE:  The features.txt file contains 84 duplicate feature names.  The statistics associated with these duplicate names are not used in this analysis, but the duplicate names can be displayed after the script is run using this R command:  
```
HARlabels[duplicated(HARlabels[,2]),]  
```
The associated values in the measurement files for those duplicate labels are not identical, so if the R script is modified to extract different columns of statistics, the results may be unexpected.

##Creating the tidy data set
This document describes the logic used to generate a tidy data set containing the averages of selected measurements for each subject and activity in the study.

The following diagram illustrates how eight raw files are used to construct the wide, tidy data set.

![HAR File Diagram](HAR_file_diagram.png)

###Cleaning the data
Running the R script accomplishes these tasks:  
1. Merge the training and test files to create one data set  
2. Extract only the mean and standard deviation statistics  
3. Generate descriptive labels for the selected statistics based on the original feature names  
4. Add the identification variables "subject" and "activity" to the data set  
5. Calculate the average of each extracted measurement for each subject and activity  
6. Write the summary data set to the working directory as a text file  

[Refer to the README.md document for instructions on running the script to produce the summary data set.](https://github.com/pfurrow/GetCleanDataClassProject/blob/master/README.md)

##Description of Variables 
The "HAR Tidy Dataset of Means.txt" file contains:
* 180 rows of statistics for 30 subjects performing 6 activities each
* Each row contains 68 variables
   + 2 identification variables (factors)
   + 66 measurement variables (numeric)

###Identification Variables

Column Name | Levels | Description
------- |----|-----|------
subject | 1-30 | An integer identifying the subject who performed the activity
activity | 1-6 | A text descriptor of the activity the subject performed  
 | | Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS

###Measurement Variables
All 66 of the measurement variables are numeric averages of extracted mean and standard deviation metrics for each subject and activity.  The variable naming convention is consistent with the original feature labels of the data set except parentheses have been removed and hyphens are replaced with underscores to make legal column names.  The variable name is composed of several descriptive elements:

Signal Domain | Component | Sensor | Calculation | Statistic | 3-axial Signals  
------- | ----|----|-----|------|----
t = time | Body | Acc = accelerometer | Jerk = time derivation | mean = mean | X = x direction
f = frequency | Gravity | Gyro = gyroscope | Mag = magnitude | std = standard deviation |Y = y direction
  |   |   |   |  | Z = z direction

All measurement variables have one of two units of measure based on the sensor that generated the measurement:

Sensor | Unit of measure
-----------------|--------------
accelerometer ("Acc" in the variable name)| g's or meters per second squared (m/s<sup>2</sup>)
gyroscope ("Gyro" in the variable name) | radian per second (rad/s)

Here is a complete list of the averages of the 66 variables in the tidy data set:

     |      |      |
-----|------|------|     
"tBodyAcc_mean_X"          | "tBodyAcc_mean_Y"          | "tBodyAcc_mean_Z"             
"tBodyAcc_std_X"           | "tBodyAcc_std_Y"           | "tBodyAcc_std_Z"              
"tGravityAcc_mean_X"       | "tGravityAcc_mean_Y"       | "tGravityAcc_mean_Z"          
"tGravityAcc_std_X"        | "tGravityAcc_std_Y"        | "tGravityAcc_std_Z"   
"tBodyAccJerk_mean_X"      | "tBodyAccJerk_mean_Y"      | "tBodyAccJerk_mean_Z"         
"tBodyAccJerk_std_X"       | "tBodyAccJerk_std_Y"       | "tBodyAccJerk_std_Z"          
"tBodyGyro_mean_X"         | "tBodyGyro_mean_Y"         | "tBodyGyro_mean_Z"           
"tBodyGyro_std_X"          | "tBodyGyro_std_Y"          | "tBodyGyro_std_Z"             
"tBodyGyroJerk_mean_X"     | "tBodyGyroJerk_mean_Y"     | "tBodyGyroJerk_mean_Z"        
"tBodyGyroJerk_std_X"      | "tBodyGyroJerk_std_Y"      | "tBodyGyroJerk_std_Z"         
"tBodyAccMag_mean"         | "tBodyAccMag_std"          |   
"tGravityAccMag_mean"      | "tGravityAccMag_std"       |   
"tBodyAccJerkMag_mean"     | "tBodyAccJerkMag_std"      |   
"tBodyGyroMag_mean"        | "tBodyGyroMag_std"         |   
"tBodyGyroJerkMag_mean"    | "tBodyGyroJerkMag_std"     |   
"fBodyAcc_mean_X"          | "fBodyAcc_mean_Y"          | "fBodyAcc_mean_Z"            
"fBodyAcc_std_X"           | "fBodyAcc_std_Y"           | "fBodyAcc_std_Z"             
"fBodyAccJerk_mean_X"      | "fBodyAccJerk_mean_Y"      | "fBodyAccJerk_mean_Z"        
"fBodyAccJerk_std_X"       | "fBodyAccJerk_std_Y"       | "fBodyAccJerk_std_Z"         
"fBodyGyro_mean_X"         | "fBodyGyro_mean_Y"         | "fBodyGyro_mean_Z"           
"fBodyGyro_std_X"          | "fBodyGyro_std_Y"          | "fBodyGyro_std_Z"            
"fBodyAccMag_mean"         | "fBodyAccMag_std"          |   
"fBodyBodyAccJerkMag_mean" | "fBodyBodyAccJerkMag_std"  |   
"fBodyBodyGyroMag_mean"    | "fBodyBodyGyroMag_std"     |  
"fBodyBodyGyroJerkMag_mean"| "fBodyBodyGyroJerkMag_std" | 

-----------
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 
