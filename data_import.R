library(ggplot2)
library(dplyr)
library(tidyr)
library(Hmisc)
ag_data2 = read.csv("C:\\Users\\Cletus Emmanuel\\Desktop\\cletus\\20NCRP12YRT_AG.csv")
View(ag_data2)


str(ag_data2)
View(Hmisc::describe(ag_data2))
hist(ag_data2$accession_name , ag_data2$sprout)
plot(ag_data2$mcmds ~ ag_data2$accession_name)

mean_data = ag_data2 %>% group_by(accession_name) %>% summarise_if(is_numeric, mean, na.rm = T,)
View(mean_data)                                                              
str(mean_data)
Hmisc::Mean(mean_data[2:52])
mean_data %>% ggplot(aes(accession_name, mcmds)) + geom_bar(stat = "identity")
mean_data %>% ggplot(aes(accession_name, mcbbs)) + geom_bar(stat = "identity")
mean_data %>% ggplot(aes(factor(accession_name), mcbbs)) + geom_boxplot()

as.numeric(sapply(mean_data, mean))

