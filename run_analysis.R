# Load necessary libraries
library(dplyr)

# Check for data and download if necessary
if(!file.exists("UCI HAR Dataset")) {
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        dir.create("UCI HAR Dataset")
        download.file(fileURL, destfile = "UCI-HAR-dataset.zip", method = "curl")
        unzip("./UCI-HAR-dataset.zip")
}

# 1. Merges the training and the test sets to create one data set.
x.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
x <- rbind(x.train, x.test)

subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject.train, subject.test)

y.train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y.test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y <- rbind(y.train, y.test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./UCI HAR Dataset/features.txt")
mean.sd.cols <- grep("(.*)mean[^F]|std(.*)", features[, 2])
x.mean.sd <- x[, mean.sd.cols]

# 3. Uses descriptive activity names to name the activities in the data set.
names(x.mean.sd) <- features[mean.sd.cols, 2]
names(x.mean.sd) <- tolower(names(x.mean.sd))
names(x.mean.sd) <- gsub("\\(|\\)", "", names(x.mean.sd))

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities[, 2] <- tolower(as.character(activities[, 2]))
activities[, 2] <- gsub("_", "", activities[, 2])

y[, 1] = activities[y[, 1], 2]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(y) <- "activity"
colnames(subject) <- "subject"
data <- cbind(subject, x.mean.sd, y)
str(data)
write.table(data, "./Getting-and-Cleaning-Data/merged.txt", row.names = FALSE)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
mean.df <- aggregate(x = data, by = list(activities = data$activity, subject = data$subject), FUN = mean)
mean.df <- mean.df[, !(colnames(mean.df) %in% c("subject", "activity"))]
str(mean.df)
write.table(mean.df, "./Getting-and-Cleaning-Data/meandataset.txt", row.names = FALSE)