# exploring the data further than just the basic tidying allows us to visualize it

#visualization of the data
univoltine_butterfly %>%
  ggplot(aes(x= sex,
             y= year)) +
  geom_point(colour="purple")

# the production of this graph highlighted the typos in the sex as males were sometimes spelt incorrectly and females were written singular and plural   

library(tidyverse)
library(tidyr)
library(readr)
library(ggplot2)
library(dplyr)
library(knitr)
unique(univoltine_butterfly$sex)
summary(univoltine_butterfly$sex)
sum(is.na(univoltine_butterfly$sex))
univoltine_butterfly <- univoltine_butterfly %>%
  mutate("Females") 
  mutate_at(c("sex"), ~replace_Females(.,"Female"))
  

# comparing groups
univoltine_butterfly %>%
  group_by()




