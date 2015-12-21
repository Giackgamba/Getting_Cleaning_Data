if (!file.exists('zipfile.zip')) {
    download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', 'zipfile.zip')
    unzip('zipfile.zip')
}

if(!(exists('x_test') & exists('x_train'))) {
    
    x_test <- read.table('UCI HAR Dataset/test/X_test.txt')
    x_train <- read.table('UCI HAR Dataset/train/X_train.txt')
}

library(dplyr)


# 1 Merges the training and the test sets to create one data sets.
# Union the data
x_total <- bind_rows(x_test, x_train)
# Then the activity
activity_test <- read.table('UCI HAR Dataset/test/y_test.txt')
activity_train <- read.table('UCI HAR Dataset/train/y_train.txt')
activity_total <- bind_rows(activity_test, activity_train)
# Then the subjects
subjects_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
subjects_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
subjects_total <- bind_rows(subjects_test, subjects_train)

# Merge the three

dataset_complete <- bind_cols(x_total, activity_total) %>%
    bind_cols(subjects_total)


# 2 Extracts only the measurement on the mean and standard deviation for each measurement.
Names <- read.table('UCI HAR Dataset/features.txt', stringsAsFactors = F)
colnames(dataset_complete) <- c(Names$V2, 'activity', 'subject')

# Remove duplicated colums
dataset_meanstd <- dataset_complete[ , !duplicated(colnames(dataset_complete))] %>%
    # keep only mean() and std() columns
    select(subject, activity, matches("(mean|std)\\(\\)"))


# 3 Uses descriptive activity names to name the activities in the data set.
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')
dataset_meanstd <- full_join(dataset_meanstd, activity_labels, by = c('activity' = 'V1')) %>%
    rename(activity_description = V2)

# 4 Appropriately labels the data with descriptive variable names

## TO DO

# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## TO DO
                            