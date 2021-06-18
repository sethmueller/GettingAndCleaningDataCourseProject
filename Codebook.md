CODEBOOK.MD

TABLE OF CONTENTS
A. Overview
B. Assumptions
C. Description of tidydata.txt 
D. Contents of run_analysis.R

A. OVERVIEW

In this package are four files of interest:
  1) README.md
  2) Codebook.md
  3) run_analsyis.R
  4) tidydata.txt

These four files will contain information needed to independently create and explore future analysis with tidydata.txt.


B. ASSUMPTIONS

It is assumed the following files are present in a directory called "data" in your current working directory before attempting to run the scripts in run_analysis.R

  - activity_labels.txt
  - features.txt
  - subject_test.txt
  - subject_train.txt
  - X_test.txt
  - X_train.txt
  - Y_test.txt
  - Y_train.txt

The scripts in run_analysis also require the following libraries to be installed and loaded to function properly:

  - dplyr
  - tidyr
  - data.table
  
The scripts to load tidydata.txt assumes that the file is located in the user's current working directory.


C. RUN_ANALYSIS.R

The script will perform the following steps
  1.  Load necessary libraries used throughout the script
  2.  Load in data sets from user's current working directory "data" folder
  3.  Update column names for non-observational data sets
  4.  Update column names for observational data sets
  5.  Combine multiple data sets into one dataframe (df) for further cleaning and manipulation
  6.  Extract mean and std variables of interest out of our dataframe (df)
  7.  Gather all measurement columns and reshape the dataframe to a more tidy data set format
  8.  Clean up measurement.variable column to be more descriptive 
  9.  Split measurement.variable column into 4 separate columns (class, type, variable, and axis)
  10. Join the measurement.variable and axis (X/Y/Z) back together
  11. Add activity labels information to the tidyDF and reorder the columns for the final output
  12. OPTIONAL - scripts to write out and read in the tidydata.txt file



D. TIDYDATA.TXT

  1.  SUBJECTID
        - integer identifying the ID of the subject the observation was captured for
  
  2.  ACTIVITYTYPE
        - string identifying the type of activity being performed for the observation captured
        
  3.  MEASUREMENT.CLASS
        - string identifying the class of the measurement that the variable was captured for
          A.  frequency
          B.  time
          
  4.  MEASUREMENT.TYPE
        - string identifying the type of the measurement that the variable was captured for
          A.  mean (average)
          B.  std (standard deviation)
  
  5.  MEASUREMENT.VARIABLE
        - string identifying the variable that was captured for this particular observation
        - 23 unique variables containing
            - 10 variables with observations on frequency & time for 20 total variables
            - 10 variables with observations on time only
            - 3 variables with observations on frequency only
            - for a total of 33 separate variables with observations

          A.  BodyAccJerkMag (observations recorded for time)
          B.  BodyAccJerkX (observations recorded for frequency & time)
          C.  BodyAccJerkY (observations recorded for frequency & time)
          D.  BodyAccJerkZ (observations recorded for frequency & time)
          E.  BodyAccMag (observations recorded for frequency & time)
          F.  BodyAccX (observations recorded for frequency & time)
          G.  BodyAccY (observations recorded for frequency & time)
          H.  BodyAccZ (observations recorded for frequency & time)
          I.  BodyBodyAccJerkMag (observations recorded for frequency)
          J.  BodyBodyGyroJerkMag (observations recorded for frequency)
          K.  BodyBodyGyroMag (observations recorded for frequency)
          L.  BodyGyroJerkMag (observations recorded for time)
          M.  BodyGyroJerkX (observations recorded for time)
          N.  BodyGyroJerkY (observations recorded for time)
          O.  BodyGyroJerkZ (observations recorded for time)
          P.  BodyGyroMag (observations recorded for time)
          Q.  BodyGyroX (observations recorded for frequency & time)
          R.  BodyGyroY (observations recorded for frequency & time)
          S.  BodyGyroZ (observations recorded for frequency & time)
          T.  GravityAccMag (observations recorded for time)
          U.  GravityAccX (observations recorded for time)
          V.  GravityAccY (observations recorded for time)
          W.  GravityAccZ (observations recorded for time)
        
        
  6.  MEAN
        - numeric identifying mean of specified variable

