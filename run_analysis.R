library(data.table)
library(dplyr)


# Read training data
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
FeaturesTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
ActivityTrain <- read.table ("UCI HAR Dataset/train/y_train.txt", header = FALSE)

# Read test data
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
FeaturesTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
ActivityTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

# Read Supporting Metadata
FeatureNames <- read.table("UCI HAR Dataset/features.txt")
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

# 1. Merge the training and the test sets to create one data set
Subject <- rbind(SubjectTrain, SubjectTest)
Activity <- rbind(ActivityTrain, ActivityTest)
Features <- rbind(FeaturesTrain, FeaturesTest)

# Naming the columns
colnames(Features) <- t(FeatureNames$V2)
colnames(Activity) <- "Activity"
colnames(Subject) <- "Subject"

# Merge the data
MergedData <- cbind(Features, Activity, Subject)

# 2. Extract only the measurements on the mean and standard deviation for each measurement
MeanandStd <- grep(".*Mean.*|.*Std.*", names(MergedData), ignore.case=TRUE)
ReqColumns <- c(MeanandStd, 562, 563)
ExtractedData <- MergedData[,ReqColumns]

# 3. Use descriptive activity names to name the activities in the data set
ExtractedData$Activity <- as.character(ExtractedData$Activity)
for (i in 1:6){
        ExtractedData$Activity[ExtractedData$Activity == i] <- as.character(ActivityLabels[i,2])
}

ExtractedData$Activity <- as.factor(ExtractedData$Activity)

# 4. Appropriately label the data set with descriptive variable names
names(ExtractedData)<-gsub("Acc", "Accelerometer", names(ExtractedData))
names(ExtractedData)<-gsub("Gyro", "Gyroscope", names(ExtractedData))
names(ExtractedData)<-gsub("BodyBody", "Body", names(ExtractedData))
names(ExtractedData)<-gsub("Mag", "Magnitude", names(ExtractedData))
names(ExtractedData)<-gsub("^t", "Time", names(ExtractedData))
names(ExtractedData)<-gsub("^f", "Frequency", names(ExtractedData))
names(ExtractedData)<-gsub("tBody", "TimeBody", names(ExtractedData))
names(ExtractedData)<-gsub("-mean()", "Mean", names(ExtractedData), ignore.case = TRUE)
names(ExtractedData)<-gsub("-std()", "STD", names(ExtractedData), ignore.case = TRUE)
names(ExtractedData)<-gsub("-freq()", "Frequency", names(ExtractedData), ignore.case = TRUE)
names(ExtractedData)<-gsub("angle", "Angle", names(ExtractedData))
names(ExtractedData)<-gsub("gravity", "Gravity", names(ExtractedData))

# 5. Create a second,independent tidy data set and ouput it
ExtractedData$Subject <- as.factor(ExtractedData$Subject)
ExtractedData <- data.table(ExtractedData)

TidyDT <- aggregate(. ~Subject + Activity, ExtractedData, mean)
TidyDT <- TidyDT[order(TidyDT$Subject, TidyDT$Activity),]
write.table(TidyDT, file = "TidyDT.txt", row.names = FALSE)