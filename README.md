# Getting_and_Cleaning_Data
Course project
The file "run_analysis.R" complete the course project and produce the tidy data as assigned.

The concept of the coding is to combine all the data of train and test, including the features,activity, and subject, in one big data frame, then start to do the extraction and then creat the tidy data as assigned. The following shows the steps:

1.read the tain/test set, train/test label, subject_train/test into R
2.read the feature list and activity_label into R,then assign features to column names of train/test set.
3.add activity in test_lable and train_label.
4.combine all the test and train sets and activity, then put all sets in one table.
5.Extracts only the measurements on the mean and standard deviation for each measurement.
6.creates a second, independent tidy data set with the average of each variable for each activity and each subject, then write it to working directory.
