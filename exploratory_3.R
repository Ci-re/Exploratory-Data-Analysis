library(tidyverse)
library(dplyr)
library(Hmisc)
library(funModeling)
library(tidyr)
#Data manipulation
library(ggplot2)
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))
head(diamonds)
diamonds %>% count(carat)
summary(diamonds)
View(diamonds)

diamonds %>% ggplot() + geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

smaller = filter(diamonds , carat < 3)
smaller %>% ggplot() + geom_histogram(mapping =  aes(x = carat), binwidth = 0.1)

count(smaller, carat, 0.99)

diamonds %>% ggplot(mapping = aes(x= carat, color = cut)) + geom_histogram(binwidth = 0.1)

diamonds %>% ggplot(mapping = aes(x = carat)) + geom_histogram(binwidth = 0.01)

diamonds %>% ggplot(mapping = aes(x = y)) + geom_histogram(binwidth = 0.5)

diamonds %>% ggplot(mapping = aes(x = y)) + geom_histogram(binwidth = 0.25) + coord_cartesian(ylim = c(0,50))


unusual = diamonds %>% filter(y < 3 | y > 20) %>% select(price, x, y, z) %>% arrange(y)
unusual

## This shows the fact that diamonds with y dimension lesser than 3 happens to be very expensive, which on a normal day
## there shouldn't be a diamond without a dimension missing, it doesn't sound normal
## and diamonds with very large y dimension happen to be very cheap like its nothing, shows that something 
## is wrong with the data.


##Excercises
##Explore the distribution of each of the x, y, and z variables in 
##diamonds. What do you learn? Think about a diamond and how you might 
##decide which dimension is the length, width, and depth.

diamonds %>% ggplot(mapping = aes(x = x)) + geom_histogram(binwidth = 0.5) + ggtitle("Histogram of x dimension")
diamonds %>% ggplot(mapping = aes(x = x)) + geom_histogram(binwidth = 0.5) + coord_cartesian(ylim = c(0,50), xlim = c(0,10)) + ggtitle("Histogram of x dimension")

unusual_X = diamonds %>% filter(x < 2) %>% select(price, x, y) %>% arrange(y)
unusual_X

diamonds %>% ggplot(mapping = aes(x = z)) + geom_histogram(binwidth = 0.5) + coord_cartesian(ylim = c(0,50))
unusual_z = diamonds %>% filter(z < 0.5 | z > 7.5) %>% select(price, x, y, z) %>% arrange(z)

diamonds %>% ggplot(mapping = aes(x = price)) + geom_histogram(binwidth = 1000) + coord_cartesian(ylim = c(0, 2000))

View(diamonds %>% filter(carat == 1) %>% arrange(carat))
View(diamonds %>% filter(carat == 0.99) %>% arrange(carat))

diamonds %>% ggplot(mapping = aes(x = carat)) + geom_histogram(binwidth = 0.01) + coord_cartesian(ylim = c(0,50))
