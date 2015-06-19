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

###Notes on the original (raw) data 
The zip file should be downloaded from the web and extracted to an empty directory with the "Use folder names" option enabled.  Although the zip file contains parallel directories of files encoded for both Mac and Windows operating systems, this script was specifically developed and tested to run on Windows OS.  The R working directory should be set to the "UCI HAR Dataset" directory one level lower than the top extracted directory. 

##Creating the tidy datafile

###Guide to create the tidy data file
The following diagram shows how eight raw files are used to construct the tidy data set.

![HAR File Diagram](HAR_file_diagram.png)

The zip file should be downloaded from the web and extracted to an empty directory with the "Use folder names" option enabled.  Although the zip file contains parallel directories of files encoded for both Mac and Windows operating systems, this script was specifically developed and tested to run on Windows OS.  The R working directory should be set to the "UCI HAR Dataset" directory one level lower than the top extracted directory. 

###Cleaning of the data
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

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
