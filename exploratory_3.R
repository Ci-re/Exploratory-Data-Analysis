library(tidyverse)
library(dplyr)
library(Hmisc)
library(funModeling)
library(tidyr)

library(ggplot2)
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))
head(diamonds)
diamonds %>% count(carat)
summary(diamonds)
View(diamonds)

diamonds %>% ggplot() + geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

smaller = filter(diamonds , carat < 3)
smaller %>% ggplot() + geom_histogram(mapping =  aes(x = carat), binwidth = 0.1)

count(smaller, cut_width(carat, 0.1))
