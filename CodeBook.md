---
title: "tidyData.txt Code Book"
author: "Jacob Schwan"
date: "4/25/2015"
output:
    html_document:
    keep_md: yes
---
 
## Project Description
tidyData.txt show the average of a subset of variables for each subject and activity type in the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html).  The selected subset of variables are a mean or standard deviation of an observed measurement from the original study.

This tidy data set achieves all 5 requirements of the course project for the Coursera Class [Getting and Cleaning Data Session 013](http://class.coursera.org/getdata-013).
 
##Study design and data processing
 
###Collection of the raw data
The raw data file was download from the following link, provided on the [Course Project page](https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3):

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The raw data is from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html).
 
###Notes on the original (raw) data 
More information on the raw data can be found in the README.txt and features_info.txt files contained in the data set zip file linked above.
 
##Creating the tidy datafile
 
###Guide to create the tidy data file
1. Download the data from the link provided on the [Course Project page](https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3): https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the file in your working directory, making sure to preserve the directory structure from the zip file.  Your working directory should have the following structure after unziping (. represents your working directory):

    ./<br />
    ./UCI HAR Dataset<br />
    ./UCI HAR Dataset/test<br />
    ./UCI HAR Dataset/train<br />



3. Ensure you have the <code>LaF</code> and <code>dplyr</code> packages installed in R. These packages can be install from the CRAN repository using the following command:

```
install.packages("dplyr","LaF")
```

4. In R, from your working directory, run the run_analysis.R script, found with this Code Book, using the source() function.

```
source('run_anaysis.R')
```

###Cleaning of the data
The run_analysis.R script loads and merges the test and train data sets, along with their header, subject, & activity information.  It merges the two data sets and then pulls out a subset of variables that measured mean and standard deviation.  Finally it takes the average of each subset variable for each subject and activity and writes the results to <code>tidyData.txt</code>.

See the [README.md](README.md) found with the run_analysis.R script for more details on how the script works.
 
##Description of the variables in the tinyData.txt file
*Dimensions:* 180 observations of 88 variables

See the README.txt and features_info.txt files included with the raw data for more information on the original measurement variables.

###subject
Subject number as provided in the raw data
*Class:* Factor
*Levels:* 1:30

###activityname
Activity performed during each measurement
*Class:* Factor
*Levles:* LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

###avgtbodyaccmeanx
The mean of the tBodyAcc-mean()-X variable from the raw data for each subject & activity observed.

###avgtbodyaccmeany
The mean of the tBodyAcc-mean()-Y variable from the raw data for each subject & activity observed.

###avgtbodyaccmeanz
The mean of the tBodyAcc-mean()-Z variable from the raw data for each subject & activity observed.

###avgtgravityaccmeanx
The mean of the tGravityAcc-mean()-X variable from the raw data for each subject & activity observed.

###avgtgravityaccmeany
The mean of the tGravityAcc-mean()-Y variable from the raw data for each subject & activity observed.

###avgtgravityaccmeanz
The mean of the tGravityAcc-mean()-Z variable from the raw data for each subject & activity observed.

###avgtbodyaccjerkmeanx
The mean of the tBodyAccJerk-mean()-X variable from the raw data for each subject & activity observed.

###avgtbodyaccjerkmeany
The mean of the tBodyAccJerk-mean()-Y variable from the raw data for each subject & activity observed.

###avgtbodyaccjerkmeanz
The mean of the tBodyAccJerk-mean()-Z variable from the raw data for each subject & activity observed.

###avgtbodygyromeanx
The mean of the tBodyGyro-mean()-X variable from the raw data for each subject & activity observed.

###avgtbodygyromeany
The mean of the tBodyGyro-mean()-Y variable from the raw data for each subject & activity observed.

###avgtbodygyromeanz
The mean of the tBodyGyro-mean()-Z variable from the raw data for each subject & activity observed.

###avgtbodygyrojerkmeanx
The mean of the tBodyGyroJerk-mean()-X variable from the raw data for each subject & activity observed.

###avgtbodygyrojerkmeany
The mean of the tBodyGyroJerk-mean()-Y variable from the raw data for each subject & activity observed.

###avgtbodygyrojerkmeanz
The mean of the tBodyGyroJerk-mean()-Z variable from the raw data for each subject & activity observed.

###avgtbodyaccmagmean
The mean of the tBodyAccMag-mean() variable from the raw data for each subject & activity observed.

###avgtgravityaccmagmean
The mean of the tGravityAccMag-mean() variable from the raw data for each subject & activity observed.

###avgtbodyaccjerkmagmean
The mean of the tBodyAccJerkMag-mean() variable from the raw data for each subject & activity observed.

###avgtbodygyromagmean
The mean of the tBodyGyroMag-mean() variable from the raw data for each subject & activity observed.

###avgtbodygyrojerkmagmean
The mean of the tBodyGyroJerkMag-mean() variable from the raw data for each subject & activity observed.

###avgfbodyaccmeanx
The mean of the fBodyAcc-mean()-X variable from the raw data for each subject & activity observed.

###avgfbodyaccmeany
The mean of the fBodyAcc-mean()-Y variable from the raw data for each subject & activity observed.

###avgfbodyaccmeanz
The mean of the fBodyAcc-mean()-Z variable from the raw data for each subject & activity observed.

###avgfbodyaccmeanfreqx
The mean of the fBodyAcc-meanFreq()-X variable from the raw data for each subject & activity observed.

###avgfbodyaccmeanfreqy
The mean of the fBodyAcc-meanFreq()-Y variable from the raw data for each subject & activity observed.

###avgfbodyaccmeanfreqz
The mean of the fBodyAcc-meanFreq()-Z variable from the raw data for each subject & activity observed.

###avgfbodyaccjerkmeanx
The mean of the fBodyAccJerk-mean()-X variable from the raw data for each subject & activity observed.

###avgfbodyaccjerkmeany
The mean of the fBodyAccJerk-mean()-Y variable from the raw data for each subject & activity observed.

###avgfbodyaccjerkmeanz
The mean of the fBodyAccJerk-mean()-Z variable from the raw data for each subject & activity observed.

###avgfbodyaccjerkmeanfreqx
The mean of the fBodyAccJerk-meanFreq()-X variable from the raw data for each subject & activity observed.

###avgfbodyaccjerkmeanfreqy
The mean of the fBodyAccJerk-meanFreq()-Y variable from the raw data for each subject & activity observed.

###avgfbodyaccjerkmeanfreqz
The mean of the fBodyAccJerk-meanFreq()-Z variable from the raw data for each subject & activity observed.

###avgfbodygyromeanx
The mean of the fBodyGyro-mean()-X variable from the raw data for each subject & activity observed.

###avgfbodygyromeany
The mean of the fBodyGyro-mean()-Y variable from the raw data for each subject & activity observed.

###avgfbodygyromeanz
The mean of the fBodyGyro-mean()-Z variable from the raw data for each subject & activity observed.

###avgfbodygyromeanfreqx
The mean of the fBodyGyro-meanFreq()-X variable from the raw data for each subject & activity observed.

###avgfbodygyromeanfreqy
The mean of the fBodyGyro-meanFreq()-Y variable from the raw data for each subject & activity observed.

###avgfbodygyromeanfreqz
The mean of the fBodyGyro-meanFreq()-Z variable from the raw data for each subject & activity observed.

###avgfbodyaccmagmean
The mean of the fBodyAccMag-mean() variable from the raw data for each subject & activity observed.

###avgfbodyaccmagmeanfreq
The mean of the fBodyAccMag-meanFreq() variable from the raw data for each subject & activity observed.

###avgfbodybodyaccjerkmagmean
The mean of the fBodyBodyAccJerkMag-mean() variable from the raw data for each subject & activity observed.

###avgfbodybodyaccjerkmagmeanfreq
The mean of the fBodyBodyAccJerkMag-meanFreq() variable from the raw data for each subject & activity observed.

###avgfbodybodygyromagmean
The mean of the fBodyBodyGyroMag-mean() variable from the raw data for each subject & activity observed.

###avgfbodybodygyromagmeanfreq
The mean of the fBodyBodyGyroMag-meanFreq() variable from the raw data for each subject & activity observed.

###avgfbodybodygyrojerkmagmean
The mean of the fBodyBodyGyroJerkMag-mean() variable from the raw data for each subject & activity observed.

###avgfbodybodygyrojerkmagmeanfreq
The mean of the fBodyBodyGyroJerkMag-meanFreq() variable from the raw data for each subject & activity observed.

###avgangletbodyaccmeangravity
The mean of the angle-tBodyAccMean-gravity- variable from the raw data for each subject & activity observed.

###avgangletbodyaccjerkmeangravitymean
The mean of the angle-tBodyAccJerkMean()gravityMean- variable from the raw data for each subject & activity observed.

###avgangletbodygyromeangravitymean
The mean of the angle-tBodyGyroMean-gravityMean- variable from the raw data for each subject & activity observed.

###avgangletbodygyrojerkmeangravitymean
The mean of the angle-tBodyGyroJerkMean-gravityMean- variable from the raw data for each subject & activity observed.

###avganglexgravitymean
The mean of the angle-X-gravityMean- variable from the raw data for each subject & activity observed.

###avgangleygravitymean
The mean of the angle-Y-gravityMean- variable from the raw data for each subject & activity observed.

###avganglezgravitymean
The mean of the angle-Z-gravityMean- variable from the raw data for each subject & activity observed.

###avgtbodyaccstdx
The mean of the tBodyAcc-std()-X variable from the raw data for each subject & activity observed.

###avgtbodyaccstdy
The mean of the tBodyAcc-std()-Y variable from the raw data for each subject & activity observed.

###avgtbodyaccstdz
The mean of the tBodyAcc-std()-Z variable from the raw data for each subject & activity observed.

###avgtgravityaccstdx
The mean of the tGravityAcc-std()-X variable from the raw data for each subject & activity observed.

###avgtgravityaccstdy
The mean of the tGravityAcc-std()-Y variable from the raw data for each subject & activity observed.

###avgtgravityaccstdz
The mean of the tGravityAcc-std()-Z variable from the raw data for each subject & activity observed.

###avgtbodyaccjerkstdx
The mean of the tBodyAccJerk-std()-X variable from the raw data for each subject & activity observed.

###avgtbodyaccjerkstdy
The mean of the tBodyAccJerk-std()-Y variable from the raw data for each subject & activity observed.

###avgtbodyaccjerkstdz
The mean of the tBodyAccJerk-std()-Z variable from the raw data for each subject & activity observed.

###avgtbodygyrostdx
The mean of the tBodyGyro-std()-X variable from the raw data for each subject & activity observed.

###avgtbodygyrostdy
The mean of the tBodyGyro-std()-Y variable from the raw data for each subject & activity observed.

###avgtbodygyrostdz
The mean of the tBodyGyro-std()-Z variable from the raw data for each subject & activity observed.

###avgtbodygyrojerkstdx
The mean of the tBodyGyroJerk-std()-X variable from the raw data for each subject & activity observed.

###avgtbodygyrojerkstdy
The mean of the tBodyGyroJerk-std()-Y variable from the raw data for each subject & activity observed.

###avgtbodygyrojerkstdz
The mean of the tBodyGyroJerk-std()-Z variable from the raw data for each subject & activity observed.

###avgtbodyaccmagstd
The mean of the tBodyAccMag-std() variable from the raw data for each subject & activity observed.

###avgtgravityaccmagstd
The mean of the tGravityAccMag-std() variable from the raw data for each subject & activity observed.

###avgtbodyaccjerkmagstd
The mean of the tBodyAccJerkMag-std() variable from the raw data for each subject & activity observed.

###avgtbodygyromagstd
The mean of the tBodyGyroMag-std() variable from the raw data for each subject & activity observed.

###avgtbodygyrojerkmagstd
The mean of the tBodyGyroJerkMag-std() variable from the raw data for each subject & activity observed.

###avgfbodyaccstdx
The mean of the fBodyAcc-std()-X variable from the raw data for each subject & activity observed.

###avgfbodyaccstdy
The mean of the fBodyAcc-std()-Y variable from the raw data for each subject & activity observed.

###avgfbodyaccstdz
The mean of the fBodyAcc-std()-Z variable from the raw data for each subject & activity observed.

###avgfbodyaccjerkstdx
The mean of the fBodyAccJerk-std()-X variable from the raw data for each subject & activity observed.

###avgfbodyaccjerkstdy
The mean of the fBodyAccJerk-std()-Y variable from the raw data for each subject & activity observed.

###avgfbodyaccjerkstdz
The mean of the fBodyAccJerk-std()-Z variable from the raw data for each subject & activity observed.

###avgfbodygyrostdx
The mean of the fBodyGyro-std()-X variable from the raw data for each subject & activity observed.

###avgfbodygyrostdy
The mean of the fBodyGyro-std()-Y variable from the raw data for each subject & activity observed.

###avgfbodygyrostdz
The mean of the fBodyGyro-std()-Z variable from the raw data for each subject & activity observed.

###avgfbodyaccmagstd
The mean of the fBodyAccMag-std() variable from the raw data for each subject & activity observed.

###avgfbodybodyaccjerkmagstd
The mean of the fBodyBodyAccJerkMag-std() variable from the raw data for each subject & activity observed.

###avgfbodybodygyromagstd
The mean of the fBodyBodyGyroMag-std() variable from the raw data for each subject & activity observed.

###avgfbodybodygyrojerkmagstd
The mean of the fBodyBodyGyroJerkMag-std() variable from the raw data for each subject & activity observed.

