Readme instructions for my script and additional information about the script.

In order to arrive at a tidy data set and get the results requested for this project, there are a number of steps that my script runs.

My project analysis script reads both training and test data sets onto data frames. It then reads a features file/data set which conatins the names of columns or variables. This was done in order to provide a description for values in the data set. Once this is done then, I combined data sets into one. At this point, the script will narrow the data set to include only the mean and std measurements. In this step, the script extracted the specific columns. At this juncture, I used Excel to format the specific list of variables names (I could not come up with clean solution in R).  
Once this list was formed, the script would create a “trimmed” data frame containing the specific measurements. We can then add the activity and subject data sets onto this data frame. In this section of the script, we renamed the activity codes to something more human readable (activity names).
The next section in the script will rename (trim or modify expressions) measurement variables names. The script removes unwanted characters in these variables names and make easier to read their descriptions. The last section of the script would group and summarize each measurement by activity and subject entity. 

Lastly, I find very useful to read other scripts that include comments within the scripts, so I have decided to enter comments throughout the script to inform the user of what is going on as the script executes.



