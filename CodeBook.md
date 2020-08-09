# CodeBook
This code book describes all the variables and summaries calculated. It contains everything that was used to clean up the data.

## Data Set Information
- The data comes from an experiment with 30 volunteers, where each person performed six activities wearing a Samsung Galaxy SII smartphone. The data was colected using an accelerometer and a gyroscope. More information on the experiment can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- The data for the project was downloaded from this URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- The zip file has been saved in the working directory through the ``run_analysis.R`` script as **UCI-HAR-dataset.zip**.
- The file was unzipped in the working directory and a new subdirectory named **UCI HAR Dataset** was created, which contains all the raw data and a **README.txt** file which contains the information needed to work with the data.
- The raw data is separated into test and training datasets. Within each of the test and training datasets the data are separated into files for measurement data, the activity labels, and the test subject labels.

## Code Book
Here, the variables and processes will be described within each step of the ``run_analysis.R``.
### 1. Merges the training and the test sets to create one data set.
The raw data from the test and training data sets files, activity labels and test subjects have been imported into the following dataframes:
- x.test
- y.test
- subject.test
- x.train
- y.train
- subject.train

Each corresponding type of file (**x**, **y** and **subject**) was binded, by rows, by test or training category. The merged data sets were saved in the following variables:
- x
- y
- subject

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
- features: imports the data set containing tne measurements variable names
- mean.sd.cols: selects only the variables that are for mean and standard deviation measurements
- x.mean.sd: subset of **x** with only the columns that represent the mean and standard deviation of the measures

### 3. Uses descriptive activity names to name the activities in the data set.
The **activity labels** data set which contains the descriptive names of the activities was imported. Then, it was joined with **y** data set resulting in a single variable data set with descriptive activity labels for each row.
- activities: imports **activity labels** data set

### 4. Appropriately labels the data set with descriptive variable names.
The ``colnames`` function was used to name the columns of **y** and **subject** data sets as *activity* and *subject*, respectively. The **subject**, **x.mean.sd** and **y** data sets were merged by columns.
- data: data frame containing the merged data sets (subject, x.mean.sd and y)

### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The **data** data set was sorted by activity and subjects. Then, the mean for each variable is calculated.
- mean.df: data frame containing the **data** data set sorted by activity and subjects, and their averages.