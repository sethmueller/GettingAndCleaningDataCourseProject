# load libraries used throughout script
library(dplyr)
library(tidyr)
library(data.table)

# load text files used in analysis
test_x <- fread("data/x_test.txt")
test_y <- fread("data/y_test.txt")
test_subj <- fread("data/subject_test.txt")
train_x <- fread("data/x_train.txt")
train_y <- fread("data/y_train.txt")
train_subj <- fread("data/subject_train.txt")
features <- fread("data/features.txt")
activitylabels <- fread("data/activity_labels.txt")

# update column names for non-observational data sets
names(test_subj) <- "subjectid"
names(test_y) <- "activity"
names(train_subj) <- "subjectid"
names(train_y) <- "activity"
names(activitylabels) = c("activity", "activitytype")

# update column names for observational data sets
colheaders <- features$V2
names(test_x) <- colheaders
names(train_x) <- colheaders

# combine multiple data sets into one data frame (df)
test <- cbind(test_subj, test_y, test_x)
train <- cbind(train_subj, train_y, train_x)
df <- rbind(test,train)

# extract mean and std variables of interest out of our df
extractcols <- grep("subjectid|activity|mean[^A-Za-z]|std[^A-Za-z]", names(df),value=TRUE)
df <- select(df, extractcols)

# gather all measurement columns and reshape the dataframe to a more tidy data set
df <- df %>% gather( key="measurement.variable", value = "measurement", -c("subjectid", "activity")) %>%
  group_by( subjectid, activity, measurement.variable) %>%
  summarize(mean=mean(measurement))

# clean up measurement.variable column to be more descriptive 
df$measurement.variable <- sub("^t", "time.", df$measurement.variable)
df$measurement.variable <- sub("^f", "frequency.", df$measurement.variable)
df$measurement.variable <- gsub("-", ".", df$measurement.variable)
df$measurement.variable <- gsub("[^A-Za-z0-9.]","", df$measurement.variable)

# split measurement.variable column into 4 separate columns (class, type, variable, and axis)
tidyDF <- df %>% separate(measurement.variable, c("measurement.class", "measurement.variable", "measurement.type", "measurement.axis"))

# join the measurement.variable and axis back together
tidyDF <- unite(tidyDF, "measurement.variable", c("measurement.variable", "measurement.axis"), sep = "", na.rm = TRUE)

# add activity labels information to the tidyDF and reorder the columns for the final output
tidyDF <- tidyDF %>% 
    merge(activitylabels, by.x = "activity", by.y = "activity") %>% 
    select(subjectid, activitytype, measurement.class, measurement.type, measurement.variable, mean)

# OPTIONAL - scripts to write out and read in tidyDF
# write.csv(tidyDF, "tidydata.txt",row.names = FALSE)
# tidyDF <- read.csv("tidydata.txt", header = TRUE)