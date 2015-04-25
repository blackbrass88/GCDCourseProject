library(LaF)
library(dplyr)

#function to merge subject, y, & X data tables
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
        col.names="subject")
    
    #merge test data
    finalData <- bind_cols(subjectData,yData,XData) 
    finalData <- mutate(finalData, group = subset)
    
    
    return(finalData)
}

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

#load each data set and 
testData <- cleanSet("test")
trainData <- cleanSet("train")

#combine the test & train data sets
fullData <- bind_rows(testData,trainData)

#convert subject & group to factors
for( i in c("subject","group")) {
    fullData[[i]] = as.factor(fullData[[i]])
}

#extract only mean & std measurments
subsetMeanStd <- select(
    fullData,
    subject,
    activityName,
    contains("mean"),
    contains("std"))

#clean variable names to fit tidy data standards
colNames <- names(subsetMeanStd)
cleanColNames <- tolower(gsub("\\.","",colNames))
names(subsetMeanStd) <- cleanColNames

#group data by subject & activity
subsetGroup <- group_by(subsetMeanStd,subject,activityname)

#take the average of each variable for each activity and each subject
tidyData <- summarise_each(subsetGroup,funs(mean))

#rename variables for tidy data
tidyVarNames <- names(tidyData)
tidyVarNames[3:88] <- paste0("avg",tidyVarNames[3:88],sep="")
names(tidyData) <- tidyVarNames

write.table(tidyData, file="tidyData.txt", row.name=FALSE)








