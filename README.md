# MechaCar_Statistical_Analysis


## Linear Regression to Predict MPG
Due to the linear behaviour of the variables contained within MechaCar's MPG data, the use of a linear-fitting model can give reasonable predictions of 0.71
![lm1_summary](https://user-images.githubusercontent.com/19878877/162633055-a035f9e1-40da-4c6a-8a2e-444a24f0f25e.png)
Attempting two comparitive extra lm models demonstrates that the two most influencial variables are Ground Clearance and Vehicle Length.  Each respectively causes an R^2 drop to 0.39 (lm2) and 0.044 (lm3) as opposed to the 0.71.

## Statistical 
The understanding of the suspension coils can be greatly improved by examining the statistics provided for each of the lots participating in the study.  The total statistical analysis of all lots contained in the car study is summarized in the table below:
![Stat_Table](https://user-images.githubusercontent.com/19878877/163041925-c4f9dca2-7e92-4cf9-ab2f-7f3b2b4494ad.png)

For the general statistics, it can be seen that the mean and median are both quite close and all lots are nearly equal to each other.  The variance on lot 3 however is quite high (170) and causes quite a variance increase in the total lots analysis as a result (62).  With the t-tests, it can therefore be noted that these are the negative t-values indicating the reversal of the trend direction.  However the corresponding p-values with these two cases, show very low which indicates an unlikely "true null".  Note that the full results of each t-test can be observed in the corresponding png files showing slightly more detail than the above summary table.

## Study Design: MechaCar vs Competition
It is valuble to the consumer to understand the performance of MechaCar versus their competition when deciding on a financially significant purchase.   Due to the current rate of gas prices around the world, this is a strong impact on consumers these days.  In Canada and the northern United States, one must also evaluate efficiency changes in the cold months.  For family use and purchases, one must also consider the safety rating and performance-impact testing.  


