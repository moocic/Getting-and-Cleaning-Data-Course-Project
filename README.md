# Getting-and-Cleaning-Data-Course-Project


This repository contains the files of the Getting and Cleaning Data Course Project.

* CodeBook.md: code book of the variables in the final data set;
* features_info.txt: information about the original features;
* run_analysis.R: R script;
* run_analysis_output.txt: final data set.

The R script follows the instructions provided in the Course Project:

1 - Merge of the training and the test sets to create one data set:
    1.1 - Read both sets data, labels and subjects into memory,
    1.2 - Rename the variable names of labels and subjects,
    1.3 - Merge all data in one data set (adding a set variable, which refers to the origin of the data: train or test set);
2 - Extract only the measurements on the mean and standard deviation for each measurement:
    2.1 - Read the feature data and searches only for the mean and std,
    2.2 - Subset the merged dataset according to the result in 2.1;
3 - Use descriptive activity names to name the activities in the data set:
    3.1 - Replace the activities by their designations,
    3.2 - Set the activities as factor;
4 - Appropriately label the data set with descriptive variable names:
    4.1 - Replace the variable names by the ones given in the file "features.txt";
5 - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject:
    5.1 - Load the libraty dplyr (needed to 5.2),
    5.2 - Summarise the dataset, by activity and by subject, and returns the average of the variables (by activity and by subject).
6 - Creates a txt file with write.table() using row.name=FALSE.