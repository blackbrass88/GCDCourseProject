---
title: "Getting and Cleaning Data: Course Project README"
author: "Jacob Schwan"
date: "4/25/2015"
output:
    html_document:
    keep_md: yes
---

This repository contains the following files necessary to complete the Getting and Cleaning Data course project:

* tidyData.txt
* CodeBook.md
* run_analysis.R
* README.md

## tidyData.txt
This file shows the average of a subset of variables for each subject and activity type in the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html).  The selected subset of variables are a mean or standard deviation of an observed measurement from the original study.

This tidy data set achieves all 5 requirements of the course project for the Coursera Class [Getting and Cleaning Data Session 013](http://class.coursera.org/getdata-013).

See the [CodeBook.md](CodeBook.md) file for more details.

## CodeBook.md
A code book describing the data in tidyData.txt.  It includes information on each variable in tinyData.txt and how to replicate the data set.

## run_anlaysis.R
An R script used to build tidyData.txt from the raw data provided by the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

####Package Dependencies
* [LaF - Fast access to large ASCII files](http://cran.r-project.org/web/packages/LaF/index.html) - provides faster loading of the raw data file.
* [dplyr - A Grammar of Data Manipulation](http://cran.r-project.org/web/packages/dplyr/index.html) - for data frame manipulation

####Script Description
The script contains a function called ```cleanSet()``` which returns a single data frame merging the X, y, and subject data files for either the test group or the train group.  The function is passed a single variable identifying the set to load & clean.  The variable can have the value *test* or *train*.  When called the function loads the X, y, and subject data files from either the test or train folders.  It loads the variable names as headers, converts the activity number to a factor with the activity name, and merges the 3 data files.

The script starts by loading the activity names from the *activity_labels.txt* file and the header variables from the *features.txt* file.  These are required by the ```cleanSet()``` function.  The script then uses the ```cleanSet()``` function to return merged data frames of the test & train group.  Then merges the test & train groups into a single data frame.

Next, it modifies the header variable names to comply with the tidy data standards of all lowercase and no punctuation or spaces.  Then it pulls out the subset of data using the ```select()``` function grab variable that contain the words *mean* or *std*, as outlined on the [course project page](http://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3). Then groups the subset of data by activity and subject and builds a data frame which takes the average of each variable by each activity and subject.  Finally, it modifies the variable names in the this data frame to reflect that they are different from the raw data variables and writes the data frame to *tidyData.txt*.

## README.md
This file, containing information about the other files contained in this repository.


### Relavent Links & Sources
[Course Project Description](http://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3)
[Getting and Cleaning Data Course](http://class.coursera.org/getdata-013)
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html)
[Raw Data ZIP file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)



