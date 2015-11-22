The code book explaining the data and variables in tidy_data.txt file which was created in this project

===========================================================================================================

This data set was created from the data in UCI HAR Dataset directory which we had an access to. I read all the available files to RStudio,
named all the variables with the appriproate names (features available) as well as the activities performed (instead of numbers I used descriptive names). I put all the variables together (subjects, activities and data set itself). Then I merged the training and test data to make one data set (I also created a new variable called data_type to distinguish between train and test data). I extracted only the measurements on the mean and standard deviation for each measurement by picking the appropriate columns from existed data set. 

Then I created a second, independent tidy data set with the average of each variable for each activity and each subject. I used for loop to compute the average of each variable and tapply function to compute the mean for each subject and each activity. The values for new variable were added to a data frame which already existed as a new column. Then I named the variables with the appropriate names and ordered the data set by subject.

=======================================================================================================================================

DATA SET AND ITS VARIABLES

==============================

1. SUBJECT - 30 different values
	* the values are the numbers between 1 and 30 to distinguish 30 different people who carried out the experiment

2. ACTIVITY - 6 differnet values
	* the values are 6 differnet categories (descriptive names) to describe the activity the people done (WALKING, WALKING UPSTAIRS, 	   WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) 

3. 66 DIFFERENT VARIABLES DESCRIBING THE FEATURES FOR ALL THE ACTIVITIES
	* '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions
	* the main features are:
		** tBodyAcc
		** tGravityAcc
		** tBodyAccJerk
		** tBodyGyro
		** tBodyGyroJerk
		** tBodyAccMag
		** tGravityAccMag
		** tBodyAccJerkMag
		** tBodyGyroMag
		** tBodyGyroJerkMag
		** fBodyAcc
		** fBodyAccJerk
		** fBodyGyro
		** fBodyAccMag
		** fBodyBodyAccJerkMag
		** fBodyGyroJerkMag

	* t as the prefix stands for time
	* f as the prefix stands for frequency 

	* for all these features the variables are created from the mean (mean()) and standard deviation (std())
	* so one variable is the combination of feature with the appropriate prefix, mean() or std() and -X, -Y or -Z