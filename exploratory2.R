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
 