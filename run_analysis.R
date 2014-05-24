# 
# 
# dat <- rbind(train[[2]],test[[2]]
#              colMeans(dat)
#              rowMeans(dat)
#              apply(dat,1,function(x)sd(x))
#              apply(dat,2,function(x)sd(x))

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
Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt",
                     col.names=c('Activity'), 
                     fill=FALSE, 
                     strip.white=TRUE)

subTrain <- read.table("UCI HAR Dataset/train/subject_train.txt",
                       col.names=c('Subject'), 
                       fill=FALSE, 
                       strip.white=TRUE)

Xtest <- read.table("UCI HAR Dataset/test/X_test.txt",
                     col.names=featureNames, 
                     fill=FALSE, 
                     strip.white=TRUE)

Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt",
                     col.names=c('Activity'), 
                     fill=FALSE, 
                     strip.white=TRUE)

subTest <- read.table("UCI HAR Dataset/test/subject_test.txt",
                       col.names=c('Subject'), 
                       fill=FALSE, 
                       strip.white=TRUE)

Xdata <- rbind(Xtrain, Xtest)
Ydata <- rbind(Ytrain, Ytest)
subData <- rbind(subTrain, subTest)

df <- cbind(Xdata, subData, Ydata)



