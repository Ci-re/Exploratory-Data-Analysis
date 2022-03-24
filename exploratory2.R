data(mtcars)

## First is find the structure of your data
str(mtcars) ## 32 observation and 11 columns
head(mtcars) ## Check the first 5 rows of your data
fivenum(mtcars$mpg) ## Interquatile Range $$ Gives us 5 values, including, the min value, 25th percentile value, mid value, 75 percentile value, and maximum value
hist(mtcars$mpg, breaks = 10) ## Histogram of frequency against mpg
IQR(mtcars$mpg) ## Interquatile range, between 75 and 25th percentile
