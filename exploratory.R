install.packages("tidyverse")
install.packages("funModeling")
install.packages("Hmisc")

library(tidyverse)
library(Hmisc)
library(funModeling)

disease_data = read.csv("heart-disease.csv")
head(data)
View(data)

colnames(disease_data)[1] = "age"


mydata = funModeling::heart_disease %>% select(age, max_heart_rate, thal, has_heart_disease)
head(mydata)
