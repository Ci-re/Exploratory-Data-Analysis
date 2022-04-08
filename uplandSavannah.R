getwd()
setwd("C:/Users/Cletus Emmanuel/Documents/R/Exploratory-Data-Analysis")
library(readxl)
library(ggplot2)
ag_file <- read_excel("18ayt5USavannahKYK.xls",
                      sheet = 1, na = c("NA", " ", "."))
ag_file <- data.frame(ag_file)
View(ag_file)

colnames(ag_file)

for (i in 1:9) {
  ag_file[,i] = as.factor(ag_file[,i])
}

for (i in 10:24) {
  ag_file[,i] = as.numeric(ag_file[,i])
}

ggplot(ag_file, aes(x = clones, y = dm)) + geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 75, vjust = 1, hjust = 1))
