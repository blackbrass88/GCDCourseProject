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

#load activity labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",
                             sep=" ",
                             header=FALSE,
                             col.names=c("id","label"))

#merge subject, y, & X data tables
cleanSet <- function(subset, ...) {
    workingDir <- paste("UCI HAR Dataset",subset,sep="/")
    XFile <- paste(workingDir,paste("X_",subset,".txt",sep=""),sep="/")
    yFile <- paste(workingDir,paste("y_",subset,".txt",sep=""),sep="/")
    subjectFile <- paste(workingDir,paste("subject_",subset,".txt",sep=""),
                         sep="/")
    
    #load X data
    XData <- laf_open_fwf(
        XFile,
        column_widths=rep(16,561),
        column_types=rep("double",561),
        column_names=colLabels$label)
    
    XData <- tbl_df(XData[,])
    
    #load y data
    yData <- read.table(
        yFile,
        header=FALSE,
        col.names="activity",
        colClasses = "factor")
    yData <- tbl_df(yData)
    
    #match activity name
    yData <- mutate(yData, activityName = activityLabels$label[activity])
    
    #load subject data
    subjectData <- read.table(
        subjectFile,
        header=FALSE,
        col.names="subject",
        colClasses = "factor")
    
    #merge test data
    finalData <- bind_cols(subjectData,yData,XData) 
    
    return(finalData)
}










