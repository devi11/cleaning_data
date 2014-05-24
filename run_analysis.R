### GETTING AND CLEANING DATA
### ASSIGNMENT 2


## * POINT 1
## Reading data into R

features = read.table("UCI HAR Dataset/features.txt",
               col.names=c("id", "name"), 
               fill=FALSE, 
               strip.white=TRUE)
featureNames <- as.vector(features$name)

others <- c('Subject', 'Activity')

columns <- c(featureNames, others)

Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt",
                     col.names=featureNames, 
                     fill=FALSE, 
                     strip.white=TRUE)

Xtest <- read.table("UCI HAR Dataset/test/X_test.txt",
                     col.names=featureNames, 
                     fill=FALSE, 
                     strip.white=TRUE)

Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt",
                     col.names=c('Activity'), 
                     fill=FALSE, 
                     strip.white=TRUE)

Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt",
                     col.names=c('Activity'), 
                     fill=FALSE, 
                     strip.white=TRUE)

subTrain <- read.table("UCI HAR Dataset/train/subject_train.txt",
                       col.names=c('Subject'), 
                       fill=FALSE, 
                       strip.white=TRUE)

subTest <- read.table("UCI HAR Dataset/test/subject_test.txt",
                       col.names=c('Subject'), 
                       fill=FALSE, 
                       strip.white=TRUE)

## binding the datasets
Xdata <- rbind(Xtrain, Xtest)
Ydata <- rbind(Ytrain, Ytest)
subData <- rbind(subTrain, subTest)


df <- cbind(Xdata, subData)

## * POINT 2
## collecting variables with mean and standard deviation

td1 <- df[grep("mean", names(df)) ]
td2 <- df[grep("std", names(df))]
td3 <- subset( df,select=c("Subject"))

  
tidydata <- cbind(td3,td1,td2)

# * point 3
#Add activities to tidy data
tidydata <- cbind(Ydata,tidydata)

# * point 4
#Load activity labels
aLabels <- read.table("UCI HAR Dataset/activity_labels.txt",
                      col.names=c('Activity', 'Acivity_Label'), 
                      fill=FALSE, 
                      strip.white=TRUE)

#Merge to get the labels names into tidydata
tidydata <- merge(aLabels,tidydata, by.x = "Activity", by.y = "Activity", all = TRUE)


## * Point 5
#Remove the Activity column from tidydata since we now have Activity_label
tidydata$Activity <- NULL

##  creating a final tidy data
finalTidyData <-aggregate( tidydata[,3:81], tidydata[,1:2], FUN = mean )


## Exporting the data to text file
write.table(finalTidyData, "final_tidy_data.txt", sep="\t",  row.names = F)

