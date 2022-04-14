getwd()
library(tidyverse)
library(readxl)
library(writexl)

---
  title: "IITAPedigree"
author: "Opamelas83"
date: "2022-03-11"
output: workflowr::wflow_html
editor_options:
  chunk_output_type: console
---

ag_data = read.csv("IITAPedigree.csv", na = c(" ", ".", "NA"))
head(ag_data)


/// 
add_accession_years = function(pedigree){
  pedigree = pedigree %>% mutate(accession_y = 
                                   as.numeric(str_extract(accession, "\\d{2}")))
  pedigree_alt = pedigree %>% 
    rowwise() %>%
    mutate(accession_y = ifelse(accession_y > 30, accession_y + 1900,
                                accession_y + 2000))
  write.csv(pedigree_alt, file = "pedigree_alt.csv", row.names = FALSE)
}


get_requiredRows = function(pedigree){
  ag_data_filtd = pedigree %>% rowwise() %>%
    filter(startsWith(Accession, prefix = "IITA-TMS") | 
            startsWith(Accession, prefix = "TMS") |
            startsWith(Accession, prefix = "IBA"))
  
  View(ag_data_filtd)
}

get_requiredRows(ag_data)
add_accession_years(ag_data)