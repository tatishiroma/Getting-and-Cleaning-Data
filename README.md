# Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.The goal is to prepare tidy data that can be used for later analysis. You will be required to submit:
1. a tidy data set as described below;
2. a link to a GitHub repository with your script for performing the analysis, and;
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called ``CodeBook.md``.
You should also include a ``README.md`` in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## Objectives
``run_analysis.R`` does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## run_analysis.R
1. The **UCI HAR Dataset** data set is downloaded and placed in zip file in your working directory. Then, the file is unziped into the UCI HAR Dataset folder.
2. The **train** and **test** data sets were merged into one data frame, using the function ``rbind``.
3. The *mean* and *standard deviation* from the **features** data set were extracted using the function ``grep``. Then, it was applied to the **x** data frame.
4. The characters of **activities** data set were all converted to lower case using ``tolower`` and underscore removed using ``gsub``. *activity* and *subject* column names are named for **y** and **subject** data sets, respectively.
5. Finally, **x**, **y** and **subject** data sets were merged. Then, it was exported as *txt* file into the project's folder (Getting-and-Cleaning-Data) in the same working directory, named **merged.txt**.
6. A separate tidy data set was created containing the *mean* of activities and subjects, which is exported as *txt* file into the project's folder (Getting-and-Cleaning-Data), named **meandataset.txt**.

On steps 5 and 6, it was used the ``str`` function to preview the final outputs.

## Reference
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)