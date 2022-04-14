getwd()

## Introduction to R for statistical analysis in plant breeding

trial101 = data.frame(
  variety = c("G01-US234", "G05-BT456", "Ind01", "G11-DR234", "check") , 
  yield = c(6323.3, 2515.2,5611, 7729, 7843.25),
  height = c(123.30, 95.2, 113, 89.45, 145.67)
)

trial101

## Check column names
names(trial101)
colnames(trial101)

#Select specified columns and rows
trial101[c(1,2), c(2,3)]

## Extract specific column from a data frame
trial101$yield

## Finding the mean of a column
mean(trial101$yield)

##  Adding new columns to a data frame
trial101$flowering = c(87, 101, 88, 120, 90)

## importing tidyverse
library(tidyverse)

## Check out the structure of your data frame
str(trial101)

## change data frame trial101 to a Tibble
trial101.new = as_tibble(trial101)
trial101.new

## importing excel and csv files into R
mydata = read_csv("heart-disease.csv")
mydata

library(readxl)
mydata2 = read_excel("18ayt5USavannahKYK.xls", sheet = 1)
mydata2
names(mydata2)

mydata2$clones

## Using the pipe %>% and filter function
mydata2.obama = mydata2 %>% filter(startsWith(environ, "O"))
View(mydata2.obama)
head(mydata2.obama)

## getting null values
mydata2 %>% filter(is.na(comment))


## Using the arrange function
mydata2.arrange = mydata2 %>% arrange(dm)
View(mydata2.arrange)
mydata2.arrange2 = mydata2 %>% arrange(clones, environ, dm)
View(mydata2.arrange2)

## Using the select function, just like filtering
## Filtering is by rows, while selecting is by columns

mydata2.short = mydata2 %>% select(clones, trial_type, yield, dm)
mydata2.short

## Using select function to position a variable to the start of
## the end of a table.
mydata2.short2 = mydata2 %>% select(dm, everything())
mydata2.short2

## Using the mutate function to add new columns to our table
mydata2.new_column = mydata2.short %>% mutate(perc_dm = ifelse(dm > 30, dm/100, NA))
mydata2.new_column

## Using the summarise function to group by and centralize calculations
## on data sets and columns
mydata2.short %>% 
  group_by(clones, trial_type) %>% 
  summarise(clones_yield = mean(yield, na.rm = TRUE)) %>%
  arrange(desc(clones_yield))


## Count the number of observation after summarizing or grouping
mydata2.short %>% 
  group_by(clones) %>%
  count(n = n())

