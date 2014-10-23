x_test <- read.csv("X_test.txt", sep = "", header = FALSE)
names(x_test)
nrow(x_test)
y_test <- read.csv("y_test.txt", sep = "", header = FALSE)
head(y_test)
names(y_test)
features <- read.csv("features.txt", sep = "", header = FALSE)
names(features)
#add column names to test data set
colnames(x_test) <- features[, 2]
names(x_test)
x_train <- read.csv("X_train.txt", sep = "", header = FALSE)
names(x_train)
nrow(x_train)
y_train <- read.csv("y_train.txt", sep = "", header = FALSE)
nrow(y_train)
#add column names to train data set
colnames(x_train) <- features[, 2]
names(x_train)
x_data <- rbind(x_train, x_test)
nrow(x_data)
ncol(x_data)
names(x_data)
ls()
colnum(x_data)
ncol(x_data)
names(x_data)
col_list <- names(x_data)
head(col_list)
head(col_list, n=10)
ls()
grep("-mean", col_list)
grep("-std", col_list)
## After grepring the Column Variables from col_list, use excel to format c list below
## and brought back list for extracting mean and std measurment columns
extract_data <- x_data[c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,294,295,296,345,346,347,348,349,350,373,374,375,424,425,426,427,428,429,452,453,454,503,504,513,516,517,526,529,530,539,542,543,552)]
ncol(extract_data)
nrow(extract_data)
class(extract_data)
names(extract_data)
#add activity label column data set to extracted data
y_data <- rbind(y_train, y_test)
ncol(y_data)
nrow(y_data)
extract_complete <- cbind(y_data, extract_data)
ncol(extract_complete)
nrow(extract_complete)
colnames(extract_complete)[1] <- "activity"
### add subject column data set to extracted data
subject_test <- read.csv("subject_test.txt", sep = "", header = FALSE)
subject_train <- read.csv("subject_train.txt", sep = "", header = FALSE)
ls()
subject_data <- rbind(subject_train, subject_test)
nrow(subject_data)
ncol(subject_data)
extract_final <- cbind(subject_data, extract_complete)
nrow(extract_final)
ncol(extract_final)
colnames(extract_final)[1] <- "subject"
### Rename acitivity number to activity name
extract_final$activity[extract_final$activity %in% "1"] <- "walking"
extract_final$activity[extract_final$activity %in% "2"] <- "walking_upstairs"
extract_final$activity[extract_final$activity %in% "3"] <- "walking_downstairs"
extract_final$activity[extract_final$activity %in% "4"] <- "sitting"
extract_final$activity[extract_final$activity %in% "5"] <- "standing"
extract_final$activity[extract_final$activity %in% "6"] <- "laying"
#trim or modify variables names to show the use of string manipulation
# Doing some manipulation to get columan names first.
#trimming unwanted characters on column names.
extract_final_list <- names(extract_final)
extract_final_list
trim_list <- sub("()", "", extract_final_list, fixed = TRUE)
trim_list
colnames(extract_final) <- trim_list
names(extract_final)

##now we are going to group and summarize (average) each variable for each activity
## and for each subject. There are several ways to do this, but I chosen the dplyr
## package with group_by and summarize_each functions. The results can be written
## later on to a file.
## dont forget to load this handy labrary -- library(dplyr)
##extract_final %>% group_by(activity) %>% summarise_each(funs(mean))
## Exclude subject column from averaging
##extract_final %>% group_by(activity) %>% summarise_each(funs(mean), -matches("subject"))
## Final statement to group by acitivty and subject
##extract_final %>% group_by(activity, subject) %>% summarise_each(funs(mean), -matches("subject"))
library(dplyr)
extract_final %>% group_by(activity, subject) %>% summarise_each(funs(mean), -matches("subject"))
## write summary to file with write.table.
## We are done!!
summary_data <- extract_final %>% group_by(activity, subject) %>% summarise_each(funs(mean), -matches("subject"))
nrow(summary_data)
ncol(summary_data)
write.table(summary_data, file = "summarydataTA.txt", row.names = FALSE)








