getwd()
library(readxl)
library(tidyverse)
ag_data = as_tibble(read_excel("Dataforcletus.xlsx", 
                     sheet = "Sheet1", na = c(" ", ".", "NA")))
str(ag_data)
View(ag_data)

for(i in 1:3){
  env = ag_data %>% filter(rep_number == i) %>% 
    select(everything())
  if(i == 1){
    env_1 = env
  } else if (i == 2) {
    env_2 = env
  } else { 
    env_3 = env
  }
}

ag_s = ag_data %>% filter(rep_number == 1 | rep_number == 2) %>% select(everything())
ag_s

ag_data %>% group_by(accession_name) %>%
  summarise(dry_matter = mean(dm, na.rm = T)) %>%
  arrange(desc(dry_matter))


ag_data = data.frame(ag_data)
for(i in c(1,3,4)){
  ag_data[,i] = as.factor(ag_data[,i])
}

str(ag_data)
