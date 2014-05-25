========================================================================================
Code Book for Coursera Getting and Cleaning Data Course Project
========================================================================================
Original dataset is from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
You may find the description of the original dataset is inside the zip-archive.
========================================================================================

Transformations:

All transformations is done by ‘run_analysis.R’ script, which does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Dataset from steps 1-4 is exported in ‘UCI_HAR_Dataset.txt’
Dataset from step 5 is exported in ‘‘UCI_HAR_Means.txt’

========================================================================================
Variables:
All variables correspond to variables in the original dataset. Except the following additional ones:
* Activity.ID - activities’ identifiers from ‘Y_test.txt’ and ‘Y_train.txt’ files from the original data set
* Activity.Name - activities’ names in accordance with activity_labels.txt file from the original data set
* Subject.ID - subjects’ identifiers from ‘subject_test.txt' and ‘subject_train.txt’ files from the original data set