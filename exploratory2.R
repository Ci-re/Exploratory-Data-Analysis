data(mtcars)

## First is find the structure of your data
str(mtcars) ## 32 observation and 11 columns
head(mtcars) ## Check the first 5 rows of your data
fivenum(mtcars$mpg) ## Interquatile Range $$ Gives us 5 values, including, the min value, 25th percentile value, mid value, 75 percentile value, and maximum value
hist(mtcars$mpg, breaks = 10) ## Histogram of frequency against mpg
IQR(mtcars$mpg) ## Interquatile range, between 75 and 25th percentile
boxplot(mtcars$mpg)


data(iris)
str(iris)
head(iris)

par(bg = "gray")
boxplot(iris[,3]~iris[,5], main = "Boxplot of Sepal length", xlab = "Species", ylab = "Sepal length", col = "red")


## Boxplot using the lattice package
install.packages("lattice")
library(lattice)

lattice::bwplot(iris[,3] ~ iris[,5], main = "Petal length Against Species", xlab = "species", ylab = "Petal length", col = "red")
lattice::bwplot(iris[,3] ~ iris[,5], main = "Petal length Against Species", xlab = "species", ylab = "Petal length", col = "turquoise1", pch = 25)
lattice::xyplot(iris[,3] ~ iris[,5], main = "Petal length Against Species", xlab = "species", ylab = "Petal length", col = "black", pch = 1)


## Boxplot using the GGPLot package
library(ggplot2)
library(dplyr)
qplot(Species, Sepal.Length, data = iris) + geom_boxplot()

## Summary
summary(iris)

data(mtcars)
summary(mtcars)

par(bg = "white")
boxplot(mtcars)
boxplot(mtcars$mpg ~ mtcars$cyl)


## using the lattice library
lattice::bwplot(mtcars$mpg ~ mtcars$cyl)
qplot(as.character(cyl), mpg, data = mtcars) + geom_boxplot()
class(mtcars$cyl)

Hmisc::describe(mtcars$mpg)

## mtcars
funModeling::data_country
Hmisc::describe(funModeling::data_country)
describe(funModeling::data_country)
data.country = funModeling::data_country
str(data.country)
library(dplyr)
library(tidyr)
library(funModeling)
selected.data = data.country %>% subset(country == "France")
selected.data
summary(selected.data)
freq_data = head(freq(data.country, "country"), 10)
freq_data
freq(data.country, "has_flu")
freq(selected.data, "has_flu")


country_freq = freq(data.country, "country", plot = F)
country_freq

head(country_freq, 10)
data.country$country_2 = ifelse(data.country$country %in% country_freq[1:10,"country"], data.country$country, "other")
data.country$country_2
freq(data.country, "country_2", plot=T)


## Livebook
library(dplyr)
library(funModeling)
library(tidyr)
library(tidyverse)


df_status(funModeling::heart_disease)
Hmisc::describe(heart_disease)

my_data_status = df_status(heart_disease, print_results = F)
my_data_status

## Remove variables with more than 60% of Zeros
var_toRemove = my_data_status %>% filter(p_zeros > 60) %>% .$variable
var_toRemove

## This line of code will select the entire heart disease dataframe except the variables to remove
heart_disease2 = select(heart_disease, -one_of(var_toRemove))
df_status(heart_disease2)

## Order your data by p_zeros
arrange(my_data_status, -p_zeros) %>% select(variable, q_zeros, p_zeros)

# total rows, columns, and column names
nrow(heart_disease)
ncol(heart_disease)
colnames(heart_disease)

freq(data = heart_disease, input = c("thal", "chest_pain"))
freq(data = heart_disease, "carb")
