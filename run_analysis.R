


features <- read.table("C:/Users/suraj/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", quote="\"", comment.char="",col.names = c("val","functions"))
activity_labels <- read.table("C:/Users/suraj/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="",col.names = c("activity","labels"))
subject_test <- read.table("C:/Users/suraj/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="",col.names = c("subject"))
X_test <- read.table("C:/Users/suraj/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="",col.names = features$functions)
y_test <- read.table("C:/Users/suraj/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="",col.names = c("activity"))
subject_train <- read.table("C:/Users/suraj/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="",col.names = c("subject"))
X_train <- read.table("C:/Users/suraj/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="",col.names = features$functions)
y_train <- read.table("C:/Users/suraj/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="",col.names = c("activity"))



x<-rbind(X_test,X_train)
y<-rbind(y_test,y_train)
subj<-rbind(subject_test,subject_train)
merge_dataset<-cbind(subj,x,y)



measurement1<-select(merge_dataset,subject,activity,contains("mean"),contains("std"))
measurement2<-merge_dataset %>% select(subject,activity,contains("mean"),contains("std"))


measurement2$activity<-activity_labels[measurement2$activity, 2]





names(measurement2)<-gsub("Acc", "Accelerometer", names(measurement2))
names(measurement2)<-gsub("Gyro", "Gyroscope", names(measurement2))
names(measurement2)<-gsub("BodyBody", "Body", names(measurement2))
names(measurement2)<-gsub("Mag", "Magnitude", names(measurement2))
names(measurement2)<-gsub("^t", "Time", names(measurement2))
names(measurement2)<-gsub("^f", "Frequency", names(measurement2))
names(measurement2)<-gsub("tBody", "TimeBody", names(measurement2))
names(measurement2)<-gsub("-mean()", "Mean", names(measurement2), ignore.case = TRUE)
names(measurement2)<-gsub("-std()", "Std", names(measurement2), ignore.case = TRUE)
names(measurement2)<-gsub("-freq()", "Frequency", names(measurement2), ignore.case = TRUE)


FinalData <- measurement2 %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

write.table(FinalData,"FinalDataset.txt",row.name=FALSE)

