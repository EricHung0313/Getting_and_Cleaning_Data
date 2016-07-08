## The following is to pre-process the data for data analysis 
 #read the tain set,train label and subject_train into R
 setwd("C:/Users/Eric/Documents/R/R Program/Geting_cleaning_data/UCI HAR Dataset/train")
 train_set <- read.table("X_train.txt")
 train_label<-read.table("y_train.txt")
 subject_train <- read.table("subject_train.txt")
 names(subject_train) = "subject"


 #read the test set,test label and subject_test into R
 setwd("C:/Users/Eric/Documents/R/R Program/Geting_cleaning_data/UCI HAR Dataset/test")
 test_set<- read.table("X_test.txt")
 test_label<-read.table("y_test.txt")
 subject_test<-read.table("subject_test.txt")
 names(subject_test) = "subject"
 
 
 #read the feature list and activity_label into R,then assign feature to column names of train/test set. 
 setwd("C:/Users/Eric/Documents/R/R Program/Geting_cleaning_data/UCI HAR Dataset")
 feature <- read.table("features.txt", header = FALSE, sep = "")
 act_label<-read.table("activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
 colnames(train_set) = feature$V2
 colnames(test_set) = feature$V2
 
 # to add activity in test_lable and train_label
 test_label$activity <- act_label$V2[match(test_label$V1,act_label$V1)]
 train_label$activity<- act_label$V2[match(train_label$V1,act_label$V1)]
 
 # to combine all the test and train sets and activity, then put all sets in one table
 test_set_total <- cbind(subject_test,test_label,test_set)
 train_set_total <-cbind(subject_train,train_label, train_set)
 total_set <-rbind(train_set_total,test_set_total)
 total_set <-tbl_df(total_set)
 #Extracts only the measurements on the mean and standard deviation for each measurement
 df <- total_set[,grepl("mean|std|subject|activity",names(total_set))]
 
 # creates a second, independent tidy data set with the average of each variable for each
 #activity and each subject, then write it to working directory.
 df_group <- group_by(df,subject,activity)
 final_df <- summarise_all(df_group,mean)
 write.table(final_df,file = "tidydata.txt", row.names = FALSE)

 