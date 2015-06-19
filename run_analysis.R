## This script requires the R working directory to be set to the top level
## directory of the extracted "UCI HAR Dataset.zip" file.
##
## This scrip requires the reshape2 package.
##
## This script will extract means and standard deviations from the measurements
## in the raw files, calculate the averages of those 66 statistics for each 
## subject and activity and write the resulting wide, tidy data set out to
## "HAR Tidy Dataset of Means.txt" in the same directory. 
##
## 1. Merge the training and test sets of statistics to create one data frame

HARdf <- read.table("UCI HAR Dataset/train/X_train.txt", 
                    header = F, colClasses = "numeric")
HARdf_add <- read.table("UCI HAR Dataset/test/X_test.txt", 
                        header = F, colClasses = "numeric")
HARdf <- rbind(HARdf,HARdf_add)

## 2. Extract only the mean and standard deviation statistics for each measurement
##
## Extract the column numbers for the measurements which contain "-mean()" 
## or "-std()" in the feature name and sort them in ascending order before 
## subsetting the data frame to keep only those columns of statistics

HARlabels <- read.table("UCI HAR Dataset/features.txt", header = F)
HARextract <- sort(c(grep("-mean()",HARlabels[,2],fixed=T),
                     grep("-std()",HARlabels[,2],fixed=T)))
HARdf <- HARdf[,HARextract]

## 3. Label the statistics columns using the original "feature" names
##
## To generate legal column names, parentheses are removed using the gsub function
## and any hyphen is translated to an underscore using the chartr function

colnames(HARdf) <- HARlabels[,2][HARextract]
colnames(HARdf) <- chartr("-","_",gsub("[:():]","",colnames(HARdf)))

## 4. Add the activity and subject factors to each row of statistics
##
## Merge the training and test activity values, generate the activity factor
## from those values using the activity labels file and then add the factor to
## the existing data frame of statistics

HAR_act_num <- read.table("UCI HAR Dataset/train/y_train.txt",
                            header = F, colClasses = "integer")
HAR_act_num_add <- read.table("UCI HAR Dataset/test/y_test.txt",
                                header = F, colClasses = "integer")
HAR_act_num <- rbind(HAR_act_num,HAR_act_num_add)
HAR_act_name <- read.table("UCI HAR Dataset/activity_labels.txt",
                           header = F)
activity <- HAR_act_name[HAR_act_num[,1],2]
HARdf <- cbind(activity,HARdf)

## And use similar logic to add the subject # factor to the data frame

subject <- read.table("UCI HAR Dataset/train/subject_train.txt",
                      header = F, colClasses = "integer", col.name="subject")
subject_add <- read.table("UCI HAR Dataset/test/subject_test.txt",
                          header = F, colClasses = "integer", col.name="subject")
subject <- rbind(subject,subject_add)
HARdf <- cbind(subject,HARdf)
HARdf$subject <- factor(HARdf$subject)

## 5. Create a summary dataset for each subject and activity with averages
##    of all other columns (variables) using functions of the reshape2 package

HARmelt <- melt(HARdf, id=c("subject","activity"))
HARmeans <- dcast(HARmelt, subject + activity ~ ... , mean)

## 6. Write out a text file from the resulting tidy data set

write.table(HARmeans, file = "HAR Tidy Dataset of Means.txt",row.name=FALSE)