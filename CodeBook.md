---
title: "Codebook for the Human Activity Recognition summary dataset (HAR Tidy Dataset of Means.txt)"
author: "Pat Furrow"
date: "16Jun2015"
---

## Project Description
Assemble, extract and aggregate select statistics from the "Human Activity Recognition Using Smartphones" raw data

##Study Design and Data Processing

###Collection of the raw data
The input files to this processing script are from a zip file "UCI HAR Dataset.zip" which is published on the following University of California Irving web page:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The README.TXT within the zip file explains how the data were collected and the features_info.txt file explains how the metrics contained in the raw files were generated.

NOTE:  The features.txt file contains 84 duplicate feature names.  These can be displayed after the script is run using this R command:  
```
HARlabels[duplicated(HARlabels[,2]),]  
```
The associated values in the measurement files for those duplicate labels are not duplicate, so if the R script is modified to use different columns of statistics, the results may be unpredictable.

##Creating the tidy datafile
This document describes the tidy data set generated from the raw files to calculate the averages of selected measurements for each subject and activity in the study.

###Guide to create the tidy data file
The following diagram shows how eight raw files are used to construct the wide, tidy data set.

![HAR File Diagram](HAR_file_diagram.png)

The zip file should be downloaded from the web and extracted to an empty directory in such a way that the internal directory structure is maintained.  The zip file contains parallel directories of files encoded for both Mac and Windows operating systems.  While this script was specifically developed and tested to run on Windows OS it should work transparently on Mac OS also.  

The R working directory should be set to the top extracted directory.  

The R package reshape2 must be loaded. 

###Cleaning of the data
The R script accomplishes these tasks:  
1. Merge the training and test files to create one data set  
2. Extract only the mean and standard deviation statistics  
3. Generate descriptive labels for the selected statistics based on the original feature names  
4. Add the identification variables "subject" and "activity" to the data set  
5. Calculate the average of each extracted measurement for each subject and activity  
6. Write the summary data set to the working directory as a text file  

[Refer to the README.md document for further details of the R code which produces the summary data set.](https://github.com/pfurrow/GetCleanDataClassProject/blob/master/README.md)

##Description of the variables in the "HAR Tidy Dataset of Means.txt" file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - 2 identification and 66 measurement variables are present in the dataset

###Identification Variables

Col Name | Class | Levels | Description
------- | ----|----|-----|------
subject | Factor | 1-30 | An integer identifying the subject who performed the activity
activity | Factor | 1-6 | A text descriptor the activity the subject performed


###Measurement Variables
All 66 of the measurement variables are averages of extracted mean and standard deviation metrics for each subject and activity.  The variable naming convention is consistent with the original feature labels of the data set except parentheses have been removed and hyphens are replaced with underscores:

signal domain | acceleration component | instrument | calculation | 3-axial signals
------- | ----|----|-----|------
t = time | Body | Acc=accelerometer | Jerk = time derivation | X = x direction
f = frequency | Gravity | Gyro=gyroscope | Mag = magnitude | Y = y direction
  |   |   |   | Z = z direction

instrument | unit of measure
-----------------|--------------
accelerometer ("Acc" in variable name)| g's or metres per second squared (m/s<sup>2<\sup>)
gyroscope ("Gyro" in variable name) | radian per second (rad/s)

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.
