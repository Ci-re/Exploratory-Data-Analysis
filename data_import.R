library(ggplot2)
library(dplyr)
library(tidyr)
library(Hmisc)
library(funModeling)
library(readxl)

ag_data = read_excel("20NCRP12YRT_AG.xls",
                     sheet = 1, na = c("NA", " ", "."))
View(ag_data)
colnames(ag_data)[c(53,54)] = c("frshwt", "dm")

ag_data = data.frame(ag_data)
View(ag_data)

for(i in 1:8){
  ag_data[,i] = as.factor(ag_data[,i])
}

for(i in 9:54){
  ag_data[,i] = as.numeric(ag_data[,i])
}

ag_data %>% ggplot(aes(x = block_number, y = tc)) + geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 75, hjust = 1, vjust = 1))
