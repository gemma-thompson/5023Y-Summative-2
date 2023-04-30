library(tidyverse)
library(here)
library(janitor)

# checking data is presented in a tidy format 
head(univoltine_butterfly)

#checking the structure of the data 
glimpse(univoltine_butterfly)

# cleaning the column names
univoltine_butterfly <- janitor::clean_names(univoltine_butterfly)

# checking that there is no duplication within the data
univoltine_butterfly %>% 
  duplicated () %>%
  sum()

# checking data for any impossible values and any typos that may have occurred within the data
univoltine_butterfly %>%
  group_by(sex)

# checking data for typos by looking at distinct characters / values
univoltine_butterfly %>%
  distinct(year)

univoltine_butterfly %>%
  distinct(forewing_length) %>%
  print (n=58)

univoltine_butterfly %>%
  distinct(jun_mean) %>%
  print (n=31)

univoltine_butterfly %>%
  distinct(rain_jun) %>%
  print(n=42)

# checking for any missing values
univoltine_butterfly %>%
  is.na() %>%
  sum()

# showing all the data 
univoltine_butterfly %>%
  print(n= 58)

# quick summary 
summary(univoltine_butterfly)

# The point of tidying the data set is to make sure that all the data is presented in a way that is readable and clear to be able to then be presented in a variety of graph formats 
# It also gives us an analysis of the data that we are dealing with and how it is formatted 



