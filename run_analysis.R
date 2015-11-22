 ### COURSE PROJECT WEEK 3 GETTING AND CLEANING DATA ###

## READING ALL THE FILES IN UCI HAR DATASET DIRECTORY ###

# 1. common files
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

# 2. train data
subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
Y_train <- read.table("train/y_train.txt")

# 3. test data
subject_test <- read.table("test/subject_test.txt")
X_test <- read.table("test/X_test.txt")
Y_test <- read.table("test/y_test.txt")

## LABELING THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
colnames(X_train) <- features
colnames(X_test) <- features

## CREATING TIDY DATA SET BY PUTTING SUBJECTS, ACTIVITIES, DATA TYPE (TRAIN OR TEST DATA) AND DATA SET TOGETHER

# 1. train data
X_train_new <- data.frame(subject_train, Y_train, rep("train", length(Y_train)), X_train)
colnames(X_train_new) <- c("subject", "activity", "data_type", as.character(features[,2]))

# 2. test data
X_test_new <- data.frame(subject_test, Y_test, rep("test", length(Y_test)), X_test)
colnames(X_test_new) <- c("subject", "activity", "data_type", as.character(features[,2]))

## MERGING THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET

data <- rbind(X_train_new, X_test_new)

## USING DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET

data$activity <- factor(data$activity, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                                                     "SITTING", "STANDING", "LAYING"))

## EXTRACTING ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT

# 1. PICKING THE APPROPRIATE COLUMNS FROM THE DATA SET

index <- sort(c(which(grepl("mean()", as.character(features[,2]), fixed = TRUE)), 
           which(grepl("std()", as.character(features[,2]), fixed = TRUE))))

# 2. ADDING FIRST THREE COLUMNS (SUBJECT, ACTIVITY AND DATA TYPE)

index_new <- c(1, 2, 3, index)

# THE NEW DATA SET

data_new <- data[, index_new] 

## CREATING A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

# 1. for loop is to compute the averages for each variable
# 2. in each step the new averages are added to data set which already exists (new variable means the new column)
# 3. the averages of each variable is computed by tapply function (splitting the data set by subject and activity)

for (i in 4:69){
    average <- tapply(data[,i], list(data_new$subject, data_new$activity), mean)
    if (i == 4){
        data_mean <- data.frame(rep(rownames(average), 6), rep(colnames(average), each = 30), c(average[1:30,]))
        data_second <- data_mean
    } else {
        data_mean <- c(average[1:30,])
        data_second <- data.frame(data_second, data_mean)
    }
}

# SETTING THE APPROPRIATE NAMES OF THE VARIABLES

colnames(data_second) <- c("subject", "activity", as.character(features[index,2]))

# CREATING THE SECOND INDEPENDENT TIDY DATA SET (ordering by the subject)

data_second <- data_second[order(data_second$subject),]

# SAVING NEW DATA SET

write.table(data_second, "tidy_data.txt", row.names = FALSE)
