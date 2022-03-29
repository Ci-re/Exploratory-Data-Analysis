library(ggplot2)
library(dplyr)
library(tidyr)
library(Hmisc)
library(funModeling)
ag_data = read.csv("20NCRP12YRT_AG.csv")
head(ag_data)
selected_cols = select(ag_data, -one_of(c("Visual.Rating", "DOH", "Comment", "Comment.1", "comment.2","picture")))
View(selected_cols)

data_status = df_status(selected_cols)
filtered_data = filter(data_status, p_na > 60) %>% .$variable
filtered_data

new_selectedData = selected_cols %>% select(-one_of(filtered_data))
df_status(new_selectedData)
view(new_selectedData)

new_selectedData$color = as.numeric(replace(new_selectedData$color, new_selectedData$color == "yellow",2))
new_selectedData$color = replace(new_selectedData$color, new_selectedData$color == "cream",1)
new_selectedData$taste = replace(new_selectedData$taste, new_selectedData$taste == "sweet",1)
new_selectedData$taste = replace(new_selectedData$taste, new_selectedData$taste == "bland",2)
View(new_selectedData)

new_selectedData$color = as.numeric(new_selectedData$color)
new_selectedData$taste = as.numeric(new_selectedData$taste)
colnames(new_selectedData)[c(51, 52)] = c("frshwt", "dm")
new_selectedData
grouped = new_selectedData %>% group_by(accession_name)
grouped
new_data = summarise_all(grouped, mean, rm.na = F)
View(new_data)


summary(new_data)
hist(new_data$mcbbs)
boxplot(new_data$mcbbs)
par(mfrow = c(2,4))
boxplot(0.1:2.0, new_data$mcmds, main = "boxplot(mcmds)")                    
boxplot(new_data$mcbbs, main = "boxplot(mcbbs)")
boxplot(new_data$cgm1, main = "boxplot(cgm1)")
