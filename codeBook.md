The ```run_analysis.R``` script performs the data preparation and all the instruction given to do in the course.

## 1. downloading and importing the dataset
The data given and data collected from the accelerometersare from the Samsung Galaxy S smartphone. To get more ingo click th link [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

click on download to download the zip file contain the dataset [Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
#### the datasets(.txt files) in zip file with their dimensions and the variable given in ```run_analysis.R``` is
<pre>
1. features        <- features.txt          : 561 rows, 2 columns
2. activity_labels <- activity_labels.txt   : 6 rows, 2 columns
3. subject_test    <- test/subject_test.txt : 2947 rows, 1 column
4. x_test          <- X_test.txt            : 2947 rows, 561 columns
5. y_test          <- y_test.txt            : 2947 rows, 1 columns
6. subject_train   <- subject_train.txt     : 7352 rows, 1 column
7. x_train         <- X_train.txt           : 7352 rows, 561 columns
8. y_train         <- y_train.txt           : 7352 rows, 1 columns
</pre>
## 2. Merges the training and the test sets to create one data set.
merging the dataset in done with rbind and cbind below is the list of variable where the instruction is done
* x <- contains the row merge of ```x_test``` and ```x_train``` by using ```rbind``` 
* y <- contains the row merge of ```y_test``` and ```y_train``` by using ```rbind```
* subj <- contains the row merge of ```subject_test``` and ```subject_train``` by using ```rbind```
* merge_dataset <- contains the column merge of ```x``` , ```y``` and ```subj``` by using ```cbind```
## 3. Extracts only the measurements on the mean and standard deviation for each measurement.
mean and std are extracted by ```contain``` and ```select``` functions below is the variable assigned to
* measurement2 <- from merge_dataset by using ```select``` columns ```subject``` ```activity``` ```contains("mean")``` ```contains("std")``` are extracted
## 4. Uses descriptive activity names to name the activities in the data set
* measurement2$activity  <- the column is changed with the columns from ```activity_labels``` by using ```activity_labels[measurement2$activity, 2]```
## 5. Appropriately labels the data set with descriptive variable names.
the column names is changed used ```gsub``` function 
* ```"Acc"``` is changed into ```"Accelerometer"```
* ```"Gyro"``` is changed into ```"Gyroscope"```
* ```"BodyBody"``` is changed into ```"Body"```
* ```"Mag"```  is changed into ```"Magnitude"```
* ```"^t"``` is changed into ```"Time"```
* ```"^f"``` is changed into ```"Frequency"```
* ```"tBody"``` is changed into ```"TimeBody"```
* ```"-mean()"``` is changed into ```"Mean"```
* ```"-std()"``` is changed into ```"Std"```
* ```"-freq()"``` is changed into ```"Frequency"```
## 6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
the below variable is the final dataset created by using ```group_by``` function for grouping activity and subject and ```summary_all``` fuction for the average
* FinalData <- from measurement2 ```group_by``` is applied to ```subject``` ```activity``` and ```summarise_all``` is used with ```mean```
