# Course Project - Getting and Cleaning Data

This repository contains required files to satisfy the project requirements of the Getting and Cleaning Data course:
* run_analysis.R - script which generates the required wide, tidy data set
* Codebook.md - describes the wide, tidy data set that is produced by the script
* README.md - this document which describes how the run_analysis.R script works

## Steps to run the script run_analysis.R

### Obtain the raw data to run the analysis

The raw input files to this script are from a zip file ["UCI HAR Dataset.zip"](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) which is published on this [University of California Irving web page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The zip file should be downloaded from the web and extracted to an empty directory in such a way that the internal directory structure is maintained.

The zip file contains parallel directories of files encoded for both Mac and Windows operating systems.  While this script was specifically developed and tested to run on Windows OS it should also work transparently on Mac OS.    

### Set your working directory

Next, you need to set your working directory to the top level directory extracted from the zip file. You can do this with either the drop down menus or using the setwd() command in R.

### Install and load reshape2 package

If the rshape2 package is not already installed, use the drop down menus or install.packages() to install the package from CRAN and load it for use with the library() function.

### Download and run the script

Once the prerequisites are complete, save the run_analysis.R script file to your hard drive, open it and execute it in R.

### Examining the resulting data set

The script generates a wide, tidy data set in the form of the text file "HAR Tidy Dataset of Means.txt" in the working directory.  The data set can be loaded from the working directory usingthe command 
```
HARtidy <- read.table("HAR Tidy Dataset of Means.txt", header=T )
```

[Refer to the CodeBook.md document for an overview of the logic used in the script to produce the summary data set.](https://github.com/pfurrow/GetCleanDataClassProject/blob/master/CodeBook.md)

[Refer to the comments within the script for details on each step of the processing to produce the summary data set.](https://github.com/pfurrow/GetCleanDataClassProject/blob/master/run_analysis.R)





