---
title: "Codebook"
author: "Giacomo Gamba"
date: "23-12-2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
This is the CodeBook for the 'Getting and Cleaning Data' Coursera project

##Study design and data processing

###Collection of the raw data
The data used in the project is downloadable [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and a full description is available at the site where the data was obtained: [UCI Datasets/Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  
The script file will download the data if don't find it in the local directories, so there is no need to dowload the file manually

###Notes on the original (raw) data 
The data files are stored in a zip file that once uncompressed is comosed of a folder containing:  
* activity_labels.txt: Labels for each of the six activities recorded.  
* features.txt: list of all variables recorded.  
* features_info.txt: explanation of the variables and their naming.
* README.txt: general info about the study.  
* test/ :
    - Inertial Signals: a folder that contains inertial data. **Ignored in the project**.
    - subject_test.txt: list of subject performing the recording.
    - X_test.txt: the data recorded.
    - y_test.txt: activity code for each record.
* train/ :
    - same structure as test/
    

##Creating the tidy datafile

###Guide to create the tidy data file
The R script will check if the data exists in the local directory and download them only if needed.
The script needs R to run and the 'dplyr' package, used to manipulate the data.

###Cleaning of the data
A brief description about what the script does can be found in the README file in this repository [here](/README.md)

##Description of the variables in the tiny_data.txt file
The script creates a txt file (tidy_data.txt) with the result data.
It contains a data set of 180 records of 68 variables: for each subject and activity it list the mean of 66 variables.
