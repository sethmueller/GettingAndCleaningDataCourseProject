README.MD

For this course project, I have taken a set of smartphone data sets and created a new data set that is a summarization of the mean of certain variables captured in the original experiment.   More detailed information about the original experiment can be found here:   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The initial data set can also be found here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The original data set followed 30 subjects performing 6 different activities (described further in Codebook.md).   For this analysis, we are only interested in the "mean" and "std" measurements captured for 33 different variables related to the smartphone Samsung Galaxy S.

The data set (tidydata.txt) produced can be recreated using the run_analysis.R scripts included within this project.  It is assumed the following data files are present in a directory called "data" in your current working directory:

  - activity_labels.txt
  - features.txt
  - subject_test.txt
  - subject_train.txt
  - X_test.txt
  - X_train.txt
  - Y_test.txt
  - Y_train.txt
  
A more detailed description of the measurements captured can be found in the Codebook.md file also included in this project.   Additionally, the scripts to load tidydata.txt can also be found in run_analysis.R for your convenience.   These scripts to load tidydata.txt assumes the data set is residing in the user's current working directory.  

The final tidydata.txt data set contains the following columns of data:

  - subjectid
  - activitytype
  - measurement.class
  - measurement.type
  - measurement.variable
  - mean
  
A decision was made to separate out the classes (time and frequency) and types (mean and std) from the 33 variables that were captured.   It was deemed there was value in having the ability to do slicing on the classes and types without any further data manipulations by the end user.   It was also believed that there is value having these separated out for future visualizations of the data (plotting/graphing) of similarly classed/typed data.

This data set contains 11,880 data rows and 1 header record.  (30 subjects * 6 activities * 33 variables * 2 types per variable * 1 class per variable).   Additional information regarding tidydata.txt can be found in the Codebook.md file.
