cleaning_data
=============
This code creates a tidy data set as per assignment requirements
The variables are used as mentioned in the assigment

step 1:
All the text files are read into the R using read.table

step 2: 
The datasets are binded together by using rbind forming a  data sets \
--variables from features.txt (containing data with x_train and x_test)
--subject
--Activity (containing data with y_train and y_test)

step3:(question 1)
the datasets with x values and subject are binded 

step 4:(question 2)
using grep variables with name "mean" and "std" are subsetted

step 5:(question 3)
the values under activity with y (y_text,y_train -both combined) values are binded with
dataset formed earlier forming a complete dataset

step 6:(question 4)
the activity has been replaced with activity labels

step 7: (question 5)
a final data set has been created calculating the  average of each variable for each activity and each subject. 

step 8: 
the final data set has been exported to text file



    

