# exploring the data further than just the basic tidying allows us to visualize it

#visualization of the data
univoltine_butterfly %>%
  ggplot(aes(x= sex,
             y= Year)) +
  geom_point(colour="purple")

# the production of this graph highlighted the typos in the sex as males were sometimes spelt incorrectly and females were written singular and plural   
#code to fix error
library(tidyverse)
library(tidyr)
library(readr)
library(ggplot2)
library(dplyr)
library(knitr)
unique(univoltine_butterfly$sex)
summary(univoltine_butterfly$sex)
sum(is.na(univoltine_butterfly$sex))

univoltine_butterfly$sex[univoltine_butterfly$sex=="Females"] <- "Female"
univoltine_butterfly$sex[univoltine_butterfly$sex=="Maes"] <- "Male"
univoltine_butterfly$sex[univoltine_butterfly$sex=="Males"] <- "Male"
  
table(univoltine_butterfly$sex)

#corrected graph displayed
#visualization of the data
univoltine_butterfly %>%
  ggplot(aes(x= sex,
             y= Year)) +
  geom_point(colour="purple")


# comparing groups
library(tidyverse)
library(he)
univoltine_butterfly %>%
  group_by()





