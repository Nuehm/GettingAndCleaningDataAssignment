==================================================================
Assingnment 1 of the Coursera course 'Getting and Cleaning Data' 
(Data Science Specialization) 
==================================================================

Codebook

In the following the R script "run_anaysis.R" is described:

1. The original data is read into R:

	- "features.txt"
	- "activity_labels.txt"
	- "subject_test.txt"
	- "y_test.txt"
	- "X_test.txt"
	- "subject_train.txt"
	- "y_train.txt"
	- "X_train.txt"

2. Names are set to the resulting data frames using also the features from "features.txt".

3. The training and the test sets are merged to create one data set (Assignment #1): 
In a first step, subjects, activities and X-data are columnwise merged for both the test- and the training-set. 
In a second step, both sets are merged rowwise to create the data frame 'ActivityData'.

4. Only the measurements on the mean and standard deviation for each measurement are extracted using the grep
function (Assignment #2):

5. In order a further column with descriptive activity names to name the activities, the file "activity_labels.txt"
was merged with 'ActivityData' by the activity number (Assignment #3).

6. All labels, which have not been appropriately labeled in 2 (see above), are labelled with descriptive names.
The columns of 'ActivityData' are reordered (Assignment #4).

7. A second, independent tidy data set "ActivityDataMean" with the average of each variable for each activity and 
each subject is created in 5 steps using 'dplyr' and 'tidyr' (Assignment #5):

1st step: a new column 'SubAct' with subject and activity together is created
2nd step: redundant information is deleted
3rd step: the resulting data frame is grouped by 'SubAct'
4th step: the data frame is summarized by 'SubAct' in order to calculate the mean
5th step: 'SubAct' is separated into two individual columns in order to make the dataset tidy.

8. The datasets are saved as txt-files "ActivityData.txt" and "ActivityDataMean.txt".

============================================================================================

In the following, the two datasets "ActivityData.txt" and "ActivityDataMean.txt" are decribed:

"ActivityData.txt" contains 

- 'subject': an identifier of the subject who carried out the experiment.
- 'activity':an activity number
- 'activityName': an activity name
- A 66-feature vector with mean and standard deviation of time and frequency domain variables. 



"ActivityDataMean.txt" contains 

- 'subject': an identifier of the subject who carried out the experiment.
- 'activity':an activity name
- A 66-feature vector with averages for each subject and activity of the mean and the standard deviation 
  of time and frequency domain variables. 


For more information about the original dataset contact: activityrecognition@smartlab.ws