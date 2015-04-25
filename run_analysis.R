library(LaF)
library(data.table)
library(dplyr)

#load column labels
colLabels <- read.table(
    "UCI HAR Dataset/features.txt",
    sep=" ",
    header=FALSE,
    col.names=c("id","label"),
    colClasses=c("integer","character"))

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",
                             sep=" ",
                             header=FALSE,
                             col.names=c("id","label"))

#load X_test data
X_test <- laf_open_fwf(
    "UCI HAR Dataset/test/X_test.txt",
    column_widths=rep(16,561),
    column_types=rep("double",561),
    column_names=colLabels$label)

testTable <- tbl_df(X_test[,])

#load y_test data
y_test <- read.table(
    "UCI HAR Dataset/test/y_test.txt",
    header=FALSE,
    col.names="activity",
    colClasses = "factor")
y_test <- tbl_df(y_test)

#match activity name
y_test <- mutate(y_test, activityName = activityLabels$label[activity])

#load subject_test
subject_test <- read.table(
    "UCI HAR Dataset/test/subject_test.txt",
    header=FALSE,
    col.names="subject",
    colClasses = "factor")

#merge test data
testData <- bind_cols(subject_test,y_test,testTable)

