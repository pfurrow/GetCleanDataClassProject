---
title: "Codebook for the Human Activity Recognition summary dataset (HAR Tidy Dataset of Means.txt)"
author: "Pat Furrow"
date: "16Jun2015"
---

## Project Description
Assemble, extract and aggregate select statistics from the "Human Activity Recognition Using Smartphones" raw data

##Study design and data processing

###Collection of the raw data
The input files to this processing script are from a zip file "UCI HAR Dataset.zip" which is published on the following University of California Irving web page:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The README.TXT within the zip file explains how the data were collected and the features_info.txt file explains how the metrics contained in the raw files were generated.

This document explains how to use the run_analysis.R script in this GitHub repository to generate a tidy data set from the raw files that averages selected measurements for each subject and activity in the study.

##Creating the tidy datafile

###Guide to create the tidy data file
The following diagram shows how eight raw files are used to construct the wide, tidy data set.

![HAR File Diagram](HAR_file_diagram.png)

The zip file should be downloaded from the web and extracted to an empty directory with the "Use folder names" option enabled.  Although the zip file contains parallel directories of files encoded for both Mac and Windows operating systems, this script was specifically developed and tested to run on Windows OS and use the appropriate files.  The R working directory should be set to the top extracted directory. 

###Cleaning of the data
The R script accomplishes these tasks:
1. Merge the training and test files to create one data set
2. Extract only the mean and standard deviation variables
3. Generate descriptive labels for the selected variables based on the original feature names
4. Add the identification variables of subject and activity to the data set
5. Summarize the data for each subject and activity calculating the averages of the 33 means and 33 standard deviations
6. Write the data set as a text file to the working directory

[Refer to the README.md document for further details of the R script which produce the summary data set.](https://github.com/pfurrow/GetCleanDataClassProject/blob/master/README.md)

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

Col Name | Class | Levels | Unit of Measure | Description
------- | ----|----|-----|------
subject | Factor | 1-30 | NA | Identifies the subject who performed the activity
activity | Factor | 1-6 | Identifies the activity the subject performed


###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.
