README.md to a script called run_analysis.R (explaining how the script works)

==========================================================================================

Each step is also briefly described in the script but it is all explained in this file below.

1. Reading all the files in UCI HAR Dataset directory
	* common files (activity_labels.txt and features.txt)
	* training data (subject_train.txt, X_train.txt and y_train.txt)
	* testing data (subject_test.txt, X_test.txt and y_test.txt)

2. Creating tidy data sets by putting subjects, activities, data type (train or test data) and data set itself together
	* first of all this is done to train and test data sets separately 

3. Labeling both data sets with the appropriate variable names (from the features.txt file)

4. Merging the training and test data sets to create one data set (these can be distinguished by the new variable data_type with
	two categories: train and test)

5. Using the descriptive activity names to name the activities in the data set (from the activity_labels.txt file)

6. Extracting only the measurements on the mean and standard deviation for each measurement
	* picking the appropriate columns by searching "mean()" and "std()" in the variable names
	* adding first three columns (subject, activity and data type)

7. The new tidy data set is created

8. Creating a second, independent tidy data set with the average of each variable for each activity and each subject
	* for loop is to compute the average for each variable
	* in each step the new averages are added to data set which already exists (new variable means the new column)
	* the averages of each variable is computed by "tapply" function (splitting the data set by subject and activity)

9. Setting the appropriate names of the variables (from features.txt file)

10. Creating the second, independent tidy data set (ordering by the subject)

11. Saving new data set called tidy_data.txt