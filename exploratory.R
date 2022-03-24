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
glimpse(mydata)
status(mydata)


freq(mydata$thal, path_out = ".")
freq(mydata$has_heart_disease, path_out = ".")

plot_num(mydata)
View(profiling_num(mydata))

View(Hmisc::describe(mydata))

Hmisc::GiniMd(mydata$age)
