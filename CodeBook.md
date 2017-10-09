# CodeBook
---------------------------------------------------------------
This document describes the data and transformations used by *run_analysis.R* and the definition of variables in *TidyDT.txt*.

## Dataset Used:

This data is obtained from "Human Activity Recognition Using Smartphones Data Set". The data linked are collected from the 
accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site 
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

The data set used can be downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>. 

## Input Dataset Details:

The input data containts the following data files:

- `X_train.txt` contains variable features that are intended for training.
- `y_train.txt` contains the activities corresponding to `X_train.txt`.
- `subject_train.txt` contains information on the subjects from whom data is collected.
- `X_test.txt` contains variable features that are intended for testing.
- `y_test.txt` contains the activities corresponding to `X_test.txt`.
- `subject_test.txt` contains information on the subjects from whom data is collected.
- `activity_labels.txt` contains metadata on the different types of activities.
- `features.txt` contains the name of the features in the data sets.

## Transformations done:

Following are the transformations that were performed on the input dataset:

- `X_train.txt` is read into `FeaturesTrain`.
- `y_train.txt` is read into `ActivityTrain`.
- `subject_train.txt` is read into `SubjectTrain`.
- `X_test.txt` is read into `FeaturesTest`.
- `y_test.txt` is read into `ActivityTest`.
- `subject_test.txt` is read into `SubjectTest`.
- `features.txt` is read into `FeatureNames`.
- `activity_labels.txt` is read into `ActivityLabels`.
- The subjects in training and test set data are merged to form `Subject`.
- The activities in training and test set data are merged to form `Activity`.
- The features of test and training are merged to form `Features`.
- The name of the features are set in `features` from `FeatureNames`.
- `Features`, `Activity` and `Subject` are merged to form `MergedData`.
- Indices of columns that contain std or mean, activity and subject are taken into `ReqColumns` .
- `MergedData` is created with data from columns in `ReqColumns`.
- `Activity` column in `MergedData` is updated with descriptive names of activities taken from `ActivityLabels`. `Activity` column is expressed as a factor variable.
- Acronyms in variable names in `MergedData`, like 'Acc', 'Gyro', 'Mag', 't' and 'f' are replaced with descriptive labels such as 'Accelerometer', 'Gyroscpoe', 'Magnitude', 'Time' and 'Frequency'.
- `TidyData` is created as a set with average for each activity and subject of `MergedData`. Entries in `TidyData` are ordered based on activity and subject.
- Finally, the data in `TidyData` is written into `TidyDT.txt`.

## Output Dataset

The output data `TidyDT.txt` is a a space-delimited value file. 
The header line contains the names of the variables. 
It contains the mean and standard deviation values of the data contained in the input files.
