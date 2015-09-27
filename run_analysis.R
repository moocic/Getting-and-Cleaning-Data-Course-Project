## "1 - Merges the training and the test sets to create one data set."


# 1.1 - Read both sets data, labels and subjects into memory

trainsubj <- read.table("./train/subject_train.txt")
testsubj <- read.table("./test/subject_test.txt")
trainlabel <- read.table("./train/y_train.txt")
testlabel <- read.table("./test/y_test.txt")
trainset <- read.table("./train/X_train.txt")
testset <- read.table("./test/X_test.txt")


# 1.2 - Rename variable names of labels and subjects

names(trainlabel) <- "activity"
names(testlabel) <- "activity"
names(trainsubj) <- "subject"
names(testsubj) <- "subject"
dataset$subject <- as.factor(dataset$subject)


# 1.3 - Merge all data in one data set (adding a set variable, which refers to
# the origin of the data: train or test set)

train <- cbind(trainsubj,trainlabel,set=as.factor("train"),trainset)
test <- cbind(testsubj,testlabel,set=as.factor("test"),testset)
dataset <- rbind(train,test)




## "2- Extracts only the measurements on the mean and standard deviation for
## each measurement."


# 2.1 - Reads the feature data and searches only for the mean and std

features <- read.table("features.txt")
features$meansd <- ifelse(grepl("mean",features[,2]),TRUE,
                          ifelse(grepl("std",features[,2]),TRUE,FALSE))


# 2.2 - Subsets dataset according to the result in 2.1

dataset <- dataset[,c(1:3,(which(features$meansd)+3))]




## "3 -Uses descriptive activity names to name the activities in the data set."


# 3.1 - Replaces the activities by names

dataset$activity <- ifelse(dataset$activity==1,"WALKING",
       ifelse(dataset$activity==2,"WALKING_UPSTAIRS",
              ifelse(dataset$activity==3,"WALKING_DOWNSTAIRS",
                     ifelse(dataset$activity==4,"SITTING",
                            ifelse(dataset$activity==5,"STANDING",
                                   ifelse(dataset$activity==6,"LAYING",dataset$activity))))))


# 3.2 - Sets the activities as factor

dataset$activity <- as.factor(dataset$activity)




## "4 - Appropriately labels the data set with descriptive variable names."


# 4.1 - Replaces the variable names by the ones given in the file "features.txt"

names(dataset)[4:ncol(dataset)] <- as.character(features[which(features$meansd),2])




## "5 - From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject."


# 5.1 - Loads the libraty dplyr (needed to 5.2)

library(dplyr)


# 5.1 - Summarises the dataset, by activity and by subject, and returns the 
# average of the variables (by activity and by subject)

datasetaverage <- as.data.frame(dataset 
                                %>% group_by(subject,activity,set) 
                                %>% summarise_each(funs(mean)))




## "txt file created with write.table() using row.name=FALSE"


write.table(datasetaverage,"run_analysis_output.txt",row.name=FALSE)