# Getting and Cleaning data course project

# Project Description
The aim of the project is to clean and extract usable data from the above zip file. R script called run_analysis.R that does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this repository, you find:
* README.md : the analysis of the code in run_analysis.R
* run_analysis.R : the R-code run on the data set
* CodeBook.md : the CodeBook reference to the variables in Tidy.txt
* Tidy.txt : the clean data extracted from the original data using run_analysis.R

# Getting Started
### Libraries Used
The libraries used in this operation are data.table and dplyr.

### Read Supporting Metadata
The supporting metadata in this data are the name of the features and the name of the activities. They are loaded into variables FeatureNames and ActivityLabels.

### Format training and test data sets
Both training and test data sets are split up into subject, activity and features. They are present in three different files.

### 1. Merge the training and the test sets to create one data set. The results are stored in Subject, Activity and Features.
Naming the columns: Features,Activity and Subject
Merge the data: Features,Activity and Subject
Merged data is now stored in MergedData.

### 2. Extract only the measurements on the mean and standard deviation for each measurement
Extract the column indices that have either mean or std in them.
Add Activity and Subject columns to the list of MergedData.

### 3. Use descriptive activity names to name the activities in the data set

### 4. Appropriately label the data set with descriptive variable names Here are the names of the variables in extractedData

By examining MergedData, the following acronyms can be replaced:

* Acc can be replaced with Accelerometer

* Gyro can be replaced with Gyroscope

* BodyBody can be replaced with Body

* Mag can be replaced with Magnitude

* Character f can be replaced with Frequen

* Character t can be replaced with Time

### 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
We create TidyData as a data set with average for each Activity and Subject. Then, we order the enties in TidyData and write it into data file TidyDT.txt that contains the processed data.
