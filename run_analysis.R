setwd("./UCI HAR Dataset")

# read 'features' and 'activity labels'
print("read 'features' and 'activity labels'...")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

# read 'test' data:
print("read 'test' data...")
setwd("./test")

s_test <- read.table("subject_test.txt")
y_test <- read.table("y_test.txt")
X_test <- read.table("X_test.txt")

setwd("..")

# read 'train' data:
print("read 'train' data...")
setwd("./train")

s_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")
X_train <- read.table("X_train.txt")

setwd("..")
setwd("..")

# set names (4. Appropriately labels the data set with descriptive variable):
names(s_test) <- "subject"
names(y_test) <- "activity"
names(X_test) <- features[, 2]

names(s_train) <- "subject"
names(y_train) <- "activity"
names(X_train) <- features[, 2]

# 1. Merges the training and the test sets to create one data set:
print("1. Merges the training and the test sets to create one data set")
testDat <- cbind(s_test, y_test, X_test)
trainDat <- cbind(s_train, y_train, X_train)
ActivityData <- rbind(testDat, trainDat)

# 2. Extracts only the measurements on the mean and standard 
#    deviation for each measurement:
print("2. Extract columns with 'mean' and 'std'")
ActivityData <- ActivityData[, c(1, 2, grep("mean\\(|std", names(ActivityData)))]

# 3. Uses descriptive activity names to name the activities 
#    in the data set:
print("3. create new column (mutate)")
ActivityData <- merge(ActivityData, activity_labels, by.x = "activity", 
                                                        by.y = "V1")

# 4. Appropriately labels the data set with descriptive variable
#    see also above: set names
print("4. Appropriately labels the data set with descriptive variable")
names(ActivityData)[ncol(ActivityData)] <- "activityName"
names(ActivityData) <- sub("^t", "Time-", names(ActivityData))
names(ActivityData) <- sub("^f", "Freq-", names(ActivityData))
names(ActivityData) <- sub("\\(\\)", "", names(ActivityData))

# reordering columns:
ActivityData <- ActivityData[, c(2, 1, ncol(ActivityData), 3:(ncol(ActivityData)-1))]
#print(names(ActivityData))


# 5. From the data set in step 4, creates a second, independent 
#    tidy data set with the average of each variable for each
#    activity and each subject.
print("5. From the data set in step 4, creates a second, independent...")
library(dplyr)
library(tidyr)
# 1st step: create new column with Subject and activity together:
ActivityDataMean <- ActivityData %>%
                    mutate(subject_activity = paste(subject, "-", activityName, sep = "")) %>%
                    select(-subject, -activity, -activityName) %>%
# 2nd step: group by SubAct, summarize and calculate mean:
                    group_by(subject_activity) %>% 
                    summarise_each(funs(mean)) %>%  
# 3rd step: make dataset tidy
                    separate(subject_activity, into = c("subject", "activity"), sep = "-") %>%
                    arrange(as.numeric(subject), activity)

# Write table as .txt:
print("Write table as .txt...")
write.table(ActivityData, file = "ActivityData.txt", sep = " ")
write.table(ActivityDataMean, file = "ActivityDataMean.txt", sep = " ")


# remove original and temp data:
rm(s_test); rm(y_test); rm(X_test)
rm(s_train); rm(y_train); rm(X_train)
rm(testDat); rm(trainDat)

