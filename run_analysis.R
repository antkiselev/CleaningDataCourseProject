#reading data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt", header=FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt", header=FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
features<-read.table("./UCI HAR Dataset/features.txt")
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")

# 1.Merge the training and the test sets to create one data set.
Data <- cbind(rbind(X_train, X_test),rbind(Y_train, Y_test))

# 2.Extract only the measurements on the mean and standard deviation for each measurement.
ind <- sort(c(grep("mean()", features$V2), grep("std()", features$V2), dim(Data)[2]))
Data <- Data[,ind]

# 3.Use descriptive activity names to name the activities in the data set
Data <- merge(Data, activity_labels, by.x="V1.1", by.y="V1")

# 4.Appropriately label the data set with descriptive activity names.
names(Data) <- c("Activity.ID",as.character(features[ind[1:length(ind)-1],"V2"]),"Activity.Name")

# 5.Create a second, independent tidy data set with the average of each variable for each activity and each subject.
Data2 <- cbind(Data, rbind(subject_test,subject_train))
names(Data2)[dim(Data2)[2]] <- "Subject.ID"

meltData2<-melt(Data2,id=c("Activity.Name","Subject.ID"),measure.vars=names(Data2)[2:(dim(Data2)[2]-2)])
castData2 <- dcast(meltData2, Activity.Name + Subject.ID ~ variable, mean)

#export data sets
write.table(Data, "UCI_HAR_Dataset.txt")
write.table(castData2, "UCI_HAR_Means.txt")
