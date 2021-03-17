## Getting-and-Cleaning-data-Project for the Getting and Cleaning Data Course Project

This repository is Nathaniel Kinsmans submission for the peer-graded assignment for the getting and cleaning data course project. It contains instructions on how to run code/analysis on the "human activity recognition" dataset (A link to the archive is below). However please note that the run_analysis.R will download a copy of the necessary dataset.

Link to Dataset (Below)
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Files
  (1) CodeBook.md is a code book that goes through and describes the variables, data and any work or changes that were done to organize the data set.
  
  (2) The run_analysis.R code performs the data prep, which is then followed by the five steps that are required by the course project's outline:
        (2a) Merges the training and the test sets to create one data set.
        (2b) Extracts only the measurements on the mean and standard deviation for each measurement.
        (2c) Uses activity names to name the activities in the data set.
        (2d) Labels the data set with variable names.
        (2e) Creates an independent tidy data set with the averages of each variable for each activity and subject.
     
   (3)FinalData.txt is the exported final data after all the steps above are run.
