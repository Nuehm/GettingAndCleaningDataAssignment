==================================================================
Assingnment 1 of the Coursera course 'Getting and Cleaning Data' 
(Data Science Specialization) 
==================================================================

The pupose of this work is to merge and to clean two datasets.

The datasets were taken from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data originates from the Human Activity Recognition Using Smartphones Dataset
Version 1.0 [1].

The original data gives information about 3-axial linear acceleration and 3-axial angular velocity measured by
the accelerometer and the gyroscope of a smartphone (Samsung Galaxy S II), worn by 30 persons, in the following 
called 'subjects', performing 6 different activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, 
STANDING, LAYING. 
The dataset represents 10299 independent preprocessed sensor signals in time- and frequency domain. 
The original data was split in two parts called 'train' and 'test'.

======================================

The present repository includes:

- the R script "run_analysis.R", which was created in order to merge and to clean the two datasets to get two new 
  datasets "ActivityData.txt" and "ActivityDataMean.txt".
	
- ActivityData.txt 

- ActivityDataMean.txt

- the codebook "CodeBook.md", which describes the R script "run_analysis.R" and the two data files.


In "ActivityData.txt", the information, further described in the codebook, is given for all 10299 measurements.
In "ActivityDataMean.txt" the data from "ActivityData.txt" is averaged for each subject and each activity, resulting
in 30 x 6 = 180 lines.

======================================

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on 
Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted 
Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their 
institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
